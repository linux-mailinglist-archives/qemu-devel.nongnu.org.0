Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DF36DE09
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:17:40 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnoh-0003dY-Bp
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncJ-0007dU-IZ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncH-0005og-RR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id t18so6246559wry.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8QpgoHSjUQHQmnKwhaHEWBPun3v2yiMKRzyi8Uhl6w=;
 b=CJItHyxsybT6+hSmpDa6CAOE0p1J9EsQspjITXQYpTI9JLnOq5uouuG7ABXKiO7uHH
 1pZ6prIb1PGDLgSeSb5JQ1W024SSceI6Al1r9fU1xXcUGELJpgzjHGkhh8OGpv6GKbG1
 mAW8CC0BNnYlSysLVVIu8QtZR7tchWFbsTiF+3gL7jDP7g+aAdvC7lqj+t+GwoUUV2C9
 9bmoNJlGxs/+Y0xYKaajR23XinlIJKSblRgCGHozW8OvgOyTiOympm2hHJZIJeHYkt3K
 YCtgz14EZQHaiiCn7KiCi3PDI8dOw7ECWsHUIiizXTUZq59rISLwthcu0RPt0qCQb7r8
 tCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u8QpgoHSjUQHQmnKwhaHEWBPun3v2yiMKRzyi8Uhl6w=;
 b=C4QrPn8ytQuNgU8+5/V57ykvMSejHrhdqKR5I+NJhMpgORI0BMioFmVZA0020PM2th
 yyZcmvYlxxLgj4OYO4QjjdueheVCQPER2Kj2FEkL5oVs1EOlXtbKPKlW6D6BMNY3+za1
 RCriUQ25EeoAjuoGhbqc5EVKFyvtQl8UpAOgKjTcuiUcBsgl3Im1McjgHpSXblUQQpZI
 JbxvBF3+lfDuYFgKx7UWpQ92AJ5GjqC8uxLJc4UUFtPy1MzdTiBT0353dUmnNe8qa7fb
 o+QqoQWwjo8js6QULwAd+0Dd8MBRFC0T1eqtDvtb+b9+0qwamZoYQeZM8DkxVa6b1sr7
 VnIA==
X-Gm-Message-State: AOAM532ULC+8XyhnxN5xCkl3mL/ogFTUh4mxsyi2XXkLnqFfmfCjdEn9
 mYhhoBUouLZFtDb2SWKopC2zbeHYgQe/Ig==
X-Google-Smtp-Source: ABdhPJyeyYh1mkfciZhY+vPNTyPHsYgOiSL5FOo+i+GnPGJPuguu/cV9nGC4cMTivDjRIOnMbw3idg==
X-Received: by 2002:adf:f40f:: with SMTP id g15mr37546430wro.46.1619629488259; 
 Wed, 28 Apr 2021 10:04:48 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k16sm312004wmi.44.2021.04.28.10.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/30] target/mips: Make CPU/FPU regnames[] arrays global
Date: Wed, 28 Apr 2021 19:03:44 +0200
Message-Id: <20210428170410.479308-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The CPU/FPU regnames[] arrays is used in mips_tcg_init() and
mips_cpu_dump_state(), which while being in translate.c is
not specific to TCG.

To be able to move mips_cpu_dump_state() to cpu.c, which is
compiled for all accelerator, we need to make the regnames[]
arrays global to target/mips/ by declaring them in "internal.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  |  3 +++
 target/mips/cpu.c       |  7 +++++++
 target/mips/fpu.c       |  7 +++++++
 target/mips/translate.c | 14 --------------
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 99264b8bf6a..a8644f754a6 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -71,6 +71,9 @@ struct mips_def_t {
     int32_t SAARP;
 };
 
+extern const char * const regnames[32];
+extern const char * const fregnames[32];
+
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index dce1e166bde..f354d18aec4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -35,6 +35,13 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
+const char * const regnames[32] = {
+    "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
+    "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
+    "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
+    "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
+};
+
 #if !defined(CONFIG_USER_ONLY)
 
 /* Called for updates to CP0_Status.  */
diff --git a/target/mips/fpu.c b/target/mips/fpu.c
index 39a2f7fd22e..1447dba3fa3 100644
--- a/target/mips/fpu.c
+++ b/target/mips/fpu.c
@@ -16,3 +16,10 @@ const FloatRoundMode ieee_rm[4] = {
     float_round_up,
     float_round_down
 };
+
+const char * const fregnames[32] = {
+    "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
+    "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
+    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
+    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
+};
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0e90d8cace6..8d686e90954 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1267,13 +1267,6 @@ TCGv_i64 fpu_f64[32];
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-static const char * const regnames[] = {
-    "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
-    "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
-    "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
-    "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
-};
-
 static const char * const regnames_HI[] = {
     "HI0", "HI1", "HI2", "HI3",
 };
@@ -1282,13 +1275,6 @@ static const char * const regnames_LO[] = {
     "LO0", "LO1", "LO2", "LO3",
 };
 
-static const char * const fregnames[] = {
-    "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
-    "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
-    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
-    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
-};
-
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
 {
-- 
2.26.3


