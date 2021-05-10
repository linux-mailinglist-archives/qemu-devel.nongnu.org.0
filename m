Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852B378C55
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:36:45 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg59Q-0000eI-8E
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z7-000618-1B
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z4-0003ES-I3
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id a4so16431242wrr.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FCYtPBdqiR2hai1rH40sFtaLEHo/VB2Vh1+jPJDC+nE=;
 b=NGhjM/zegVyZ6J1N/ymapXRb8YW5wlMtSTNcjrEZYtJvy+MlMkAi9NDwFvpzpZzNcF
 SQHo2sgc4n4aaun3piHbCyUHjn/ztmsDXR5ffW0K2gT9VDE2dwLh84TBmeXne76RYu//
 q+P9jID8plWRMtwmD91xIRjmFKYldYApXgkjBr+PMug66OXMVPiJFoA9IetmKqeC4tkV
 QSvIIY76jjLfIXXhe2lwAA69wSXJZrAAsYIRpCTWaj/HKb7bCSCk4GCgEHI1BJcS1SK2
 6yLHVDygoOiGxpOkTXvwtvLJCMEyIv9j/IRjs2JLdDDxYyMa9eEnW1qrDksz2DDVZ1BG
 vY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCYtPBdqiR2hai1rH40sFtaLEHo/VB2Vh1+jPJDC+nE=;
 b=Dg6y27vntAVZAa+F7mPmrkJ6qw0urwgR3Mtj1r5g9Z07B72qL23GK4+tiHhlT+CgZ7
 cYMYZC5Y8tlrLXvH/JG0qEUc7oF0hij+KL/pOXhPpzNMy4XIPPpBJ4RvQCU1EBxNimSi
 9JpbQVvZTrO/Yn/5kOEsxyjE9GgE3ee2ESKwEVpj8gyHp3ZHtuoE8l3cMllP8IgXuMLH
 SPg+c4Vy4jxu4dQsKZ2DOod/bSwHfq2DBBvgRvU3Fk10yWfLM3AKmsEuO+sdukbGnEvn
 +oIW007ripaXvZxTubQxq1wAUGI73PajbSgXWq+O2B6QnsMX0x5OTSf5q0GlV3VCuPtT
 tVRw==
X-Gm-Message-State: AOAM5309tsS8sbSvEYbY1IaynlEc2aGU4VzEqAabf0td9Q9zjDMay1EB
 gvbbiXSZPA9S1rCE1bjquMa1UaH/q5m2eQ==
X-Google-Smtp-Source: ABdhPJwvh6GP02WDFY8Vbkan6O69wIOZHmMGQ8uuI1CUf3/f6bK+94OMSctqREQ6VWTKYI3HQ36gXQ==
X-Received: by 2002:a5d:6402:: with SMTP id z2mr30037182wru.7.1620649561150;
 Mon, 10 May 2021 05:26:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] target/arm: Make translate-neon.c.inc its own
 compilation unit
Date: Mon, 10 May 2021 13:25:38 +0100
Message-Id: <20210510122548.28638-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Switch translate-neon.c.inc from being #included into translate.c
to being its own compilation unit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-14-peter.maydell@linaro.org
---
 target/arm/translate-a32.h                           |  3 +++
 .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
 target/arm/translate.c                               |  3 ---
 target/arm/meson.build                               |  7 ++++---
 4 files changed, 14 insertions(+), 11 deletions(-)
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 3ddb76b76b5..c997f4e3216 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -24,6 +24,9 @@
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
 bool disas_vfp(DisasContext *s, uint32_t insn);
 bool disas_vfp_uncond(DisasContext *s, uint32_t insn);
+bool disas_neon_dp(DisasContext *s, uint32_t insn);
+bool disas_neon_ls(DisasContext *s, uint32_t insn);
+bool disas_neon_shared(DisasContext *s, uint32_t insn);
 
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c
similarity index 99%
rename from target/arm/translate-neon.c.inc
rename to target/arm/translate-neon.c
index 73bf376ed32..658bd275dac 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c
@@ -20,11 +20,13 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * This file is intended to be included from translate.c; it uses
- * some macros and definitions provided by that file.
- * It might be possible to convert it to a standalone .c file eventually.
- */
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/exec-all.h"
+#include "exec/gen-icount.h"
+#include "translate.h"
+#include "translate-a32.h"
 
 static inline int plus1(DisasContext *s, int x)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 18de16ebd0a..455352bcf60 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1206,9 +1206,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
 
 #define ARM_CP_RW_BIT   (1 << 20)
 
-/* Include the Neon decoder */
-#include "translate-neon.c.inc"
-
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
 {
     tcg_gen_ld_i64(var, cpu_env, offsetof(CPUARMState, iwmmxt.regs[reg]));
diff --git a/target/arm/meson.build b/target/arm/meson.build
index f6360f33f11..5bfaf43b500 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,8 +1,8 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('neon-shared.decode', extra_args: '--static-decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--static-decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
@@ -27,6 +27,7 @@ arm_ss.add(files(
   'tlb_helper.c',
   'translate.c',
   'translate-m-nocp.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.20.1


