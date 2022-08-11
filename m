Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C3758FF40
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:24:42 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA37-0003qJ-7E
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tD-0005B5-D9
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tB-0005iz-DV
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z12so21692340wrs.9
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3mcreeC7sB94QXrxXmku0iTtPiRjYMbQWc4z8QaguNY=;
 b=yHxUCasXgroZKJs3i9Y1TBMetLE6YWRyrLgxgjQo2oXorsbbbS/E/QmbwoWUtdQV9V
 zKcgzRu0QJJoydWLWi3B4K5A6EhedWqn2dzZ44dEoKZveyN7+nF6MzybSEG3w2sb6BTM
 8xt6Lk2AosqBnPqkVCHj7GWP3Dh9AP1xrXv3PnyNbCZSEGojnx77DOVVwALuy5BYV0Si
 4y3jaSfo1oDIaIaTfnh1eTxoSKxNzUOnylE7EawdLeX+LbmMS2+5YeET7x116P/CsC4h
 Y2EXVsH1ReWLOYnPvyKYYmF3ncGs798W4Rx99j/ra9kCkKeHoeXbOdDxA5YRzlMWYTRO
 0+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3mcreeC7sB94QXrxXmku0iTtPiRjYMbQWc4z8QaguNY=;
 b=X56keMO8ADPSbGYvCs3rUgNQ7+Cfc//rmvxSTqzHDknnK5zgWosDl15CEbuwFEzRPr
 4pWKo/2Hv+cvKN2Nkfl/KfuMRXtcgxybK6hntt75fbZpg0yhaTW17UnRUFXduUe/dFeE
 CjqIYAaW4GRgYuaNZ7hm6Jf1T7Pw54MOZ4qsDjC5HLA7KQgiDoTboK7sMns3C67WoNXq
 1SqAOZn6HkaiBoKVHZJmSeexc4X97c9EviH8IfgdK92bROrll5lUGkXMHBZbjn3xW3YW
 kBDHMiHQUl6+hBo9PvIm3PN6y1IWnTVGsHpiquGZ8n7RBvu8efmFO9btouXiu/OtWKcY
 P8kw==
X-Gm-Message-State: ACgBeo3tQMG8IunZzrqH8DFZGNvyyKSHaiEZfyUaAUSxXjYijMs5VOMg
 CEG934h77yfdGkV0SX/0loGIxA==
X-Google-Smtp-Source: AA6agR5qZQz1pVURpCavkr4xp9f9NhPl4ouClcApm3vrXUNTzlDgplmfIMiSb3pX801dn49c3vmyXg==
X-Received: by 2002:a05:6000:184d:b0:220:8235:132 with SMTP id
 c13-20020a056000184d00b0022082350132mr20671192wri.178.1660230864067; 
 Thu, 11 Aug 2022 08:14:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d48c1000000b0021e6277bc50sm23336426wrs.36.2022.08.11.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E33041FFC0;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v1 8/8] accel/tcg: remove trace_vcpu_dstate TB checking
Date: Thu, 11 Aug 2022 16:14:13 +0100
Message-Id: <20220811151413.3350684-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

We removed the ability to do vcpu tcg tracing between:

  d9a6bad542 (docs: remove references to TCG tracing)
  and
  126d4123c5 (tracing: excise the tcg related from tracetool)

but missed a bunch of other code. Lets continue the clean-up by
removing the extra field from tb_hash saving us 4 bytes per-TB and the
additional cost of hashing/checking something that was always empty
anyway.

There remain some per-vcpu trace points which don't look as though
they are called anywhere and the command line/QMP machinery to
clean-up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-hash.h       |  6 +++---
 include/exec/exec-all.h   |  3 ---
 accel/tcg/cpu-exec.c      |  6 +-----
 accel/tcg/translate-all.c | 13 ++-----------
 4 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 0a273d9605..d58115ee70 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -60,10 +60,10 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 #endif /* CONFIG_SOFTMMU */
 
 static inline
-uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags,
-                      uint32_t cf_mask, uint32_t trace_vcpu_dstate)
+uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc,
+                      uint32_t flags, uint32_t cf_mask)
 {
-    return qemu_xxhash7(phys_pc, pc, flags, cf_mask, trace_vcpu_dstate);
+    return qemu_xxhash6(phys_pc, pc, flags, cf_mask);
 }
 
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..21469da064 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -479,9 +479,6 @@ struct TranslationBlock {
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
-    /* Per-vCPU dynamic tracing state used to generate this TB */
-    uint32_t trace_vcpu_dstate;
-
     /*
      * Above fields used for comparing
      */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..86f0276b1d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -188,7 +188,6 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                tb->pc == pc &&
                tb->cs_base == cs_base &&
                tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
                tb_cflags(tb) == cflags)) {
         return tb;
     }
@@ -494,7 +493,6 @@ struct tb_desc {
     tb_page_addr_t phys_page1;
     uint32_t flags;
     uint32_t cflags;
-    uint32_t trace_vcpu_dstate;
 };
 
 static bool tb_lookup_cmp(const void *p, const void *d)
@@ -506,7 +504,6 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         tb->page_addr[0] == desc->phys_page1 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
-        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
         tb_cflags(tb) == desc->cflags) {
         /* check next page if needed */
         if (tb->page_addr[1] == -1) {
@@ -537,14 +534,13 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cs_base = cs_base;
     desc.flags = flags;
     desc.cflags = cflags;
-    desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
     phys_pc = get_page_addr_code(desc.env, pc);
     if (phys_pc == -1) {
         return NULL;
     }
     desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, pc, flags, cflags);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..ce05cb4103 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -197,11 +197,6 @@ struct page_collection {
 #define V_L2_BITS 10
 #define V_L2_SIZE (1 << V_L2_BITS)
 
-/* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
-QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
-                  sizeof_field(TranslationBlock, trace_vcpu_dstate)
-                  * BITS_PER_BYTE);
-
 /*
  * L1 Mapping properties
  */
@@ -894,7 +889,6 @@ static bool tb_cmp(const void *ap, const void *bp)
         a->cs_base == b->cs_base &&
         a->flags == b->flags &&
         (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
-        a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
         a->page_addr[0] == b->page_addr[0] &&
         a->page_addr[1] == b->page_addr[1];
 }
@@ -1186,8 +1180,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1349,8 +1342,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1426,7 +1418,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
 
-- 
2.30.2


