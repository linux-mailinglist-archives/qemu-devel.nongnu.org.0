Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069163ADCC6
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:26:56 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup2t-0000oa-2C
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoy3-0005Km-Hn
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxx-0007zJ-Nz
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id w31so11273061pga.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xehCQ9vTLilSPHreJ5z6HAmdw9vSAgo0a8TpFRTr4mo=;
 b=uf1LXOjQlLi95vPdgt/zeewXab2w5VyDPzjECeToS0mC48/Fxv+TBn9QNS4+3Z/6QN
 tRBp0tD3seNFEaERPKMSkcos6OhLMh2q3FSxu4la6IXXRceWy7lsVUuHxuHTiFJ5ozbw
 kg7e0mjysDxzsxUDeGLkGFl6p4GzF5ZxT1iCtLSF7/ojJhwBxSKf1mDHdBhC/IeQ2ZUn
 L8myaDTIgFWwnJtmYPIR5OVP14DsS9DYxxFLwnNov0YWNgO3RNWmQXX+y2n4/601lZSe
 d1nWWnR0N407+LSZHYZrfgdor/Ws6138i/3y0LnN0xDyWRAoYYMtURd4Xqv5WqI6Wn0k
 Zu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xehCQ9vTLilSPHreJ5z6HAmdw9vSAgo0a8TpFRTr4mo=;
 b=EZ8tHQLqRmuhgRAk12FFFijES7SwkF2O6Ti84mq/Xo989FcsRfjFHniBZiU1at3HAL
 01dsqa27aNu/6ONDV4UmYUkPO7ONfhe9lfAmQiVlNvzHNanICBzLs9DzodPEmQCRUX9h
 Ubn+KCr+9C9vnodrgnSdxMajGyvNvl9NFzEp4cc85nEOpnokQua25zz0bg7jjC64mk8I
 6xoh2iK2E6KAfhTfwbgCdMKYWlAETworcHIVE97JSawVZMWFZrcTgQGGjJbg0Ap0sZY3
 SE4ykg7NOtDmFMHn1yXUYg5BFoGyP91bfUmR3U2Z4xmwDuQhtwfmPl/1HuRa0bu8wWRQ
 iy6A==
X-Gm-Message-State: AOAM531Ra8VifS9IrNXXngVoNPHaPjCSMjXgpYKtkBsRYs9CUJyn8qkB
 ++mkwMuJGYjvHzpk5nxupHe0ITcrD1rTzw==
X-Google-Smtp-Source: ABdhPJxjt23Cppk464+j24+FrmD5p01NjSLBEX838O7s2m7vrs7dHelddSkrfOo/d7e4ifcvItLojA==
X-Received: by 2002:a63:e245:: with SMTP id y5mr17462746pgj.171.1624162907668; 
 Sat, 19 Jun 2021 21:21:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/cris: Mark static arrays const
Date: Sat, 19 Jun 2021 21:21:39 -0700
Message-Id: <20210620042141.1235541-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 19 ++++++++++---------
 target/cris/translate_v10.c.inc |  6 +++---
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 8c24053f5e..3515c21b7b 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -137,14 +137,15 @@ static void gen_BUG(DisasContext *dc, const char *file, int line)
     cpu_abort(CPU(dc->cpu), "%s:%d pc=%x\n", file, line, dc->pc);
 }
 
-static const char *regnames_v32[] =
+static const char * const regnames_v32[] =
 {
     "$r0", "$r1", "$r2", "$r3",
     "$r4", "$r5", "$r6", "$r7",
     "$r8", "$r9", "$r10", "$r11",
     "$r12", "$r13", "$sp", "$acr",
 };
-static const char *pregnames_v32[] =
+
+static const char * const pregnames_v32[] =
 {
     "$bz", "$vr", "$pid", "$srs",
     "$wz", "$exs", "$eda", "$mof",
@@ -153,7 +154,7 @@ static const char *pregnames_v32[] =
 };
 
 /* We need this table to handle preg-moves with implicit width.  */
-static int preg_sizes[] = {
+static const int preg_sizes[] = {
     1, /* bz.  */
     1, /* vr.  */
     4, /* pid.  */
@@ -475,9 +476,9 @@ static inline void t_gen_swapw(TCGv d, TCGv s)
    ((T0 >> 5) & 0x02020202) |
    ((T0 >> 7) & 0x01010101));
  */
-static inline void t_gen_swapr(TCGv d, TCGv s)
+static void t_gen_swapr(TCGv d, TCGv s)
 {
-    struct {
+    static const struct {
         int shift; /* LSL when positive, LSR when negative.  */
         uint32_t mask;
     } bitrev[] = {
@@ -1284,7 +1285,7 @@ static int dec_prep_alu_m(CPUCRISState *env, DisasContext *dc,
 #if DISAS_CRIS
 static const char *cc_name(int cc)
 {
-    static const char *cc_names[16] = {
+    static const char * const cc_names[16] = {
         "cc", "cs", "ne", "eq", "vc", "vs", "pl", "mi",
         "ls", "hi", "ge", "lt", "gt", "le", "a", "p"
     };
@@ -2931,7 +2932,7 @@ static int dec_null(CPUCRISState *env, DisasContext *dc)
     return 2;
 }
 
-static struct decoder_info {
+static const struct decoder_info {
     struct {
         uint32_t bits;
         uint32_t mask;
@@ -3371,8 +3372,8 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
     CPUCRISState *env = &cpu->env;
-    const char **regnames;
-    const char **pregnames;
+    const char * const *regnames;
+    const char * const *pregnames;
     int i;
 
     if (!env) {
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 0ba2aca96f..4ab43dc404 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "crisv10-decode.h"
 
-static const char *regnames_v10[] =
+static const char * const regnames_v10[] =
 {
     "$r0", "$r1", "$r2", "$r3",
     "$r4", "$r5", "$r6", "$r7",
@@ -29,7 +29,7 @@ static const char *regnames_v10[] =
     "$r12", "$r13", "$sp", "$pc",
 };
 
-static const char *pregnames_v10[] =
+static const char * const pregnames_v10[] =
 {
     "$bz", "$vr", "$p2", "$p3",
     "$wz", "$ccr", "$p6-prefix", "$mof",
@@ -38,7 +38,7 @@ static const char *pregnames_v10[] =
 };
 
 /* We need this table to handle preg-moves with implicit width.  */
-static int preg_sizes_v10[] = {
+static const int preg_sizes_v10[] = {
     1, /* bz.  */
     1, /* vr.  */
     1, /* pid. */
-- 
2.25.1


