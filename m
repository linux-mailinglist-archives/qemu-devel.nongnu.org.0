Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E737F43C1FA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:01:56 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfb4W-0003aJ-1h
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfazE-0005Sv-HT; Wed, 27 Oct 2021 00:56:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfazC-0005Ly-H7; Wed, 27 Oct 2021 00:56:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 82-20020a1c0055000000b0032ccc3ad5c1so3155432wma.2; 
 Tue, 26 Oct 2021 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUWK5GIvdKJkNgsviIlVDW6DDcBmHOa3/s4hjVgxLIw=;
 b=WNcyyKAOyKM2YG9mLLHAoUI/rb1qWiiLyA753qocH5gbs5OXE2iiV76u2YCQPwgaW9
 1oWhYMTcskLUI4FJApUynN2/ZTdrpTLzVqDFnV2PxSCvkljhm/8S8CPwsn7jgBEzTpYd
 +Ut3sBHfx/GlFr+fQ/CilAwstsLZ4yq18oOetNrDShw6j5Na51e1QtfXAKA3R6idNNLW
 v1gudQNkNjLjSxeyOrGuvK/9PtxKt+gU3Yfr5iAWy8NV66dUjo89xFY8CxSkkBzV0w37
 eFBNFVf+CRJcYsWYHPxnTRwHglkRqg8ATaj1eeEs20hgn0fJXoqmxarALun1Gh3YzSCT
 rnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aUWK5GIvdKJkNgsviIlVDW6DDcBmHOa3/s4hjVgxLIw=;
 b=tEgdkXT2qfsnzHE5m5K3fiYLEwZovzjRTuaHPQ31N4q9txQbRqZuD2blcbAiZdSB34
 oqKChoGF2lVnbfnBtoBYqUtoxNPYUY1TDCwBS2Y2N/jvUyZGBqc6rPRQ5puoFJcDTEOj
 OmmmWPEh9beN5dNMHcntUykjHE18E/8ztKCbB2A8jqqOnlT3T7YN6rJt79E8xQACWNxs
 /FOo6cgIrkWfUGtSHzv7MkYKXoF8ozZkqIymN1P6/v12226XKqyCu79+GxgduHb1/ha0
 mQjjtgeSxIzhN4PjAUnIomul01tEb8iQiY9T+caYvi7h9QYf2/kzu958ZEiaRhfFY4bL
 HQPg==
X-Gm-Message-State: AOAM533En0/aXRL6egYaWfacg3kQYw0uanjhWDt1WtLFSD/UH9CirmJU
 M2kmivq4A4xlWOm9il8YS5gFA5KFLsU=
X-Google-Smtp-Source: ABdhPJyS0JSxOyxMbWfsNciNdlTWP55PgMfHGA89D6xed1Jtxk23rRZ4e+xGDD8U3ZKXumzbolkoZg==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr3289012wmq.63.1635310584729; 
 Tue, 26 Oct 2021 21:56:24 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i14sm2206763wmb.48.2021.10.26.21.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:56:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] target/arm: Use the constant variant of
 store_cpu_field() when possible
Date: Wed, 27 Oct 2021 06:56:06 +0200
Message-Id: <20211027045607.1261526-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027045607.1261526-1-f4bug@amsat.org>
References: <20211027045607.1261526-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using a constant variable, we can replace the store_cpu_field()
call by store_cpu_field_constant() which avoid using TCG temporaries.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5061e55f2c0..484b0eed0cb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -364,8 +364,7 @@ void clear_eci_state(DisasContext *s)
      * multiple insn executes.
      */
     if (s->eci) {
-        TCGv_i32 tmp = tcg_const_i32(0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
         s->eci = 0;
     }
 }
@@ -740,9 +739,8 @@ void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
         uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
+
+        store_cpu_field_constant(val, condexec_bits);
     }
 }
 
@@ -8362,8 +8360,6 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
-    TCGv_i32 tmp;
-
     /*
      * BLX <imm> would be useless on M-profile; the encoding space
      * is used for other insns from v8.1M onward, and UNDEFs before that.
@@ -8377,8 +8373,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    tmp = tcg_const_i32(!s->thumb);
-    store_cpu_field(tmp, thumb);
+    store_cpu_field_constant(!s->thumb, thumb);
     gen_jmp(s, (read_pc(s) & ~3) + a->imm);
     return true;
 }
@@ -8677,7 +8672,6 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
      * doesn't cache branch information, all we need to do is reset
      * FPSCR.LTPSIZE to 4.
      */
-    TCGv_i32 ltpsize;
 
     if (!dc_isar_feature(aa32_lob, s) ||
         !dc_isar_feature(aa32_mve, s)) {
@@ -8688,8 +8682,7 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
         return true;
     }
 
-    ltpsize = tcg_const_i32(4);
-    store_cpu_field(ltpsize, v7m.ltpsize);
+    store_cpu_field_constant(4, v7m.ltpsize);
     return true;
 }
 
@@ -9487,9 +9480,7 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     /* Reset the conditional execution bits immediately. This avoids
        complications trying to do it at the end of the block.  */
     if (dc->condexec_mask || dc->condexec_cond) {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, 0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
     }
 }
 
-- 
2.31.1


