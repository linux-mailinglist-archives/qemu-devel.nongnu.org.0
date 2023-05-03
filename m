Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20406F5165
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rE-0004HT-BD; Wed, 03 May 2023 03:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qC-00029l-0R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qA-0001jn-3g
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so7197145e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098632; x=1685690632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXEFc1/6MuyUi4qFjNUKl+8lwoCYByZLzDmBXIOsnHw=;
 b=rt0v3UvTcPxB+Jz2mWG+Q9AoXZTq1UghXczPfIAPRFkiHY75iYPXx8a9akhsFmklIM
 2nrIb7qCbwiy7Dqwi6X+OLyPHZ2SbvzEmWWBpD2VxxeA0pdI/R9s3VkUPL7pbgDsKlz7
 9mbWRi9afJkaNvImjJi3MAjn8Kylla6GP7dE1Sw2w8asqi/WdW8jHPu5v7656+0usT7i
 p+zgTSiqNfW4cpX1BNuq5KwHRYnmNeQgncy/c4pjwgHGzBrI6kj2UfK0VSRTQURL9O7n
 bjSNUGLrD8nEaVMZwclkv9Kv23VfjT1kHhNlWkR5a7brwMf58can9jKhKVEiYyGiDFjU
 b3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098632; x=1685690632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXEFc1/6MuyUi4qFjNUKl+8lwoCYByZLzDmBXIOsnHw=;
 b=KEPK/c1oYNKPmy1JvuZ5tAnhs97xPAz2al79abUTJyIU1EEMNcjZUi+Q9pHiEVymE7
 148vZhTEgzX8RiCkNQs1mWPjAhlrtHfnvSzKru6Tt7Ne35Amfbuyyibc7l9jygFqJdSF
 vcKz1PltAp2o307WfswKlQXMMLJ279GiYqFy0L+pP6smsSvK1KxL388DOGYRc+AL6ifA
 q2PjtFPpAgpM2AFl1JOI+k+GFjCYyQIMFOrqTMFwoChaQ2KORJfdVHg1w9FE4CBORYlN
 NFpHF1i2a3Fz/f4DmqPVTYfPBQ+UBhTj37jIy9b5d7Hbq0gXScHxC/EoVSi6DmcCcYgi
 ThhA==
X-Gm-Message-State: AC+VfDzfXa1DuFM05QawmdvuPZuNqC2lwqH4stVXGzlmvyXsSVFJLEmC
 0HKuDO0TUnYWFrl/jOwMUiiLF9JgVD3LQeC9EybuBA==
X-Google-Smtp-Source: ACHHUZ5mbitGG9O9FCS8qT4RHHjGs6ZTLyiUhH+B/iZqHzI84aVpc59WuBB8+a8/xLLdo7V3UyfaMg==
X-Received: by 2002:a1c:7910:0:b0:3ed:276d:81a4 with SMTP id
 l16-20020a1c7910000000b003ed276d81a4mr14171929wme.32.1683098632706; 
 Wed, 03 May 2023 00:23:52 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 25/84] tcg/ppc: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:32 +0100
Message-Id: <20230503072331.1747057-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6bda1358ef..33237368e4 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2048,6 +2048,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
                                            MemOpIdx oi, bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp a_bits, atom_u, s_bits;
@@ -2107,17 +2108,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
     /* Load the (low part) TLB comparator into TMP2.  */
-    if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
+    if (cmp_off == 0
+        && (TCG_TARGET_REG_BITS == 64 || addr_type == TCG_TYPE_I32)) {
+        uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32
                         ? LWZUX : LDUX);
         tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
     } else {
         tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        if (TCG_TARGET_REG_BITS == 32 && addr_type != TCG_TYPE_I32) {
             tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
                        TCG_REG_TMP1, cmp_off + 4 * HOST_BIG_ENDIAN);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
+            tcg_out_ld(s, addr_type, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
@@ -2125,7 +2127,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Load the TLB addend for use on the fast path.
      * Do this asap to minimize any load use delay.
      */
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 64 || addr_type == TCG_TYPE_I32) {
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
                    offsetof(CPUTLBEntry, addend));
     }
@@ -2151,7 +2153,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         }
 
         /* Mask the address for the requested alignment.  */
-        if (TARGET_LONG_BITS == 32) {
+        if (addr_type == TCG_TYPE_I32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
         } else if (a_bits == 0) {
@@ -2163,7 +2165,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         }
     }
 
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 32 && addr_type != TCG_TYPE_I32) {
         /* Low part comparison into cr7. */
         tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_I32);
@@ -2183,8 +2185,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
     } else {
         /* Full comparison into cr7. */
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
-                    0, 7, TCG_TYPE_TL);
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2, 0, 7, addr_type);
     }
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
@@ -2211,7 +2212,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     h->base = guest_base ? TCG_GUEST_BASE_REG : 0;
 #endif
 
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 64 && addr_type == TCG_TYPE_I32) {
         /* Zero-extend the guest address for use in the host address. */
         tcg_out_ext32u(s, TCG_REG_R0, addrlo);
         h->index = TCG_REG_R0;
-- 
2.34.1


