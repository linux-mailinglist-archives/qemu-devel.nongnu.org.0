Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B671E625D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRb-00074i-Eh; Fri, 11 Nov 2022 09:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRZ-00073c-Dz
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRW-0007yP-KT
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id l14so6808453wrw.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3w4mX1qsjSiPO0pJ/lfZfSTSL+aAl8Bv1zC1N3BSyI8=;
 b=fMTvIFFDCorfBpb/boI/HoBjuSOj1lrwBEdBgCRLf/iRw1+F//eR6oStfvCoMXWMnG
 nO/yAOIb6SctuwUgcLfA2mF1qJZRxigh1NCFKiO2iFYHxW+lvNJwNFbJ2uJ6jSXJwXt2
 4daJd8KEHWXYfZ4YIRQoQBYlUEQRtSt+vgdlksKrwDiz7XDvGba3/K1BMR8qofMCu6yV
 19jbbF8xMRPhLYcLGyXv5/LTBs4HsDeu3Z/4v6ypdy99BJ3aHZYa6aC270leKVO40Sli
 cx2RPyvkLN8tRQAZ+Hu2009uUzn2yFJacOvQJkIXZAE3IMj0NaFW/apUtIuU1gV28Hpx
 XIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3w4mX1qsjSiPO0pJ/lfZfSTSL+aAl8Bv1zC1N3BSyI8=;
 b=oQBeVnmCtf/mmWDTJgOt8FjXMjiRv9CEyAFkzYRIJ9yHFfiaGU5wlujlJAXBPYJYkU
 6ce0kYSGtkpO6RUWAJjoxK778ovMHlZPHZ/MKjmjhd09sINoNxjQ3fMxZnVduxKSD0Mo
 OJO1oMaqlDbuLhozYGSmjuhzwjO1yGN/rZhI+sUhdiUNoed/F3vDVUBrBIanUUEGKqmD
 QtprJ9kkkiJSkLz6RRmaQYR0w0Jtp0b3XC6gmv4JIGqB5T5alHlzdqHv6PzIXIzq4Xwq
 GA81ArSwSFSccVCnlpHiQV2GUVsCd6KepWg4gTH0SGanKOGM0P02Uzq6Oudt/x3meQH5
 cPyg==
X-Gm-Message-State: ANoB5pkj4SPSgaxHjtYyvcQ8B537J43ayp9IcJky1wdmCt4hPFVIvKIV
 +CCyXLy6octubiNFrPKjHFpvPQ==
X-Google-Smtp-Source: AA0mqf7W+gJDbUZRg7VZLLiC8KBQUwhPhNiKZ+4j/iqQPEHRdHItYqdxHTaYLGg6sEqKYdJRT6FbSg==
X-Received: by 2002:adf:e70c:0:b0:236:6578:48ad with SMTP id
 c12-20020adfe70c000000b00236657848admr1472896wrm.405.1668178541326; 
 Fri, 11 Nov 2022 06:55:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003b4c979e6bcsm9831705wms.10.2022.11.11.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26F421FFC4;
 Fri, 11 Nov 2022 14:55:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH v2 12/12] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Fri, 11 Nov 2022 14:55:29 +0000
Message-Id: <20221111145529.4020801-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v2
  - checkpatch fixes.
---
 hw/intc/arm_gic.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..65b1ef7151 100644
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
@@ -954,23 +958,35 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
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
+        if (offset < 0xc) {
+            switch (offset) {
+            case 0: /* GICD_CTLR[7:0] */
+            {
+                if (s->security_extn && !attrs.secure) {
+                    /*
+                     * The NS bank of this register is just an alias of the
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


