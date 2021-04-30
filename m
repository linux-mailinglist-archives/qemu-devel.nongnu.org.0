Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A683E36FC59
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:26:58 +0200 (CEST)
Received: from localhost ([::1]:34506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcU6Z-0006Ju-Tu
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBe-000618-BE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBP-0003vT-6O
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1681065wmi.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F5srNWLoR+tJvJGu3iqRKMB8Wtmf8qQwcyjFl8XuJIQ=;
 b=LPOSVhE8fPkoBHNc97geEb8eAKe7nnwTEuTYNy5dTIicpVv+/H12+dsq/owd8HGKOp
 dR2SqayywT5wxneaov7ta1K22iLwfC70I7pdMthjabVUlJehVUYq5dT2Fy3nSYwM94yC
 DDKH/NQr2qWKqm3dYArilss7EBG8HerD8VAUEG1+3YU9ZUcTKtvfleMAPRrF+ZWhc8Iy
 CQoDnywBnOkHP4lymw2twsblbfm3HFrgg/4elyP03uLQn7cNOqHL1BXCie7mA8lR7MZx
 F5plBe6xl1QmELukNQpnAnJDchLEp8kHKHKxe2KgefKEhiWLS1eBWKrmUuDCqdhEeNDN
 jOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5srNWLoR+tJvJGu3iqRKMB8Wtmf8qQwcyjFl8XuJIQ=;
 b=bj1uq5XXBg8DiEuLPvjIwtNfsBfl756AaX9Tjf+JvjUG5UgSg3Xg+HOQW+jrfK75yo
 zu7XT8pKlq8aQQaH/2kpyURRyE9gJs6TXTdz7ka/NuFEqM70zMWMF5goURb7olFv32fy
 oW1fBrY+G9WF6MHip704ITWyh02ZzLkBv7ZUoogCtCtKJMitpqqNSojWXP2y2bC/BJ18
 kre4mycgceRv9OC5wqoAHiOZh9t9KrAY5sV1p++bxCBnVwdDH5uM7TdTUjVFZ8NHjONR
 2RkzO8mwXnQ8s192See3yhmVoKH8Aha5PRQyf/k68AdgQSkDQ4mnFoTumSix1X9f+9wK
 3Dcw==
X-Gm-Message-State: AOAM5304wZ+jQ0iz0F0H7wnSNI1UgG00SlHMUvpIJzTyeSVYg7cqen9j
 2zDx35ZHpRXTDpg8lhHHoB1WuATNKv92oOYT
X-Google-Smtp-Source: ABdhPJyV0W2wCRggpWdXdc2/vXG5NFWuhjfg9pTbCECgt8iDeSEThUNXvKPB7Y/phLwFvSDbIh2RDw==
X-Received: by 2002:a1c:60c2:: with SMTP id u185mr6098606wmb.157.1619789269467; 
 Fri, 30 Apr 2021 06:27:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
Date: Fri, 30 Apr 2021 14:27:35 +0100
Message-Id: <20210430132740.10391-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Switch translate-vfp.c.inc from being #included into translate.c
to being its own compilation unit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h                          |  2 ++
 target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
 target/arm/translate.c                              |  3 +--
 target/arm/meson.build                              |  5 +++--
 4 files changed, 13 insertions(+), 9 deletions(-)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 326cbafe996..e767366f694 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -22,6 +22,8 @@
 
 /* Prototypes for autogenerated disassembler functions */
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
+bool disas_vfp(DisasContext *s, uint32_t insn);
+bool disas_vfp_uncond(DisasContext *s, uint32_t insn);
 
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c
similarity index 99%
rename from target/arm/translate-vfp.c.inc
rename to target/arm/translate-vfp.c
index 1004d1fd095..3da84f30a01 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c
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
 
 /* Include the generated VFP decoder */
 #include "decode-vfp.c.inc"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c83f2205b67..6aec494e81d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1224,8 +1224,7 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 
 #define ARM_CP_RW_BIT   (1 << 20)
 
-/* Include the VFP and Neon decoders */
-#include "translate-vfp.c.inc"
+/* Include the Neon decoder */
 #include "translate-neon.c.inc"
 
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
diff --git a/target/arm/meson.build b/target/arm/meson.build
index bbee1325bc4..f6360f33f11 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -3,8 +3,8 @@ gen = [
   decodetree.process('neon-shared.decode', extra_args: '--static-decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--static-decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--static-decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--static-decode=disas_vfp_uncond'),
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
@@ -27,6 +27,7 @@ arm_ss.add(files(
   'tlb_helper.c',
   'translate.c',
   'translate-m-nocp.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
-- 
2.20.1


