Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FB6F3065
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 13:16:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptRUc-0005Ih-KM; Mon, 01 May 2023 07:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUW-0005ID-9p
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUU-0001qy-JJ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab05018381so133105ad.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682939684; x=1685531684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=latjWEiWH2tnba4koN8glwZlLcdiw5w2n4QIpyRjV7I=;
 b=KSMNcMcSRgA2MND/CZ7hl3i6WC6+LV76mjcJsyWjodXK8R5PbV07vmHC34nJCCk9L1
 d3B/iZ/ZC2XB9u5DSDWEXz5LV6o3+6DMJdEHscsBJWw567UrbOWIp3BxE5VnRfj3RQ7O
 /jRUH2H+E9iSHa3b9USE6VMCipf9x4+5V1A/OQcc+Y0wCL23pryFQaVwxT95eS4bRGzq
 w1aZg+2Xs8eLUXeBh/2wiZf+Ra02XRflSG/1E5TS9DcBUrP7E+d1NfFDgWUBlsRPKCGi
 XGXO6NSJLHdQFwFlm5HuyJXBuH0yvSwdEykcXY8/ZPQZqZlCgM+29biRs5urAKnE46fQ
 hyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682939684; x=1685531684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=latjWEiWH2tnba4koN8glwZlLcdiw5w2n4QIpyRjV7I=;
 b=E0YyqeNvZs1GhBT8VrByhI3DC/AtK61sYU5bX/fvAvPOFxqcA29Ek5AU82SdSXdmoa
 tXf+6YcJcfnC2AEPX1U5M8qLkQecqqax0rCcoNo7aDdWI7RwDrM5j8QdHU0V1oEsF4Ex
 PFJ5OVzqfAQX9ENxb02TdsXU407HIGJqNWpUq7+YS0wlL8h0XebyafKFGOoL4IsKwOro
 j1z9usNES42cU5mUXz5UkY1IlAPSTsFtM3SKIF3ug9rkL19b16NmQRzV3xKSpMluDb/C
 cByo7zJmtgUbyz2nzAye3JBCMd/+GBiJE3YBLfNQCpUYAmKznzKeaTpcgYny4yldUsoP
 RmOQ==
X-Gm-Message-State: AC+VfDyDNbgrJ74l1fUfpiM3Tb1BZNw8bR2egv1M9vRkhASC/CjwqYY1
 4ZGl21+RDFfcAvwqxEBvF73+WeKYClM=
X-Google-Smtp-Source: ACHHUZ4uuPgwQIWxgLkDIj2bpZWa9Cil091u/jbMCE9FtNFXPcP6+zYosNn3eLzT0x7AY/3ghiEpKg==
X-Received: by 2002:a17:903:228c:b0:1a6:95c3:74a with SMTP id
 b12-20020a170903228c00b001a695c3074amr16795030plh.17.1682939684405; 
 Mon, 01 May 2023 04:14:44 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-10-58.hsd1.ca.comcast.net.
 [98.35.10.58]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c08500b001aafdf8061dsm1043091pld.207.2023.05.01.04.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 04:14:43 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, philmd@linaro.org,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v2 1/3] target/i386: Fix and add some comments next to SSE/AVX
 instructions.
Date: Mon,  1 May 2023 04:14:26 -0700
Message-Id: <20230501111428.95998-1-ricky@rzhou.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pl1-x635.google.com
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

Adds some comments describing what instructions correspond to decoding
table entries and fixes some existing comments which named the wrong
instruction.
---
 target/i386/tcg/decode-new.c.inc | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 4fdd87750b..1a579451d2 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
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
@@ -660,15 +660,15 @@ static void decode_0F10(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F11(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F11_reg[4] = {
-        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPS */
-        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,   W,x,  None,None, V,x, vex4), /* MOVUPD */
         X86_OP_ENTRY3(VMOVSS,  W,x,  H,x,       V,x, vex4),
         X86_OP_ENTRY3(VMOVLPx, W,x,  H,x,       V,q, vex4), /* MOVSD */
     };
 
     static const X86OpEntry opcodes_0F11_mem[4] = {
-        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPS */
-        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVPD */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPS */
+        X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex4), /* MOVUPD */
         X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
         X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
     };
@@ -839,9 +839,9 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x17] = X86_OP_ENTRY3(VMOVHPx_st,  M,q, None,None, V,dq, vex4 p_00_66),
 
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
@@ -879,7 +879,7 @@ static const X86OpEntry opcodes_0F[256] = {
 
     [0x58] = X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x59] = X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2), /* CVTPS2PD */
     [0x5b] = X86_OP_GROUP0(0F5B),
     [0x5c] = X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x5d] = X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-- 
2.39.2


