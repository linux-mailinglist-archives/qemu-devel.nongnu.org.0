Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A113DA20F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:27:21 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94C8-00076X-Qx
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940k-0000R8-HU
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-00012Z-6I
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id l18so6461616wrv.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qmYdn/b+7uslGkmiRTc9E6zb61LbVOfXICGmdFgy+bQ=;
 b=KiwvbyvnDCKLQ8U1e4tmBErUZ9PzM20Q0BvEHUH28UfyxKXBmxOdRcoC5PTRkoQwNh
 iDK2GRKFeIh7mlXu/+BiaWXTXUNxofZWVqbctvz7iGrx1nEAlOZcc8crEWKn8tj6pmEe
 LpfmJ6FGFv8VW6WlXJUSMAQHJJcyUMO8x4TSBq/keE05KLOfpYKoF04UFrAUQVu3xrb6
 V1WvVVtdSikmAIicqHSs8XqrpvKqtISo1y77SvmvSJp2oyIiBE5rlz4WN0Ahxf/IELt0
 JJvJuWEr8ORdQqH8EbosJyYpBzzOGQfWWQfOVz1P7lxUsTvDukphGE2H2R76eh/xr7mv
 Dh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmYdn/b+7uslGkmiRTc9E6zb61LbVOfXICGmdFgy+bQ=;
 b=esFKXNEVKYg+SDCHNrlgfhHFZJAao5BH1s2n4BOTT69RfmRH/+i4djbxtf7XAl2F95
 IFAfbeaxqvsDymEKAV+wA/WCQr2B2wQ1ZhXu20ECf43unDIyTMxUiC/7O5POXPDngF7A
 Ipa/VLPSLroDozmTC94zjfeDmoBKun4UEbNXJ3stUNvHP8L1zkmdYzNcrj7ZdjXIy1p5
 5cYiBdueAYCF5xdAY2WvsnoYbDLdOGqBXw/kHkh8N0WOeBiTzJ/izzBylUC64Ufm0Lsv
 x/thvZI2U5zkMpWjJozvquYvbLr/HBrVXS5splgCTfEwjfso/JvZB7NrBi0Y8mnPaqZU
 92xA==
X-Gm-Message-State: AOAM530k7Hr2l6SxVQxiSWufzb2dAqI4xG93SMT8vL+TLtxAlisBh/C9
 jDUcJhgDeGm9eHxVzMIAXBQ1cONEYhO7FQ==
X-Google-Smtp-Source: ABdhPJyEIuxAFGBcoxeu396kyoyXES3d9WB3AanQQF6ZDJxvLiq53pd/lhjf4XIHMoYe23mWnH7cVQ==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4291482wrv.77.1627557322794;
 Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/53] target/arm: Fix VPT advance when ECI is non-zero
Date: Thu, 29 Jul 2021 12:14:29 +0100
Message-Id: <20210729111512.16541-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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


