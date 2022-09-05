Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4EF5ADA26
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:26:29 +0200 (CEST)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIfs-0004BV-Nq
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIch-00079h-Nw
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcc-0004Xc-NK
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k9so12668124wri.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ID+SnhpEZx/BDqyhmU8JXjs9pMlZndn9aHrSLTIAUAA=;
 b=Oa78ED8JInHiSEiQGo4S4fRljhXgCC2CEjhG9gAkzV8h8fDk7VBjzhbIsW9nq/8aTv
 F3bURBIb/xjLv5i8e/K8TSmBzoNZnDD7IE9kf7ChzxGN7wL6wm4EDXZEAZvHvjzDgmPs
 VbaDrYA0rPF2VEhir0jMYN1Lv/udwnhXB1K3WFzDNrdKtLSgO2Vyex6DuSMwOiaBkayN
 bKfJDdYx+3L8l242XHvyU0OEjKMRuJr06a1fALqnXcoHHa45TejuR7qvwa08uL/J5NZF
 zadMS4Vn7aeTImXERz4Rfo/IU238f6U1gBTomrFZgERj8qSuFWq4DwAH0ofw877qwCSR
 AQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ID+SnhpEZx/BDqyhmU8JXjs9pMlZndn9aHrSLTIAUAA=;
 b=dPa/t7w2tm02JO+jV5wgmzpPKi8pmWbFg/gMt04ioK9BkybwEafLOQJRLEhUbL4ba9
 2ruJHcRV0Ot6r5NS5ftI9QWZE1VruYTZeHL16+yOzUqVdv+4TzTARoNc05gM6i5omufd
 T/HaB31eZegKwuIPW2+pjyGnSSTgXI52ujFEkTA1nXpPFhe5fkjKfHPo1VJ3Mj4zRBLt
 UcEiYjRBo+RuGp6LV0PEd8BXvY999+n/avx+xxKZmjMuDArtEOw1VlG1AdB86th3nD63
 QCdx2bh1nekTIcTaqLt13bW0aQILYcdAU9wZUMng7bMK1ZzPF5QWPcAAC72aMJ8D4+vr
 cOOg==
X-Gm-Message-State: ACgBeo2WhwXB8JsZpDSHqWN1S+yDX8Q8cy6SZp49pfBxX2xujaaNxSrK
 k+PwUgpQLLnNxHU3EvcK1pSAYs4kIzpI0FD4
X-Google-Smtp-Source: AA6agR6+XZRUjEt67cZ+GfKPjh7sPBZzMtyNp42XXQSDvwUBa2TSRnaG+MBJUkPRbX6f/cJUy27z/g==
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr25862129wrv.97.1662409385452; 
 Mon, 05 Sep 2022 13:23:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 3/6] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Mon,  5 Sep 2022 21:22:56 +0100
Message-Id: <20220905202259.189852-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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


