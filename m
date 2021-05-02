Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10D370DDF
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:20:48 +0200 (CEST)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEpr-00085b-T8
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElc-0005cE-Ru
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElb-0007T4-CI
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id v12so3091560wrq.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9aHYgYzT6J1wA0FMMiXBOV8u8PmBNE5bOUtIZLsRchM=;
 b=kQapcxIqYtind6MGaR4gjiFhcyuv/QdHntQfJ+xt3GxP36i1qqHN07KZhgPfrRhvUU
 rdenA5LFxMPPkqxg9el+FeWWux6BNeyumikpcfhithvdyGCcPufZI63k4tnYrfyZKJYf
 qqyBJhDX5zzpa0uYrI/ogiv4W8F5y0rzrRTYdoJAf/jG3pfvpwmR2FYKxlFR1QDyReMX
 nrVDy31jZ8JAVOZDMO2bUXFPgfDS6Jw1BZBJoTF2YqHopO1JwxBrlelZxoW8eBJ7GR3A
 J3IlkDmtD3XEwausKrpKMfg8Qp+PPbz5O76SJrWT4pv/4N66tnthxG37UJHYV89AOQXu
 W5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9aHYgYzT6J1wA0FMMiXBOV8u8PmBNE5bOUtIZLsRchM=;
 b=syyhKbS2jSXLhZTJaYKa2jjDDYDbkhzs8V4zsdQAIWcz/J6a5my/0DtNoXt4COGwIW
 bHjht6ik761phe0F7Tfg3CYBiOD1oZHibmSh9HELjk37GFwZI5h08i0WsifXBJEvNnBR
 oPGq8Klfcd8tt41ndmqT+Nw1Z6a9qmzH2GbuEPN38zW+AwUKr6GVWWYuusil02p7zt1b
 Er6yk9qbleSxZXUf54xNY/PTium2Kxn/ueiLCO4mEbwD06kW95XVbJrxbsfrbF/vUh+W
 E2quSPsdyvk3FQA3579KC5JUPo6LV24Jz1mhspWPBA0FRTqL69Vh6FsDRU8wdGu5FZy/
 FiQg==
X-Gm-Message-State: AOAM530l5jy7yP4HqUeaTAQGCtiwQ1sGccBUFczpYP8ZRbykuuJ1KNld
 wScJTeZT/ozQ4qPHhxk8oMXCLArScxI4bikb
X-Google-Smtp-Source: ABdhPJxTzP7+oM3S4uMjRRtq01ifxA8JZSJ80beccg4IPh/ufe4zUEVdVWByq++CC9zQvNg7JSqrsQ==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr19819781wrw.212.1619972181918; 
 Sun, 02 May 2021 09:16:21 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u2sm10619688wmm.5.2021.05.02.09.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] target/mips: Move IEEE rounding mode array to new source
 file
Date: Sun,  2 May 2021 18:15:10 +0200
Message-Id: <20210502161538.534038-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Message-Id: <20210428170410.479308-3-f4bug@amsat.org>
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


