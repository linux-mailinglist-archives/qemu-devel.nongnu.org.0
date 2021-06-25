Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A813B40F2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:54:31 +0200 (CEST)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiXe-0003Ev-NA
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4k-0006bC-IA
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4i-0002D1-R8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id u20so630920wmq.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z3wZSKfgpDL8vaWMLSuWVaLYUZ6Ms90loGBbtNoC/Qo=;
 b=HYud0adKfSUKhdOcGbaVOejHqV/EpokTAihJYx7ygtcuiyydWn8EsxU6xbRuJGH7nb
 25UZYMY318In3mhelHB2ejZdNmLLPCYhNm/MUYksf0avYEZPJZ9rm/36ZxCXzWHZhN83
 3mtiqH/0t06qYsE4lo8jCyxvWjsbCY81/wUkCITXJgtDO+usN5OZKV6vKzwtKV2qo8PN
 2TqIRqmRlBB+GaQLCY6EjjqFWsUgvaqKZPL845YbgbHknL1TXm5DG736D6AdrKc/HzGj
 pmi8yCB8TivuhnjWuoRPyUNCIhmXUty+Y1a5oZ5mo6ivuov1c9W+wSZr18agiBMNw7hi
 A9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z3wZSKfgpDL8vaWMLSuWVaLYUZ6Ms90loGBbtNoC/Qo=;
 b=fn3nRLNaJ9XLbUIDclP4U60oKvWqZSTcoNRDUvD79LybkSieKbNd6n63k7GJelrHZB
 YRgzhvMqruaZfYiVa+HQDnvT3M7G4NfqqvAx1uqjRdZnxXWHqYy7a3RnwLdPabDAcDPv
 Vps2yfG2EE8eLKNr7jeNTMYQspFBXk2/2cU7znO6UNCvZb+2Znn1oK8vCDnFftQNBAYK
 M3y06mW7zt/UkLe9QfB/uNR5U/yYSYLLFw3njOsiysp9r8gu2xWiJjYMvSU2X9gVFQvh
 9XLFg3uBlMWMF8DagU3WBxZM5vA4qOU8f3dxDRLTBGtb2j37TMUabgyRtFlqdI6pjLVL
 cTKw==
X-Gm-Message-State: AOAM5320yggyJ0aabUUzanNkayD3cNxWmuknD/ts8OXvyIhjMviYwOYJ
 yqRTG0YdgYrdfGpQgpsaRRlAHd0PKtm2Iw==
X-Google-Smtp-Source: ABdhPJxN1oDBJukEZnOLIgmAv+1Q8e/pB8PqhRzPuPHmD2UyC8Yd+UrQqE5kpSR1lsUql2EnvEb7xg==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr9570043wmk.21.1624613075135;
 Fri, 25 Jun 2021 02:24:35 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m184sm5089542wmm.26.2021.06.25.02.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] target/mips: Optimize regnames[] arrays
Date: Fri, 25 Jun 2021 11:23:27 +0200
Message-Id: <20210625092329.1529100-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all entries are no more than 3/4/6 bytes (including nul
terminator), can save space and pie runtime relocations by
declaring regnames[] as array of 3/4/6 const char.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-10-f4bug@amsat.org>
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
index ae6587edf69..b0df4f85dfe 100644
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
index fb0a811af6c..963d4ba8b13 100644
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
index d248b5e5d21..b4a454ec09b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1280,11 +1280,11 @@ TCGv_i64 fpu_f64[32];
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


