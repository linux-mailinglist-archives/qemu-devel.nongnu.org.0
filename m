Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D63F739B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:47:19 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqRC-0008MK-Qx
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG2-0002vI-EI
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG0-0005IS-Op
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id f10so14670999wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8qIE5oE1JZoICFhq6qSEMy1TMT2jNqxyN7BxrEyKPnk=;
 b=dd9Ds+meriI9xZTes2q/4EeCeLljWB7PI2jqoIDVO/2ar0+PAD0hK8Rx7MZukZUi7T
 B+NCEJouOQcBaIZOkzDGOfMDpWovpFsWH7V1CarhNeUkbrEFpD+B9X3sxcMWtwULe0zm
 zgA1FNe54XfiYnpoUMmGg9x+Fx+75TrZZRWYM92yPooZ5HhhGNRf9GDfcjSg/u1vAfBi
 3xXjEFGGmomaJYtKGrsBBmxkew/PiQo29nRFcSJYqAPBwKyUbtmH+BeyQqLl502sCrtP
 3wXaCUEvIf1Jq9/FkOV3B0iVo7Hcal2uKjK7pQa1U0y9JNdROInSbPcGlYpZRiCHPKLj
 Z24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qIE5oE1JZoICFhq6qSEMy1TMT2jNqxyN7BxrEyKPnk=;
 b=C6finHRiNK1ZArTENtMMt+XKgYloCipWz+cgd1HgZ1RMkkA69/ntwxOQKB87RL/TPl
 /ooK6WlUKVVOD1QZX4YzkYmlNfmzDs8+Xfr2bQLxJWtt5w7fmLQJPgkfe81EbOdKjNBu
 JDJ2LME25jtdOp3cr2boO1e+dDT2eOyNI7TT4jA0LJ9NPZJUejVud5YaoHTiK6zCmtum
 +KHsO/NllRBDlKDPB4aovuFNGLZap4EyTGF23RPEiO1eUKq+54FnhJ14tlDNjpFcncwl
 F+kHb7ZIOm+tfss2B8hUq0gyRc1V3DmBuRT1UJX1UjfcdqWm+u9oGdyGv+/F4XV6hSLZ
 IK6w==
X-Gm-Message-State: AOAM533DB+lCchZNJbHNocuWMmWvy2ALtptJe4UpE1yg8vRYlsW7LuZM
 LWVBW0zWfq6N6vRjvwVpGOsOsbQ7KXgQSw==
X-Google-Smtp-Source: ABdhPJxHp7pOyKPLlGTBmA1Q04TiIVgDV3i0N9AO2VIoFf0z1CPA0vgDAeGEgKyYYQmRXo1fp5A2Dw==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr3303473wmc.138.1629887743294; 
 Wed, 25 Aug 2021 03:35:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/44] target/arm: Fix VPT advance when ECI is non-zero
Date: Wed, 25 Aug 2021 11:35:00 +0100
Message-Id: <20210825103534.6936-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were not paying attention to the ECI state when advancing the VPT
state.  Architecturally, VPT state advance happens for every beat
(see the pseudocode VPTAdvance()), so on every beat the 4 bits of
VPR.P0 corresponding to the current beat are inverted if required,
and at the end of beats 1 and 3 the VPR MASK fields are updated.
This means that if the ECI state says we should not be executing all
4 beats then we need to skip some of the updating of the VPR that we
currently do in mve_advance_vpt().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ffff280726d..bc89ce94d5a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -110,6 +110,8 @@ static void mve_advance_vpt(CPUARMState *env)
     /* Advance the VPT and ECI state if necessary */
     uint32_t vpr = env->v7m.vpr;
     unsigned mask01, mask23;
+    uint16_t inv_mask;
+    uint16_t eci_mask = mve_eci_mask(env);
 
     if ((env->condexec_bits & 0xf) == 0) {
         env->condexec_bits = (env->condexec_bits == (ECI_A0A1A2B0 << 4)) ?
@@ -121,17 +123,25 @@ static void mve_advance_vpt(CPUARMState *env)
         return;
     }
 
+    /* Invert P0 bits if needed, but only for beats we actually executed */
     mask01 = FIELD_EX32(vpr, V7M_VPR, MASK01);
     mask23 = FIELD_EX32(vpr, V7M_VPR, MASK23);
-    if (mask01 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff;
+    /* Start by assuming we invert all bits corresponding to executed beats */
+    inv_mask = eci_mask;
+    if (mask01 <= 8) {
+        /* MASK01 says don't invert low half of P0 */
+        inv_mask &= ~0xff;
     }
-    if (mask23 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff00;
+    if (mask23 <= 8) {
+        /* MASK23 says don't invert high half of P0 */
+        inv_mask &= ~0xff00;
     }
-    vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    vpr ^= inv_mask;
+    /* Only update MASK01 if beat 1 executed */
+    if (eci_mask & 0xf0) {
+        vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    }
+    /* Beat 3 always executes, so update MASK23 */
     vpr = FIELD_DP32(vpr, V7M_VPR, MASK23, mask23 << 1);
     env->v7m.vpr = vpr;
 }
-- 
2.20.1


