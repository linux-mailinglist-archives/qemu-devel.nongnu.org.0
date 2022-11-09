Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0F622E47
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osmLq-0001Tu-6J; Wed, 09 Nov 2022 09:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osmLK-0001Kk-Jh
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:46:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osmLI-0003xF-CD
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:46:18 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs21so26111908wrb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 06:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBTGXdmQQNz9jBeb+iuOSNPhPhrt0VQWOq4hWuoixNM=;
 b=UyUhAhCdvJQkCj8JvN/G6Bap+M2+wsehCqwghvPDT48UFRMvHxKhgu/IfOEmK8bKld
 yOBSCAwHpleR5LvmmmIwTU5aCO/ZF/j7KrsRAFuo2x7+MciRzg3OtaJGxymQjSuEeVUz
 SlkfykivGF65QGH/h+PSDRrGGe6WHYki7+FyLsw6ThHdIC8pXLys7MgwrlshZ3EGXIrB
 6fps/EGZNxDKQEy0mUkbirV13rvXFaaect/C9tzS9EW+eMU5Tb5oX8//MRv5i7P2zVk7
 oUBvE6zHRmS5xrPtSzX2dm5rjMhmpOrT0r4qzQOfqC4ikxX/UHPFZY25IXSnHh/P6zbM
 W6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBTGXdmQQNz9jBeb+iuOSNPhPhrt0VQWOq4hWuoixNM=;
 b=FXf4+2bR2WFWo7aUsCxqqG8zLaFkDpQIZUQn7NdVd+8oWhv1jesqYQ+QQOITZsosYR
 OXiVIuDeUibT3+I2NNMDXHx0X8sk9sM8S3cOnmI4lTvsrQ6dxk+vf14NGUE9xVhUUfRI
 fvo8hnHCzg9S6GjHl/+FwX7yKK7M9x0ymSEk/F+YIY047GfAxrDwfIMJGTwp2hzYVd41
 jsfUEiVZQruukVA/mw27yorJXNxJlusUVOlS1/5/D8P+vOyR3k1ttEg3mqNN9R0vEpHg
 RCF3KS37UgjTldQARYSE6Q0z0LaUo2RDeGmv6P0vmDAF5J2Jr2gYPiCl/18TyikbUkXA
 XOOw==
X-Gm-Message-State: ACrzQf0n0fzhYThmiBuVR0ncOhblZt8XdxY5I4Lgk4X7umwVdJh0jUZR
 8CcmYhu4N6pYeNQ/5zDkJpEcbg==
X-Google-Smtp-Source: AMsMyM5ldid8HOkMfsJZYVtd07/5LY51sQUPse/GntzradbSofsNFkmoPVDL1A7GV8/sacSJ3z57MQ==
X-Received: by 2002:a5d:4bc5:0:b0:23a:591d:51c with SMTP id
 l5-20020a5d4bc5000000b0023a591d051cmr18036282wrt.184.1668005172515; 
 Wed, 09 Nov 2022 06:46:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003cfa26c410asm2232016wmq.20.2022.11.09.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 06:46:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EFD541FFB7;
 Wed,  9 Nov 2022 14:46:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [RFC PATCH] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Wed,  9 Nov 2022 14:46:08 +0000
Message-Id: <20221109144608.2567252-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Lightly re-factor this region of registers and also add a comment to
the function in case anyway was under the illusion we only return
bytes from a function called readb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gic.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..515923416c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,6 +941,10 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
+/*
+ * Although this is named a byte read we don't always return bytes and
+ * rely on the calling function oring bits together.
+ */
 static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
@@ -954,23 +958,34 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cpu = gic_get_current_cpu(s);
     cm = 1 << cpu;
     if (offset < 0x100) {
-        if (offset == 0) {      /* GICD_CTLR */
-            if (s->security_extn && !attrs.secure) {
-                /* The NS bank of this register is just an alias of the
-                 * EnableGrp1 bit in the S bank version.
-                 */
-                return extract32(s->ctlr, 1, 1);
-            } else {
-                return s->ctlr;
+        if (offset < 0xc ) {
+            switch(offset) {
+            case 0: /* GICD_CTLR[7:0] */
+            {
+                if (s->security_extn && !attrs.secure) {
+                    /* The NS bank of this register is just an alias of the
+                     * EnableGrp1 bit in the S bank version.
+                     */
+                    return extract32(s->ctlr, 1, 1);
+                } else {
+                    return s->ctlr;
+                }
             }
-        }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
+            case 4: /* GIC_TYPER - Interrupt Controller Type Register */
+            {
+                return ((s->num_irq / 32) - 1)
                     | ((s->num_cpu - 1) << 5)
                     | (s->security_extn << 10);
-        if (offset < 0x08)
-            return 0;
+            }
+            case 8: /* GICD_IIDR - Implementer ID Register */
+            {
+                return 0x43b; /* Arm JEP106 identity */
+            }
+            default:
+                /* return 0 for high bits of above */
+                return 0;
+            }
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.34.1


