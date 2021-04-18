Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0623636AF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:39:45 +0200 (CEST)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYASW-0007wD-Ml
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKs-0002Rw-4M
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKq-0004PL-HK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so22459462wrt.12
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpoNBDIqjGZ8Kx6BEbS7lZL3RSkdLsQ+f0VxVq/nvuQ=;
 b=r5hfpFp5NJBFF6gq+ARsJtfKX1OHw2ZlOyRiPKb/Xpxa7Ca4oPP3/yhesLZAZyOlYU
 NpIhFqAxE2umPmr5gUZzUwQfJXIinQ1ha7/1XZlM1bfnTvVaEri60dc6njHac6BhU7mP
 X0TwEzMPzN4cmKxboXMEsvHlVdF9wkpOLdj39GeAVPkeRQR421mKz+XjCEAfuLhGVDSW
 3oC4C1x0790mwGRpJGma8bqwCtPB0sL55Z16Yg8AWxVdwXg8PjoXUenJEOuK4Ic+FcW4
 U/wDoLPAGcl4KvafvwZN0SvIPFQC7/7Dk6eOk0Tt/i2rG0bmWVy/g2MI8D3GM7lRaZeO
 HMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gpoNBDIqjGZ8Kx6BEbS7lZL3RSkdLsQ+f0VxVq/nvuQ=;
 b=RgVkGow6JRra65wjdONVLHAJfMIQ152yn/WOvnREjZQ8M1dv60yYjr5PqJfvwtNtSD
 u/EiwdMwG3fO/TfoGcC/fsR/+gSoDhRVv/J7O+dwl2EZ3dL2GiXGnBO2I5vDHwlOpFlo
 E2a0ti6TDKTTbYThnpJa10r/0kwR7IOCjEaXf7xU9fF6XDgzHryttj2pcei/vObgPkZK
 ACtvD3j/TyB1hFC0ajaYDwqBkW6EbiPOj+ddX3Lhx8cmjP8onffm+91Io8k6g0CRszoY
 5H+dP4NhGluSadul7sphmZtAGjfC2a5criSDV6FpY9jxINX/MeZb0qXzpvYxYc72BlLQ
 4Dmg==
X-Gm-Message-State: AOAM530XRhpXE3xsUYy5tY1buo3Crrt//+arAFGsttDw8n5Hs2e6S5XG
 rtK9Qq2RZzRF1poSUOsg9Yofy5n3m6uU1w==
X-Google-Smtp-Source: ABdhPJwEXZ+6e89/VzvLpG1HsSTNk0519+2+yvy4B3kk43It+/lzCvmaEDR5fQ3+VL2k46u9sn/TVA==
X-Received: by 2002:adf:f5cc:: with SMTP id k12mr9746560wrp.117.1618763506941; 
 Sun, 18 Apr 2021 09:31:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l4sm19466811wrx.24.2021.04.18.09.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:31:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/26] target/mips: Move IEEE rounding mode array to new
 source file
Date: Sun, 18 Apr 2021 18:31:10 +0200
Message-Id: <20210418163134.1133100-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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


