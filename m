Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D18363858
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:56:57 +0200 (CEST)
Received: from localhost ([::1]:40558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGLY-00007k-D4
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGG1-0002Le-AW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGFz-0000Mh-P3
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s7so31941004wru.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGOvaajXfmrpLSnOyhpIroCQXe3e+OS5MF3gQarLZWU=;
 b=QNWivB0L78JT1kd7GTmkKb8wUPAPwNm5zXohZKxJy7IquaKDl/Yzg3BMgbLib0B0jS
 rdXs4YRgNy7VRtbf2GGRcs2LUZvCC3eo8KwLwS3x0wi+vXjfo42mr7NMTWc4nHudokLt
 0LcgaYZoFdEY1wNGW1gNZHAJXOpjPvrOktyVvHLsFyS/AQCYKbSUpm3Llr9e11KuSTo0
 OzEEmKvXuKv/tD6LIDg9onGEImOwXp/xaU9tDeIUDASwARMLPngfZFP+hj3tsZcQI7dg
 Wx3/F+Q3OeA+qrKlZgvQEKeJ2pj0DAfAZd59qKe+hnHtWMfodRBp3b3KfTJb2Eq18T+Z
 xcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fGOvaajXfmrpLSnOyhpIroCQXe3e+OS5MF3gQarLZWU=;
 b=dIeES39kvKsOzHZE4UghgFnAlk5cJ8akOSrrG5xo+uUjFN2zucHGeCIL1hbAvFG2Vd
 0cnw1/tGbgx+jvDHUplg90tTZaaLjNxBGYnnYISG7SCtP8ev6XJyITpyCO3eyzu7LwAq
 +4Rx1LWpETzZmrGbIHzin7TrmqN3MWG3D/PU0p/7ZSaW5S0EdNECPwcT03YGaiYPZuq3
 5snMFWQ0VXY9fGUeMs5bcAMdXCQJ3S8cAAHSFFtul+BCnHqoox3+hFhDVIKtRMgWhdgD
 bNjfA52IYfZNzfGkyjX1xmfDF0jKl+MNUDsT1ruS9Kn9wX0pC5h8MHZXBwg3aot2LZr0
 jsQA==
X-Gm-Message-State: AOAM53233r4pExJ6MKizIDgOHdzW1afEn2gE+4NkyD19fHTw8Fi0y0Ap
 9HzWugFvswf3j2bv/9wsS/DMQ7M+onpN0w==
X-Google-Smtp-Source: ABdhPJw5bdgj/nrcN8qxu7gCPBPkwh6PVJs0KKVqtV863IaReWsmB+Tf4JACO1OQvYO7hvjRWOCFig==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr11099761wrj.420.1618786269900; 
 Sun, 18 Apr 2021 15:51:09 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m67sm20080759wme.27.2021.04.18.15.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/29] target/mips: Move IEEE rounding mode array to new
 source file
Date: Mon, 19 Apr 2021 00:50:31 +0200
Message-Id: <20210418225058.1257014-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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


