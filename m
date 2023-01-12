Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5846674C0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBI-0002EQ-No; Thu, 12 Jan 2023 09:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000278-Nx
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005tg-UT
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMjb4iAhFx/d60nuJYZ8m86PInpCUfFMHjzGv5toOsc=;
 b=UrhCCeuV15LhQ2F0yDpKqReB/ycqOfwBCypwhXnCSAQ+td/9ciT7Rr9nOXvZK6bJn7Ys64
 ZhIfl84P6erAneMRQp+H4le8UP7GgbcQj1Ymq0pPtEpHVHrsvvteACPf0U5KYgHw7wbE4K
 y5f0hClW3JYM/xL8J5EBwXt4qABb9M0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-7Fv9fscIOO-_R2u4HGXd0A-1; Thu, 12 Jan 2023 09:03:29 -0500
X-MC-Unique: 7Fv9fscIOO-_R2u4HGXd0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B786485C6F1;
 Thu, 12 Jan 2023 14:03:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F41C54085720;
 Thu, 12 Jan 2023 14:03:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 15/40] tests: boot_sector_test(): make it multi-shot
Date: Thu, 12 Jan 2023 15:02:47 +0100
Message-Id: <20230112140312.3096331-16-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

if the function is called the 2nd time within the same qtest session,
it will prematurely return before boot sector is executed due to
remaining signature.

Follow up patch will add VM reboot to a test case and will
call boot_sector_test() again within the same qtest env,
which may lead to above issue.

To fix it make sure signature in VM RAM is no more before
exiting boot_sector_test(), so next time it's called it
will wait boot sector is completed again.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Thomas Huth <thuth@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/boot-sector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index d3f68018e7..679ee17e2a 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -153,6 +153,8 @@ void boot_sector_test(QTestState *qts)
         signature_high = qtest_readb(qts, SIGNATURE_ADDR + 1);
         signature = (signature_high << 8) | signature_low;
         if (signature == SIGNATURE) {
+            /* wipe signature */
+            qtest_writeb(qts, SIGNATURE_ADDR, 0x00);
             break;
         }
 
-- 
2.31.1


