Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335406A285B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:26:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjn-0000M0-1P; Sat, 25 Feb 2023 04:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj7-0006Ik-W9
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:23 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj3-0003CT-Kc
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:19 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c10so205847pfv.13
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=zkH1iDSkz01mDAtPZePvEVJaW9yiQA1WXPTNCmqT/tDER5uVma1IR68NQmf7K6/l2F
 vZphHx6sYuYnKCxJWQH8sFicOFoUHyg9PR9IdFdRI5ELJ6tUc49991hGHHd0d7xyBjnr
 RMJskgUxatbFuhKnO3N7ZUVt1YUtMM6s9Y9c4dGKDknFvnZg8CRqM08iOpDJJWd/1qoL
 ee8HRsBmBWJSZptnxrV9mWyOkjzY6PrNPfw6ruYrPiLCTJY7dW5pfmE4L9P0PgE06FOb
 XanmkJN+zRxGItU5dRR1cTVuq0Am9stSCGne485XOyxM83LUyMrjZmaVKqWIPFjTIHBi
 ZEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=cWvGyeFnltsOEMTdIde6ky+YlpiXEUfFmRAwGawMxD17tncVEf+4c6sAGFLF6mfuXp
 5F0yHVs3lkHiU9ZDEw8duzY/EYRd2DaMirsYqcSINWH8JwcIzMOA6ovvxqtUsUA0Py/N
 h4wlLh5LwoN3/TiLLB2+AkXF3ltp+IgmVy+zg4nActOClgFHUUYtrMqwIYk6i2/Zn0GA
 PIQjKlWvuOy3tcuFsQMNdTmWoVyMxAxR/eNitegvmup0HZD9EZ+pz3GPvjp3Dt1yJJeg
 6Q2XnoJEdY+57xNeX5JKoXZVFviwcH1pUMAgMG9rA2aeCGifrjkPI7M4PZ+x5SCj73LT
 ipIQ==
X-Gm-Message-State: AO0yUKUGwe7rccqCl/BgvBFJvlfj/OdHGIM3AtwzzCChl71SCYI51hY5
 VZvBZWUskHVvycx+r9wfN0XJ9EzmsDn/+1OvkC0=
X-Google-Smtp-Source: AK7set8t+NpZJSdMfa0/mMoErBtZt5ncgGdzidPCvaXTxYQ7pZZDVxVlb5EU08q3VtwZrnakxaiqvw==
X-Received: by 2002:aa7:8ecc:0:b0:5a9:b910:6d98 with SMTP id
 b12-20020aa78ecc000000b005a9b9106d98mr17241347pfr.13.1677316814490; 
 Sat, 25 Feb 2023 01:20:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 62/76] target/s390x: Remove assert vs g_in2
Date: Fri, 24 Feb 2023 23:14:13 -1000
Message-Id: <20230225091427.1817156-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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


