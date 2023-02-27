Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4BA6A3C54
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW88-0004KY-CQ; Mon, 27 Feb 2023 00:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6P-0005Z9-AT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:09 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6L-0000HX-IK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso922205pjb.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=gY/f9RH0zoGxslOmVnxn5fElATJ1Mu5GqwOu9nQFTT1Z/tQV4RtpXM978qtozChTh7
 cAYZ1jFOU0fNvmOOo43Yew+qHc7SIhH2pOFil4tYrfZIl5F1aZmbS3+6ZCNEDu0kWwvo
 QOrt6S/KElakDkVWfUiMst2RnH8jeWpAOLPCg2Lz4Ikv2CUHAxespFrEkwr53mGEMZx/
 tDe+vev1GkaeSrsfCT9cF0sTib4k27/qh1B04GUiuUyLzOOeUs+GZkIXdD4RZvj1A/14
 dMmerC41rhPfz+bAB7CHGhbzGs6NpXYcEpEUpxymqXBu0Z6IOasvURdhnUCadSY9x5Hi
 htKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=yIy4RGR8q0X7c5wRS4NHsCeUpQmMVvqLie0H5K7yZ/+72xtRvKPkgOUpJQwbEkzfgh
 qkEBocAy8i4yCVsPe264ECgzEc7afT5tx2CFKKI4WKpYWnemhfC6lHi905WJ0S5EI4L+
 NbZ5ZQA+T/+RK4YyGXudDplNiqir25MuqdHjAZm3j/8ZOR9KmdvuQVSyPJwUabyNsedu
 IGg85XaUlE3d7IvoXt3p+Ci93Yy53SEnh7YJRv8gKQQF/dj86H6F3df7kMz27jBhZWtF
 YPA0rert+AiiRNUgPnXcq2bKcsqiwZcdmFLV56FxPhaEDK8HcG6eKqy4Cn3LSG0e4m+b
 tZMQ==
X-Gm-Message-State: AO0yUKWRXmFRjzmyKyDmAGtXhZdsyn3PcfE1m+DPxm6QLlOBw/EHiYpJ
 k2igPYllkgQoIy+O53TiQ/b30fkQWB+UvDaJpEQ=
X-Google-Smtp-Source: AK7set+MiPgvM3bLJo7lTQ1TaVXF2EZoKpC4bq5hn94QDr18RNOkcUvfKFcxbCSrZ/G3YmhveLml2A==
X-Received: by 2002:a17:90b:4a43:b0:233:f365:1d0b with SMTP id
 lb3-20020a17090b4a4300b00233f3651d0bmr24346398pjb.5.1677475864543; 
 Sun, 26 Feb 2023 21:31:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 62/76] target/s390x: Remove assert vs g_in2
Date: Sun, 26 Feb 2023 19:24:51 -1000
Message-Id: <20230227052505.352889-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index beccd3429e..c431903c67 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1


