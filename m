Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D541453F44A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:06:31 +0200 (CEST)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPY6-0003Gd-V4
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGC-0007SZ-Ig
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:48:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG9-0000Pt-VG
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g205so14256710pfb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e5X8Giy1nSXUAW/k2gk27MTQNnTOPX0p6C0iMqD4S4=;
 b=XGI3okjrgtRS82YWE588I1XHQFlpIW2GvSuFsNkKbDAPIMG62yQ0Z96xOjU+LPVduy
 tIyhHQoOGzweZmUXgGkOPLiGXf7tKr6LR3Rwg29zQW0vlXRF2wc68mKCrCtNsvEcT1gU
 Xac3dE9D7IEaXQEPQBl7Q/10yrDys5/JF07kgkSQnkC5VxlM46vgd9pT2AlGIOvBbBjZ
 kV98iBIWQkSahRbyzbKJujNosfO4T4/iAKBFZJhe5S8zwrWLMvKCc8A11nAtSsWyd5ff
 84k1eKIkfRRmX1I3qxJiJu6NxS+MNRXCMraP8+eBT4foiETQg3DWljF6CzYE61FzF+Hb
 fcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e5X8Giy1nSXUAW/k2gk27MTQNnTOPX0p6C0iMqD4S4=;
 b=JwEv10VyPkg1JS9mJ8RZPqdtU40dCaBxzoGL4wnVmS5rfTrw2+lxr7SK8wmMgFpjz1
 klx7vsF7jrlPRrvJRP9aj7ez0lHBNihB4GKENTfuDhTEEgxz97nTcS+Op1j57KDGOszb
 sk99WFvv3MTA5DDBQBkxLW0MudyV6kemUPooaAq7iq3tXfWpPVsmVCmDvj2IjouuGaQm
 7dCCvIaejedQ4/Q/BDqi6OuRP5iko3SCGNo6K+Wxt0fICLrGQzrdg4WWesiHMOdzzNLT
 AUPk7vTU7tgJ7DepyIYG95JsjAReYJxsDBMOdWepLcFCGObdFaCLtkCWxygqPm+SxLXG
 ARBA==
X-Gm-Message-State: AOAM533QhnqvdoVsjteFcsdL1L/i7v7lT5jL60f/vhbOtXkoFE7tdoX2
 yIYhAB0ae17Vg4yFSB74Iw+SsSnnDRAo5Q==
X-Google-Smtp-Source: ABdhPJym/PkOGOYOZTf6P95Y0dIo6UCP1wXTVypFbqk4L/rGRFNtOIVzVNYzm2gCaGNtN5iMRYb9dg==
X-Received: by 2002:a63:24e:0:b0:3fd:d5d8:9b91 with SMTP id
 75-20020a63024e000000b003fdd5d89b91mr5555067pgc.458.1654570076602; 
 Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 24/25] target/arm: Rearrange Secure PL1 test in
 arm_debug_target_el
Date: Mon,  6 Jun 2022 19:47:33 -0700
Message-Id: <20220607024734.541321-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Not a bug, because arm_is_el2_enabled tests for secure,
and SCR_EL3.EEL2 cannot be set for AArch32, however the
ordering of the tests looks odd.  Mirror the structure
over in exception_target_el().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b18a6bd3a2..59dfcb5d5c 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -15,22 +15,24 @@
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
 {
-    bool secure = arm_is_secure(env);
-    bool route_to_el2 = false;
-
-    if (arm_is_el2_enabled(env)) {
-        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & MDCR_TDE;
-    }
-
-    if (route_to_el2) {
-        return 2;
-    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
-               !arm_el_is_aa64(env, 3) && secure) {
+    /*
+     * No such thing as secure EL1 if EL3 is AArch32.
+     * Remap Secure PL1 to EL3.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
         return 3;
-    } else {
-        return 1;
     }
+
+    /*
+     * HCR.TGE redirects EL0 exceptions from EL1 to EL2.
+     * MDCR.TDE redirects both EL0 and EL1 debug exceptions to EL2.
+     */
+    if (arm_is_el2_enabled(env) &&
+        (env->cp15.hcr_el2 & HCR_TGE || env->cp15.mdcr_el2 & MDCR_TDE)) {
+        return 2;
+    }
+
+    return 1;
 }
 
 /*
-- 
2.34.1


