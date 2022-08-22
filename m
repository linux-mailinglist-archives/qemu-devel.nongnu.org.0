Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2B59CCE2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:10:27 +0200 (CEST)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHUw-0005cN-O8
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ5-00041W-Fj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ2-0002hw-OP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id f4so8972680pgc.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=BjuEw3wloWDrnY7RqCrxF26rQ1wtDF2Ak+8vY4QlozgVGX71or1Tmidc0PKn+1qKSS
 dZbOZFyNsGWrPrDvhPsXoGw+SydzUTO8nestC9CMLQ7qRHy1FmgICKLlphBcIOWsYf9f
 mw0WX3N9z/dkrXdv4pQTqAlNWvn2A1sWT/KyFhLnOM/Xga6T5dtUzKu3V/fd6pKGvfJ2
 sChwgfj8Aa+Y65VmloZ1Cc5VBSknkm/e5tLH1vle8hb5Amq3/cRCJ7T6Y5bnMl052kda
 n1uOcGFTjN15eSmkNj6HhbFe47cky6muhZk22I06H5lXUG1FNJ53maDQ6pWY9Ba5r3m4
 gCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=t+83NGVI8KbBLfjH1UOLtoP5qwbdSRE0wP8oASXjhOYF+OPmnWYqzywdhJLipR8Qky
 uSq+UtjigdRB6lYRV5Q8cefDyUUrcAOV1lfn2k4u3uMV2SpgYwfn/9Q9hV7oUUJbvj6P
 kt+w9vRf7WIvh2BQ75uoML4hIv9gccDZr4OBgrGiJfSt8VKTr2NJkiH2fUmeg97QOz9T
 IsWYSx1GehnukiCTe708txhJCZwoDyTvTn8QYb5s0wKKvkyl654AFObdWIQjj+Rqg0pL
 ZMb2bsMbSBABC63suYgHd4YuepDmFaE0y0/7Loy4+Y3ol8r67XZo+yANyyA5Lt3wXfU3
 deaw==
X-Gm-Message-State: ACgBeo0xfD3Tv6NZsUaX5F6X8fRQluPvQC4SBmUjm/zJi5E4MyCLEFZ6
 hxouBharcBDnvPlgcJPVxwuqAoDkPxGpfg==
X-Google-Smtp-Source: AA6agR6kppUfUVyVBQ4B8uUVGEM/RiUuqG8ln30zS0g9OlMj7yXYWqBWEwHqkzfH/zslzHJ5GOk8mg==
X-Received: by 2002:a63:41c4:0:b0:429:8c1b:61df with SMTP id
 o187-20020a6341c4000000b004298c1b61dfmr18848741pga.518.1661212687496; 
 Mon, 22 Aug 2022 16:58:07 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH 03/14] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Mon, 22 Aug 2022 16:57:52 -0700
Message-Id: <20220822235803.1729290-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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


