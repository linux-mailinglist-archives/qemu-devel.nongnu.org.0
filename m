Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3E5BEE37
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:07:19 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajWY-0007E8-7n
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHX-0007bX-3Z
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHV-0001NO-Hz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovjEdOieswAzk6LBwlaIRgBEuvpXPe/cDDavWz0Yi/g=;
 b=b1EfzU9J33soKwcOcHK6FWI+NxbIfBj5YGNePBhHB1qcb/VBwtrIVsGaz8mTOeBwTADxp6
 PQSGv7ThVz5TxlVJRP5K2erwt08sndUBj6kX0A5/Gl2jrkhdQZq6QG76upWFCHyaX3PurK
 TmHjXyEqE0TFDzKzlsDEWHCXTxU1Mhs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-dYjeDKK9PS2fpZVt8VD_5g-1; Tue, 20 Sep 2022 11:35:25 -0400
X-MC-Unique: dYjeDKK9PS2fpZVt8VD_5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 491C0382F1A0;
 Tue, 20 Sep 2022 15:35:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6ECD492B04;
 Tue, 20 Sep 2022 15:35:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 05/15] qtest/fuzz-lsi53c895a-test: set guest RAM to 2G
Date: Tue, 20 Sep 2022 17:35:02 +0200
Message-Id: <20220920153512.187283-6-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

test_lsi_do_msgout_cancel_req does not run on machines with small size
memory. Reduce guest memory from 4G to 2G to alleviate the problem.

Reported-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Message-Id: <20220902133853.834065-1-mcascell@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index b23d3ecf45..434c16bf42 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -21,7 +21,7 @@ static void test_lsi_do_msgout_cancel_req(void)
         return;
     }
 
-    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+    s = qtest_init("-M q35 -m 2G -display none -nodefaults "
                    "-device lsi53c895a,id=scsi "
                    "-device scsi-hd,drive=disk0 "
                    "-drive file=null-co://,id=disk0,if=none,format=raw");
-- 
2.31.1


