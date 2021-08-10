Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3DE3E5C41
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:53:22 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSC1-0006TD-Ny
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7p-0007XP-Lk
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7n-0008K2-6B
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso2005816wmq.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OeyL5avmNVOjpFxGDSZQyOpcaoDi34m5YhQCj2SVog=;
 b=SLpbYTMw2xOjaHo7+0Hl0MHBLeJUm46ne2J6YB91bHa4Ci9i3bvYHXyVIA0B9YxEL7
 r4WQG2zjRMuUgGqTM1vhzSaMIq3nTbi819SK5DLUmrDSt2Tbj4qn0yqYOfOUMecskM7W
 QbNVpzoPZfeiQI5g2/luSnKODpizUf0UtfxyAivqsD5AuI1YW+OQHNwVL1LDhx3/P53F
 vGdy1fVPQU3AoJc1EW4R8FVbXmu3s7N55TvDvbRmC3kZhS5aqTXD5kECqe04/O/SdFfN
 QXODlmNDuc/rH8DV9gCxXSTDx00fCIv5hqBxYnb/ab3Optj/oXXz+C/f8eKZxnIaKkBy
 ZRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OeyL5avmNVOjpFxGDSZQyOpcaoDi34m5YhQCj2SVog=;
 b=lyUUb699oz9i/Je9EOYnFCQFfFz1IloprRW0ZC/CEfdvfH8MBTKe53yfjG86QkOeDQ
 Rp8wKW4UTZeyzzYu/gi0qt88ge/1v1ZBJXL5eBOI1dVwM2ki7qbQ1HbZ5y0c3zihQUdm
 P+3TtkzQRfQm4kPQVWuxx/qvDpRxCNFMqqymKN4HAfHHusEO3I3AAeYYiAXiWlFPRvPM
 r3eFZgA/Yw2/7qLeXu9b96y1GE5HVCna/3B1dg9VVda1wrBPyAXZBgvE2k6QZ3VO+fMr
 pvUSHQzItC4T1OM8NsCVbOluWm2jhCxbbuWBgESChVa9+Ky4COsYaGdG/4k64sTsinlC
 1dkw==
X-Gm-Message-State: AOAM530BX9HtilyqTFMI0IyM8x8EEpIuF6H6zjBbfspbqR76c8WZT3xH
 dDqvxRwRanCxJ+i7qHn2Y/c6mRfJEJw=
X-Google-Smtp-Source: ABdhPJy074RRlub/FfmEyfQn4aol3FF/kFzegSiIyKKweCrKSHT/3LsKYFJtt2qY/R20HtmuXcu3Bg==
X-Received: by 2002:a05:600c:ad8:: with SMTP id
 c24mr4820533wmr.28.1628603336884; 
 Tue, 10 Aug 2021 06:48:56 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:48:56 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] plugins/cache: implement unified L2 cache emulation
Date: Tue, 10 Aug 2021 15:48:41 +0200
Message-Id: <20210810134844.166490-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds an implementation of a simple L2 configuration, in which a
unified L2 cache (stores both blocks of instructions and data) is
maintained for each core separately, with no inter-core interaction
taken in account. The L2 cache is used as a backup for L1 and is only
accessed if the wanted block does not exist in L1.

In terms of multi-threaded user-space emulation, the same approximation
of L1 is done, a static number of caches is maintained, and each and
every memory access initiated by a thread will have to go through one of
the available caches.

An atomic increment is used to maintain the number of L2 misses per
instruction.

The default cache parameters of L2 caches is:

    2MB cache size
    16-way associativity
    64-byte blocks

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 256 +++++++++++++++++++++++++++-------------
 1 file changed, 175 insertions(+), 81 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index a255e26e25..908c967a09 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -82,8 +82,9 @@ typedef struct {
     char *disas_str;
     const char *symbol;
     uint64_t addr;
-    uint64_t dmisses;
-    uint64_t imisses;
+    uint64_t l1_dmisses;
+    uint64_t l1_imisses;
+    uint64_t l2_misses;
 } InsnData;
 
 void (*update_hit)(Cache *cache, int set, int blk);
@@ -93,15 +94,20 @@ void (*metadata_init)(Cache *cache);
 void (*metadata_destroy)(Cache *cache);
 
 static int cores;
-static Cache **dcaches, **icaches;
+static Cache **l1_dcaches, **l1_icaches;
+static Cache **l2_ucaches;
 
-static GMutex *dcache_locks;
-static GMutex *icache_locks;
+static GMutex *l1_dcache_locks;
+static GMutex *l1_icache_locks;
+static GMutex *l2_ucache_locks;
 
-static uint64_t all_dmem_accesses;
-static uint64_t all_imem_accesses;
-static uint64_t all_imisses;
-static uint64_t all_dmisses;
+static uint64_t l1_dmem_accesses;
+static uint64_t l1_imem_accesses;
+static uint64_t l1_imisses;
+static uint64_t l1_dmisses;
+
+static uint64_t l2_mem_accesses;
+static uint64_t l2_misses;
 
 static int pow_of_two(int num)
 {
@@ -382,6 +388,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     struct qemu_plugin_hwaddr *hwaddr;
     int cache_idx;
     InsnData *insn;
+    bool hit_in_l1;
 
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
     if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
@@ -391,14 +398,29 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
     cache_idx = vcpu_index % cores;
 
-    g_mutex_lock(&dcache_locks[cache_idx]);
-    if (!access_cache(dcaches[cache_idx], effective_addr)) {
+    g_mutex_lock(&l1_dcache_locks[cache_idx]);
+    hit_in_l1 = access_cache(l1_dcaches[cache_idx], effective_addr);
+    if (!hit_in_l1) {
+        insn = (InsnData *) userdata;
+        __atomic_fetch_add(&insn->l1_dmisses, 1, __ATOMIC_SEQ_CST);
+        l1_dcaches[cache_idx]->misses++;
+    }
+    l1_dcaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l1_dcache_locks[cache_idx]);
+
+    if (hit_in_l1) {
+        /* No need to access L2 */
+        return;
+    }
+
+    g_mutex_lock(&l2_ucache_locks[cache_idx]);
+    if (!access_cache(l2_ucaches[cache_idx], effective_addr)) {
         insn = (InsnData *) userdata;
-        __atomic_fetch_add(&insn->dmisses, 1, __ATOMIC_SEQ_CST);
-        dcaches[cache_idx]->misses++;
+        __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
+        l2_ucaches[cache_idx]->misses++;
     }
-    dcaches[cache_idx]->accesses++;
-    g_mutex_unlock(&dcache_locks[cache_idx]);
+    l2_ucaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l2_ucache_locks[cache_idx]);
 }
 
 static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
@@ -406,18 +428,34 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     uint64_t insn_addr;
     InsnData *insn;
     int cache_idx;
+    bool hit_in_l1;
 
     insn_addr = ((InsnData *) userdata)->addr;
 
     cache_idx = vcpu_index % cores;
-    g_mutex_lock(&icache_locks[cache_idx]);
-    if (!access_cache(icaches[cache_idx], insn_addr)) {
+    g_mutex_lock(&l1_icache_locks[cache_idx]);
+    hit_in_l1 = access_cache(l1_icaches[cache_idx], insn_addr);
+    if (!hit_in_l1) {
+        insn = (InsnData *) userdata;
+        __atomic_fetch_add(&insn->l1_imisses, 1, __ATOMIC_SEQ_CST);
+        l1_icaches[cache_idx]->misses++;
+    }
+    l1_icaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l1_icache_locks[cache_idx]);
+
+    if (hit_in_l1) {
+        /* No need to access L2 */
+        return;
+    }
+
+    g_mutex_lock(&l2_ucache_locks[cache_idx]);
+    if (!access_cache(l2_ucaches[cache_idx], insn_addr)) {
         insn = (InsnData *) userdata;
-        __atomic_fetch_add(&insn->imisses, 1, __ATOMIC_SEQ_CST);
-        icaches[cache_idx]->misses++;
+        __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
+        l2_ucaches[cache_idx]->misses++;
     }
-    icaches[cache_idx]->accesses++;
-    g_mutex_unlock(&icache_locks[cache_idx]);
+    l2_ucaches[cache_idx]->accesses++;
+    g_mutex_unlock(&l2_ucache_locks[cache_idx]);
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -493,30 +531,28 @@ static void caches_free(Cache **caches)
     }
 }
 
-static int dcmp(gconstpointer a, gconstpointer b)
-{
-    InsnData *insn_a = (InsnData *) a;
-    InsnData *insn_b = (InsnData *) b;
-
-    return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
-}
-
-static void append_stats_line(GString *line, uint64_t daccess, uint64_t dmisses,
-                              uint64_t iaccess, uint64_t imisses)
+static void append_stats_line(GString *line, uint64_t l1_daccess,
+                              uint64_t l1_dmisses, uint64_t l1_iaccess,
+                              uint64_t l1_imisses,  uint64_t l2_access,
+                              uint64_t l2_misses)
 {
-    double dmiss_rate, imiss_rate;
+    double l1_dmiss_rate, l1_imiss_rate, l2_miss_rate;
 
-    dmiss_rate = ((double) dmisses) / (daccess) * 100.0;
-    imiss_rate = ((double) imisses) / (iaccess) * 100.0;
+    l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
+    l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
+    l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
 
     g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
-                           " %9.4lf%%\n",
-                           daccess,
-                           dmisses,
-                           daccess ? dmiss_rate : 0.0,
-                           iaccess,
-                           imisses,
-                           iaccess ? imiss_rate : 0.0);
+                           " %9.4lf%%  %-12lu %-11lu %10.4lf%%\n",
+                           l1_daccess,
+                           l1_dmisses,
+                           l1_daccess ? l1_dmiss_rate : 0.0,
+                           l1_iaccess,
+                           l1_imisses,
+                           l1_iaccess ? l1_imiss_rate : 0.0,
+                           l2_access,
+                           l2_misses,
+                           l2_access ? l2_miss_rate : 0.0);
 }
 
 static void sum_stats(void)
@@ -525,43 +561,66 @@ static void sum_stats(void)
 
     g_assert(cores > 1);
     for (i = 0; i < cores; i++) {
-        all_imisses += icaches[i]->misses;
-        all_dmisses += dcaches[i]->misses;
-        all_imem_accesses += icaches[i]->accesses;
-        all_dmem_accesses += dcaches[i]->accesses;
+        l1_imisses += l1_icaches[i]->misses;
+        l1_dmisses += l1_dcaches[i]->misses;
+        l1_imem_accesses += l1_icaches[i]->accesses;
+        l1_dmem_accesses += l1_dcaches[i]->accesses;
+
+        l2_misses += l2_ucaches[i]->misses;
+        l2_mem_accesses += l2_ucaches[i]->accesses;
     }
 }
 
+static int dcmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->l1_dmisses < insn_b->l1_dmisses ? 1 : -1;
+}
+
 static int icmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
     InsnData *insn_b = (InsnData *) b;
 
-    return insn_a->imisses < insn_b->imisses ? 1 : -1;
+    return insn_a->l1_imisses < insn_b->l1_imisses ? 1 : -1;
+}
+
+static int l2_cmp(gconstpointer a, gconstpointer b)
+{
+    InsnData *insn_a = (InsnData *) a;
+    InsnData *insn_b = (InsnData *) b;
+
+    return insn_a->l2_misses < insn_b->l2_misses ? 1 : -1;
 }
 
 static void log_stats(void)
 {
     int i;
-    Cache *icache, *dcache;
+    Cache *icache, *dcache, *l2_cache;
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-                                          " insn misses, imiss rate\n");
+                                          " insn misses, imiss rate,"
+                                          " l2 accesses, l2 misses,"
+                                          " l2 miss rate\n");
 
     for (i = 0; i < cores; i++) {
         g_string_append_printf(rep, "%-8d", i);
-        dcache = dcaches[i];
-        icache = icaches[i];
+        dcache = l1_dcaches[i];
+        icache = l1_icaches[i];
+        l2_cache = l2_ucaches[i];
         append_stats_line(rep, dcache->accesses, dcache->misses,
-                icache->accesses, icache->misses);
+                icache->accesses, icache->misses, l2_cache->accesses,
+                l2_cache->misses);
     }
 
     if (cores > 1) {
         sum_stats();
         g_string_append_printf(rep, "%-8s", "sum");
-        append_stats_line(rep, all_dmem_accesses, all_dmisses,
-                all_imem_accesses, all_imisses);
+        append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
+                l1_imem_accesses, l1_imisses, l2_mem_accesses, l2_misses);
     }
 
     g_string_append(rep, "\n");
@@ -585,7 +644,7 @@ static void log_top_insns(void)
         if (insn->symbol) {
             g_string_append_printf(rep, " (%s)", insn->symbol);
         }
-        g_string_append_printf(rep, ", %ld, %s\n", insn->dmisses,
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l1_dmisses,
                                insn->disas_str);
     }
 
@@ -598,7 +657,20 @@ static void log_top_insns(void)
         if (insn->symbol) {
             g_string_append_printf(rep, " (%s)", insn->symbol);
         }
-        g_string_append_printf(rep, ", %ld, %s\n", insn->imisses,
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l1_imisses,
+                               insn->disas_str);
+    }
+
+    miss_insns = g_list_sort(miss_insns, l2_cmp);
+    g_string_append_printf(rep, "%s", "\naddress, L2 misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->l2_misses,
                                insn->disas_str);
     }
 
@@ -611,11 +683,13 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     log_stats();
     log_top_insns();
 
-    caches_free(dcaches);
-    caches_free(icaches);
+    caches_free(l1_dcaches);
+    caches_free(l1_icaches);
+    caches_free(l2_ucaches);
 
-    g_free(dcache_locks);
-    g_free(icache_locks);
+    g_free(l1_dcache_locks);
+    g_free(l1_icache_locks);
+    g_free(l2_ucache_locks);
 
     g_hash_table_destroy(miss_ht);
 }
@@ -647,19 +721,24 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     int i;
-    int iassoc, iblksize, icachesize;
-    int dassoc, dblksize, dcachesize;
+    int l1_iassoc, l1_iblksize, l1_icachesize;
+    int l1_dassoc, l1_dblksize, l1_dcachesize;
+    int l2_assoc, l2_blksize, l2_cachesize;
 
     limit = 32;
     sys = info->system_emulation;
 
-    dassoc = 8;
-    dblksize = 64;
-    dcachesize = dblksize * dassoc * 32;
+    l1_dassoc = 8;
+    l1_dblksize = 64;
+    l1_dcachesize = l1_dblksize * l1_dassoc * 32;
+
+    l1_iassoc = 8;
+    l1_iblksize = 64;
+    l1_icachesize = l1_iblksize * l1_iassoc * 32;
 
-    iassoc = 8;
-    iblksize = 64;
-    icachesize = iblksize * iassoc * 32;
+    l2_assoc = 16;
+    l2_blksize = 64;
+    l2_cachesize = l2_assoc * l2_blksize * 2048;
 
     policy = LRU;
 
@@ -668,21 +747,27 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "iblksize=")) {
-            iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+            l1_iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
         } else if (g_str_has_prefix(opt, "iassoc=")) {
-            iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+            l1_iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
         } else if (g_str_has_prefix(opt, "icachesize=")) {
-            icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+            l1_icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "dblksize=")) {
-            dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
+            l1_dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
         } else if (g_str_has_prefix(opt, "dassoc=")) {
-            dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
+            l1_dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
         } else if (g_str_has_prefix(opt, "dcachesize=")) {
-            dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
+            l1_dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "cores=")) {
             cores = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2cachesize=")) {
+            l2_cachesize = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2blksize=")) {
+            l2_blksize = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "l2assoc=")) {
+            l2_assoc = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "evict=")) {
             gchar *p = opt + 6;
             if (g_strcmp0(p, "rand") == 0) {
@@ -703,24 +788,33 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy_init();
 
-    dcaches = caches_init(dblksize, dassoc, dcachesize);
-    if (!dcaches) {
-        const char *err = cache_config_error(dblksize, dassoc, dcachesize);
+    l1_dcaches = caches_init(l1_dblksize, l1_dassoc, l1_dcachesize);
+    if (!l1_dcaches) {
+        const char *err = cache_config_error(l1_dblksize, l1_dassoc, l1_dcachesize);
         fprintf(stderr, "dcache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
-    icaches = caches_init(iblksize, iassoc, icachesize);
-    if (!icaches) {
-        const char *err = cache_config_error(iblksize, iassoc, icachesize);
+    l1_icaches = caches_init(l1_iblksize, l1_iassoc, l1_icachesize);
+    if (!l1_icaches) {
+        const char *err = cache_config_error(l1_iblksize, l1_iassoc, l1_icachesize);
         fprintf(stderr, "icache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
-    dcache_locks = g_new0(GMutex, cores);
-    icache_locks = g_new0(GMutex, cores);
+    l2_ucaches = caches_init(l2_blksize, l2_assoc, l2_cachesize);
+    if (!l2_ucaches) {
+        const char *err = cache_config_error(l2_blksize, l2_assoc, l2_cachesize);
+        fprintf(stderr, "L2 cache cannot be constructed from given parameters\n");
+        fprintf(stderr, "%s\n", err);
+        return -1;
+    }
+
+    l1_dcache_locks = g_new0(GMutex, cores);
+    l1_icache_locks = g_new0(GMutex, cores);
+    l2_ucache_locks = g_new0(GMutex, cores);
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


