Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48992693675
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 09:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR7ik-0006Ah-CC; Sun, 12 Feb 2023 03:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1pR7ii-0006AM-Hd
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 03:28:24 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1pR7ig-0002BY-8s
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 03:28:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so9573036pjp.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 00:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=zLwq6cA9DMz2yxpqo3iewSzjjRlrK3lDbSE5XJKpBvQ=;
 b=NhetZg9VuuhidPnHjnh1w13HKj0geP8Rbd3LiHzEsug9huOH4MDSBPa6sIJsli6fbX
 L0Sau2fxIUgOSEAbpP39id25t9PlE6QhR1CDyecwQHE/vZ9b59qhMYvTOm+Wr95co7Lz
 pXcypdHlzakSyzqM2HjHvl/3maXW5ndL2fMknlbB0wdCcERPkE1DzTgRiQU+Rm0nKdIn
 eRZ5uf/d/W58G0dVRssVgygaH1r7IsDV0gRif3lu9JBEFFLob5N4OxIT7zD7ORuijLl/
 ezBHfjV3vRzxpZ8cdyXJTsvDWTAMJJlVfPp7/4pS0b4G9o7sGvEyal8NyHc6KldFN58K
 A3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLwq6cA9DMz2yxpqo3iewSzjjRlrK3lDbSE5XJKpBvQ=;
 b=uEwoY04E0zJjswfSSi5EANX4YozG+TpbUa2vMsEXBgO/mpDUrRH0M75Y3Nj4Sv8M/h
 F6ldMsNOGxGZjfX/s0Nl0VrPIFbLJDfdobo9RN1IBrJxCJJ5atGVuEtrscgABIowVgKt
 GSJgxH44I8I4hkUs/sgSY9yzrLHrhMSrmQk2D3h6jyoAKhRu9m0hvzOl1YXOfbIcBWs7
 mup1Aiq6bFgUVUyCx2YjhBk7UGO+lLdw3RkNpetBP7tB/4Cgo9A6q9Cbu4rJKG51GbJT
 /hQK3nGS0aP5tej7CoswlCOW0gr7n1ZJ80xbzzuZBBdZfXU7hIhzDuEWutTwCpvuUSv2
 DYUg==
X-Gm-Message-State: AO0yUKVW/VLXK8njTm10hA6kuVyCOXVrAWGBSXXVrVpT+WDf2nyrszKm
 JwAZZC8gbBjt2GFo1s+r6ddXTIehZgfwLQ==
X-Google-Smtp-Source: AK7set8shuaXlx4KApapyUOaGClX6+MEGnUjGwqq+PAYkwpArz09biFzT55wQSWk9mr9O7nEyGUhXw==
X-Received: by 2002:a05:6a20:7d9b:b0:bc:96bd:d701 with SMTP id
 v27-20020a056a207d9b00b000bc96bdd701mr24326108pzj.13.1676190500056; 
 Sun, 12 Feb 2023 00:28:20 -0800 (PST)
Received: from localhost.localdomain (c-67-188-238-54.hsd1.ca.comcast.net.
 [67.188.238.54]) by smtp.gmail.com with ESMTPSA id
 x8-20020a62fb08000000b00592543d7363sm5834611pfm.1.2023.02.12.00.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 00:28:19 -0800 (PST)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH] target/i386: Fix exception classes for SSE/AVX instructions.
Date: Sun, 12 Feb 2023 00:28:12 -0800
Message-Id: <20230212082812.55101-1-ricky@rzhou.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Most of these changes have no functional effect on the behavior that
qemu implements (primarily >= 16-byte memory alignment checks). For
example, since qemu does not implement the AC flag, there is no
difference in behavior between Exception Classes 4 and 5 for
instructions where the SSE version only takes <16 byte memory operands.

There is one functional change:

Before this change, MOVNTPS and MOVNTPD were labeled as Exception Class
4 (only requiring alignment for legacy SSE instructions). This changes
them to Exception Class 1 (always requiring memory alignment), as
documented in the Intel manual.

Signed-off-by: Ricky Zhou <ricky@rzhou.org>
---
 target/i386/tcg/decode-new.c.inc | 79 ++++++++++++++++----------------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index d5fd8d965c..a9060c3268 100644
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
@@ -274,9 +274,9 @@ static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 {
     static const X86OpEntry opcodes_0F78[4] = {
         {},
-        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A)),
+        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A)), /* AMD extension */
         {},
-        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A)),
+        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A)), /* AMD extension */
     };
     *entry = *decode_by_prefix(s, opcodes_0F78);
 }
@@ -284,9 +284,9 @@ static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (s->prefix & PREFIX_REPNZ) {
-        entry->gen = gen_INSERTQ_r;
+        entry->gen = gen_INSERTQ_r; /* AMD extension */
     } else if (s->prefix & PREFIX_DATA) {
-        entry->gen = gen_EXTRQ_r;
+        entry->gen = gen_EXTRQ_r; /* AMD extension */
     } else {
         entry->gen = NULL;
     };
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
@@ -660,17 +660,17 @@ static void decode_0F10(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F11_reg[4] = {
-        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPS */
-        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPD */
-        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
-        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPD */
+        X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex5),
+        X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex5), /* MOVSD */
     };
 
     static const X86OpEntry opcodes_0F11_mem[4] = {
-        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPS */
-        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPD */
-        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
-        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPD */
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
@@ -750,8 +750,9 @@ static void decode_0F2A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F2B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F2B[4] = {
-        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPS */
-        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPD */
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex1), /* MOVNTPS */
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex1), /* MOVNTPD */
+        /* AMD extensions */
         X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSS */
         X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSD */
     };
@@ -813,7 +814,7 @@ static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     static const X86OpEntry opcodes_0FE6[4] = {
         {},
         X86_OP_ENTRY2(VCVTTPD2DQ,  V,x, W,x,      vex2),
-        X86_OP_ENTRY2(VCVTDQ2PD,   V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTDQ2PD,   V,x, W,x,      vex5),
         X86_OP_ENTRY2(VCVTPD2DQ,   V,x, W,x,      vex2),
     };
     *entry = *decode_by_prefix(s, opcodes_0FE6);
@@ -831,17 +832,17 @@ static const X86OpEntry opcodes_0F[256] = {
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
-    [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3),
-    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3),
+    [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2), /* sqrtps */
+    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3), /* rsqrtps */
+    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3), /* rcpps */
     [0x54] = X86_OP_ENTRY3(PAND,       V,x, H,x, W,x,  vex4 p_00_66), /* vand */
     [0x55] = X86_OP_ENTRY3(PANDN,      V,x, H,x, W,x,  vex4 p_00_66), /* vandn */
     [0x56] = X86_OP_ENTRY3(POR,        V,x, H,x, W,x,  vex4 p_00_66), /* vor */
@@ -871,15 +872,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x2B] = X86_OP_GROUP0(0F2B),
     [0x2C] = X86_OP_GROUP0(0F2C),
     [0x2D] = X86_OP_GROUP0(0F2D),
-    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex4 p_00_66),
-    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex4 p_00_66),
+    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex3 p_00_66),
+    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex3 p_00_66),
 
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
     [0x58] = X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x59] = X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2), /* CVTPS2PD */
     [0x5b] = X86_OP_GROUP0(0F5B),
     [0x5c] = X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x5d] = X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-- 
2.39.1


