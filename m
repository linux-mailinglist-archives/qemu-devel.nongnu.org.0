Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2D5355DF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:58:40 +0200 (CEST)
Received: from localhost ([::1]:49730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLV9-0005LD-67
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCX-0001xN-Ow; Thu, 26 May 2022 17:39:27 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCU-0008BM-R1; Thu, 26 May 2022 17:39:24 -0400
Received: by mail-oi1-x234.google.com with SMTP id w130so3714878oig.0;
 Thu, 26 May 2022 14:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GI+749Neze7S/y7cQmy/1jkItDMv0WlylwQZHYhEKCk=;
 b=V60Xgw4BGQRoXYhFBNQTbCQRjAVGlW4jpmgXbjN5R0RbJTt1JYl7RYPDmFf5woWbBg
 2gtGMtbckQWKN7q5JcoW7kYjPNyDIkxhmsZzswjrhBYxRGFV06dVAcHkYx7oVaat58gz
 ycbh80ZNtNstTGDEBFS3fke3ZOC/gfkhMCLXK/1176xOzJZNumzejMz2E6grxGuwfhDx
 mmZ/FZqxr3BG9ajBOVYsGhRv7MS0T8nfXDAwbVy6glEEIVfu0XaQoJY0tATCCaXn1AFq
 5qdg7I8UzhCNsEfIxMYK+Y275AkPddV9kmQzARbwqQo3/DHtXNCGth9Jr1tlw6pcKGOY
 Oatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GI+749Neze7S/y7cQmy/1jkItDMv0WlylwQZHYhEKCk=;
 b=bAYOVSMiZRfAVZZret8i1E+I+GRLkkc9GCltWIyaOmUJO8jlDJVAju99RWTKv7bbBq
 kyCgaVmPNnLdEmsGmW0ESl6dpWBfvWeBuM5s6cUBSb8TwuREB4UsULrqd5GU1O5bv/s3
 0JEYO5hEZVcmhs6/8GVur46dDe8zYYNm3DXha/DMsmchkdMowq4kyDYvW6qpFpHGOZrO
 R1rF4/OEyPhIyYrtt9kBEwh1n11Ca/dw3JpuPMmmY/WRKw1wzhKwv4yB45pGkQdzRTs7
 DQ2EoLfBfMKo7127i/j8ZQ82zX6DYv7JWjH2MMZP3BPSgiLtQDzM8eIVidrGKIffmX9S
 B1Zw==
X-Gm-Message-State: AOAM530QysKTHjecVKuRi8WLXHJUqzdolzApTEc44se95TJnKbSw3zmK
 uvxkWMYgjQqBG1/+TmyWkE8dMXry7zQ=
X-Google-Smtp-Source: ABdhPJzBDXdY8qbGF7wYi++EcNuonP+ym5VZ+jyKxKaMl1IFgWIu+YfmiyW5QIAG5Zob4ra3/+3f2g==
X-Received: by 2002:aca:3bc1:0:b0:32b:243e:2542 with SMTP id
 i184-20020aca3bc1000000b0032b243e2542mr2227552oia.175.1653601161498; 
 Thu, 26 May 2022 14:39:21 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 17/34] target/ppc: declare xvxsigsp helper with call flags
Date: Thu, 26 May 2022 18:37:58 -0300
Message-Id: <20220526213815.92701-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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

Move xvxsigsp to decodetree, declare helper_xvxsigsp with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-8-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c             |  2 +-
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 ++++
 target/ppc/translate/vsx-impl.c.inc | 18 +++++++++++++++++-
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 55ef4b5d48..9489e06504 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3205,7 +3205,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
     return xt;
 }
 
-void helper_xvxsigsp(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
+void helper_XVXSIGSP(ppc_vsr_t *xt, ppc_vsr_t *xb)
 {
     ppc_vsr_t t = { };
     uint32_t exp, i, fraction;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9be69fa91e..aed1b24fdb 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -531,7 +531,7 @@ DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
-DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_2(XVXSIGSP, TCG_CALL_NO_RWG, void, vsr, vsr)
 DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVH, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d4c2615b1a..483349ff6d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -710,6 +710,10 @@ XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
 XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 
+## VSX Binary Floating-Point Math Support Instructions
+
+XVXSIGSP        111100 ..... 01001 ..... 111011011 ..   @XX2
+
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
 XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9b4f309d9d..ca11e2c4b8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2151,7 +2151,23 @@ static void gen_xvxexpdp(DisasContext *ctx)
     tcg_temp_free_i64(xbl);
 }
 
-GEN_VSX_HELPER_X2(xvxsigsp, 0x00, 0x04, 0, PPC2_ISA300)
+static bool trans_XVXSIGSP(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_ptr t, b;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    t = gen_vsr_ptr(a->xt);
+    b = gen_vsr_ptr(a->xb);
+
+    gen_helper_XVXSIGSP(t, b);
+
+    tcg_temp_free_ptr(t);
+    tcg_temp_free_ptr(b);
+
+    return true;
+}
 
 static void gen_xvxsigdp(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 52d7ab30cd..4524c5b02a 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -156,7 +156,6 @@ GEN_XX3FORM(xviexpdp, 0x00, 0x1F, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpdp, 0x16, 0x1D, 0x00, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxsigdp, 0x16, 0x1D, 0x01, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpsp, 0x16, 0x1D, 0x08, PPC2_ISA300),
-GEN_XX2FORM_EO(xvxsigsp, 0x16, 0x1D, 0x09, PPC2_ISA300),
 
 /* DCMX  =  bit[25] << 6 | bit[29] << 5 | bit[11:15] */
 #define GEN_XX2FORM_DCMX(name, opc2, opc3, fl2) \
-- 
2.36.1


