Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE86341F4D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:24:32 +0100 (CET)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNG3D-0004xp-1y
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNG20-00049w-QW
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNG1z-0003SE-9s
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616163794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L6ao+ru9GH1VH9Sp7obIJ//NGjertJqEquapjCNSKrA=;
 b=AzyGQ8831U7vCNMgBHASG0jSHQ8+IEoBrRK+w32lVelppzN93p3m99dYn6DOfTbXALF3xY
 0KE49AWjxtsyJ94KhS9eYSEeLjomR9RkyutQtVXzayhu9NtizzHEWJIz0HtCrtFVBwdv0v
 dwLlBzTYkoAOmF3l1mPbk/BL/gzrbnU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-SToV8M2cPTSIJIqEZ8eaVw-1; Fri, 19 Mar 2021 10:23:13 -0400
X-MC-Unique: SToV8M2cPTSIJIqEZ8eaVw-1
Received: by mail-wr1-f69.google.com with SMTP id r12so21937620wro.15
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6ao+ru9GH1VH9Sp7obIJ//NGjertJqEquapjCNSKrA=;
 b=sVeOp0OYikL28UkArepRfjadBKvD5VfzkuTvk8OEGJ1AH02WwACfLN1WaNd6C2oYM3
 0UJ65Vpk7E5MBRMzrJ/0bryQDLo+SwRVzGR8aUaBIH4/lMHT8oC2DZSVywMEd9fcukrN
 ne2EDlXhIMnx6OBMkoZVsqO5pZU9WFxv2Vk2r1OZAID+NvA7K02s99af+cOBGIhSMWqf
 TyBS8RXz9h+kf2f9zN0k3N6VBMIcVqE+ibiVSWxs6ou2tZagN9AHJ2Fu7TowBd4+9D/4
 SEFHq5w9WP4PutePh/BQODib4YXRRUHuZE2xvz86hDuCCDYwEhuUtVRLEQPxr4stNEsD
 stnw==
X-Gm-Message-State: AOAM5336SbjQT5gKwLL91CxwbAnR8+qhgPUUdwIlaxaVrCh7uBKhfG0g
 KByEcRYTCr3YfX442K1ACsj1CglDb4XfZm77dugsbuLsdiEjvbOtiZ+8PD7xclqhIkuaWY+z3NS
 vEopbf+oVT1cwbKYVnaecgEGX1EZN1qzermsIGtTfNceK4F1AExhGlsnFXdYEnTJV
X-Received: by 2002:a1c:f404:: with SMTP id z4mr4072754wma.39.1616163791809;
 Fri, 19 Mar 2021 07:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVXeq9zGV0MwTCURc+u/z/1LTnGR59UPmCyrzxwAxcB9RNe/ijSh7ITyL9F7ip/ibiRGTfvQ==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr4072736wma.39.1616163791616;
 Fri, 19 Mar 2021 07:23:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm8411011wrt.1.2021.03.19.07.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:23:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0 v4] hw/intc/i8259: Refactor pic_read_irq() to avoid
 uninitialized variable
Date: Fri, 19 Mar 2021 15:23:08 +0100
Message-Id: <20210319142308.3980259-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Since v3:
- Declare irq2 really local (Richard)
Since v2:
- Remove pic_intack() call (Zoltan)
---
 hw/intc/i8259.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db14..d67c4710f15 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -176,12 +176,13 @@ static void pic_intack(PICCommonState *s, int irq)
 int pic_read_irq(DeviceState *d)
 {
     PICCommonState *s = PIC_COMMON(d);
-    int irq, irq2, intno;
+    int irq, intno;
 
     irq = pic_get_irq(s);
     if (irq >= 0) {
         if (irq == 2) {
-            irq2 = pic_get_irq(slave_pic);
+            int irq2 = pic_get_irq(slave_pic);
+
             if (irq2 >= 0) {
                 pic_intack(slave_pic, irq2);
             } else {
@@ -189,20 +190,18 @@ int pic_read_irq(DeviceState *d)
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


