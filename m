Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AF3C89CF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:28:55 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3igo-0005mo-Be
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idX-0008QK-TP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idT-0005gf-Qz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4384639wmh.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l38aQRI2rzDIqUMZhp7jHSxY2lEYFMkxgCQ8I8cOe7U=;
 b=neMUOFKaj4sxujSoWpzocTq4FGS2bkC5p1SkrhZe/5ut+q7x7zqh3Mui2JDX21YYxE
 m0phcKWTpznSQVRxp78lBsOexyq3w7MKNevtu8ifeUc6U0cCUAM8Ov/z8dklFfVoXaqB
 MU4g/n0YtULe14Rr9aT18scUKlzVzVFZLDgX1+0U0j48syHBiMx2369q7E+eSIIxDvYA
 8TAJuZHe1TcMsAMQsElamhwNCENGs5HJrraoS9mgISlRnucsDsPztR62noMVgbZzI7oc
 iDXkNWHSgoKjIMopWyZrCCWkx7awvu2KVdfQVsgbZdKgth6hI3c50fQmTwnLzy3v8wg1
 P6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l38aQRI2rzDIqUMZhp7jHSxY2lEYFMkxgCQ8I8cOe7U=;
 b=jfthbs4xZxi/ds+hpK47cA4VjB6jk6UAzTXjMuxqex0qk78Wnb8TqsDFi8GBT8l/6X
 d1cD4XPjWH9NMdOzPyEzMW3XRdExjYkqsYSC5NFVUIeV4J7SGiNqoKakEcplTu+ELH4D
 hWwLDXvewEG8KwWcGsNqpoyIU0UAUTCdZsZwWUHUA688OfdQ+Xk0VYzJeI7hPgn9HNW/
 vekntQCw7E+ZdK33o4zPYK1SE5NRiyyQP0WF3OUuL3hG0N+0uWp66dJRhZGGRL+UdEWa
 GuKdBWd9pXBfDce0rWTfjkQtH/e8iF+/mNm66wlpd0TX4YMu0DWmYyaMCo9xv2ZpFn1H
 MuVw==
X-Gm-Message-State: AOAM533E+HgrmRmf39dz3r8FVJuvLWpnD4HtkbCI5bTv9tvrLezx8P8w
 fT4IPOuJnEt3dKhJDKRSe4G9Lh9H+RgDvg==
X-Google-Smtp-Source: ABdhPJx+7DDrNaypMKJjy3cSk2gIkkIb8q8GxmrYtXMzoCd5x7pcQBu10HCM5RVx2WJAstbr0xM4qQ==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr5183227wme.13.1626283526385; 
 Wed, 14 Jul 2021 10:25:26 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:26 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] plugins/cache: Supported multicore cache modelling
Date: Wed, 14 Jul 2021 19:21:50 +0200
Message-Id: <20210714172151.8494-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
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
 contrib/plugins/cache.c | 156 ++++++++++++++++++++++++++++++----------
 1 file changed, 117 insertions(+), 39 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index a452aba01c..60f7be208b 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -23,11 +23,6 @@ static GRand *rng;
 static int limit;
 static bool sys;
 
-static uint64_t dmem_accesses;
-static uint64_t dmisses;
-
-static uint64_t imem_accesses;
-static uint64_t imisses;
 
 enum EvictionPolicy {
     LRU,
@@ -90,13 +85,22 @@ typedef struct {
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
@@ -233,10 +237,6 @@ static bool bad_cache_params(int blksize, int assoc, int cachesize)
 
 static Cache *cache_init(int blksize, int assoc, int cachesize)
 {
-    if (bad_cache_params(blksize, assoc, cachesize)) {
-        return NULL;
-    }
-
     Cache *cache;
     int i;
     uint64_t blk_mask;
@@ -263,6 +263,24 @@ static Cache *cache_init(int blksize, int assoc, int cachesize)
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
@@ -353,6 +371,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
 {
     uint64_t effective_addr;
     struct qemu_plugin_hwaddr *hwaddr;
+    int cache_idx;
     InsnData *insn;
 
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
@@ -363,17 +382,24 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
     g_mutex_lock(&mtx);
-    if (dcache == NULL) {
+    cache_idx = vcpu_index % cores;
+    if (dcaches[cache_idx] == NULL) {
         g_mutex_unlock(&mtx);
         return;
     }
 
-    if (!access_cache(dcache, effective_addr)) {
+    if (!access_cache(dcaches[cache_idx], effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
-        dmisses++;
+        if (cores > 1) {
+            stats[cores].dmisses++;
+        }
+        stats[cache_idx].dmisses++;
+    }
+    if (cores > 1) {
+        stats[cores].dmem_accesses++;
     }
-    dmem_accesses++;
+    stats[cache_idx].dmem_accesses++;
     g_mutex_unlock(&mtx);
 }
 
@@ -381,21 +407,29 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
 {
     uint64_t insn_addr;
     InsnData *insn;
+    uint64_t cache_idx;
 
     g_mutex_lock(&mtx);
     insn_addr = ((InsnData *) userdata)->addr;
 
-    if (icache == NULL) {
+    cache_idx = vcpu_index % cores;
+    if (icaches[cache_idx] == NULL) {
         g_mutex_unlock(&mtx);
         return;
     }
 
-    if (!access_cache(icache, insn_addr)) {
+    if (!access_cache(icaches[cache_idx], insn_addr)) {
         insn = (InsnData *) userdata;
         insn->imisses++;
-        imisses++;
+        if (cores > 1) {
+            stats[cores].imisses++;
+        }
+        stats[cache_idx].imisses++;
     }
-    imem_accesses++;
+    if (cores > 1) {
+        stats[cores].imem_accesses++;
+    }
+    stats[cache_idx].imem_accesses++;
     g_mutex_unlock(&mtx);
 }
 
@@ -475,6 +509,22 @@ static void cache_free(Cache *cache)
     g_free(cache);
 }
 
+/*
+ * caches_free(): free an array of Cache structs.
+ * @caches: caches to free
+ *
+ * Calling cache_free for each cache in @caches, and then NULL-ify them so that
+ * we mark them as freed, other async callbacks can check to see whether a cache
+ * is freed already or not by checking against NULL.
+ */
+static void caches_free(Cache **caches)
+{
+    for (int i = 0; i < cores; i++) {
+        cache_free(caches[i]);
+        caches[i] = NULL;
+    }
+}
+
 static int dcmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
@@ -493,19 +543,38 @@ static int icmp(gconstpointer a, gconstpointer b)
 
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
+    CoreStats cs;
+    double dmiss_rate, imiss_rate;
+
+    g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
+                                          " dmiss rate, insn accesses,"
+                                          " insn misses, imiss rate\n");
+
+    /* Only iterate and print a sum row if cores > 1 */
+    iters = cores == 1 ? 1 : cores + 1;
+    for (i = 0; i < iters; i++) {
+        cs = stats[i];
+        dmiss_rate = ((double) cs.dmisses) / (cs.dmem_accesses) * 100.0;
+        imiss_rate = ((double) cs.imisses) / (cs.imem_accesses) * 100.0;
+
+        if (i == cores) {
+            g_string_append_printf(rep, "%-8s", "sum");
+        } else {
+            g_string_append_printf(rep, "%-8d", i);
+        }
+
+        g_string_append_printf(rep, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
+                               " %9.4lf%%\n",
+                               cs.dmem_accesses,
+                               cs.dmisses,
+                               cs.dmem_accesses ? dmiss_rate : 0.0,
+                               cs.imem_accesses,
+                               cs.imisses,
+                               cs.imem_accesses ? imiss_rate : 0.0);
+    }
 
+    g_string_append(rep, "\n");
     qemu_plugin_outs(rep->str);
 }
 
@@ -553,15 +622,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     log_stats();
     log_top_insns();
 
-    cache_free(dcache);
-    dcache = NULL;
-
-    cache_free(icache);
-    icache = NULL;
+    caches_free(dcaches);
+    caches_free(icaches);
 
     g_hash_table_destroy(miss_ht);
     miss_ht = NULL;
 
+    g_free(stats);
+
     g_mutex_unlock(&mtx);
 }
 
@@ -608,6 +676,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy = LRU;
 
+    cores = sys ? qemu_plugin_n_vcpus() : 1;
+
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "iblksize=")) {
@@ -624,6 +694,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "cores=")) {
+            cores = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "evict=")) {
             gchar *p = opt + 6;
             if (g_strcmp0(p, "rand") == 0) {
@@ -644,22 +716,28 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
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


