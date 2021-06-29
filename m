Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEFC3B78C0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:36:02 +0200 (CEST)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJWb-0004nt-FM
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItF-0008CE-Jd
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000ta-0N
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so2556316pjb.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDzjdzY2uNgirunivl38O17B6vfKe1pDPaF+QZIpYjM=;
 b=IDf7F/H87WZSPij1x46NiqLZub5PUnG986U3ixBWWB+7GYfgcoX33dd+26ujFL+JdZ
 IlCWjEzUtFL8Y5F9gEDl7i+AWhKfZiZmY9Slfkm93Gt6xjop5frRcbvrDi70ZZnZSjFP
 LYxEcdQ/+Lwp/q8QCN5Rl//r3nB4wtYXNm8Y2aMUD8K+pvx//i+SUUJCNlddqtrPKeQD
 qgxd0awCP201CsOmHRjQWdrWI0YZ5lmKj1/1sijDwm/E9t7O8+cxHJLsTFotUuCOrd8U
 P9TR1BX+Be+HViUzuDH8HOE417V9F6ZCg8SwgpGSn1qEchzOqu3+AX5BxofsCCaw0kD+
 /hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDzjdzY2uNgirunivl38O17B6vfKe1pDPaF+QZIpYjM=;
 b=UyMNu5oi7brbzSmw/Eg806Msyt3rY4zNpwv9PVcYdiwxuoxI9COI/OXxcWBpeOxeCR
 5EjFH7a+leR5ERmHafDzGvy8fba9hXRDiAB0yengh9BpgMA4DPtnQxq+Y8auzahRm1VW
 iC5Z9hulUEkSL0UUVrRK/X3rgYq+i/nzQ3PbdoKoKA0decCxi5G7SGrD2t96oo6L2EdT
 Fl1bVPxZS8m0fNQVLUfuqaytq0SMt6qhHHLwrFzJvoDeSC/QStjELyGl/5LauwREZiDw
 rlOGPzlWfUI0DCj0xBPwDEUODGhjdS2goeIesg6dO2+/pUhVyoLfjD5Vi33JbB+qN9eM
 sOug==
X-Gm-Message-State: AOAM531AGTGH7fIEXaK5Mw2RlXEi9mf9h+rgljeINIGcoaOhZXd0od/Z
 885nI7FgjIi2cfpwQzwE/s/BmPLvM5a3Ww==
X-Google-Smtp-Source: ABdhPJyS0twuGblldl7vkXqSD5zEC1hcxC5Yu8rzrk/AiDnqwQtVMMNMbg8weKmFSrAD3vPyfLMoUg==
X-Received: by 2002:a17:90a:f0c3:: with SMTP id
 fa3mr19518267pjb.90.1624992907414; 
 Tue, 29 Jun 2021 11:55:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/63] target/cris: Mark static arrays const
Date: Tue, 29 Jun 2021 11:54:12 -0700
Message-Id: <20210629185455.3131172-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 19 ++++++++++---------
 target/cris/translate_v10.c.inc |  6 +++---
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index eabede5251..e14b7acb10 100644
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
@@ -3363,8 +3364,8 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


