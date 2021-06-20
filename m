Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F93AE0C1
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:41:22 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5Bx-0003DY-El
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53t-0002Nf-LQ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:01 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53o-0008Ub-2Q
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id t8so1860007pfe.3
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4kZDh8uVsOZEauYx+O7aUBWOVxEx002X2bRwf1pVz0=;
 b=cdpo0K+Sh0yVlGEkyYNgjItt4m5Cs0tDBwPBlTc6QZtl9ek2+qHgs+y4VsXTmSDvH4
 nH3NCS21MP646qMm3TyWu9/Qa1iCekyitqeL29h4eYbz+bu78gZ9S0DBSQLG8+I53fHL
 2GzXDpxBxwd42DwLXpfwtoncBWgf8ItWjqoGXvvuZtsH1kzAWN7kTJPLIhYZpvE30uAJ
 s39HLAQUTXE4wZqxIaktwEhm7BN9WoZe1CyQDCYkIOKPlc8NyaEuSduhRF6uYKJzupiH
 HEpifoDdfxvzm+RopE/LeCEP6OiM+SUfFudvbcXkfSdwMspwK2EkSqf76IE9EhInbgqH
 t6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4kZDh8uVsOZEauYx+O7aUBWOVxEx002X2bRwf1pVz0=;
 b=peXjdONyCZAxayKJTbHc2eQBg6BHizSGYlUBcMSkT/J83i7cqkzSenQFMPrq12l1z8
 gonypTNVpKThk5vnc92076SB1ChmTQSyRZ8WkfD8ctqwd0h0px2uhpzahihPthelp8Zs
 WP2HzBHC78xz1ICNom4tbbgcZsVfhp16mQwp9y0oPj8wKpwfmQaYLnb30q6neeskTINS
 eimeDxCbg0iTVFCCdBDGtMWVIthEOaHnQionxlhtZcFn1ca5sGvyE4kovkYZf8EC7Zz0
 RKU0V4C4NkRwtJKd4gZ6JYiQH45v3t6yXv+E9gyP2QRK9jNVlFXIIZBcYQT29uv2YGAS
 k0kw==
X-Gm-Message-State: AOAM530YfmSoMIJGGgP6JJBTiZB2lyp+kftTNv4UFw1g5f5Soc1bvM1Y
 ipCIls/c0oGLuj+LavovPJc5yxLjPz/j8g==
X-Google-Smtp-Source: ABdhPJzJ65lCqomzyl6He88ZpE6x7SWJy7FQ+Ct2Y94IMZZmdf2CZw5JQKBIskwLQObWSc3UKRV38A==
X-Received: by 2002:a62:8f81:0:b029:2e9:c6d9:df67 with SMTP id
 n123-20020a628f810000b02902e9c6d9df67mr16340032pfd.52.1624224774300; 
 Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] target/cris: Mark static arrays const
Date: Sun, 20 Jun 2021 14:32:46 -0700
Message-Id: <20210620213249.1494274-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
index f6d1fa914f..83b20162f1 100644
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
@@ -1279,7 +1280,7 @@ static int dec_prep_alu_m(CPUCRISState *env, DisasContext *dc,
 #if DISAS_CRIS
 static const char *cc_name(int cc)
 {
-    static const char *cc_names[16] = {
+    static const char * const cc_names[16] = {
         "cc", "cs", "ne", "eq", "vc", "vs", "pl", "mi",
         "ls", "hi", "ge", "lt", "gt", "le", "a", "p"
     };
@@ -2926,7 +2927,7 @@ static int dec_null(CPUCRISState *env, DisasContext *dc)
     return 2;
 }
 
-static struct decoder_info {
+static const struct decoder_info {
     struct {
         uint32_t bits;
         uint32_t mask;
@@ -3359,8 +3360,8 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


