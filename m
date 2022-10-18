Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E45602DA0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:09 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6d-0005nt-87
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiT-0004TA-UE
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiR-0005P7-8Q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k229EqfcdmSEeYRUd9pze+gwJ+qeSPgXw5lbUelqaYo=;
 b=WdzOvogJ/b/RlS2R/8NjDfHQzsRADM1NH52rN3IlT8TDAK+0t7gMDT6ONWZGak+NBhReoK
 cN+FsGGu6gSe7pLtqo0Y6Rfp3sT3BZ73RvCwK+b6WEN0EXq8ls5P7PRLpp3cxFlFArws3t
 HpfeCoJI5ajsQFVJFKCIbjGsTWhMy3s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-X-kBsRjWNSyuH-HSpRc9TA-1; Tue, 18 Oct 2022 09:33:04 -0400
X-MC-Unique: X-kBsRjWNSyuH-HSpRc9TA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x19-20020a05640226d300b0045dc858ce29so2210169edd.7
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k229EqfcdmSEeYRUd9pze+gwJ+qeSPgXw5lbUelqaYo=;
 b=DW65dV6n68AYfHjeE10mkkbIxVKOXtzSmGYKGTo8gkACWH3+LtHS1WAqryJ3vBylcS
 3QSWTwX2BE4nx0oJJcaLZ1xv/ZKuLsXlPZD69aNEsGylHT6C/YxBmsI0SQeewSsZc74J
 48gyheahZ7XziKRp0YUDfWn3lZpHWT7/+FkP8qmAYBOJrWH1OSpiaABVJok5oOz2k4Ay
 hKIORyDBgGMcYhzI+DpX/aoOY+TusDsblNLYO00qTKo1zftOxRYUA07imjuh+GaX2n/Q
 aHk/8xw4fpfHywevon78DL+BAuzbezv75ADr4tCK+kUGSpJwlpmsL+/MQgpmziA2Rth0
 Dxrw==
X-Gm-Message-State: ACrzQf26FO6JVJ4hx21yIlvbi5KXlTLR8sZav6Bqj5JqeNqiFRabSYmd
 UOTlC+TuNSKU/BK14fKtpR02cRyls4pwUwcHDrsZ9y3PdlKtALNaYq19KOEAoCGFWTk9zjZpNgB
 0TNErZUOPr0Kheqbq/YUTyRXUoBKsoG7FG2YrKoLk2ODymFuHxfoTYoau9Og6HS3TC9U=
X-Received: by 2002:a17:906:9be9:b0:78d:2f63:10dd with SMTP id
 de41-20020a1709069be900b0078d2f6310ddmr2424265ejc.479.1666099982930; 
 Tue, 18 Oct 2022 06:33:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ZeKi1lyzbkWtJK8MNj7BdjP1u61EgZ1At+aEZTUkujoBylJDo50RplQSaPXViuRmV5Xk2WA==
X-Received: by 2002:a17:906:9be9:b0:78d:2f63:10dd with SMTP id
 de41-20020a1709069be900b0078d2f6310ddmr2424239ejc.479.1666099982550; 
 Tue, 18 Oct 2022 06:33:02 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 ky18-20020a170907779200b00780a26edfcesm7556087ejc.60.2022.10.18.06.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 43/53] target/i386: Use tcg gvec ops for pmovmskb
Date: Tue, 18 Oct 2022 15:30:32 +0200
Message-Id: <20221018133042.856368-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

As pmovmskb is used by strlen et al, this is the third
highest overhead sse operation at %0.8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[Reorganize to generate code for any vector size. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 88 +++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 062c92e45a..ad93094ca8 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1191,14 +1191,92 @@ static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_pinsr(s, env, decode, decode->op[2].ot);
 }
 
+static void gen_pmovmskb_i64(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_andi_i64(d, s, 0x8080808080808080ull);
+
+    /*
+     * After each shift+or pair:
+     * 0:  a.......b.......c.......d.......e.......f.......g.......h.......
+     * 7:  ab......bc......cd......de......ef......fg......gh......h.......
+     * 14: abcd....bcde....cdef....defg....efgh....fgh.....gh......h.......
+     * 28: abcdefghbcdefgh.cdefgh..defgh...efgh....fgh.....gh......h.......
+     * The result is left in the high bits of the word.
+     */
+    tcg_gen_shli_i64(t, d, 7);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 14);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 28);
+    tcg_gen_or_i64(d, d, t);
+}
+
+static void gen_pmovmskb_vec(unsigned vece, TCGv_vec d, TCGv_vec s)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, MO_8, 0x80);
+
+    /* See above */
+    tcg_gen_and_vec(vece, d, s, m);
+    tcg_gen_shli_vec(vece, t, d, 7);
+    tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, d, 14);
+    tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, d, 28);
+    tcg_gen_or_vec(vece, d, d, t);
+}
+
+#ifdef TARGET_X86_64
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i64
+#else
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i32
+#endif
+
 static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
-    if (s->prefix & PREFIX_DATA) {
-        gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, OP_PTR2);
-    } else {
-        gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, OP_PTR2);
+    static const TCGOpcode vecop_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2 g = {
+        .fni8 = gen_pmovmskb_i64,
+        .fniv = gen_pmovmskb_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64
+    };
+    MemOp ot = decode->op[2].ot;
+    int vec_len = vector_len(s, decode);
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_gvec_2(offsetof(CPUX86State, xmm_t0) + xmm_offset(ot), decode->op[2].offset,
+                   vec_len, vec_len, &g);
+    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+    while (vec_len > 8) {
+        vec_len -= 8;
+        if (TCG_TARGET_HAS_extract2_tl) {
+            /*
+             * Load the next byte of the result into the high byte of T.
+             * TCG does a similar expansion of deposit to shl+extract2; by
+             * loading the whole word, the shift left is avoided.
+             */
+#ifdef TARGET_X86_64
+            tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_Q((vec_len - 1) / 8)));
+#else
+            tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_L((vec_len - 1) / 4)));
+#endif
+
+            tcg_gen_extract2_tl(s->T0, t, s->T0, TARGET_LONG_BITS - 8);
+        } else {
+            /*
+             * The _previous_ value is deposited into bits 8 and higher of t.  Because
+             * those bits are known to be zero after ld8u, this becomes a shift+or
+             * if deposit is not available.
+             */
+            tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+            tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);
+        }
     }
-    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+    tcg_temp_free(t);
 }
 
 static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
-- 
2.37.3


