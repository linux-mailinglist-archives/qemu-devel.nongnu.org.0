Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538153DD730
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:34:25 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAY5I-0006mg-DY
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY37-0003o6-H4
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY35-0006Vb-ED
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id n12so21519807wrr.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xFU+dbgZZkd+s3VgebR+tKEa5TZwHcK/VeauCvgQuY=;
 b=qgbpO51kKEpXscEcli8y8mJPcaKYuScjPu0hGSy16ivhmuKWkovJjChFStooSQFJMo
 AVKvHUO/wfc3NIIZqc4qXPOQEfAAUFNjzvZVo2sIHmL4lavlBaX7NlBfG3O8C1KVqnBC
 fh+YdrZNVhei87lrpnWQ9oAx3WDyAEOsilQtSe/bGQFovsQGZa7vJt7gQR1gjPTPQBMp
 +xvMsreiQ8ezzznJZ01KrtbSBiIleSWYW5pY8ePK+kVuXuSYkG2EsaEhTFVwU+7DbFpz
 OxXqLFxjlxnr6IhLzLzbmETgmTyKPzNJJPUSFbE6D9VdSJkqXiaYbxzVOfjDP/fe/2G+
 bBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xFU+dbgZZkd+s3VgebR+tKEa5TZwHcK/VeauCvgQuY=;
 b=X+nbw4+rrvcrNRTI5qXVNl6c2gX4XYvDTdIu9FgyAwJYWdV79r21v1HrZ1Ijl1fCt7
 lKWtCS75x9qntdQkoztSU5yr96gmvIImUh6TlVz5XW1AIhCJx9aS14eEK7aCPVUpFrXR
 09UsaExDyFHT+IRezpO1C/GwWtGpAEN2gdgF7R607fMfVtIWsZsHnXcu1lNdJZMgAYZ3
 sTIfT1hP0Ygp1hqvBz7X2kDOjTRRdE/ZCbbUHwGrLkyqQVN+XGeHgO9Llio4b5pdm6te
 69PlPY2gcHPis1YjbbYa2a9VJVLThE7GuG/8xldhst1Ga8CMKfURbkMXurb8dSGvuyr1
 djtQ==
X-Gm-Message-State: AOAM530Ex6r34L1WTZNaBMGfGnkdFUjiQfdlexwaksEIeAAsB29EjVek
 +Yylpy6ilrhbTc6IlFKtnvzx11R4F0g=
X-Google-Smtp-Source: ABdhPJzotPjqsix+lsAAD9YXDX3Ul0rQTWXjapsFu5UT61q7JBH+uTbVnmvR5hsCnQ2Vmr5VJi9Mcw==
X-Received: by 2002:a5d:5484:: with SMTP id h4mr17715942wrv.20.1627911125843; 
 Mon, 02 Aug 2021 06:32:05 -0700 (PDT)
Received: from localhost.localdomain ([197.61.223.190])
 by smtp.gmail.com with ESMTPSA id a2sm11269589wrn.95.2021.08.02.06.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:32:05 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] plugins/cache: supported multicore cache modelling
Date: Mon,  2 Aug 2021 15:31:42 +0200
Message-Id: <20210802133144.45196-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802133144.45196-1-ma.mandourr@gmail.com>
References: <20210802133144.45196-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x429.google.com
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
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
index 066ea6d8ec..971569cc9d 100644
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
@@ -461,6 +497,36 @@ static int dcmp(gconstpointer a, gconstpointer b)
     return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
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
 static int icmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
@@ -471,19 +537,25 @@ static int icmp(gconstpointer a, gconstpointer b)
 
 static void log_stats(void)
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
 
 static void policy_init(void)
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


