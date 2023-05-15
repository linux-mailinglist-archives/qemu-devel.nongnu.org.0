Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CD703065
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:44:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZK0-0005Fw-EG; Mon, 15 May 2023 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJs-0004yO-CB
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJj-0005yV-F2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so120110295ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161410; x=1686753410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPhN/AVmZfqDEN0zKKnHjQGokKYF75xLV5YHB0OEaoc=;
 b=mvTdIKjvnkSuz2lCQmiB3DZC9JiVefPaeGnuFgM8g4fZDrKjEezR4UwAYTDhLytCU3
 j8KMmFY4koHmQ86YyRTe/zNcE5ozl2fOJUE/4nbtFwblEIE360XBuJEWmdo73qb1bBGT
 dzOnXjRdfQ/xjPd2jXkfMCeWN6qMDC+f0q0+a3RkOdPpIou5XhL8e/ZB30sF3izZ58yP
 vmP+Tuu3G/hvcI3XRx9PNa0ngD3bmLLswf7rEzSEJL/gs2pbSwr3/epcrkN8dY9Ldogz
 mtUu1jCBfplAAv7X+pz4oPBtfvfsqQVJ5aPf6EJbKm9hCxCPayI6ZFIrbkdzUdeekGFz
 e+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161410; x=1686753410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPhN/AVmZfqDEN0zKKnHjQGokKYF75xLV5YHB0OEaoc=;
 b=IXEqgz4fLI+FF9n4addPbJ+QmuNvmkWZQIyJPQSnG2NPvemgIAge457+JG/qZjGxCc
 KznK3p/8SE7OA3/ZTw4ZipfTZEgUvCo0hJjv/sUvROzsIohOl1GjkPmMCoBv06dhsZDn
 T41ABhrG0aZYMT+zYXtnn5Lv8vIjfncMzzvDkyAOwqfXfWm/gYhD7wmbkfI4G/1BfCYa
 dqrMKsAMRfiWmxm/0jsSZ2/lR5LqxGauO5JMgtcF8j+FxgiEZHU0FnnM5DDkzBYGdGNf
 EI9KkiStmhRyNCmKBxPCUNCnvbDBl1RVFLzHIHl2Lrgg8lg3Ab/A9i6KO8VC+lUl7ANi
 04ig==
X-Gm-Message-State: AC+VfDx8PJ6OjbyDfYavyWt+YkTJ1yACu9WE4cPkDZrNYmAjw4qhVvhA
 GZJuMNhw8fi3vgzzK6EM/7hkqsYrpJgWZy/fcS0=
X-Google-Smtp-Source: ACHHUZ7AnBXVGRPE+NBY5rLRzQFbsGr31LzR+6DdGdI9mTwCW46IHVAJpLAV2heRq22rHqayhe5kfA==
X-Received: by 2002:a17:902:efc5:b0:19c:f096:bbef with SMTP id
 ja5-20020a170902efc500b0019cf096bbefmr31630039plb.49.1684161410241; 
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 41/54] tcg/aarch64: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:00 -0700
Message-Id: <20230515143313.734053-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 0cc719d799..ea4108d59c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1593,6 +1593,7 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     TCGType index_ext;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1646,8 +1647,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    unsigned a_mask;
+
+    h->aa = atom_and_align_for_opc(s, opc,
+                                   have_lse2 ? MO_ATOM_WITHIN16
+                                             : MO_ATOM_IFALIGN,
+                                   false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1693,7 +1699,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         x3 = addr_reg;
     } else {
         tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
@@ -1713,11 +1719,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 
-    *h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
+    h->base = TCG_REG_X1,
+    h->index = addr_reg;
+    h->index_ext = addr_type;
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1735,17 +1739,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     if (USE_GUEST_BASE) {
-        *h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
+        h->base = TCG_REG_GUEST_BASE;
+        h->index = addr_reg;
+        h->index_ext = addr_type;
     } else {
-        *h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
+        h->base = addr_reg;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
     }
 #endif
 
-- 
2.34.1


