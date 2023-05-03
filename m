Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC66F510C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:17:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6dm-0004ET-JF; Wed, 03 May 2023 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dR-0002vw-Jt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00075X-5X
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30940525e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=Zn+HHXznZSvz5DjBkYn6ROVwfncn8g31Uo41M6h+iNHj5AMhje8ixZChoxeSYMW6XA
 qFZeGWLgknDIL9ZAc/i3nIivffL+BuLhLRWYCUJSk5r8O8d5ayetP82CCQPRyEBjHuFA
 BC4qHd5PKJcPCVwL2ww7dEtMX90YTcvYnTzPsg8HbvZMNFkchW8kduuqbZEKMMo2vLje
 hgIJff9SzOrUAB3pGgFDYeLm/QEocF7yHO+Lf1q437uRecqtr+ma46ifD5S0vz4fG/Wh
 vgqPl0PnMNmYIHR7qwq/Nemr2a8Bh+DKvkTao1ZwCZ9egs+0KOkEv6cnOdoxBQZXrmWo
 uDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=AnnHQT1BvUo3/prbhLiVWvlwxg+MU/AkSJH3yDVV+9/1KoQXA2n+/62ET5gjDffUx/
 wxnG+V36wDZfRk5+F87g+BJ/ryuA0ghZ/4R8fv64MUMQlHtW3AbD5a9Yuz+oMLzXAsX+
 ti7xjJ3yLMkyG7gHthEXXCR/Q3l1a5SigaxwB1MZhQXm0B59HXLdtPtVLfP7+rGlq8GR
 t8/t94kyZD/fUi28rJLvyCyXYTmtL/cPBr29BJjX1d3MRVV7g+82KCP5bv/kXRBaIJ+s
 SKgzTPn344NnLep5xjM2eBAmb/1JnBp+m1WQGMKV1D5YfCBKngRO8LYY2SJODXnvLqw4
 B0ww==
X-Gm-Message-State: AC+VfDzkWBHW/kIDoIMKYYvxw2tTtndbi8w5S8uKZziPYZ9Sln2dy8dS
 Bja3pYDn2h3/OGos6P1CN4R6ZQIjwI30/q3Zfpd41g==
X-Google-Smtp-Source: ACHHUZ5EBoVUg9DNbIN7hM9whjtyTxHFpBmiZuiunCKtKCW6bsmPgz3xYu3BM2Za3n1zzKUYG5ziDA==
X-Received: by 2002:a1c:f019:0:b0:3f1:78a7:6bd2 with SMTP id
 a25-20020a1cf019000000b003f178a76bd2mr14151889wmb.27.1683097835587; 
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 50/57] tcg/s390x: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:49 +0100
Message-Id: <20230503070656.1746170-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22f0206b5a..ddd9860a6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1572,6 +1572,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     int disp;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1733,8 +1735,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1764,7 +1770,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
@@ -1806,7 +1812,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addr_reg;
 
         /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-        tcg_debug_assert(a_bits < 16);
+        tcg_debug_assert(a_mask <= 0xffff);
         tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
 
         tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-- 
2.34.1


