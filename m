Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF65F14DE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:30:11 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNaE-0003cc-AX
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWu-0006FY-AL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:44 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:39858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWr-0005OH-Ry
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:44 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id z18so3378178qvn.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=wyyQ/kPFXbgigJ4kzZxQj6DW70lHpPFMo3lKF7N1JKIgS+LyX5asEN6RWCydAVU9J0
 DkM8g3zkSKNPz1jBgBZXl+yTtQJ1TvQSvoeOCOy0hwUyvRIJ8wieS5PH2UloFlXuF3h1
 hHPjW9kFWNXiOejIySNfhU24MZ2bnaEzzZ6oXFmlIC5EZmge+FHr1Pl1RT05vlH0Vkge
 X5v8OdncOATH1w+6av83QvslLJ/+l9HkuYv0RetkoqsCQzOC/ysg8yEFG5CjOFwBfA9+
 +laKO/jaURcaHVf/ZLVuyo+30D1q72b5EJpF9MRiFtt3xMpYJL9uuYyfa3ZIEMvqazQk
 /ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=St5dCg8yC5zIkIV0jUFWp9UWjpefIW881mvaUfGPCfo=;
 b=sEpW5aBhtH+S/8pRedGdXr1uN1yvbxCzirYKs6zwEAxZFWZW5wsAPPTNrlg//NYmee
 rczzELk02X0IF2XaycWsSLLHlr71ZGf5roCpAaX3Bc/HMhxVeUxZuPjFPf6M3rzq9tjc
 acXxOM5mU6sVWN4hw6mCzeE/Ufjyh7e0TF0KhPfBixf6xUPv1GsZQZGvBpww2xpqC906
 p/perb7NieC9gil71JTZp8bJ/lA2+ZVxUSKRbQn0iEyKuh4nWcrq3nobGyM4Ke9csU1P
 v8dilFciiokRp+W/RlMAy3GYCW1cHpBPs7QKQOM/wfmDk0GtbqTa+bUalZF6s1c/gmRi
 4JEA==
X-Gm-Message-State: ACrzQf1Lad9gWv6RsXEq3YJ7xnWQdePKgdN1U5shuhHLsyStjz2t4fGa
 UarpYx4saaFYv7JEPutjfgsA10kseBDFpw==
X-Google-Smtp-Source: AMsMyM6FsBRHrfETcLXaL3mawrA8irQ2f1b0z7fJ9v2dBKaP6vFqPV5jwkEWzHB2CGIIhPye+hqWFA==
X-Received: by 2002:a05:6214:5096:b0:4af:aef9:f78c with SMTP id
 kk22-20020a056214509600b004afaef9f78cmr7994664qvb.63.1664573200394; 
 Fri, 30 Sep 2022 14:26:40 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/18] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Fri, 30 Sep 2022 14:26:10 -0700
Message-Id: <20220930212622.108363-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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


