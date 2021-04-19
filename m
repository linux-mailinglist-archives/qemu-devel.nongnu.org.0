Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E364364A80
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:23:49 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZUp-00030l-Uc
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQ4-0006Ur-AP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQ2-00017r-Q5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id k26so18752730wrc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jK+gaco4qgdVhboeMerJ/bnvg6dnQ6kpU1z6QqW9e3M=;
 b=Nhj2vqKHQdKioneDnC2EAcLaGuo4ppKDS7DnZs0P4Y1GYs3G8/QYQ1nzi9ikCy4UqO
 pi68PN+GO8kKLVf+P/lJGhQF9pid9b7u4NMNEJy20PS3IUKboHLxfZIyUbDTAU7nKNWJ
 onVpf5KW3Y0c8GPma/s1iyIAUN657nV0LTd0sWUoYD9cEjLrdQ9CcrAxuJKbsAz6DpeE
 fQSOhkiskJdlLq3GkcpMHO2vNQ9Cbcheh1t85RxMGzH1BKEuwcRUmdQI6XEJxlJWppdI
 zRmNY7bDUqUKVisU01nHl51E8O71rErT51Iu3prLh967zKW4qavJZGNM6QqwT6IgdhUt
 9X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jK+gaco4qgdVhboeMerJ/bnvg6dnQ6kpU1z6QqW9e3M=;
 b=tBY0SBY8LtpavNI3pSzTP33SjWB+UySvt3F+JiNFFOEy5oC0YOiEgSaNcfEY9ngt9v
 7wL0Y5g9SH7swFMdYJcLAAkC5WCtTNpwki+S1YmC3CKwUzA4f9imWhAQcQi3DcxhkYDT
 gxCiDd2Ko5sQL7oIPDfG5uw3SBGhGuqzdxzfRYQKnLAHkdU9qE6UaMSkP008T6wxcPN9
 U/su/I5TmsX4ydt2M+vdFsoESmuE3n9VA8idwgphvP4J4cDuo/rYAdtzRHbi1vOK63zE
 y//ubnJsVC9PYnZQl5X5ouJ2+0G1a93HOTBviw69B0ccbT7qg+T7baTIa9EcnGfaQA+f
 T24g==
X-Gm-Message-State: AOAM532Cze9/e40WMLuQsJtLhCwvPUPFL8HVis+AOhef7Tz8njn4l1BC
 vH2FYIs2WtgO2CZKpS3oWnq32lf7MXFvxw==
X-Google-Smtp-Source: ABdhPJzLoFi4JNVy2b0YsHmsILZ3ie5xTYyHpk45C+EBbhLqTsmhAjW4A5vaEi2iUhqteEASdl3Xog==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr16090532wrw.379.1618859929386; 
 Mon, 19 Apr 2021 12:18:49 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c1sm23538279wrx.89.2021.04.19.12.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/30] target/mips: Optimize CPU/FPU regnames[] arrays
Date: Mon, 19 Apr 2021 21:17:58 +0200
Message-Id: <20210419191823.1555482-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Since all entries are no more than 4 bytes (including nul
terminator), can save space and pie runtime relocations by
declaring regnames[] as array of 4 const char.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 4 ++--
 target/mips/cpu.c      | 2 +-
 target/mips/fpu.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index a8644f754a6..37f54a8b3fc 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -71,8 +71,8 @@ struct mips_def_t {
     int32_t SAARP;
 };
 
-extern const char * const regnames[32];
-extern const char * const fregnames[32];
+extern const char regnames[32][4];
+extern const char fregnames[32][4];
 
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f354d18aec4..ed9552ebeb7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -35,7 +35,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
-const char * const regnames[32] = {
+const char regnames[32][4] = {
     "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
     "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
     "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
diff --git a/target/mips/fpu.c b/target/mips/fpu.c
index 1447dba3fa3..c7c487c1f9f 100644
--- a/target/mips/fpu.c
+++ b/target/mips/fpu.c
@@ -17,7 +17,7 @@ const FloatRoundMode ieee_rm[4] = {
     float_round_down
 };
 
-const char * const fregnames[32] = {
+const char fregnames[32][4] = {
     "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
     "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
     "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
-- 
2.26.3


