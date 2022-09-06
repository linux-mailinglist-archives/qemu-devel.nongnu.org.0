Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E85AE6D1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:45:40 +0200 (CEST)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX1O-00046U-Vw
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeW-0003Cj-6e
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeT-0005BP-Lk
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id b17so1348963wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ANAO+fxWijWMMNf02gQ41mdu8Z3ZVUxIoag7ddJorMU=;
 b=iS0oIfDz+mXmOqviZXqu+lrma9F/QviizLVxSts0DmVAxSxerA3BJ0YFaD2VwnML6G
 aQsT0RRfJLfC7WFryHO2PiC1gtKNVdvfW4c7PSSyDTrJAClEVwAaB7KmAz4OOOu5ATP5
 TJj9F8ZWp9NvmajtKsT/Cs8LpcxvLFHTJObpyyxNPCjDE6WgYvt9UoilyFEJa0u1OH8R
 bO/lbMkp4I7cMU7sTGQkeWiMSYf5cCNgZn70XhcLQEetRMbYEIP4pgKKAp+NVyGjGlgA
 VAORuAFc6X4lciMY28qiCiwZ68TrTtYq/EVe4n9ffHG+dMpWrvV0GS4n9hv5whPw10yG
 U+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ANAO+fxWijWMMNf02gQ41mdu8Z3ZVUxIoag7ddJorMU=;
 b=A9QsvdUc7Rq8YnAppgOnvb8q2CS4X7CaNj2qQoLMQTuPD1hjAZp+rVRXooGfwwkcaa
 XSjj04BpF5KrXE5qWa22SDbmqxTUcSIjrkWjSEw/7l5vfJdWE3miK/uxoJdSRZyJs7yu
 1heI2MGLHEO0pWkMv+7tFSPUMKwnALIsJwML9k1v/c6e+0sOdTyUl4cAj0psJ7LWm1sV
 E1sbPlDr/ZqYykVw3HtryFm7EbZVfaw0ZDK9PcM7cvx7bGNNsXB8+Mz4kzymlTDuKpS2
 L3HOPX9qrYvTA4pQZ4tfzqHB3WlrnLfV/TDrj0orXWWpB3n89FYalMySqLngOA3Ciy/L
 sDsg==
X-Gm-Message-State: ACgBeo3SDYe2WjNQxD9MiTgW8rMPxJOcsSAjEM6jvET+Wtu4fxVheAC9
 AuL641ZQFZtBMwBFKLaoZG0wf2aFCWwpAQAX
X-Google-Smtp-Source: AA6agR51MZTwArHN701Ilk3X8jt3Q2MOsmWC0A+Cpan5JxQsWZszBpSgbkcOY2shGoJLwQwHHBYqiQ==
X-Received: by 2002:a5d:4c51:0:b0:226:d2fb:85d7 with SMTP id
 n17-20020a5d4c51000000b00226d2fb85d7mr26114392wrt.210.1662459472306; 
 Tue, 06 Sep 2022 03:17:52 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 04/26] target/s390x: Use tcg_constant_* in
 translate_vx.c.inc
Date: Tue,  6 Sep 2022 11:17:25 +0100
Message-Id: <20220906101747.344559-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In most cases, this is a simple local allocate and free
replaced by tcg_constant_*.  In three cases, a variable
temp was initialized with a constant value -- reorg to
localize the constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 45 +++++++++++++----------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 3526ba3e3b..cdb192454f 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -319,12 +319,10 @@ static void gen_gvec128_4_i64(gen_gvec128_4_i64_fn fn, uint8_t d, uint8_t a,
 static void gen_addi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
                           uint64_t b)
 {
-    TCGv_i64 bl = tcg_const_i64(b);
-    TCGv_i64 bh = tcg_const_i64(0);
+    TCGv_i64 bl = tcg_constant_i64(b);
+    TCGv_i64 bh = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
-    tcg_temp_free_i64(bl);
-    tcg_temp_free_i64(bh);
 }
 
 static DisasJumpType op_vbperm(DisasContext *s, DisasOps *o)
@@ -609,9 +607,8 @@ static DisasJumpType op_vlei(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    tmp = tcg_const_i64((int16_t)get_field(s, i2));
+    tmp = tcg_constant_i64((int16_t)get_field(s, i2));
     write_vec_element_i64(tmp, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1107,11 +1104,13 @@ static DisasJumpType op_vseg(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 tmp = tcg_const_i64(16);
+    TCGv_i64 tmp;
 
     /* Probe write access before actually modifying memory */
-    gen_helper_probe_write_access(cpu_env, o->addr1, tmp);
+    gen_helper_probe_write_access(cpu_env, o->addr1,
+                                  tcg_constant_i64(16));
 
+    tmp = tcg_temp_new_i64();
     read_vec_element_i64(tmp,  get_field(s, v1), 0, ES_64);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
     gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
@@ -1270,9 +1269,10 @@ static DisasJumpType op_vstm(DisasContext *s, DisasOps *o)
     }
 
     /* Probe write access before actually modifying memory */
-    tmp = tcg_const_i64((v3 - v1 + 1) * 16);
-    gen_helper_probe_write_access(cpu_env, o->addr1, tmp);
+    gen_helper_probe_write_access(cpu_env, o->addr1,
+                                  tcg_constant_i64((v3 - v1 + 1) * 16));
 
+    tmp = tcg_temp_new_i64();
     for (;; v1++) {
         read_vec_element_i64(tmp, v1, 0, ES_64);
         tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
@@ -1359,7 +1359,7 @@ static DisasJumpType op_va(DisasContext *s, DisasOps *o)
 static void gen_acc(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, uint8_t es)
 {
     const uint8_t msb_bit_nr = NUM_VEC_ELEMENT_BITS(es) - 1;
-    TCGv_i64 msb_mask = tcg_const_i64(dup_const(es, 1ull << msb_bit_nr));
+    TCGv_i64 msb_mask = tcg_constant_i64(dup_const(es, 1ull << msb_bit_nr));
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
     TCGv_i64 t3 = tcg_temp_new_i64();
@@ -1416,7 +1416,7 @@ static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 {
     TCGv_i64 th = tcg_temp_new_i64();
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(tl, th, al, zero, bl, zero);
     tcg_gen_add2_i64(tl, th, th, zero, ah, zero);
@@ -1425,7 +1425,6 @@ static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 
     tcg_temp_free_i64(th);
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vacc(DisasContext *s, DisasOps *o)
@@ -1455,15 +1454,14 @@ static void gen_ac2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
                         TCGv_i64 bl, TCGv_i64 bh, TCGv_i64 cl, TCGv_i64 ch)
 {
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 th = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     /* extract the carry only */
     tcg_gen_extract_i64(tl, cl, 0, 1);
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
-    tcg_gen_add2_i64(dl, dh, dl, dh, tl, th);
+    tcg_gen_add2_i64(dl, dh, dl, dh, tl, zero);
 
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(th);
 }
 
 static DisasJumpType op_vac(DisasContext *s, DisasOps *o)
@@ -1484,7 +1482,7 @@ static void gen_accc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
 {
     TCGv_i64 tl = tcg_temp_new_i64();
     TCGv_i64 th = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_andi_i64(tl, cl, 1);
     tcg_gen_add2_i64(tl, th, tl, zero, al, zero);
@@ -1495,7 +1493,6 @@ static void gen_accc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
 
     tcg_temp_free_i64(tl);
     tcg_temp_free_i64(th);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vaccc(DisasContext *s, DisasOps *o)
@@ -1597,14 +1594,13 @@ static void gen_avgl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 static void gen_avgl_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
 {
     TCGv_i64 dh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(dl, dh, al, zero, bl, zero);
     gen_addi2_i64(dl, dh, dl, dh, 1);
     tcg_gen_extract2_i64(dl, dl, dh, 1);
 
     tcg_temp_free_i64(dh);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vavgl(DisasContext *s, DisasOps *o)
@@ -2440,7 +2436,7 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 {
     TCGv_i64 th = tcg_temp_new_i64();
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_sub2_i64(tl, th, al, zero, bl, zero);
     tcg_gen_andi_i64(th, th, 1);
@@ -2452,7 +2448,6 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 
     tcg_temp_free_i64(th);
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vscbi(DisasContext *s, DisasOps *o)
@@ -2572,11 +2567,12 @@ static DisasJumpType op_vsumq(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    sumh = tcg_const_i64(0);
+    sumh = tcg_temp_new_i64();
     suml = tcg_temp_new_i64();
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
     tmpl = tcg_temp_new_i64();
 
+    tcg_gen_mov_i64(sumh, zero);
     read_vec_element_i64(suml, get_field(s, v3), max_idx, es);
     for (idx = 0; idx <= max_idx; idx++) {
         read_vec_element_i64(tmpl, get_field(s, v2), idx, es);
@@ -2587,7 +2583,6 @@ static DisasJumpType op_vsumq(DisasContext *s, DisasOps *o)
 
     tcg_temp_free_i64(sumh);
     tcg_temp_free_i64(suml);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(tmpl);
     return DISAS_NEXT;
 }
-- 
2.34.1


