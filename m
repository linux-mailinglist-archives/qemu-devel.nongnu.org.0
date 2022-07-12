Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29208571273
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:48:06 +0200 (CEST)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9gj-00058x-5J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9GB-00047r-5K
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:39 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9G9-0002JE-IJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:38 -0400
Received: by mail-pg1-x534.google.com with SMTP id o18so6690833pgu.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ameaOYTaejX0n/etuEC9PIIeVKsPKESqsBuicmuydr8=;
 b=IsMnhkWb90qtkcnR29Z/AMLQKysLRdZ3FIyeDsjqFW37OOifRNF641/vb5NgzWIs5e
 xFuiG/QXsB2kvb89tpE1rMioARlyhjNeQlg9XF8KU055JDjrG8crVBpn2FN81CosOUQD
 qQNqWTZNkpomCV8CE1+xf9lW3hgy5o0DUkTosLx8JAoEJPnfWCxCa2LXMkSwJ4FkhrdH
 brr8Y/7SjZqIJoYECB+Qbvt/b6xRZiNUmakVFAl6wKEnUdQ+3NSeQwwnCk4k7+V9HQ3B
 6dGj24uJNHr0zJYgGSRESnvZN3Ibm0zXMT6qeGNkBhXo4WBKByHFIlYRkwZQTlNYX5qd
 Y6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ameaOYTaejX0n/etuEC9PIIeVKsPKESqsBuicmuydr8=;
 b=yc2rBA9Z5QdPrSM0Y0bTbj/088Lx9nnacftT5jPvwgnYvA0EmRbqtdZi8gfk+Cy6qf
 LOfpuzXfIdXclMjrJRpPC6+fDqzKcNlkFhvKMr163S4JqGtB6TDOWAA+bxb1NRXv6Mj+
 HD2OGFBvAuMEW+tdFhGXUv+BMSSY/emvdJISy4i8KNInj9e1zyyUJ1UJcKDaRWMag/JA
 i4lOkYGNwyRWIiDxcQXi9cA3S642HRNwUlVppJ+YK9lWz3xbTSl2CEDEL0LKktWy2mE8
 vobYFRuVz/1v7aS0UtqRtrpGwm4U2YTA3W7bmwrZ29wRhKNFsRl4xxRfUYTdFr79wM/Q
 fYug==
X-Gm-Message-State: AJIora/hHbPGTQ3t4jCRTLhg+7AwHtfck5PUBpg8Qxqsz8xaOMKh21b1
 cyKmZ7qrqWR6DcsDzBNQHG7Pyxji53w07zr0
X-Google-Smtp-Source: AGRyM1sXGSEKbRAfIteRspOMlwXjZ5JaXAwDpJPyp7dCC4cBmEWskTfWtqVp/CnkVpxQlaTb82q2Iw==
X-Received: by 2002:a63:c15:0:b0:411:f92a:8ec7 with SMTP id
 b21-20020a630c15000000b00411f92a8ec7mr18895806pgl.86.1657606836196; 
 Mon, 11 Jul 2022 23:20:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 f2-20020aa79682000000b0052ab7144de8sm6040776pfk.10.2022.07.11.23.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 23:20:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 2/2] accel/tcg: Fix unaligned stores to s390x
 low-address-protected lowcore
Date: Tue, 12 Jul 2022 11:50:25 +0530
Message-Id: <20220712062025.197634-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712062025.197634-1-richard.henderson@linaro.org>
References: <20220712062025.197634-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

If low-address-protection is active, unaligned stores to non-protected
parts of lowcore lead to protection exceptions. The reason is that in
such cases tlb_fill() call in store_helper_unaligned() covers
[0, addr + size) range, which contains the protected portion of
lowcore. This range is too large.

The most straightforward fix would be to make sure we stay within the
original [addr, addr + size) range. However, if an unaligned access
affects a single page, we don't need to call tlb_fill() in
store_helper_unaligned() at all, since it would be identical to
the previous tlb_fill() call in store_helper(), and therefore a no-op.
If an unaligned access covers multiple pages, this situation does not
occur.

Therefore simply skip TLB handling in store_helper_unaligned() if we
are dealing with a single page.

Fixes: 2bcf018340cb ("s390x/tcg: low-address protection support")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220711185640.3558813-2-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f90f4312ea..a46f3a654d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2248,7 +2248,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
     const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
-    target_ulong page2, tlb_addr, tlb_addr2;
+    target_ulong page1, page2, tlb_addr, tlb_addr2;
     MemOpIdx oi;
     size_t size2;
     int i;
@@ -2256,15 +2256,17 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
     /*
      * Ensure the second page is in the TLB.  Note that the first page
      * is already guaranteed to be filled, and that the second page
-     * cannot evict the first.
+     * cannot evict the first.  An exception to this rule is PAGE_WRITE_INV
+     * handling: the first page could have evicted itself.
      */
+    page1 = addr & TARGET_PAGE_MASK;
     page2 = (addr + size) & TARGET_PAGE_MASK;
     size2 = (addr + size) & ~TARGET_PAGE_MASK;
     index2 = tlb_index(env, mmu_idx, page2);
     entry2 = tlb_entry(env, mmu_idx, page2);
 
     tlb_addr2 = tlb_addr_write(entry2);
-    if (!tlb_hit_page(tlb_addr2, page2)) {
+    if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
         if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
-- 
2.34.1


