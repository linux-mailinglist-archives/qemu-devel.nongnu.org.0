Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB1341FEB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:44:44 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGMl-00020b-J7
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHm-0005LQ-HJ
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHk-0004pr-7z
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bquYpcnZmcudj9kVmx4yv28dkt/YfbLZRig664mS0G4=;
 b=jBlxNU9KDWHEDH4l0tV171UjX648VRRb0MwoNVIc3dqR913/lXdwREeetg1QwFm10NnEjX
 fnT2tPfTz3d+1AzVVNCIu/5osZkECADmjOXmBxLcKR7dyEqE2zQThxXWqrfKGlG0xmm0yX
 tc5I4huhR9rfRfdDIQV3WBrzR4bJQ1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-WxxvkfO7O2eXLROXiUqwfw-1; Fri, 19 Mar 2021 10:39:28 -0400
X-MC-Unique: WxxvkfO7O2eXLROXiUqwfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5031A107B7C4;
 Fri, 19 Mar 2021 14:39:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F8860C04;
 Fri, 19 Mar 2021 14:39:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] hw/intc/i8259: Refactor pic_read_irq() to avoid
 uninitialized variable
Date: Fri, 19 Mar 2021 10:39:23 -0400
Message-Id: <20210319143924.2173798-8-pbonzini@redhat.com>
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
References: <20210319143924.2173798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Some compiler versions are smart enough to detect a potentially
uninitialized variable, but are not smart enough to detect that this
cannot happen due to the code flow:

../hw/intc/i8259.c: In function ‘pic_read_irq’:
../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   203 |         irq = irq2 + 8;
       |         ~~~~^~~~~~~~~~

Restrict irq2 variable use to the inner statement.

Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210318163059.3686596-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/intc/i8259.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db1..cc4e21ffec 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -176,10 +176,12 @@ static void pic_intack(PICCommonState *s, int irq)
 int pic_read_irq(DeviceState *d)
 {
     PICCommonState *s = PIC_COMMON(d);
-    int irq, irq2, intno;
+    int irq, intno;
 
     irq = pic_get_irq(s);
     if (irq >= 0) {
+        int irq2;
+
         if (irq == 2) {
             irq2 = pic_get_irq(slave_pic);
             if (irq2 >= 0) {
@@ -189,20 +191,18 @@ int pic_read_irq(DeviceState *d)
                 irq2 = 7;
             }
             intno = slave_pic->irq_base + irq2;
+            pic_intack(s, irq);
+            irq = irq2 + 8;
         } else {
             intno = s->irq_base + irq;
+            pic_intack(s, irq);
         }
-        pic_intack(s, irq);
     } else {
         /* spurious IRQ on host controller */
         irq = 7;
         intno = s->irq_base + irq;
     }
 
-    if (irq == 2) {
-        irq = irq2 + 8;
-    }
-
 #ifdef DEBUG_IRQ_LATENCY
     printf("IRQ%d latency=%0.3fus\n",
            irq,
-- 
2.26.2



