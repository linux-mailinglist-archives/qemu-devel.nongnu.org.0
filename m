Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788475F49F1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:58:12 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofo3P-0007rg-Dz
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyG-0001iS-2G
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyE-0000GD-FH
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id l1so729895pld.13
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=KBNKLDkoV6FyvbfjKKLGdRo3UUeOFuWALGQt/O7p7ylLoI4IMaE8rYSNu0a04WqIwM
 Ha0WUHTgWqLyAXXgp4YlNtmrgG15mfS0J1UJLmmQP7Dzk0Vd2mhtPm3S7xqHmKRmkgqe
 pkZP1Ft/sqEuagv8q3FSPGN8sA6Lnv7+mWT3eOhAOcx7kp1JBbE7qf5G33CuHWkJuKn1
 FelsDWIDzVvzI5wWJDnnbyyVucl5HsZbHW2ymh2TXDk80SV+P4MU53txb7GQ9wg1dqyo
 J5MD/OP3/8rt+mBY6mt3lUN4sQ1NP2839ow6PRHJZ1RoR0tl8YrNuAWVxp3iPUq3q+XQ
 2Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=zDUAD41fT1JYSF2ttyFnXm9B+bsB2j20ye/gLilzfXqnhe730jI4Sl+KDNRBIgwLrT
 UTjHdgSfpL6xm778osz3caWpwbZ5LincSpAYjukrRUGA8fglDz60HkbWAV+V26aHD09q
 BHkKgdlUovfqrhUTzNLfpLwj720jWw4NsmU/8UnjVKcuwxdPviVC+RedD8vMlPqBz0uk
 b9I7/NuEvETgCFyQfuiQaooJcJDMun7OS3Ml4yPe99WsMPGRsW1pPufX2/WG0dLPtKTN
 ziT5X+8UHHbZYHKI5uBdtM0Qak4DGs5adIhRU197hE4fdl4CbUM4ULsb3twZtLzH3/yb
 vUwQ==
X-Gm-Message-State: ACrzQf3Hi+7aLNTZ4p9b19B61/nUX7Zeds6QuUzvjuZNJh+AF1aV2heX
 L+gaqPbZk07+rs08dYfw9q5r5qRUvOU3ew==
X-Google-Smtp-Source: AMsMyM41pGfkiduqIsgrAIuwo+6KqyJb0Nx9qXEKYAS4zrMXjiqdP3DrZcVYBMul242tcAIb6kNRBg==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id
 s2-20020a17090a1c0200b001e00df731f2mr1264580pjs.222.1664913168688; 
 Tue, 04 Oct 2022 12:52:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/20] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Tue,  4 Oct 2022 12:52:27 -0700
Message-Id: <20221004195241.46491-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c            | 10 +++++++++-
 target/s390x/tcg/mem_helper.c |  4 ----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d06ff44ce9..264f84a248 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1533,6 +1533,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     tlb_addr = tlb_read_ofs(entry, elt_ofs);
 
+    flags = TLB_FLAGS_MASK;
     page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
@@ -1547,10 +1548,17 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 
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


