Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E356940C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:14:56 +0200 (CEST)
Received: from localhost ([::1]:59888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CMJ-0006sb-Jo
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLr-0000VL-Fx; Wed, 06 Jul 2022 16:10:24 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLo-0003W8-Mv; Wed, 06 Jul 2022 16:10:23 -0400
Received: by mail-vs1-xe29.google.com with SMTP id k2so6596873vsc.5;
 Wed, 06 Jul 2022 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YYul5Ilxr9DNQKNpfYQy96Zdzh7QMDSOjZruOeEzOM=;
 b=BMLbvJgwX2DN3hXuGj+e6Gjrtx+oHMNOnWhQdNl7KjMjEWfDo4rEV4WSDb+3COnDWD
 VSBzjHvH8/TobktwyDnm4AC2i1aFmdTxjpmNAE23JBcoMYKSjlCUY4Pcwcjl5+NXPdE5
 j4U9wStV6UewKqnvQ00/os+lRfkOrAIjLfp5yTyg5cTCn0v7S29BhZOuO4R1CzUIJbdR
 2SZCIbHI2YdJEfpfEaAqOHeo2sIxH7t1uupPmKZdXYMY2xgLdC799H/WvUd9ECwPuVA0
 3/lR+hetVE4RmULKe/vikq9SOozf487l5pGZWw+TPhv6EPRqyGGMpgocMtjH/iebOeEM
 bCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YYul5Ilxr9DNQKNpfYQy96Zdzh7QMDSOjZruOeEzOM=;
 b=I4/+IYgmkR/5HRuCLFrSsF5DCDvaGaDGSwnwq4i7Sr+wFhCV449lkFkBaocQE8Etg7
 7lWAjPzZ87TdzyjqvD2JG0ZGVkJVTBVNFuF68IL18Il1Gv9R0KwmU3i6FeCxXE9hiBzK
 UbT1UDzxjHTG7Xr6/ggaMHyY3/mQZX1pXJkx5WsijAvS0IYTs+xktKREyYvUJcF5niip
 SQEPxhWzIEZlu43fjw7WCHKWUpf5wnkayBQAZeyl///1KK2+JflJPNNRo3KrM5rdzvb0
 DBM2jRnPh8RXLr49v7HMqS5AFmLiR8/yKKC1ghiDGtIuzuDxgpDhqr+B/cWlq49wK5Wm
 sqTQ==
X-Gm-Message-State: AJIora9PNpghCEE25hlpO7fZ75xMDs1/ALD/wsY3INQWlqJkV2b8Xqum
 9dO++FYC9oggoFCY+Q47G30n8utRMBk=
X-Google-Smtp-Source: AGRyM1sBi5RrLPpuUXNgaIoHXG4MR2AhPqgam4PiUlTLcxvmBTuiQd2FZchQ3ag9BIv4WiN9NZWnTg==
X-Received: by 2002:a05:6102:f09:b0:354:4803:b79f with SMTP id
 v9-20020a0561020f0900b003544803b79fmr23085037vss.11.1657138216740; 
 Wed, 06 Jul 2022 13:10:16 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 13/34] target/ppc: use int128.h methods in vadduqm
Date: Wed,  6 Jul 2022 17:09:25 -0300
Message-Id: <20220706200946.471114-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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

And also move the insn to decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 | 2 +-
 target/ppc/insn32.decode            | 2 ++
 target/ppc/int_helper.c             | 8 ++------
 target/ppc/translate/vmx-impl.c.inc | 3 ++-
 target/ppc/translate/vmx-ops.c.inc  | 1 -
 5 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 39ad114c97..c6fbe4b6da 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -204,7 +204,7 @@ DEF_HELPER_FLAGS_5(vadduws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsububs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuhs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
-DEF_HELPER_FLAGS_3(vadduqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vaddecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vaddeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0772729c6e..d6bfc2c768 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -550,6 +550,8 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
+VADDUQM         000100 ..... ..... ..... 00100000000    @VX
+
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
 VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1476e51651..7de69f00b5 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2224,13 +2224,9 @@ static int avr_qw_addc(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
 
 #endif
 
-void helper_vadduqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = a->u128 + b->u128;
-#else
-    avr_qw_add(r, *a, *b);
-#endif
+    r->s128 = int128_add(a->s128, b->s128);
 }
 
 void helper_vaddeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4c2a36405b..3fb48404d9 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vadduqm, 0, 4);
 GEN_VXFORM(vaddcuq, 0, 5);
 GEN_VXFORM3(vaddeuqm, 30, 0);
 GEN_VXFORM3(vaddecuq, 30, 0);
@@ -3100,6 +3099,8 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
     return true;
 }
 
+TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
+
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 26c1d957ee..065b0ba414 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -126,7 +126,6 @@ GEN_VXFORM(vsubuws, 0, 26),
 GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_207(vadduqm, 0, 4),
 GEN_VXFORM_207(vaddcuq, 0, 5),
 GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
-- 
2.36.1


