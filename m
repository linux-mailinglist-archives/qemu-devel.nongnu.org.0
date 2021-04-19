Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2D2364A75
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:22:10 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZTF-0000Oc-A3
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPq-00064z-5Z
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPo-000103-Df
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id m9so22425644wrx.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGOvaajXfmrpLSnOyhpIroCQXe3e+OS5MF3gQarLZWU=;
 b=mOjaQ8Os+wMa5eXWTbLTFe+2E4ZBAkAODgCIhYnBE3BDDnlrR5zlUnwFzk9yaWXahU
 Gu0jEn3Wy0iRiPCm01xTmPLMK+9Sj9hjMEpFY9zbWPx+RPk4PJZS338Ugmdeys1g+pt2
 ITDWb1jj7PvHI5nzTRypC76yZeHjLl8ltj8g6j2ZshPM4cKnfsHiaBb+5o3cCxxQmT2o
 4wQ7UvjMGTXczER46qY6yAgkxFAvJJujtx42A+ACeiWVzIzQsRShbVN24LR77qoO84ze
 ojWg3G2B3xACMR9VXtdBSkNjP2uPc2kMiCmu4HibNPpvblRpNzcBAgzC7R7TDoxutby1
 FSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fGOvaajXfmrpLSnOyhpIroCQXe3e+OS5MF3gQarLZWU=;
 b=VyzvXuxGK6OWucb+ETuDXLxBqvs1MG3UwjnfBTheakhPuKbtvF2Cl8KR7sxL5aQ/GO
 j5iVO3SlKFi+1PFklKBXVx5txXnDHbsfvdl3hDWZQQJ3I1+mGPp67cOVcgoEh+EH/3pe
 rAFPJHWbkGFJCAL68vH2zDT5rfDsmFI6bx4lt7GCSpzss0iPQShvtR6CC3MT02EKDwD2
 t1tGnBLL0YvwUiOsCHTiewSSbqANT6sF8IDBoOYSqmCpYshPirL6eIa7Dn5L+Mfo9VaP
 5mRiHg/7nfAyvqUFgbBZoB6PlANeWsqLF9UhKCcoBRl449N4hz6HcEfWifmG9jlnekto
 IehA==
X-Gm-Message-State: AOAM5337Syti7MVqJVUlNOjGI16OIpx+RvgKL1wJriTIe6e8QTR/x9mM
 qNfXoJj6CN5VBqkx8u2us7xqS6x6vH2v+Q==
X-Google-Smtp-Source: ABdhPJxcFKG1mEOJQbvsCg2CAHPJb1YNiCdHaYAZPgOsUJi7bUQcClWyyyCNMSwt//Z3tejgG7RFrg==
X-Received: by 2002:adf:8b02:: with SMTP id n2mr15720884wra.259.1618859914883; 
 Mon, 19 Apr 2021 12:18:34 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f23sm545631wmf.37.2021.04.19.12.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/30] target/mips: Move IEEE rounding mode array to new
 source file
Date: Mon, 19 Apr 2021 21:17:55 +0200
Message-Id: <20210419191823.1555482-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

restore_msa_fp_status() is declared inlined in fpu_helper.h,
and uses the ieee_rm[] array. Therefore any code calling
restore_msa_fp_status() must have access to this ieee_rm[] array.

kvm_mips_get_fpu_registers(), which is in target/mips/kvm.c,
calls restore_msa_fp_status.

Except this tiny array, the rest of fpu_helper.c is only useful
for the TCG accelerator.

To be able to restrict fpu_helper.c to TCG, we need to move the
ieee_rm[] array to a new source file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu.c        | 18 ++++++++++++++++++
 target/mips/fpu_helper.c |  8 --------
 target/mips/meson.build  |  1 +
 3 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 target/mips/fpu.c

diff --git a/target/mips/fpu.c b/target/mips/fpu.c
new file mode 100644
index 00000000000..39a2f7fd22e
--- /dev/null
+++ b/target/mips/fpu.c
@@ -0,0 +1,18 @@
+/*
+ * Helpers for emulation of FPU-related MIPS instructions.
+ *
+ *  Copyright (C) 2004-2005  Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#include "qemu/osdep.h"
+#include "fpu/softfloat-helpers.h"
+#include "fpu_helper.h"
+
+/* convert MIPS rounding mode in FCR31 to IEEE library */
+const FloatRoundMode ieee_rm[4] = {
+    float_round_nearest_even,
+    float_round_to_zero,
+    float_round_up,
+    float_round_down
+};
diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 6dd853259e2..8ce56ed7c81 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -38,14 +38,6 @@
 #define FP_TO_INT32_OVERFLOW 0x7fffffff
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
 
-/* convert MIPS rounding mode in FCR31 to IEEE library */
-const FloatRoundMode ieee_rm[4] = {
-    float_round_nearest_even,
-    float_round_to_zero,
-    float_round_up,
-    float_round_down
-};
-
 target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
 {
     target_ulong arg1 = 0;
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3733d1200f7..5fcb211ca9a 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -9,6 +9,7 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
+  'fpu.c',
   'gdbstub.c',
 ))
 mips_tcg_ss = ss.source_set()
-- 
2.26.3


