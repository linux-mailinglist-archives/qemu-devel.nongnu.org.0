Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F25E9234
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:56:40 +0200 (CEST)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPJP-0007qc-6S
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEe-0002NH-UK
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:44 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEd-0000Lr-38
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:44 -0400
Received: by mail-qt1-x82b.google.com with SMTP id g12so2618606qts.1
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WH/H6qrZlP9fnJx7iYc8K+by1boChGZc2yEwipA2Efc=;
 b=hJ6A7TfYT6TyecVJLnqAzoXvFPxSFxD67g+6Entjru7rmolr2UxLacwogpBByYNzt/
 Oo9/3gf+NLdFmvaZcjH8eo/gnSizCn+Y8wg/4kZks26vP98Go7ruKO9DUHQ4ugfwjZBR
 1vrYycvtLB4gbPd+ONj/llrwCqnBJLx6cZGxvxWEU2G1O0kBzxtMVjao9dThjJ4d5qQJ
 Sa9feHI5Tk9p78oUPBJpR6Ar9zARFHPCb7MEY6SZERNcF11S8GiMHWmGh4lYUlmsW6t4
 LqZjQ5flaK7zavp0NPZNVJoBr90Nu/loT21Po2/wuG4GLUrHtBR7Nhr/q5EOgjWik4Pu
 /F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WH/H6qrZlP9fnJx7iYc8K+by1boChGZc2yEwipA2Efc=;
 b=tT/i80aEKBsGl8z/ZLIgdRm8vDAmf7eVgKwBvbQ9oVzhgj2hz8MzsPDdPILkggZh//
 IB/LYFk0+ZttqRGiO1wPqgqtFVIpmznlaVfQKWZit0Y2jbqVfjsFi2H3JW5FZKbh/QIL
 doNas229bRhHx7RGdqBbDqbhuR6C5Pjy1lgLQdn43YD0U8NIJPxMHj2fWkXP6upoOwXn
 pm3R2J1a6Rg+SvC3WLvjvISBrj9SQccExAZB5xTtyLlHhxkInKKiybJTd/k3uN8xvkcs
 NGlkkZ4dVpKxvbvIq/3a4MKM5/3YhcgZk6dcXfNrcG+S1UnE1HQzFqyIhNSMDrVDo1Ix
 ZsmA==
X-Gm-Message-State: ACrzQf3dMjgu12L71AlepBrm+oP9JVa8XPurdhW+7Z5gxhvsfpXjLcYB
 5x9Q7/6ywgj5sapVZI/vxQwV/cW8yIiy9Q==
X-Google-Smtp-Source: AMsMyM4fbfaf31niXmuekJXVZvQdj3TxbxPHdPEpB2RPtTdVn5N3fJ5J3wvTDmdd1brWqsbdkyZEeQ==
X-Received: by 2002:ac8:5b4d:0:b0:35b:b5fa:5e24 with SMTP id
 n13-20020ac85b4d000000b0035bb5fa5e24mr14180682qtw.163.1664103101892; 
 Sun, 25 Sep 2022 03:51:41 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/17] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Sun, 25 Sep 2022 10:51:10 +0000
Message-Id: <20220925105124.82033-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When PAGE_WRITE_INV is set when calling tlb_set_page,
we immediately set TLB_INVALID_MASK in order to force
tlb_fill to be called on the next lookup.  Here in
probe_access_internal, we have just called tlb_fill
and eliminated true misses, thus the lookup must be valid.

This allows us to remove a warning comment from s390x.
There doesn't seem to be a reason to change the code though.

Cc: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c            | 10 +++++++++-
 target/s390x/tcg/mem_helper.c |  4 ----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 03395e725d..91f2b53142 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1535,6 +1535,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     tlb_addr = tlb_read_ofs(entry, elt_ofs);
 
+    flags = TLB_FLAGS_MASK;
     page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
@@ -1550,10 +1551,17 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 
             /* TLB resize via tlb_fill may have moved the entry.  */
             entry = tlb_entry(env, mmu_idx, addr);
+
+            /*
+             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
+             * to force the next access through tlb_fill.  We've just
+             * called tlb_fill, so we know that this entry *is* valid.
+             */
+            flags &= ~TLB_INVALID_MASK;
         }
         tlb_addr = tlb_read_ofs(entry, elt_ofs);
     }
-    flags = tlb_addr & TLB_FLAGS_MASK;
+    flags &= tlb_addr;
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index fc52aa128b..3758b9e688 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -148,10 +148,6 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
 #else
     int flags;
 
-    /*
-     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
-     * to detect if there was an exception during tlb_fill().
-     */
     env->tlb_fill_exc = 0;
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
                                ra);
-- 
2.34.1


