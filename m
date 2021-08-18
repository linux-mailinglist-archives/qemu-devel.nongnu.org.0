Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A023F0C80
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:14:46 +0200 (CEST)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRxW-0000I5-2J
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA5-0008Dw-Mx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:41 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA4-0002vO-7n
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so3313885pgk.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9A8Rj2dWBZVd/2qEoygNTQVafGJWurEIjdRl4wrHP1s=;
 b=yekeMA7ZtZDWcv77lwhURJQETKJViGSmmZTT08QAQ4Lmz8Ur6WLqcRB6X6wTcR3E1E
 Tf4hSCr8/CFM013izNKkp4xxapJMoDkDITIyrGqyb59/23pgXrcKAAO4sbJOAR5zQz/r
 xYIzEkQsd53VswfSlzqmn+INsNdcyg+qfhhVxeLyheZEMrPOQD+Y/Ft1CBfmrBlwSNHy
 ol2rMx5Re3VXKL2QYQVv2uiPpmAnC/IcVWCVPobjc0kuilE+8POJbM7aJC7wzHMi4J9x
 n09+HZQ1zVsXmkNjy6i7VOTv4TjETF+XA4mTS5Shh457AdYgb7MZfqefuh17r9pzUazh
 3BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9A8Rj2dWBZVd/2qEoygNTQVafGJWurEIjdRl4wrHP1s=;
 b=oS00j5u0apoJXLQzUqVz/Bc4wAHEtl8IjVeBsVtMsioTxoc+OLnDIlBuUHZxO/Buhf
 6bv6JbmOmGOmUATtuZnGz+TqNpm1R/qpVJXZQQZIhyrCG948d1z1DoONyC4IULYrJkfz
 pFAbo0Hb9WuyPTlGH4PCh2pwnsdxAGi1eGiFP6zvPzp5JQM6FyesD+Spkw3ZUeLN+gav
 9oF/UvWnc7vgoCgi3D92XwHcJXLI/zRjr1rFaEq9OFNbDop1AuxTO9LdQNmQE2+UPxlL
 1fkLZTAgxBHKl1KWEocfS4hL1ciqKOIa8OSE5hTj1x9/G3wNeOrKng3DtUSzDTWMEPJo
 g35g==
X-Gm-Message-State: AOAM533cgboekF++178kH675/1GhlIUU4anGbfMh2uaK5N3RuEnnGYq2
 ewqWEFTjwa0WDRWl0jG/4dgO9OWZ9BKMJw==
X-Google-Smtp-Source: ABdhPJw95caHWoLiiT7i8E6rVIQAXiaRPpIrNl3GaZN/iOgZ1loQq+65c3Wqe83AoEAGCKZL5nR3VA==
X-Received: by 2002:a62:1ad2:0:b029:3e0:7eb7:a6bd with SMTP id
 a201-20020a621ad20000b02903e07eb7a6bdmr11058139pfa.51.1629314618973; 
 Wed, 18 Aug 2021 12:23:38 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 63/66] tcg/tci: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 09:19:17 -1000
Message-Id: <20210818191920.390759-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e76087ccac..985c8a91cb 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -296,7 +296,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         return helper_ret_ldub_mmu(env, taddr, oi, ra);
     case MO_SB:
@@ -326,10 +326,14 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
     uint64_t ret;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_ld(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         ret = ldub_p(haddr);
         break;
@@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
                         MemOpIdx oi, const void *tb_ptr)
 {
-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         helper_ret_stb_mmu(env, taddr, val, oi, ra);
         break;
@@ -408,9 +412,13 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_st(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         stb_p(haddr, val);
         break;
-- 
2.25.1


