Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B393B09AD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:58:09 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvimu-0007sr-C8
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidd-00058B-8v
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidY-0005KE-KH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: by mail-pf1-x435.google.com with SMTP id q192so10162679pfc.7
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LskbPVAjrbITbR/BLSWbN40vYGjGl6tGTo3OTtiJcvA=;
 b=U59w59lPOQkKBAWXmKZ2aHRwbiwS2SU4Qxa+k87XC9IXL24FEo9Pi7Iy7e7BAergRj
 DnPp5i1ARkVc7I1lzE/HaD2I+1s2TDBEE+FbOVwVrMMc5qeX3rZ6gogzTlgiwjl2wmYB
 qy00lt0mIglfu03JEbOkU7JWqq/iVIp6113n8gTOnynQQY8sqOzcDUSQ2ofiw3rlP3nt
 wFERb4LUNjqzNk8IPpX6SbkbqA3mErQgldj10LdlVnf6KHTxMEl0VF1W8bqpvoT4oam0
 ErjFay/L/AD2tVZRVi/rBH2vDXO2Fq93sUKMibvh+JLCs4VpZaubBnPwU6oRgQVk571k
 VCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LskbPVAjrbITbR/BLSWbN40vYGjGl6tGTo3OTtiJcvA=;
 b=TkVmeiIPNjJfIzf87D7qAnvv2tocJf+zRIkc3vLphjWqJykZpv4GJ+Q1alg0l5JKE5
 jS2LmaMBeslQRANIWk8J8Mk7a6ON2IPBZ9/abNTYqWe6FIdTKoHBnY27j8PPf50LfSlC
 Ety1T76Z0+rr5wb7eSdjE0Q4YA8lvw5PXarrP6r46NB6ndVn9VXnViXZeSUojr0Sd/kf
 fXXm9+a++1oC0zl9J5kGmfBKJrH8X+8R3zBhDmHFQFP12fjK8STNSuENn2+KU1T/l2OZ
 J1BR/B1flyqrZ9e/UbjboowSdnWqojkuhNjC1Egg/fTxFbCaAXiiunyl+rEIlCex0H88
 C5Xw==
X-Gm-Message-State: AOAM5336Vgu3Zn+GS10Q2R9ESdHaVO24mQWnefRWopBMuMlRrYZSk6M7
 Gv+D938Z8o8xGp33Crl/SAq6F+SCRuFnbA==
X-Google-Smtp-Source: ABdhPJxvkSwukASnXA62gXgCI5xFOMAJYe0K8Haoeswfa5J52Kb7XhTgOe+OSPJxkVyYMWoWGllZXA==
X-Received: by 2002:a63:2742:: with SMTP id n63mr2902541pgn.94.1624376907133; 
 Tue, 22 Jun 2021 08:48:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/15] target/cris: Mark static arrays const
Date: Tue, 22 Jun 2021 08:48:13 -0700
Message-Id: <20210622154820.1978982-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


