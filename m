Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29480370DF0
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:27:40 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEwV-0006zu-5y
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElo-0005e1-0M
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElm-0007V6-B4
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id n2so3130140wrm.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U33GaZGmKc4FXCL1JvbSdQZh866O1wwcqJkiYK14iVg=;
 b=Le7YhhrPWUwgaAYXTqhR9PfkgWkK9VtyCQlDyfvTcFYSBRGjCZekgjfz4XgcQZ0YoD
 dONKBUaOhX5xrb4ebD68UfPQlCQyjMvoZxUXnHUp58dElWE+WX2aCJyv4wxYP93PLoUS
 Cyo/ZGlnvug0fMhDyEoVteddXaXlAs65uLh2+OZbxhB+FCB8BPs7R6rYzjgSHhjCeHz3
 Z+qtZUmiqx3FMMlAqYAUr/7vO+csDBCeiMQWs0Ts3cLEtmsR7xVUSZQ8gqWi8fV1RPl9
 aN4+ob1Xoxr3JoN9NReIBHVPNq6Dr7IgMd4j+v4yjCx9k7KoQnliPWdiybsfB9Gt0R1h
 4bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U33GaZGmKc4FXCL1JvbSdQZh866O1wwcqJkiYK14iVg=;
 b=Q9EaYPdeutJpCIC8UT3+CZUSu/B8XxYSLvf2pSbN2GSreTToM/POzojucJu6Ia/v4b
 SJ5rNmZzivZxoQr1b1jhlvHxKxBJiXAnpB9IwMrN5IlQtmlkvmkTLPqHssThFt/Q2+2G
 VJQY41a5z1kC6QpWE6DV58PuZr7emSsk/JzX2gWB+C3sVlxM9ofYWaJ8dM/udKRkdnnp
 QjivlP5Xft2Jfbjq9YRueZY6F3XAxKKYzYElpP09gWpi1gjRnQY1ZHycVFz2kXHw+kkO
 5ajm3PX6QElJxfvO6Qr67d2EqlCc3MEJUovb05Zud2m9SywonHnaOk7kXV9t9Srntg6V
 odUw==
X-Gm-Message-State: AOAM531ixTzEipuR5yOLMRTiJ15Rjs4oJsWI7ykbLKSeUoImpV0tBJE/
 H8PJSzxpn5EiUunuiF2uLdFUhb6tIE74DDXH
X-Google-Smtp-Source: ABdhPJw64wLkDmF8aCNK25kVFdMHmoY/+6BGDxBc78j0X0HRB/pqdjT/3hsU9lPBVpHTBtFcMdhdvA==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr20212854wrn.363.1619972192106; 
 Sun, 02 May 2021 09:16:32 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m11sm9463723wri.44.2021.05.02.09.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/36] target/mips: Make CPU/FPU regnames[] arrays global
Date: Sun,  2 May 2021 18:15:12 +0200
Message-Id: <20210502161538.534038-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

The CPU/FPU regnames[] arrays is used in mips_tcg_init() and
mips_cpu_dump_state(), which while being in translate.c is
not specific to TCG.

To be able to move mips_cpu_dump_state() to cpu.c, which is
compiled for all accelerator, we need to make the regnames[]
arrays global to target/mips/ by declaring them in "internal.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-5-f4bug@amsat.org>
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


