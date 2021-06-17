Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBB3ABADA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:48:51 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw8I-0006m7-Vk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3n-00073n-7r
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3l-0001Rq-Hy
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so7710956wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RoU+7ht74MR+uFQU3Fe913vTah/u1fs34mzDvWBnykU=;
 b=PFWA+9fPatF/9NJ95kCiwTEH+SgOOZzRg+Z2TkfGcqNKBr++fRBZCHM2F1UafxCXFJ
 hgVqYgdO+dLdIm4yBvfws5mQo/9GZuMqwqgo1d7xWygtBqR4RiPxDfIVO+ZDJWvbjkJJ
 FvZNKoCRa48hF4MTnn/ByQvtHsFN/tOcQl03uTJkMp15qXYCDw+fQ8UqIyWY1jWBIiZF
 yUoJrIQ14QraJBkiWGLvlKpwWHEhAegXI0nc0S4Qwa1bngAip3wgMAlvDBgExMTFnLmB
 GkMN4LLm2vBxVqb7TW1OYeYHZ/eRCrMooZ8mJ6pWqXMLpxXNhRtFVrTee4f87e3P6sDk
 ZeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RoU+7ht74MR+uFQU3Fe913vTah/u1fs34mzDvWBnykU=;
 b=qV0Dn9P2e5W2HGkAdkg3ISMY623th3uULNpB27tOjA52mdtE9UI7+qQDqfmeSSR+l3
 fuhEQrc+OWRn1103kZo2wxGqROKFIQjtuccY7Ax7kRkJ+AJNGI8BLIVNG3+DGuoahdqF
 jB5hjhYsrZLSjH5wsx/W6LxZzrRS9IYfQSUARPk2fugd6glY5pPUCKOHYGLVMQGNQm1l
 qZnbnIW1E6mkGKu1XksMCn/pVadIMMpAPkH0n2vMLFqJBLyXOnMjPmfiS+w2Bu0hZL/h
 eepGyhRx89BrA65Bbon057MlU7lpQCrh6ew6zo3aHV2l5zrukMPrAmOAKVhdmDeBbEIX
 Q8vA==
X-Gm-Message-State: AOAM531XV9M/AuJM9q2I1LFwYMRzPthQaaT1bmi9a5cGasHJ7tABPerk
 XThKOc9rG0eHknZql5OAOvDbwhX+IWzEGQ==
X-Google-Smtp-Source: ABdhPJzM3qtaAu5eq0B0+9Uu2piNu4NBocIwXUSu57BL5+GFMsz83ivWyZfUSNP9b/LfGPgJfH5XBA==
X-Received: by 2002:adf:a412:: with SMTP id d18mr7259901wra.49.1623951848000; 
 Thu, 17 Jun 2021 10:44:08 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v8sm6645721wrc.29.2021.06.17.10.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:44:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/mips: Optimize regnames[] arrays
Date: Thu, 17 Jun 2021 19:43:23 +0200
Message-Id: <20210617174323.2900831-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all entries are no more than 3/4/6 bytes (including nul
terminator), can save space and pie runtime relocations by
declaring regnames[] as array of 3/4/6 const char.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h          | 2 +-
 target/mips/cpu.c               | 2 +-
 target/mips/tcg/msa_translate.c | 2 +-
 target/mips/tcg/mxu_translate.c | 4 ++--
 target/mips/tcg/translate.c     | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 18d5da64a57..eecdd101169 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -74,7 +74,7 @@ struct mips_def_t {
     int32_t SAARP;
 };
 
-extern const char regnames[32][4];
+extern const char regnames[32][3];
 extern const char fregnames[32][4];
 
 extern const struct mips_def_t mips_defs[];
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 96236abc006..d426918291a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -35,7 +35,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
-const char regnames[32][4] = {
+const char regnames[32][3] = {
     "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
     "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
     "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index b3b06352bf2..a2f7d6a1e08 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -255,7 +255,7 @@ enum {
     OPC_BINSRI_df   = (0x7 << 23) | OPC_MSA_BIT_09,
 };
 
-static const char * const msaregnames[] = {
+static const char msaregnames[][6] = {
     "w0.d0",  "w0.d1",  "w1.d0",  "w1.d1",
     "w2.d0",  "w2.d1",  "w3.d0",  "w3.d1",
     "w4.d0",  "w4.d1",  "w5.d0",  "w5.d1",
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f70a8ca59f4..e336518cdea 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -447,9 +447,9 @@ enum {
 static TCGv mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
 static TCGv mxu_CR;
 
-static const char * const mxuregnames[] = {
+static const char mxuregnames[][4] = {
     "XR1",  "XR2",  "XR3",  "XR4",  "XR5",  "XR6",  "XR7",  "XR8",
-    "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "MXU_CR",
+    "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "XCR",
 };
 
 void mxu_translate_init(void)
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5d571d83c54..255f97fe9c1 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1281,11 +1281,11 @@ TCGv_i64 fpu_f64[32];
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-static const char * const regnames_HI[] = {
+static const char regnames_HI[][4] = {
     "HI0", "HI1", "HI2", "HI3",
 };
 
-static const char * const regnames_LO[] = {
+static const char regnames_LO[][4] = {
     "LO0", "LO1", "LO2", "LO3",
 };
 
-- 
2.31.1


