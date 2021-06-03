Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B41639A017
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:50:20 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolrf-0007DN-17
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqA-0004ov-3r
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolq8-00020H-3t
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9z+D1lI4IVrYvvo11z5Q83r0R8VCoLW7BD2OfYfE8c=;
 b=U6FJKd7s3aLnj234JG4NBQbyp6hZmXAqCC+u0BBMsd4aH79+DsMafpMXE5BF+YiBQQpmVb
 +pGhZIe4BaCW64uxJx3IXprhOBxLWEexxe178n+whdit2JSVBHS5SFfhfCSdazct4Lj4d4
 uc4iRu/usn1rpkvNmVGs3HB8Af7IJ/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-YrrbEhFvPLedQBoSr3CCwA-1; Thu, 03 Jun 2021 07:48:41 -0400
X-MC-Unique: YrrbEhFvPLedQBoSr3CCwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E13D107ACC7
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:41 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6921A868;
 Thu,  3 Jun 2021 11:48:39 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 1/9] i386: avoid hardcoding '12' as 'hyperv_vendor_id'
 length
Date: Thu,  3 Jun 2021 13:48:27 +0200
Message-Id: <20210603114835.847451-2-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While this is very unlikely to change, let's avoid hardcoding '12' as
'hyperv_vendor_id' length.

No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fa282a07013f..b2d8e5713911 100644
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


