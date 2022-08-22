Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7459C570
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:52:03 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBak-0006By-8q
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9M0-0000p7-Ga
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:40 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Le-0000h5-Rt
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x15so9774973pfp.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=iIvxLrzj8WxzmdYfitz6DVTQo2olvu6icUB/p/DoRCUH67QB5rjnc4S5hbAwU5iUXh
 vizwayS9shWSKQ+MUkki9pqv2B3gBZeSJtOe1rADfyNgW948xljZ5HeRLwy0ccnASec7
 Zdbpdi2lxZQImaxDd0+JaQH/RW1+ZqNSEeLfaAy4t8/rKepiqeic+RfICdWmE7ecMpeU
 KkKSRUp98G9gUH4f0T5MfsMLp4d9gqQxVo7HnenbOzIrxv7X7o/xBRkPsvrXmex84U9R
 vgTbd/QIibgpx2GEDaPRc/8OQnCm23/n6sybFtNRhL27VZy6aSFvvya84rdE6eQJbAds
 90uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=2e8GsdIqrhb8sAeMaUBIv0WgpITeM/IYdDSfSmbmJRcKSPVDI08v71cRBkhdxDTMzV
 w3PQW6g2fXXVuFH5/ggKszqDMWyYVyvj3MW/3z6I/mMEFgbEAhkSH7FIfIxTqVQS/L70
 MTUam4pmNa/Ouy6onbfrgtGs7GWuwHfkpTatyzCKomeUzCJ74wFkceq1KJ2/2REF1Z1u
 sJLUoFc62ap8Ji2XLsZOfsa/Q6QugrEOht6KRExbMxXNaI9a9YEeteAlk33XDHI50f7G
 gXU+AmqXqZ+PCWiCp1orUgjVBMLqoqsOlMC07iOJ9sqE1BmS7XVHIUd1JwyVWZOGRuXG
 o+fw==
X-Gm-Message-State: ACgBeo1t+gJ+G5aqJ7uC0MmiYspA6f3BBonM408ChByHVc2rCnyTe/9q
 8EC0HR7SekpjMGNxAwMU85wDIeHdXqZaNA==
X-Google-Smtp-Source: AA6agR5wfRLOHq3Rukf+PcByaduGDyq6SwchzYlGJuPy3SRhJxZHqkar+L+jTIn2ydwhQg4hr18ZVQ==
X-Received: by 2002:a05:6a00:1883:b0:536:e59f:f776 with SMTP id
 x3-20020a056a00188300b00536e59ff776mr1086800pfh.49.1661182098016; 
 Mon, 22 Aug 2022 08:28:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 39/66] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Mon, 22 Aug 2022 08:27:14 -0700
Message-Id: <20220822152741.1617527-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

When PAGE_WRITE_INV is set when calling tlb_set_page,
we immediately set TLB_INVALID_MASK in order to force
tlb_fill to be called on the next lookup.  Here in
probe_access_internal, we have just called tlb_fill
and eliminated true misses, thus the lookup must be valid.

This allows us to remove a warning comment from s390x.
There doesn't seem to be a reason to change the code though.

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c            | 10 +++++++++-
 target/s390x/tcg/mem_helper.c |  4 ----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1509df96b4..5359113e8d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1602,6 +1602,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     tlb_addr = tlb_read_ofs(entry, elt_ofs);
 
+    flags = TLB_FLAGS_MASK;
     page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
@@ -1617,10 +1618,17 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 
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


