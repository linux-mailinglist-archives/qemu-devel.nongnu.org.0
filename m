Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F936F3064
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 13:16:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptRUd-0005Ik-GM; Mon, 01 May 2023 07:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUX-0005IL-Lp
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:49 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUV-0001rE-Ls
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:49 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso1692784b3a.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682939686; x=1685531686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52EkvQKfeuMgyVPLZ2Vj666RfrR+9Z9OBca7fh74bGg=;
 b=nH+CIeWN2AdvaAU0tV4daxVtHWfDGy5w8EBW6RaZkdupe846WNLKsvBSyxHqlMTKJw
 0TV75nZ/MvO+w/AgOSXB1d9LAITrCTCB1ir8+dSybmKmr0tIvyfpaEO+lz4udJS3xykf
 Z6y6dsAiXQNXlZybSRz6Zts7e8lMW3rDnAgBtsX/IohcS6u7LSJFqVCZJ8eippaNzuoa
 QG4GCDK2Cy3idkIeO+ubYG/f4w5Dmm3qNaHYfGSvmRAp3uTfm+47EdK75hIHcc0Nee3I
 WuR9/tc6jukRXeEX5OtxIblTRE0Sk0GltKj55RIjyGaLT/BfpHREu01SFa0ym7ISF/yG
 BD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682939686; x=1685531686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=52EkvQKfeuMgyVPLZ2Vj666RfrR+9Z9OBca7fh74bGg=;
 b=KsvPHnIcuo+X354/iq8TG8aunotiGteTtMd64uEdd/yX453dRv8EuXsig8FEg6mItr
 L0OvOrqGUBITopWiIMXiP9xxMEPBd2iF1b3TTcHsqyrHJYu4cdek6lH1xXLGwYVmA90Z
 jc7qixCDBc/CJ66qI6GTFuM2nF4qc3xY1OPFgm77L3GrK9vjK0D+rwaMElrAHaxN2O5l
 0p6tT5+ZkuyrKds0G9gmAzoLV/hkkCK01/wlIhsUd3piXMxh/xowMUlcPw6ANgxcm+D/
 pLSJtqXCGFZWWZvDR+W7wIPmX1bwYUPnikDsZk/OBdkZmYthMZxJa7MnhhWNwOLm5xa+
 rUoQ==
X-Gm-Message-State: AC+VfDxWldgk8GxFIblv2PaAQf0PWhblkQnyKLLZhaHfo3nzZtmxUDH8
 PKY6z3XO4O5Pe40BZlzhL+WkK2+EktU=
X-Google-Smtp-Source: ACHHUZ4/Nwpzl/rDtklhtTbOemH2A/Bk0ZYdQy6zTXwUbu67bxNlggingwZcW7uqYBcXMeqGrRwWww==
X-Received: by 2002:a17:903:1382:b0:1aa:fd48:f5e2 with SMTP id
 jx2-20020a170903138200b001aafd48f5e2mr1427563plb.32.1682939685738; 
 Mon, 01 May 2023 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-10-58.hsd1.ca.comcast.net.
 [98.35.10.58]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c08500b001aafdf8061dsm1043091pld.207.2023.05.01.04.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 04:14:45 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, philmd@linaro.org,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v2 2/3] target/i386: Fix exception classes for SSE/AVX
 instructions.
Date: Mon,  1 May 2023 04:14:27 -0700
Message-Id: <20230501111428.95998-2-ricky@rzhou.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501111428.95998-1-ricky@rzhou.org>
References: <20230501111428.95998-1-ricky@rzhou.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Fix the exception classes for some SSE/AVX instructions to match what is
documented in the Intel manual.

These changes are expected to have no functional effect on the behavior
that qemu implements (primarily >= 16-byte memory alignment checks). For
instance, since qemu does not implement the AC flag, there is no
difference in behavior between Exception Classes 4 and 5 for
instructions where the SSE version only takes <16 byte memory operands.
---
 target/i386/tcg/decode-new.c.inc | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 1a579451d2..796ba7cf18 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -237,7 +237,7 @@ static void decode_group14(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
 static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F6F[4] = {
-        X86_OP_ENTRY3(MOVDQ,       P,q, None,None, Q,q, vex1 mmx),  /* movq */
+        X86_OP_ENTRY3(MOVDQ,       P,q, None,None, Q,q, vex5 mmx),  /* movq */
         X86_OP_ENTRY3(MOVDQ,       V,x, None,None, W,x, vex1),      /* movdqa */
         X86_OP_ENTRY3(MOVDQ,       V,x, None,None, W,x, vex4_unal), /* movdqu */
         {},
@@ -306,7 +306,7 @@ static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F7F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F7F[4] = {
-        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1 mmx), /* movq */
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex5 mmx), /* movq */
         X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1), /* movdqa */
         X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex4_unal), /* movdqu */
         {},
@@ -639,15 +639,15 @@ static void decode_0F10(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     static const X86OpEntry opcodes_0F10_reg[4] = {
         X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPS */
         X86_OP_ENTRY3(MOVDQ,   V,x,  None,None, W,x, vex4_unal), /* MOVUPD */
-        X86_OP_ENTRY3(VMOVSS,  V,x,  H,x,       W,x, vex4),
-        X86_OP_ENTRY3(VMOVLPx, V,x,  H,x,       W,x, vex4), /* MOVSD */
+        X86_OP_ENTRY3(VMOVSS,  V,x,  H,x,       W,x, vex5),
+        X86_OP_ENTRY3(VMOVLPx, V,x,  H,x,       W,x, vex5), /* MOVSD */
     };
 
     static const X86OpEntry opcodes_0F10_mem[4] = {
         X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPS */
         X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x,  vex4_unal), /* MOVUPD */
-        X86_OP_ENTRY3(VMOVSS_ld,  V,x,  H,x,       M,ss, vex4),
-        X86_OP_ENTRY3(VMOVSD_ld,  V,x,  H,x,       M,sd, vex4),
+        X86_OP_ENTRY3(VMOVSS_ld,  V,x,  H,x,       M,ss, vex5),
+        X86_OP_ENTRY3(VMOVSD_ld,  V,x,  H,x,       M,sd, vex5),
     };
 
     if ((get_modrm(s, env) >> 6) == 3) {
@@ -662,15 +662,15 @@ static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     static const X86OpEntry opcodes_0F11_reg[4] = {
         X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPS */
         X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPD */
-        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
-        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
+        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex5),
+        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex5), /* MOVSD */
     };
 
     static const X86OpEntry opcodes_0F11_mem[4] = {
         X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPS */
         X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPD */
-        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
-        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
+        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex5),
+        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex5), /* MOVSD */
     };
 
     if ((get_modrm(s, env) >> 6) == 3) {
@@ -687,16 +687,16 @@ static void decode_0F12(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
          * Use dq for operand for compatibility with gen_MOVSD and
          * to allow VEX128 only.
          */
-        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPS */
-        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex5), /* MOVLPS */
+        X86_OP_ENTRY3(VMOVLPx_ld, V,dq, H,dq,      M,q, vex5), /* MOVLPD */
         X86_OP_ENTRY3(VMOVSLDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
-        X86_OP_ENTRY3(VMOVDDUP,   V,x,  None,None, WM,q, vex4 cpuid(SSE3)), /* qq if VEX.256 */
+        X86_OP_ENTRY3(VMOVDDUP,   V,x,  None,None, WM,q, vex5 cpuid(SSE3)), /* qq if VEX.256 */
     };
     static const X86OpEntry opcodes_0F12_reg[4] = {
-        X86_OP_ENTRY3(VMOVHLPS,  V,dq, H,dq,       U,dq, vex4),
-        X86_OP_ENTRY3(VMOVLPx,   W,x,  H,x,        U,q,  vex4), /* MOVLPD */
+        X86_OP_ENTRY3(VMOVHLPS,  V,dq, H,dq,       U,dq, vex7),
+        X86_OP_ENTRY3(VMOVLPx,   W,x,  H,x,        U,q,  vex5), /* MOVLPD */
         X86_OP_ENTRY3(VMOVSLDUP, V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
-        X86_OP_ENTRY3(VMOVDDUP,  V,x,  None,None,  U,x,  vex4 cpuid(SSE3)),
+        X86_OP_ENTRY3(VMOVDDUP,  V,x,  None,None,  U,x,  vex5 cpuid(SSE3)),
     };
 
     if ((get_modrm(s, env) >> 6) == 3) {
@@ -716,15 +716,15 @@ static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
          * Operand 1 technically only reads the low 64 bits, but uses dq so that
          * it is easier to check for op0 == op1 in an endianness-neutral manner.
          */
-        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVHPS */
-        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex5), /* MOVHPS */
+        X86_OP_ENTRY3(VMOVHPx_ld, V,dq, H,dq,      M,q, vex5), /* MOVHPD */
         X86_OP_ENTRY3(VMOVSHDUP,  V,x,  None,None, W,x, vex4 cpuid(SSE3)),
         {},
     };
     static const X86OpEntry opcodes_0F16_reg[4] = {
         /* Same as above, operand 1 could be Hq if it wasn't for big-endian.  */
-        X86_OP_ENTRY3(VMOVLHPS,  V,dq, H,dq,      U,q, vex4),
-        X86_OP_ENTRY3(VMOVHPx,   V,x,  H,x,       U,x, vex4), /* MOVHPD */
+        X86_OP_ENTRY3(VMOVLHPS,  V,dq, H,dq,      U,q, vex7),
+        X86_OP_ENTRY3(VMOVHPx,   V,x,  H,x,       U,x, vex5), /* MOVHPD */
         X86_OP_ENTRY3(VMOVSHDUP, V,x,  None,None, U,x, vex4 cpuid(SSE3)),
         {},
     };
@@ -813,7 +813,7 @@ static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     static const X86OpEntry opcodes_0FE6[4] = {
         {},
         X86_OP_ENTRY2(VCVTTPD2DQ,  V,x, W,x,      vex2),
-        X86_OP_ENTRY2(VCVTDQ2PD,   V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTDQ2PD,   V,x, W,x,      vex5),
         X86_OP_ENTRY2(VCVTPD2DQ,   V,x, W,x,      vex2),
     };
     *entry = *decode_by_prefix(s, opcodes_0FE6);
@@ -831,12 +831,12 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x10] = X86_OP_GROUP0(0F10),
     [0x11] = X86_OP_GROUP0(0F11),
     [0x12] = X86_OP_GROUP0(0F12),
-    [0x13] = X86_OP_ENTRY3(VMOVLPx_st,  M,q, None,None, V,q,  vex4 p_00_66),
+    [0x13] = X86_OP_ENTRY3(VMOVLPx_st,  M,q, None,None, V,q,  vex5 p_00_66),
     [0x14] = X86_OP_ENTRY3(VUNPCKLPx,   V,x, H,x, W,x,        vex4 p_00_66),
     [0x15] = X86_OP_ENTRY3(VUNPCKHPx,   V,x, H,x, W,x,        vex4 p_00_66),
     [0x16] = X86_OP_GROUP0(0F16),
     /* Incorrectly listed as Mq,Vq in the manual */
-    [0x17] = X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex4 p_00_66),
+    [0x17] = X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex5 p_00_66),
 
     [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
     [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2), /* sqrtps */
@@ -871,8 +871,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x2B] = X86_OP_GROUP0(0F2B),
     [0x2C] = X86_OP_GROUP0(0F2C),
     [0x2D] = X86_OP_GROUP0(0F2D),
-    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex4 p_00_66),
-    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex4 p_00_66),
+    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex3 p_00_66),
+    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex3 p_00_66),
 
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
-- 
2.39.2


