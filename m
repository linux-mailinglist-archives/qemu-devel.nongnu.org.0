Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30453440ADC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:02:49 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsgq-0002bd-9a
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1o-0001T2-N3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:26 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1l-0002B3-Qk
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y1so8902406plk.10
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=vRHSQTBxihlddshAA986+iSiR0Nil9TNfH5cy5j0mEEUv7Ovted3tzIZ0QxxEN9a9z
 Qd161FDUp6F6m2S1FkbGD1emlcTsvxBj26uGgDDroKILuRZEkwVAgJ/QeweFiw4uAaHC
 oW1a2X+BgQEOv90XhrTPa2BGYJND0tJU+fh9cKMe2hqc0DU8FCYNiGuELJqkJBG/7GCt
 i0s8s7Te+E5Fx+QEPGGj3lrxUk5DTgDfcc2VLf1DnKKGYGITFwa3r7ah/b3splqM2KUQ
 fIi9IrX1NxqGS1LKDlu963ChISm5bxuBWJYpYsSwV22m5m2vMzrHIP+pGcdXosezmADW
 DhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTKdaHiEpe60z+ThGKt8c3K8jQRQXSW+5obPKHUiPMs=;
 b=1UgGUAjj7v1Xzwh1seR/CK98by1FWoZr0e6NsCGKr4/PjZd8sIOK4M78MhGFgW5sdZ
 efzBneaxQZ2siVfmfsLEyzpBklg7nv7zehw75+hPOG+w9xuHtXcLccTEhMdw64y9pl4P
 OKfLmESwP2ed53sAtcLLCkTa8y+oArSRqBOxZGbOrUEJfIzG2IM5FKzrkdmueUKKV7T/
 IxP4CT0w9Pdlaay6CRd57qbFXWaVs7z0O/M8sNoiKxNAcPbAqPl8ASlfDYVudv3309J7
 G1e6eY4wQwOSyfDHJoFRhxbCK7Y/v29Dg4bCv9pI4h67/H1euOdyN/bFbj36NSZCOavW
 G5sA==
X-Gm-Message-State: AOAM533SJ20nVem/10Aj7691IRKsWKmsuLE6PKzec/baWi6iZfPnvpoW
 E46Hh8E9p0PH5v6w0eAA491f2cuL9L99Kg==
X-Google-Smtp-Source: ABdhPJz4zl/P9N8T9mjIsif7Tw1criAHj+nqjOEwR0Ow6vz3BZR64Fccd37oijYWOmOCMAa/wNPrGg==
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr19311342pjb.57.1635614419955; 
 Sat, 30 Oct 2021 10:20:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 47/66] target/microblaze: Do not set MO_ALIGN for user-only
Date: Sat, 30 Oct 2021 10:16:16 -0700
Message-Id: <20211030171635.1689530-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel will fix up unaligned accesses, so emulate that
by allowing unaligned accesses to succeed.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 437bbed6d6..2561b904b9 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -722,6 +722,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
 static void record_unaligned_ess(DisasContext *dc, int rd,
                                  MemOp size, bool store)
 {
@@ -734,6 +735,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
     tcg_set_insn_start_param(dc->insn_start, 1, iflags);
 }
+#endif
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
@@ -755,12 +757,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, false);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
@@ -901,12 +910,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, true);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
 
-- 
2.25.1


