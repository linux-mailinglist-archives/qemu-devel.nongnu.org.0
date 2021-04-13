Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231E35E3EA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:29:03 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLuQ-00059x-Mo
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaa-0006Uw-HM
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaS-0006wU-1w
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so5014161wrm.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zJftxWeOf1waFo8PZ0HmoXVAIrP81e+QKyBtFEMWQ/s=;
 b=GwPvgcUv2Xgb/pCrm6mHysuUBo4ESzHXBIgJkjg4WEm6o9713WHrxJnxPFpOsQK7uc
 Zj7nj8tF1bRrDH/ukaStJiyvgeiNrZa50tCrdcioqeqts/WrRXql9sQHQtYFF0O/WrnR
 EVoW4GUMfCBoOID6vB6HzfsR5o1+du3CYQN4gmHOOV41VmMUETVXujlGy8fbz0LiqjYQ
 kM3JjF5QlHMfV7g0Tu7sXwLGzb6wQMH7oNzuUIgbXeKhVw+KMRcRHwkF/0Tu9lzrQwfP
 yfhBjdvdG3re1I3K57Ngct/qL0azj7gqOSeX/qVdugiBWXPFGg3I1G1rTKYtjBR627jG
 Yu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJftxWeOf1waFo8PZ0HmoXVAIrP81e+QKyBtFEMWQ/s=;
 b=UukHKEWwwzvPL5gxELFkXoGn7vMPS/rSx7EmF2ihVXDVeabLs6AULNUTBvEbMhxizh
 QKAg2lQ6pldX01EnyKmxf7bvpEFnwDL/tkCZcE6kb6NxNzq4uVEEqOSJJif73YxVk3qq
 VeqSuGxFZY9zYMxewjooa6Qt6ajMWT+h16f9c+jQnrGvOSRRso/I2sXxh84I9IseINKS
 9kN9B06iHFH8oq8/WQJjGE/zC7oSwP01YIdlZiD+tKm0PzCKmu9wEDWZPwW0UJqZRFE7
 g7tnVZSYlMoSbVdXeKJG8lfPl+rDLNphIGwGJEr2lgfB3cRSrojNrPoSctEK/B+w3Nja
 BSbw==
X-Gm-Message-State: AOAM533AbMIihxvwnBs+Vd+UUrmWSLaEsl7A1uO1uLag28x2zZQbXOrq
 zYMnrNL1gpmJ6PkED1KIGT9vbQ==
X-Google-Smtp-Source: ABdhPJxUlek2iqcmeYkkhxFh6S7fZpdeW7+SFAWpObEtiSjaGbmCLtrcz7rRnU4NJbq9cBA28MUjDw==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr13269224wru.306.1618330102357; 
 Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/arm: Make translate-neon.c.inc its own
 compilation unit
Date: Tue, 13 Apr 2021 17:07:59 +0100
Message-Id: <20210413160759.5917-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
---
 target/arm/translate-a32.h                           |  3 +++
 .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
 target/arm/translate.c                               |  3 ---
 target/arm/meson.build                               |  7 ++++---
 4 files changed, 14 insertions(+), 11 deletions(-)
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index f165f15cc47..d3aeb5a19c9 100644
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
index c6f8bc259a1..6532d69f134 100644
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
index f6d71d03a3a..b00344b933d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1149,9 +1149,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
 
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


