Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2235E3CB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:24:53 +0200 (CEST)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLqO-0000mv-Tn
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaV-0006J3-Cr
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:27 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006vV-1O
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id 12so17030585wrz.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3a6hJI/Z9I/W5ssdG0WCaeNEsNPyYAWvgCozZQou3Pg=;
 b=p2hTKYVNFhKV2MnrIgAJ9v+JEjwKGWxwAFANv8aPrkb/0FAB830YdQwrpt7ZkOlPVn
 Lh+oOVQoWQ7BbV+C+E2aTH4Y+EGufHMbKdhhYd72c31fG9J/ps2DXMueJefLI0ZH40L6
 nAO86ZzJgadT0LUUkfEVi3G0lpEU/G3www0a2NSzUe47+UkpZVf7vF+T6u+zIA7A8Lpb
 LTQDLnvHpqCF2YyMgSW0gPG6UiDNYQWIlt5J3XOFeOiFPGjsimjqdiBujCcSGHkUxLli
 Kd5aU+3Co9AEHdLm3nCewYcjwt3Pb3BIP23dvVet+Mg8IXpcF2UAq3GEyM9xOd4ch9of
 3eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3a6hJI/Z9I/W5ssdG0WCaeNEsNPyYAWvgCozZQou3Pg=;
 b=j4Ng/UeJVz6xRYColn0h9H7maKOaX8tZiw4zg4XOAMpXAgPSJW/0XBD7JzKQXnAFb9
 ElTJWdo4+c6/rTh1BOIf2eUTKQZMXexhbK3+aypzEtfEFzzcaq7+kbDWjcGqzqJ7CIU/
 x9PH/Fe5bp9fQV8Wtmtg5MaHEqKiWJfdBI7/yvoALwagZ+ReKbCnmMAtlEVUihMqclsV
 ytlktHEBpLQCQE3EKDBB/qJ574WfhGnOYDHBryTQeohh6ri+aOsdpYg+lsG6q71iNcDO
 A4lLIZHVxRpDfmRMOtPe7HBKWCGvR/SXoqBa8EhsGY6QM0APU60YdgJtCnnImymNjm6y
 UafA==
X-Gm-Message-State: AOAM533VKaN4k/rg1fmxchmVFyo+yLMOf+Fi/mk5tj2mQF/UFCcBxYiZ
 qgn0uRdwhWbMezIiJhuygYVSWURuOVOCbffZ
X-Google-Smtp-Source: ABdhPJxOaTuQMFRs7CPzjs3L/80G8k2kZVzVFeuNgUmMZ/MmU3WOlIu8K5S499NRQprDFJ+XlSsIug==
X-Received: by 2002:a5d:400d:: with SMTP id n13mr16631553wrp.372.1618330098864; 
 Tue, 13 Apr 2021 09:08:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
Date: Tue, 13 Apr 2021 17:07:54 +0100
Message-Id: <20210413160759.5917-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
---
 target/arm/translate-a32.h                          |  2 ++
 target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
 target/arm/translate.c                              |  3 +--
 target/arm/meson.build                              |  5 +++--
 4 files changed, 13 insertions(+), 9 deletions(-)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index a874253321d..96e6eafbde4 100644
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
index 873a6237ea1..a9069458082 100644
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
index 9522002d34e..2ed02df05e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1167,8 +1167,7 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 
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


