Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB38552F2D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:52:24 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aYa-0003QJ-2v
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQg-0007Sf-It; Tue, 21 Jun 2022 05:44:14 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQe-0007Ll-Kv; Tue, 21 Jun 2022 05:44:14 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-101d2e81bceso8873521fac.0; 
 Tue, 21 Jun 2022 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGrU/66nhnRlMdpQWIYgIzyzKeLNIFZKefQjC8mDfUM=;
 b=cvs/74UEG6V5RnMKBx5C9A+SFRqHNIWyLWEUN3aq/iAd1zyk0BvmX3FvsSz0W3+/AG
 6p+U1Uhf4Zr6tMYOvO4wlVRkK1itIku014EXxHLx79n/CWkBUdKtWwndCpEAUW0BDXav
 hR7XW+QyvIJ+UsRixV7QYtp6PE9w+9Bk5XcYL8DafYp3hRM7u+J4TWynZWcJqDOFjE4n
 iG86V9AujLBLJQZj8CgXqslKEC2B3wK9fQqwGINpY99ql1QbCzMN1UkG+ZydpX2MGseB
 9An6qv9mYc4qji4VnWcOf8RFQH9YaikonIYOfZgNYFLin+7X2HLABU7oh4vzu/MUQTeH
 c9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGrU/66nhnRlMdpQWIYgIzyzKeLNIFZKefQjC8mDfUM=;
 b=fP/xEN7io1BTF+bTjiIOtfLp82BqKaQhusjccp0f9Zl70t6CB9WBQvX/1FSAUio7Mh
 XMxHCL3jaGShYToL2oRum495xOZN+TnAy2mh7cMfpX487wWHfSqcZ1Crqs3/4w516YsP
 nPhshDcMaDQ+bVPaCBkcCgzmTR+iJ6+Kx7tjM1l+N04EfCmxWE0QKKgAblUHTqI6UXm8
 fBlU7qvZaRcFfqnGrOwjRb0S+kGb1ugFSkGAQMVa8qoTk+w8OBU0C5vX0AhE6WCNexcV
 VJgxFv6m36DvAGfKVHDjTStfuKvcVLEsi40oamdifEY06ksVj0KnIRRi21SHlwW49RgC
 ztdQ==
X-Gm-Message-State: AJIora87PwcRoty7URytaIqp9Ru6IBvCFTROtCU8nW2ts/5txyqgP4AL
 gKJ+Gv+IIx7DzZql45y6DdVpTvHVKLo0YA==
X-Google-Smtp-Source: AGRyM1tYyuzcPoih0+8u71YVVPz14QzS2+ZqHiTTnN087XeY2jxx0a9aPo/spVdoGiwIfZQQz3Svyw==
X-Received: by 2002:a05:6870:5b81:b0:101:b256:b7d with SMTP id
 em1-20020a0568705b8100b00101b2560b7dmr10943608oab.198.1655804650923; 
 Tue, 21 Jun 2022 02:44:10 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 02/15] target/ppc: Implemented vector divide quadword
Date: Tue, 21 Jun 2022 06:43:47 -0300
Message-Id: <20220621094400.122800-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivsq: Vector Divide Signed Quadword
vdivuq: Vector Divide Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-3-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 21 +++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6233e28d85..9f33e589e0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -175,6 +175,8 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6df405e398..01bfde8c5e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -793,3 +793,5 @@ VDIVSW          000100 ..... ..... ..... 00110001011    @VX
 VDIVUW          000100 ..... ..... ..... 00010001011    @VX
 VDIVSD          000100 ..... ..... ..... 00111001011    @VX
 VDIVUD          000100 ..... ..... ..... 00011001011    @VX
+VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
+VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 105b626d1b..033718dc0e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1162,6 +1162,27 @@ void helper_XXPERMX(ppc_vsr_t *t, ppc_vsr_t *s0, ppc_vsr_t *s1, ppc_vsr_t *pcv,
     *t = tmp;
 }
 
+void helper_VDIVSQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 neg1 = int128_makes64(-1);
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    if (likely(int128_nz(b->s128) &&
+              (int128_ne(a->s128, int128_min) || int128_ne(b->s128, neg1)))) {
+        t->s128 = int128_divs(a->s128, b->s128);
+    } else {
+        t->s128 = a->s128; /* Undefined behavior */
+    }
+}
+
+void helper_VDIVUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    if (int128_nz(b->s128)) {
+        t->s128 = int128_divu(a->s128, b->s128);
+    } else {
+        t->s128 = a->s128; /* Undefined behavior */
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4c0b1a32ec..22572e6a79 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3317,6 +3317,8 @@ TRANS_FLAGS2(ISA310, VDIVSW, do_vdiv_vmod, MO_32, do_divsw, NULL)
 TRANS_FLAGS2(ISA310, VDIVUW, do_vdiv_vmod, MO_32, do_divuw, NULL)
 TRANS_FLAGS2(ISA310, VDIVSD, do_vdiv_vmod, MO_64, NULL, do_divsd)
 TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
+TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
+TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.36.1


