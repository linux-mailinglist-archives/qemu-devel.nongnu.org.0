Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEE569371
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:39:05 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bnc-0008O1-5j
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLx-0000WW-QB; Wed, 06 Jul 2022 16:10:34 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLv-0003ZZ-Vh; Wed, 06 Jul 2022 16:10:29 -0400
Received: by mail-vk1-xa31.google.com with SMTP id r184so1134425vkg.9;
 Wed, 06 Jul 2022 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ve6hY3Wum/ydWk7IqBHIOQfGxbEY1YmsIA2+9osiFik=;
 b=Jw1cFGB+Bjl86dxqDLgvqrKg/T9esmhuOzOuQGWByqb7VejpWJJkXLOTC9Lzt8hyql
 3utTeM8zs2Qjd4vWj+rj/sHr0pPZhRiDfIgMIK87/TNcdet0oJLwz58vL36tyMJV4sfK
 YHKFCz/jPyS85VDj21KoSkcPFYPg3w/I0BZgyF+hykbNs6IW+u7Rih7obMrK3SGPtQmx
 gAdMVlYTMkuOalL2r2gJPQbqMlIVqQvgBFs57HhdMVbaxIyBjbyncYsHGZC0uqfUVvnz
 sO/nScW6gSpkwAMEDIi8AQ3ZdiGmc7d7AnfSRBNIOSWf+ocgFw33MdGZ9upm0+VNrO2U
 t1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ve6hY3Wum/ydWk7IqBHIOQfGxbEY1YmsIA2+9osiFik=;
 b=OHmIbxgpbWMhHR566c2qh01q28ABAHBUgdg59hlVPlPFryhzWgot25aM82N9HnNBRP
 ENO8x9detcxjzZwFAaP4aMmfJaWGQhyDkXDob24OcmRmg2ptNyWiBBp50QYwGXj/oRv9
 QGyVeP/pAaoW8WYLII56h1rq05l/KRgm4AqOTe5m50k83CNg8gTjfpNmuulXWUvj9Ml3
 rwHL3HC4yfcbiQ5XNdxKUXeI3HquZG0mb4JQh4HDBBY1j4W/OhpWwVCB1dj/Q7EDx9z2
 hyObIqW3liiWNjqdyhK8qFAmM+pQ2G7omcX3jvaFSCfeQdKdx786csleRM/HvqeusNes
 yoRw==
X-Gm-Message-State: AJIora9C5YMQ88cTpJwoqjaSE/lvaxN8NvVIaXjrpibWaAC6a8LaF1+Z
 WddSNX5WmHSOWq6Ur2TU5HuAWG4DTwc=
X-Google-Smtp-Source: AGRyM1vyc1y8fDwJPT2RqtKfOmmIkqJiZtItVsvWw3b1jOlvYSEEPZiEf+xxE8iT6k+BB7IHXA/3BQ==
X-Received: by 2002:a1f:aa91:0:b0:374:35b0:af7d with SMTP id
 t139-20020a1faa91000000b0037435b0af7dmr2949770vke.32.1657138226567; 
 Wed, 06 Jul 2022 13:10:26 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 18/34] target/ppc: use int128.h methods in vsubcuq
Date: Wed,  6 Jul 2022 17:09:30 -0300
Message-Id: <20220706200946.471114-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

And also move the insn to decodetree and remove the now unused
avr_qw_not, avr_qw_cmpu, and avr_qw_add methods.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-8-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  1 +
 target/ppc/int_helper.c             | 51 +++--------------------------
 target/ppc/translate/vmx-impl.c.inc |  5 +--
 target/ppc/translate/vmx-ops.c.inc  |  2 +-
 5 files changed, 9 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 04ced6ef70..84a41d85b0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -211,7 +211,7 @@ DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VSUBECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VSUBEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VSUBCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vextractuh, TCG_CALL_NO_RWG, void, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5e6f3b668e..65a6a42f78 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -556,6 +556,7 @@ VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBCUQ         000100 ..... ..... ..... 10101000000    @VX
 VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
 
 VSUBECUQ        000100 ..... ..... ..... ..... 111111   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a93398fde4..d905f07d02 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2176,38 +2176,6 @@ VGENERIC_DO(popcntd, u64)
 
 #undef VGENERIC_DO
 
-#ifndef CONFIG_INT128
-
-static inline void avr_qw_not(ppc_avr_t *t, ppc_avr_t a)
-{
-    t->u64[0] = ~a.u64[0];
-    t->u64[1] = ~a.u64[1];
-}
-
-static int avr_qw_cmpu(ppc_avr_t a, ppc_avr_t b)
-{
-    if (a.VsrD(0) < b.VsrD(0)) {
-        return -1;
-    } else if (a.VsrD(0) > b.VsrD(0)) {
-        return 1;
-    } else if (a.VsrD(1) < b.VsrD(1)) {
-        return -1;
-    } else if (a.VsrD(1) > b.VsrD(1)) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
-static void avr_qw_add(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
-{
-    t->VsrD(1) = a.VsrD(1) + b.VsrD(1);
-    t->VsrD(0) = a.VsrD(0) + b.VsrD(0) +
-                     (~a.VsrD(1) < b.VsrD(1));
-}
-
-#endif
-
 void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     r->s128 = int128_add(a->s128, b->s128);
@@ -2250,22 +2218,13 @@ void helper_VSUBEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
                          int128_make64(int128_getlo(c->s128) & 1));
 }
 
-void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VSUBCUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = (~a->u128 < ~b->u128) ||
-                 (a->u128 + ~b->u128 == (__uint128_t)-1);
-#else
-    int carry = (avr_qw_cmpu(*a, *b) > 0);
-    if (!carry) {
-        ppc_avr_t tmp;
-        avr_qw_not(&tmp, *b);
-        avr_qw_add(&tmp, *a, tmp);
-        carry = ((tmp.VsrSD(0) == -1ull) && (tmp.VsrSD(1) == -1ull));
-    }
+    Int128 tmp = int128_not(b->s128);
+
+    r->VsrD(1) = int128_ult(int128_not(a->s128), tmp) ||
+                 int128_eq(int128_add(a->s128, tmp), int128_makes64(-1));
     r->VsrD(0) = 0;
-    r->VsrD(1) = carry;
-#endif
 }
 
 void helper_VSUBECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 671992f7d1..e644ad3236 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM_TRANS(vsl, 2, 7);
 GEN_VXFORM_TRANS(vsr, 2, 11);
 GEN_VXFORM_ENV(vpkuhum, 7, 0);
@@ -2856,9 +2855,6 @@ GEN_VXFORM_DUAL(vsubuwm, PPC_ALTIVEC, PPC_NONE, \
                 bcdus, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsbs, PPC_ALTIVEC, PPC_NONE, \
                 bcdtrunc, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_DUAL(vsubcuq, PPC2_ALTIVEC_207, PPC_NONE, \
-                bcdutrunc, PPC_NONE, PPC2_ISA300)
-
 
 static void gen_vsbox(DisasContext *ctx)
 {
@@ -3098,6 +3094,7 @@ TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
 
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 
+TRANS_FLAGS2(ALTIVEC_207, VSUBCUQ, do_vx_helper, gen_helper_VSUBCUQ)
 TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
 
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 9395806f3d..a3a0fd0650 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -127,7 +127,7 @@ GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM_300(bcdtrunc, 0, 20),
-GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
+GEN_VXFORM_300(bcdutrunc, 0, 21),
 GEN_VXFORM(vsl, 2, 7),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
-- 
2.36.1


