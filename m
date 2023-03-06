Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D76AB41D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyZ-0004ul-4r; Sun, 05 Mar 2023 19:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-000370-Og
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:28 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxl-0007LA-DA
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: by mail-pf1-x42a.google.com with SMTP id ay18so4730236pfb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=we4F9PkfB77P75KJaS8X1iUxCu8Fq4F1ACBDQfQuXBI=;
 b=n4MhOMKGJdZAaoZ/menHRlf6G2EYg4iUzWQLucBkvzHH+fcKDB6MLsmL3pTOcpJjMB
 GVvmIH6GhsPZy2w4alFXY394kJberJzw3UDs5CmxFnQiGGbK76Lw/pRLgvnQpMh6wSDi
 9xfikuZmyCntfxs1+iUJMIZlXeNP4HCaR/Sv6ucWGwL/84GquWS+4O2dKMXOFepTmbs3
 YRBv26IvCfOnmlIYnb5+fR8H44BxAnhSfqYcVwhf7ZXh4Cvy3u8bKYf/WAVtPygAbqD0
 F0km6La0LSbBM8bjdOZdGcw69Vf3T5XVFvacxgydflLvAsl8VzJKzIdkRC0aSMJbXfYR
 xmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we4F9PkfB77P75KJaS8X1iUxCu8Fq4F1ACBDQfQuXBI=;
 b=O+Qpf/vkPqCRcnfQMsudii/JwiXqd0aRVvqlqvgDvss+61YEd3QG+Mo7mnUmmDpSjx
 ghssbG562CX+LaSCSE+0g6GQGHabVZ/G1UjnCOrXnyamwFXu7Qp2fQj46vui2P5h3iQt
 DrpO1ZsuxZGPVoX0ZhNnbmCOggrOZLex1tbte86s/vRmm8KcjQIrqtKrBltt6vCeOy+r
 aPRCE7CLEXk0g0n4mKCwfO4iSHiga6neFpESKhUq0QejKAxBok24Yth68ZDkvldZNfyb
 NJbdpw5Qr2Un9QhIErjpBtM9KZd5+wrY5qNpDddFfYdWfeXGJB0t0NVWOhiebDwbsJxB
 SF5Q==
X-Gm-Message-State: AO0yUKUQrrHNUfS6RaICFUQItycZU4bMVL06oTE//uW3+7O9+YJKAcnQ
 kBdhhmHMheu9ls3RyuyyiMxUyh7NrWiK892UmrHHyA==
X-Google-Smtp-Source: AK7set/jhJbA1YZ1n+qsYPxY7PsGsPAvXBhJZLhR6JbQbQGYjWabAUWWHQi6/FtasfsIFSTwxRXWAg==
X-Received: by 2002:aa7:9ed1:0:b0:5e0:316a:1fef with SMTP id
 r17-20020aa79ed1000000b005e0316a1fefmr6961187pfq.15.1678063464444; 
 Sun, 05 Mar 2023 16:44:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 77/84] target/s390x: Split out gen_ri2
Date: Sun,  5 Mar 2023 16:39:47 -0800
Message-Id: <20230306003954.1866998-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Use tcg_constant_i64.  Adjust in2_mri2_* to allocate a new
temporary for the output, using gen_ri2 for the address.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 811049ea28..21a57d5eb2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5886,9 +5886,14 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_a2 0
 
+static TCGv gen_ri2(DisasContext *s)
+{
+    return tcg_constant_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+}
+
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    o->in2 = gen_ri2(s);
 }
 #define SPEC_in2_ri2 0
 
@@ -5976,29 +5981,29 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
 
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld16u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_16u 0
 
 static void in2_mri2_32s(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32s(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32s 0
 
 static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32u 0
 
 static void in2_mri2_64(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld64(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_64 0
 
-- 
2.34.1


