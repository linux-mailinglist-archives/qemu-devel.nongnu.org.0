Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E351378C4F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:34:40 +0200 (CEST)
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg57P-0003H7-BJ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z3-0005mm-8Q
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z1-0003D3-3q
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a4so16431072wrr.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KidqP9C++Nfg7TlswLUfpndbQ6x9/TKgLrZ9dvnXn4A=;
 b=gDduUEIM0Ys6Qbe491E20vIX6/RcSGDu/qJhqm3TgR+/coGrB0VpUyxEUQpSPGknAV
 3+UplfsjZkJsTcmM9gutR5V1wsPVCi7ONPuJZQ86AYS30gXV3r09x5ncuPB0C1MNw2w7
 +6lhCSVlaqrsZ3eWb0RogJWcJ12jgPnDaVLPOMzOuSGwd21WGcm411MSm06HWznRH0NB
 5qed39SZpcu/kaE03I0TPnjXlvBUVB9ZAFwxGamyJWgIDjboKpk5+y5vLe9qHc854C8/
 /FRpBS45GXAPumAfEeiti65jkRbyYUf0i04BI+6dVs/LviYY0m8+A59UQIh/k5QxxN9G
 WqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KidqP9C++Nfg7TlswLUfpndbQ6x9/TKgLrZ9dvnXn4A=;
 b=tqdYpbmpkPSqJzXxzCCOe4iZwbPBtgd/ICzRiJ3KmcJ1jkvcJbW0KISH134Q2vMsBz
 4czkbYH7Vl80vmeTcj2dNLu356/yIQpzFVEb2FDCaqljW/kvpJIfWrUX9KjaQZ0+wPAL
 p1fB8X5t121IlqJ5TGn5gn7VGdh6m4gfu4zAfxzRlLlnjaYIhRtlYqPt13zi/T7q91LJ
 EDURJ0V2iOsrUg2q8LErKEZN520dd9U+S7+J08j/CApDvmHuOOluud14lSv8g49QZYH7
 x/HkmDcN70jFMZ4DJoRSRDRbqO5YFeqNAY24L+v4Iaj8d5HPMrAKT4VFBRpTbm+6WEF4
 MxoA==
X-Gm-Message-State: AOAM533eSvuIXlRFSOhKfkCnFOpjrXZmePEK90kpranBo10R7WFj5qBx
 yJVkn+si7gumtDqwSVfHuZsToR05Ug7RGw==
X-Google-Smtp-Source: ABdhPJyABGPv3u9J5TQS6UcHWVs2AG5527GfLyEgVlxYS8RVGCE4ldAVqPEXWvnpm6R3RyGvmSg/2Q==
X-Received: by 2002:adf:f805:: with SMTP id s5mr30095932wrp.143.1620649557876; 
 Mon, 10 May 2021 05:25:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] target/arm: Make translate-vfp.c.inc its own compilation
 unit
Date: Mon, 10 May 2021 13:25:33 +0100
Message-Id: <20210510122548.28638-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20210430132740.10391-9-peter.maydell@linaro.org
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


