Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B94572D3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:25:05 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6hE-0000FM-Nw
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ow-0006dq-Rc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:10 -0500
Received: from [2a00:1450:4864:20::430] (port=37448
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ov-0004U0-96
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id b12so18965838wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fq8YVZ41y2m63Xbs624QcT/491tkKkPk8MVBVrP9XU=;
 b=L20IbaCSCw2joaYjiV86ERzsKPG66sNPl0PMblYgPd42h8nBoLlG10lQTURLUkCoad
 pQG6ikhqoEfqZyMI06BNcndCaeJ4i3p/icMTI2wOjJC+YRCVZUCooXhO8DdwYjqv3k0t
 7ZycddbrFt7eFxYjKyZtTFX3iFFVuN9aOlWub1A6oelEMcQB4db/m90fZr2nNMgZG/HS
 68VxHyjN1FHXbw5MQ6kcETN1Omj2xObzYfWWPDYfMzUwHT/Z3oTi48Jwwo+AiE8gqMYm
 zUT6v5EWf+wQL+cD2U3hLdGnJ6c2Vh+SsKXND0SwT7wlhsTz7HWe+/KBxXInQ53xy7Hd
 rbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fq8YVZ41y2m63Xbs624QcT/491tkKkPk8MVBVrP9XU=;
 b=q0tKUGOhSliIHqnejgmmR7kNqKaOlyoZ6FYgz1mKiWKEqV6MMZBgzu70YXWihhLcxZ
 eU2a/hNVRCUpcmhuEPTw8ILcj0fkMHSvZJVOGyyppA+zuU/GQ2H05f2Su4qI8ozmRjWU
 uFldjFkca7/vYC5FntJ7+gnRRPiRrwKEcdGdTvRonwvCeKGruMhMsBbqwJqtm7hs0OSH
 3t0FAgBPvLq6THqOpv3I0wHwi3zYeeV5uuXMwCuht/LrWClTYGQ7z+1G/CjSZg4lBDXS
 5iDDbV1GO+mxz+WalEC5NUF9JFAlVj93XQiNALYMlIkjNvCFuaGCsGeyJ/7JGBUQgzug
 tbgg==
X-Gm-Message-State: AOAM531BxFlVV4veae33Tw8vgzuFFalSm3JcMgAtI2HvLpwCSx1rHhxY
 vqJqWrEE6vgFfxLo+Mqv9xl1yFeN2Vym1+Y2pDE=
X-Google-Smtp-Source: ABdhPJyo+lcqfCGx4teRNFTeC5DfMyd0Xh52owo9N7A6GYn8QBGTR4xv0nYtesR1EJ+v7Rn18rbXfw==
X-Received: by 2002:adf:e882:: with SMTP id d2mr8748452wrm.389.1637337967756; 
 Fri, 19 Nov 2021 08:06:07 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/35] target/ppc: Update fre to new flags
Date: Fri, 19 Nov 2021 17:04:53 +0100
Message-Id: <20211119160502.17432-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use float_flag_invalid_snan instead of recomputing
the snan-ness of the operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f46d529f04..7b4407e189 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -717,20 +717,15 @@ float64 helper_fre(CPUPPCState *env, float64 arg)
 {
     /* "Estimate" the reciprocal with actual division.  */
     float64 ret = float64_div(float64_one, arg, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status)) {
-        if (status & float_flag_invalid) {
-            if (float64_is_signaling_nan(arg, &env->fp_status)) {
-                /* sNaN reciprocal */
-                float_invalid_op_vxsnan(env, GETPC());
-            }
-        }
-        if (status & float_flag_divbyzero) {
-            float_zero_divide_excp(env, GETPC());
-            /* For FPSCR.ZE == 0, the result is 1/2.  */
-            ret = float64_set_sign(float64_half, float64_is_neg(arg));
-        }
+    if (unlikely(flags & float_flag_invalid_snan)) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        float_zero_divide_excp(env, GETPC());
+        /* For FPSCR.ZE == 0, the result is 1/2.  */
+        ret = float64_set_sign(float64_half, float64_is_neg(arg));
     }
 
     return ret;
-- 
2.25.1


