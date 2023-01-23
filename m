Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE71677CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzw-00067Z-Gy; Mon, 23 Jan 2023 08:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzg-0005zk-U6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:20 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwze-0002Lo-Le
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so10606901wml.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=73fZODUVN+eHuckJW+3x93TAtbbakSn6uC4UQHq9gd4=;
 b=Dj+KcwUsgwcaxSvxsnwooipVuNR1Xxv4sDuvLgMRWJdIw0w5U4x6BT4foNMzleQv1A
 RneBfDz6uzdmmwm/stL4QKThQjUDLqHtFE8FSjoYM774C1g+RCJMsGylJnjCcWtC1aM9
 fcAOTTmrZ1gWgv/L9jBz1ExTybwGfHiKGpAgBEYEFWGUI0AaL+pOpsa1YVSjFirkihgZ
 zjYENw3kUt+Y+Wt+cxhjkLcnhxVs74nh4cefNAk2aPjpDgOkNxjW5L9ZWcBNLB16waRa
 Gc8TMRx2tJPc9qCazHES0j/9GIt+1Y3uk0q7esZS+Af8h3mmTwuacSaEMDM+7cpq2HZS
 FybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73fZODUVN+eHuckJW+3x93TAtbbakSn6uC4UQHq9gd4=;
 b=2LN/JkA2nIhQrsKM21xCcCRKgWTyDuihMsxFEBSONwSc5uRxN0G/hRYo2Srfv2D6xv
 WxHIAUx/wytafkiTKI3kwfhdKU9qINJXNA6+f1MJTnyhqpsJplF6rRJyVMUpFUISfvjN
 jbUramJjKUjYQkJY2AmFdtTFbk968UO1kSqgjiLEgaBFlwDwkphbh6cisRssI3vgb8xP
 WbmdnTl4Fn0HwE3gR22d9XdkNt5Fb+FGY/3o891hrJL+zOfccvEbVMID3g8CTBJbIGTp
 RIwcgXNks1J2104oD3lCE1dBEc1EbLcKlSGSrPgijEkND5YMwKgBACK2VPdZAFd/mJFd
 82BQ==
X-Gm-Message-State: AFqh2krYiSwJosl/JcXVMeIJXoLSQJZJUn5xHBeU/DGtnTBkM5slysvG
 wzJk04+bF+Zd/TUipIUmMu9V22C4EvhiLP3v
X-Google-Smtp-Source: AMrXdXvYI1Ea/wO94/9fipfePjs05Vwpxm/xbtslRJb1zKVZ9QYPnCbGrT+uIzEOrCDkADn9vhZclA==
X-Received: by 2002:a05:600c:34d1:b0:3db:1434:c51a with SMTP id
 d17-20020a05600c34d100b003db1434c51amr18371567wmq.40.1674480972912; 
 Mon, 23 Jan 2023 05:36:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] target/arm/sme: Unify set_pstate() SM/ZA helpers as
 set_svcr()
Date: Mon, 23 Jan 2023 13:35:46 +0000
Message-Id: <20230123133553.2171158-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Unify the two helper_set_pstate_{sm,za} in this function.
Do not call helper_* functions from svcr_write.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230112102436.1913-8-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sme.h    |  3 +--
 target/arm/helper.c        |  2 --
 target/arm/sme_helper.c    |  9 ++-------
 target/arm/translate-a64.c | 10 ++--------
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index d2d544a6961..27eef49a11e 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -17,8 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
-DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_3(set_svcr, TCG_CALL_NO_RWG, void, env, i32, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 80779678499..72b37b7cf17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6765,8 +6765,6 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
-    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
     aarch64_set_svcr(env, value, -1);
 }
 
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 3abe03e4cb3..1e67fcac308 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -29,14 +29,9 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
-void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
-    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-}
-
-void helper_set_pstate_za(CPUARMState *env, uint32_t i)
-{
-    aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
+    aarch64_set_svcr(env, val, mask);
 }
 
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 035e63bdc51..19cf371c4c8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1847,14 +1847,8 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
 
             if ((old ^ new) & msk) {
                 /* At least one bit changes. */
-                bool i = crm & 1;
-
-                if ((crm & 2) && i != s->pstate_sm) {
-                    gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
-                }
-                if ((crm & 4) && i != s->pstate_za) {
-                    gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
-                }
+                gen_helper_set_svcr(cpu_env, tcg_constant_i32(new),
+                                    tcg_constant_i32(msk));
             } else {
                 s->base.is_jmp = DISAS_NEXT;
             }
-- 
2.34.1


