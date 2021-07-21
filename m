Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA03D0C90
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:52:37 +0200 (CEST)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69q8-00019V-IZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69au-0004CA-Lh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69as-00058m-Gt
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id w13so1028477wmc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOjUscqVzJcRPYkS7J51fxMeax0tJPb3jN+fReD0gug=;
 b=i994gDG5GExCD+qznygtrzybbf2GM9g1lgwO0Mz55wdCZg3URjvth6G1+76nQ6qSDX
 SHCUNhySjW/cdtJkWvpDgUdIROFYnNz9EEa7DQF0DdUlDqfWQDmUi9xn/L+7vo5QbSjK
 exwLiFgO8m2Wf+Kr8sPVtRWwxvj+ctCVLNmbxgipvdhEyb5+SGdJlgd+P5jWbU91LAKA
 qAwTz5J/Ci//DP3KnmFIntpc6Mfu7Cfku4VbZUIfiHssTG+G6vcsRJJxfjCiaolj8uTy
 rDGkwOg1RxFxkzUL9LwDC8pL9HIX2VHZ1U63KG1yXah2ugwtNdDUgc7LvGrFoboi/YBP
 Ssnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOjUscqVzJcRPYkS7J51fxMeax0tJPb3jN+fReD0gug=;
 b=LY++LMMunFHw3jquVPgQmPnzNbZp0vgwyIFyp0XtiIC0vNnW7SJ50Ci8qV/SdDX6LE
 DWh3/lgbyKHXBHgIW/VRuGV65jd4A9ckayA+MrbenZe+x7ppikVfwmbND59QErhiQ7m7
 Uuv6FvJWSlDLqsewLeW4XT3ErBf5eBoD2EYoMg31dv5vUTHjjzf0wrRA5xq6ZBwR6WTm
 Wmt8eEiVTW4psctPgaQeeuk4BiPgQH2Th6yL1DQXkLx5xHkdKpa5jM2xpjxECJVzLrcw
 WDKLCX/Lt3opkfKjcKo8pVfPmyvMq0zONDc35i/pcirEa34ksI0E8JhGdJuw7yIrAz7x
 ZuaQ==
X-Gm-Message-State: AOAM530cWu6ptiyluA9FaK5M6a/GVV/AGBtgOi9ohNNPRxMN5gKxoxDm
 mp0tplMqMHqpMTmpE5XDuTHbfhwFpqY=
X-Google-Smtp-Source: ABdhPJzdm6b+G6WGejuzKIuCYpt8PfUdvOUcDI17x6UYne+ffIC/yXDKmLBwf9RCWgiBzccNn3vWng==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr3353122wmh.69.1626863808834;
 Wed, 21 Jul 2021 03:36:48 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:48 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] plugins/cache: Supported multicore cache modelling
Date: Wed, 21 Jul 2021 12:36:09 +0200
Message-Id: <20210721103612.48844-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721103612.48844-1-ma.mandourr@gmail.com>
References: <20210721103612.48844-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multicore L1 cache modelling is introduced and is supported for both
full system emulation and linux-user.

For full-system emulation, L1 icache and dcache are maintained for each
available core, since this information is exposed to the plugin through
`qemu_plugin_n_vcpus()`.

For linux-user, a static number of cores is assumed (default 1 core, and
can be provided as a plugin argument `cores=N`). Every memory access
goes through one of these caches, this approach is taken as it's
somewhat akin to what happens on real setup, where a program that
dispatches more threads than the available cores, they'll thrash
each other

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 154 +++++++++++++++++++++++++++++++---------
 1 file changed, 119 insertions(+), 35 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 695fb969dc..496d6e7d49 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -23,12 +23,6 @@ static GRand *rng;
 static int limit;
 static bool sys;
 
-static uint64_t dmem_accesses;
-static uint64_t dmisses;
-
-static uint64_t imem_accesses;
-static uint64_t imisses;
-
 enum EvictionPolicy {
     LRU,
     FIFO,
@@ -90,13 +84,22 @@ typedef struct {
     uint64_t imisses;
 } InsnData;
 
+typedef struct {
+    uint64_t dmem_accesses;
+    uint64_t dmisses;
+    uint64_t imem_accesses;
+    uint64_t imisses;
+} CoreStats;
+
 void (*update_hit)(Cache *cache, int set, int blk);
 void (*update_miss)(Cache *cache, int set, int blk);
 
 void (*metadata_init)(Cache *cache);
 void (*metadata_destroy)(Cache *cache);
 
-Cache *dcache, *icache;
+static int cores;
+CoreStats *stats;
+Cache **dcaches, **icaches;
 
 static int pow_of_two(int num)
 {
@@ -233,14 +236,16 @@ static bool bad_cache_params(int blksize, int assoc, int cachesize)
 
 static Cache *cache_init(int blksize, int assoc, int cachesize)
 {
-    if (bad_cache_params(blksize, assoc, cachesize)) {
-        return NULL;
-    }
-
     Cache *cache;
     int i;
     uint64_t blk_mask;
 
+    /*
+     * This function shall not be called directly, and hence expects suitable
+     * parameters.
+     */
+    g_assert(!bad_cache_params(blksize, assoc, cachesize));
+
     cache = g_new(Cache, 1);
     cache->assoc = assoc;
     cache->cachesize = cachesize;
@@ -263,6 +268,24 @@ static Cache *cache_init(int blksize, int assoc, int cachesize)
     return cache;
 }
 
+static Cache **caches_init(int blksize, int assoc, int cachesize)
+{
+    Cache **caches;
+    int i;
+
+    if (bad_cache_params(blksize, assoc, cachesize)) {
+        return NULL;
+    }
+
+    caches = g_new(Cache *, cores);
+
+    for (i = 0; i < cores; i++) {
+        caches[i] = cache_init(blksize, assoc, cachesize);
+    }
+
+    return caches;
+}
+
 static int get_invalid_block(Cache *cache, uint64_t set)
 {
     int i;
@@ -353,6 +376,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
 {
     uint64_t effective_addr;
     struct qemu_plugin_hwaddr *hwaddr;
+    int cache_idx;
     InsnData *insn;
 
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
@@ -361,14 +385,15 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     }
 
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
+    cache_idx = vcpu_index % cores;
 
     g_mutex_lock(&mtx);
-    if (!access_cache(dcache, effective_addr)) {
+    if (!access_cache(dcaches[cache_idx], effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
-        dmisses++;
+        stats[cache_idx].dmisses++;
     }
-    dmem_accesses++;
+    stats[cache_idx].dmem_accesses++;
     g_mutex_unlock(&mtx);
 }
 
@@ -376,16 +401,18 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
 {
     uint64_t insn_addr;
     InsnData *insn;
+    int cache_idx;
 
     g_mutex_lock(&mtx);
     insn_addr = ((InsnData *) userdata)->addr;
+    cache_idx = vcpu_index % cores;
 
-    if (!access_cache(icache, insn_addr)) {
+    if (!access_cache(icaches[cache_idx], insn_addr)) {
         insn = (InsnData *) userdata;
         insn->imisses++;
-        imisses++;
+        stats[cache_idx].imisses++;
     }
-    imem_accesses++;
+    stats[cache_idx].imem_accesses++;
     g_mutex_unlock(&mtx);
 }
 
@@ -453,6 +480,15 @@ static void cache_free(Cache *cache)
     g_free(cache);
 }
 
+static void caches_free(Cache **caches)
+{
+    int i;
+
+    for (i = 0; i < cores; i++) {
+        cache_free(caches[i]);
+    }
+}
+
 static int dcmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
@@ -469,21 +505,57 @@ static int icmp(gconstpointer a, gconstpointer b)
     return insn_a->imisses < insn_b->imisses ? 1 : -1;
 }
 
+static void append_stats_line(GString *line, CoreStats cs)
+{
+    double dmiss_rate, imiss_rate;
+
+    dmiss_rate = ((double) cs.dmisses) / (cs.dmem_accesses) * 100.0;
+    imiss_rate = ((double) cs.imisses) / (cs.imem_accesses) * 100.0;
+
+    g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
+                           " %9.4lf%%\n",
+                           cs.dmem_accesses,
+                           cs.dmisses,
+                           cs.dmem_accesses ? dmiss_rate : 0.0,
+                           cs.imem_accesses,
+                           cs.imisses,
+                           cs.imem_accesses ? imiss_rate : 0.0);
+}
+
+static void sum_stats(void)
+{
+    int i;
+
+    g_assert(cores > 1);
+    for (i = 0; i < cores; i++) {
+        stats[cores].imisses += stats[i].imisses;
+        stats[cores].dmisses += stats[i].dmisses;
+        stats[cores].dmem_accesses += stats[i].dmem_accesses;
+        stats[cores].imem_accesses += stats[i].imem_accesses;
+    }
+}
+
 static void log_stats()
 {
-    g_autoptr(GString) rep = g_string_new("");
-    g_string_append_printf(rep,
-        "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
-        dmem_accesses,
-        dmisses,
-        ((double) dmisses / (double) dmem_accesses) * 100.0);
-
-    g_string_append_printf(rep,
-        "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
-        imem_accesses,
-        imisses,
-        ((double) imisses / (double) imem_accesses) * 100.0);
+    int i, iters;
+
+    g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
+                                          " dmiss rate, insn accesses,"
+                                          " insn misses, imiss rate\n");
+
+    /* Only iterate and print a sum row if cores > 1 */
+    iters = cores == 1 ? 1 : cores + 1;
+    for (i = 0; i < iters; i++) {
+        if (i == cores) {
+            g_string_append_printf(rep, "%-8s", "sum");
+            sum_stats();
+        } else {
+            g_string_append_printf(rep, "%-8d", i);
+        }
+        append_stats_line(rep, stats[i]);
+    }
 
+    g_string_append(rep, "\n");
     qemu_plugin_outs(rep->str);
 }
 
@@ -530,10 +602,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     log_stats();
     log_top_insns();
 
-    cache_free(dcache);
-    cache_free(icache);
+    caches_free(dcaches);
+    caches_free(icaches);
 
     g_hash_table_destroy(miss_ht);
+
+    g_free(stats);
 }
 
 static void policy_init()
@@ -579,6 +653,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy = LRU;
 
+    cores = sys ? qemu_plugin_n_vcpus() : 1;
+
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "iblksize=")) {
@@ -595,6 +671,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "cores=")) {
+            cores = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "evict=")) {
             gchar *p = opt + 6;
             if (g_strcmp0(p, "rand") == 0) {
@@ -615,22 +693,28 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy_init();
 
-    dcache = cache_init(dblksize, dassoc, dcachesize);
-    if (!dcache) {
+    dcaches = caches_init(dblksize, dassoc, dcachesize);
+    if (!dcaches) {
         const char *err = cache_config_error(dblksize, dassoc, dcachesize);
         fprintf(stderr, "dcache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
-    icache = cache_init(iblksize, iassoc, icachesize);
-    if (!icache) {
+    icaches = caches_init(iblksize, iassoc, icachesize);
+    if (!icaches) {
         const char *err = cache_config_error(iblksize, iassoc, icachesize);
         fprintf(stderr, "icache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
         return -1;
     }
 
+    /*
+     * plus one to save the sum in. If only one core is used then no need to
+     * get an auxiliary struct.
+     */
+    stats = g_new0(CoreStats, cores == 1 ? 1 : cores + 1);
+
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
 
-- 
2.25.1


