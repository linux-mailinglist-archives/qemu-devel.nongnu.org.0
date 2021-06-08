Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056739F61B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:11:56 +0200 (CEST)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaaJ-0006q1-8i
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX4-0008Eo-Jh
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX1-0001h1-37
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VQwAvd+P+60pku6i6LhwwzklfGQ307gRl3lhfcyMwY=;
 b=MGqlkgYUDcin3wKVG2A84cDHAaNH7o/3IId1sdIHGe/xhx56W3/Kphu9Ts0lkdbQs6HjC8
 Eoz5T3ODdibrBRiLl5mkbD51li6vliddnRzBtGwcChOzMrGrZSv3xvIQe1DrBaHqaxJiAC
 lyoXCBQHZCgsnhJPr90LKrZTaVYgK7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-JfaVTABxPamxiuY4H8UFpA-1; Tue, 08 Jun 2021 08:08:27 -0400
X-MC-Unique: JfaVTABxPamxiuY4H8UFpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C89BBEE1;
 Tue,  8 Jun 2021 12:08:26 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C16D5B4A6;
 Tue,  8 Jun 2021 12:08:24 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 1/9] i386: avoid hardcoding '12' as 'hyperv_vendor_id'
 length
Date: Tue,  8 Jun 2021 14:08:09 +0200
Message-Id: <20210608120817.1325125-2-vkuznets@redhat.com>
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While this is very unlikely to change, let's avoid hardcoding '12' as
'hyperv_vendor_id' length.

No functional change intended.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d392..f8ae45be0d53 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6057,11 +6057,12 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
                                 &error_abort);
     }
     len = strlen(cpu->hyperv_vendor);
-    if (len > 12) {
-        warn_report("hv-vendor-id truncated to 12 characters");
-        len = 12;
+    if (len > sizeof(cpu->hyperv_vendor_id)) {
+        warn_report("hv-vendor-id truncated to %ld characters",
+                    sizeof(cpu->hyperv_vendor_id));
+        len = sizeof(cpu->hyperv_vendor_id);
     }
-    memset(cpu->hyperv_vendor_id, 0, 12);
+    memset(cpu->hyperv_vendor_id, 0, sizeof(cpu->hyperv_vendor_id));
     memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
 
     /* 'Hv#1' interface identification*/
-- 
2.31.1


