Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008916AABDB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTi-0006Wp-Lu; Sat, 04 Mar 2023 13:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTa-0006VA-EY
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:22 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTW-0003Q7-C3
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:22 -0500
Received: by mail-pg1-x536.google.com with SMTP id bn17so3285777pgb.10
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUy1JZzTuPGot+rHAkA2NlK/qSoLXklkglokMU7FjFM=;
 b=PSmetU192pX5NhrBoJffrp8d03rM8C6z0DYtTxZ7y+SdQjOPJ/db37V8Z0GU3Lv3GA
 I3HNDqn6lQjZwynsYOyDj/Fy4Jkff58DrLPo5R+FxNzmXTdKW1He+rY2Ph0nOgIQvqkd
 vYGFCqs87G/JU+rs8kIlk84Fh8JrKKdFwNS8VWUaaXGknlNmW+GYae79onnMOqvV+Bgr
 n4yFrVoUOHluW309Py4wtcSzDajNqAc+U6wYQyLyINxgWD0ryWFhOFqFf5ERWnuMByc2
 ZtCAfSivTid/cIquPAsmqHXKkQFAcGIfERLlvi48wIfqAg2nDb2YLFT95LKL3u05Q6+u
 40pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUy1JZzTuPGot+rHAkA2NlK/qSoLXklkglokMU7FjFM=;
 b=p8d1KUSYdC5GE7LWSCuIMSdc6iIFncgnXhgqRVVW55LSr+91lcuB2EOqRvNT/OhuXY
 vwlmpQ/wHwfjb3Oivxd8wW9tpU3ppF7OMqw3Rmj0jUoKiffevKLdtPCQ5Mu85VbuMxql
 VdWLouTWDd07bgZfT4eFQQb8bePTC7dxK0HOc7QXk2IMn15BWgmiEuynMmk4mVeHEk5U
 W2RQhN3El/otoAD/NTwy1m9KvkbG0zmw4y7Aj+vfHEXqEm/FeFENxD8rOzXhQn/alKls
 Kl6hDxqb9JW4xFfS0TPAOQJFHaZwe0WUEeoQywZsJEFqUww0k1R5rF/vVANTlKid5miH
 WTpw==
X-Gm-Message-State: AO0yUKW1lek4zcnN5NZudknAzOrxgWgG/b7vnczAasFy31Q9zDcWzgWK
 kDizmodCVpRPTFNLZvb4ne1TC/8oc1PXIBmrZEmqCA==
X-Google-Smtp-Source: AK7set/JgSGE0bs6vptGSrkDgQw3UY7UwBMOvcr1tr2EVk/4Fhi5XWPgdfHNisKIr/yu5P6AzGKcbA==
X-Received: by 2002:a62:1b89:0:b0:5db:ba81:dd9f with SMTP id
 b131-20020a621b89000000b005dbba81dd9fmr5529561pfb.30.1677953956891; 
 Sat, 04 Mar 2023 10:19:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v3 17/20] target/s390x: Remove g_out, g_out2, g_in1,
 g_in2 from DisasContext
Date: Sat,  4 Mar 2023 10:18:57 -0800
Message-Id: <20230304181900.1097116-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
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


