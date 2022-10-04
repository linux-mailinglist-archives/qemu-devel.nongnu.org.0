Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73445F461C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:03:51 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjSY-0006lJ-SF
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidZ-0002Vn-Bv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidX-0004Jf-Kg
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id 83so6248332pfw.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=i1l7vnsl3IaRsiVGvzgvoP+kjr2/33aQEwi1y891bxSwaRuKb6GDGwyZEHlYRtSkj8
 iqvet7kLshPWpCEt3T0MOvEtRpityMf/fb12WDjzz+HxLXsms2frGcPcbEGJHeaNEtUe
 YHQPhB708/lK5AxHGnj1Z1kGhfyUGeuHwVHLbj4umcofOSblzJjSociSIoUFFvCUiypb
 l1LG8IdUmPs+rVxAFYs76782r7/9ef5HOl4YAwd1QfTaq36pA/glddh19h46p/JUOA5u
 l5VryiRQd1sQ6sy1GilikVmBdnwrTek/Z7nvFNTr6lXnyyvDV3rirRa8h4JQ+xcjjlhy
 RrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=hWKNn3vA2Svz4GldRoddFXDdSuEsXGQnSv1hHrECodPCM2DsJhy1c+n68VS6wLyc5y
 4fIvJYWp1ZlkieLzr307W9rVq0iVOEcieeDBKtazMvovtzGbJuH9dZ2A7bWN9CORjbSq
 TYPvjm9kpcaJYJT/qAhBY8ZG1U+pp671GgdEJKso/om3/awntc/ln8iNj56TleMiL1+1
 Fhi/cipHrtvyM0Ix01HB8lb38yk+B4fS8vdqHwYMWvQpmgTcCSQN5b5q8M2kONS+963z
 W5WlqHLGUGRyTN+8a62r2lNb/4x+jW0tFAag9ds9fGQhSu+DaYXis//vtYtGmrXZVjXr
 Q9dA==
X-Gm-Message-State: ACrzQf1rWMTcq3qhoFGahmuim3+GBaE1DjdUNCpric9b39OrtImm+Od3
 7TqnQOFVhqlRdIRk3FZllI1VdEoxjjNExg==
X-Google-Smtp-Source: AMsMyM48PKQR+UUHHkr/IzolL0CJaYC2QpQlh19sdhfAZSLYElaCuE6wXaVPCRU1HTUdQfbq0MbYhw==
X-Received: by 2002:a62:1e83:0:b0:545:6896:188 with SMTP id
 e125-20020a621e83000000b0054568960188mr27711610pfe.51.1664892664869; 
 Tue, 04 Oct 2022 07:11:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 06/18] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Tue,  4 Oct 2022 07:10:39 -0700
Message-Id: <20221004141051.110653-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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


