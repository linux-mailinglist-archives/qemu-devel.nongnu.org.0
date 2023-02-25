Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EC6A2853
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:24:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjo-0000RE-OK; Sat, 25 Feb 2023 04:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjE-0006MP-BY
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:30 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj4-000309-HL
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:24 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p6so1041256plf.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=gcXQpl7ctKdujWVcb6yCFa3kmgklC0n0XJkEh1FFUz2+v5oJeqHTOmNT09NsymdHTD
 oXAE7ys/f2U9qcw++xXqSqWuG/Po5NgfmjydyGl/R49ryzP37C4t3c4mLMbOpk63kIaN
 +sT5q72q0ncgdkx01nUL60zDtUdtFKmY//FrH7sNkhuAMRdfBHnDoJk6fe9I017/qzho
 92+5J+uFShpaZj2V4/tBvK9HaVJQZmKqGniJind4gMqsTPaE4gthQUc4NGXujK7uMTHE
 bDrWDDDmihLhm7o629wo2FIM7r5S819xyeHjy/J7GzfV3iS6WKScJ2T+laMb6ZBkpl4v
 BZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=yLixev85XbafKaf5XmxiynuTNTqDODMF2DsOeLlUm3gF6SS/Zx/p5CCKbmCMpwlkTr
 gweLZ7Q9NKqebR6JFwm8OXbNuth8gQNAuwhWqky6BSkVoDri9cBZTEQ+oY48Ptuq3R/e
 lOMAMKJLJK4doVs5QTNzlGj7BEvI5BlGJLfbqjoUI+UobrM1Yse8t5k3dP2AYEGmBMLr
 B8fO2EGxylzMxRXaNz7oiGWPWBvvvw9f4Hp9bHcW73zuLOKbFm99XR4AWrJeus3m7naO
 UUF6KuXr8C1ZrCJmgH4Rdb17CB4dxrrfuu9bAboki6SLh29sv/JpKZHVzzSZ52Rt7oNB
 J6bg==
X-Gm-Message-State: AO0yUKUb0Jdkx7bvpwx7W8JZyEgrOMQC1BLSYgyxwaVIvxonS5r2bxIM
 OU+aWFFytedudP7nH5YWw/POjhVHXS2vUB8eej4=
X-Google-Smtp-Source: AK7set/83pnxDzYuu4SxaNU9VQmH72Hi6ayrbgJj9b+bPDU9pnQtYqgJFrXgIUUvFQaWJjvWQ/h10Q==
X-Received: by 2002:a05:6a20:bfc5:b0:cc:1ec7:45e5 with SMTP id
 gs5-20020a056a20bfc500b000cc1ec745e5mr7220125pzb.35.1677316816971; 
 Sat, 25 Feb 2023 01:20:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 63/76] target/s390x: Remove g_out, g_out2, g_in1,
 g_in2 from DisasContext
Date: Fri, 24 Feb 2023 23:14:14 -1000
Message-Id: <20230225091427.1817156-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These fields are no longer read, so remove them and the writes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index c431903c67..9974162527 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1061,7 +1061,6 @@ static const DisasFormatInfo format_info[] = {
    them, and store them back.  See the "in1", "in2", "prep", "wout" sets
    of routines below for more details.  */
 typedef struct {
-    bool g_out, g_out2, g_in1, g_in2;
     TCGv_i64 out, out2, in1, in2;
     TCGv_i64 addr1;
     TCGv_i128 out_128, in1_128, in2_128;
@@ -3159,9 +3158,7 @@ static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mov2(DisasContext *s, DisasOps *o)
 {
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3171,9 +3168,7 @@ static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
     TCGv ar1 = tcg_temp_new_i64();
 
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
 
     switch (s->base.tb->flags & FLAG_MASK_ASC) {
     case PSW_ASC_PRIMARY >> FLAG_MASK_PSW_SHIFT:
@@ -3202,11 +3197,8 @@ static DisasJumpType op_movx(DisasContext *s, DisasOps *o)
 {
     o->out = o->in1;
     o->out2 = o->in2;
-    o->g_out = o->g_in1;
-    o->g_out2 = o->g_in2;
     o->in1 = NULL;
     o->in2 = NULL;
-    o->g_in1 = o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3708,7 +3700,6 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
         o->out = tcg_temp_new_i64();
-        o->g_out = false;
     }
 
     i3 &= 63;
@@ -4874,7 +4865,6 @@ static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
     o->out = tcg_const_i64(0);
     o->out2 = o->out;
-    o->g_out2 = true;
     return DISAS_NEXT;
 }
 
@@ -5142,7 +5132,6 @@ static void prep_new_x(DisasContext *s, DisasOps *o)
 static void prep_r1(DisasContext *s, DisasOps *o)
 {
     o->out = regs[get_field(s, r1)];
-    o->g_out = true;
 }
 #define SPEC_prep_r1 0
 
@@ -5151,7 +5140,6 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     o->out = regs[r1];
     o->out2 = regs[r1 + 1];
-    o->g_out = o->g_out2 = true;
 }
 #define SPEC_prep_r1_P SPEC_r1_even
 
@@ -5375,7 +5363,6 @@ static void in1_r1(DisasContext *s, DisasOps *o)
 static void in1_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1_o 0
 
@@ -5409,7 +5396,6 @@ static void in1_r1p1(DisasContext *s, DisasOps *o)
 static void in1_r1p1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1) + 1];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1p1_o SPEC_r1_even
 
@@ -5464,7 +5450,6 @@ static void in1_r3(DisasContext *s, DisasOps *o)
 static void in1_r3_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r3)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r3_o 0
 
@@ -5595,7 +5580,6 @@ static void in1_m1_64(DisasContext *s, DisasOps *o)
 static void in2_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r1)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r1_o 0
 
@@ -5630,7 +5614,6 @@ static void in2_r2(DisasContext *s, DisasOps *o)
 static void in2_r2_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r2)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r2_o 0
 
-- 
2.34.1


