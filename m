Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F83FFCD4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:15:01 +0200 (CEST)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Ho-00008X-7O
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57B-0006El-Ib
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM579-0005fY-87
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id i3so3019242wmq.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmOXcmKk0XvDznE6oW/gFfY7dG0lGaTYlfhMcC+RlKg=;
 b=WiHyM356COoNapWdmEAGluCE501Uc58ZtIZkwamXK2JabF53N+Q/3U1AFRm3ipz/eC
 ebiGvuQLampzqbxyZ25hXfAFn8PzVl/TYnVb9GqQEgdwog2cCPMwpYYSvH9wTLlW/D93
 OrQsz0b5rJAoRWCyDfddRDJAlzNU/dBv/X1H5DCDVNv6SdIr+zhviWU/FmrCD7TrK8b9
 UvCQwNbSSwN6FoU73UhcBlsUKeitgdWYMquTFUENqchM+KZM3h73dRPKhornZGw15M7N
 bycQujrfRKzaau0k3kHZeTe6oEbWRCU0Z3VP7RzPAqVe+GpKX4E4A4W4IhYZz4GV8wE9
 Rr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmOXcmKk0XvDznE6oW/gFfY7dG0lGaTYlfhMcC+RlKg=;
 b=cbn8QPiijlQeS9EgGLVN0JO5XCOX8ocowpMdBydKSd2WM9o7GMH+zvCoOuNw+eZKwn
 JyI97W5hteTsOrSqcpoCk1gFXpcoHInnKP0+nnfr7/xHfYTyVNJ/Pq6QuHC+Ct/qQ8/O
 PPqcPAPzxIfGWVpO54OPNIh9SwHY8MKnqrj4fcbbSdtr3sQcj0qDK2mwInGirrb31kxV
 5msVMTZK4YnJqsfyAqEWHhLaCck6OzYzXC1DwT7zLnYqMVqdWyk8taqcWkRtNzcAZKBb
 zLkwGXjsxMrShXspv5XFSMq4cfRIG+ubJD/zcvjor+bEetrYiU/PDY1huQWAFwVzQ9we
 aZvQ==
X-Gm-Message-State: AOAM531fpz7TKCoqSMRtsjZ4kGCLpOV8vF2VCpxCmWS9oiq2x2a93tV7
 wz00cYeV2MGr/XnlNxafixHQKA==
X-Google-Smtp-Source: ABdhPJxC7RRa2QONZLcuAloLgAiDozNwBw4VTuQ7K+jLd7VxbkObNjBahpx4XarLpT2kL9ZGKkNmAw==
X-Received: by 2002:a05:600c:2e46:: with SMTP id
 q6mr7193693wmf.93.1630659837021; 
 Fri, 03 Sep 2021 02:03:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k1sm4278049wrz.61.2021.09.03.02.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59EB11FF9D;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/22] plugins/cache: supported multicore cache modelling
Date: Fri,  3 Sep 2021 10:03:23 +0100
Message-Id: <20210903090339.1074887-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

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
Message-Id: <20210803151301.123581-2-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 066ea6d8ec..a1e03ca882 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -17,18 +17,12 @@ static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
 
 static GHashTable *miss_ht;
 
-static GMutex mtx;
+static GMutex hashtable_lock;
 static GRand *rng;
 
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
@@ -80,6 +74,8 @@ typedef struct {
     int blksize_shift;
     uint64_t set_mask;
     uint64_t tag_mask;
+    uint64_t accesses;
+    uint64_t misses;
 } Cache;
 
 typedef struct {
@@ -96,7 +92,16 @@ void (*update_miss)(Cache *cache, int set, int blk);
 void (*metadata_init)(Cache *cache);
 void (*metadata_destroy)(Cache *cache);
 
-Cache *dcache, *icache;
+static int cores;
+static Cache **dcaches, **icaches;
+
+static GMutex *dcache_locks;
+static GMutex *icache_locks;
+
+static uint64_t all_dmem_accesses;
+static uint64_t all_imem_accesses;
+static uint64_t all_imisses;
+static uint64_t all_dmisses;
 
 static int pow_of_two(int num)
 {
@@ -233,20 +238,24 @@ static bool bad_cache_params(int blksize, int assoc, int cachesize)
 
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
     cache->num_sets = cachesize / (blksize * assoc);
     cache->sets = g_new(CacheSet, cache->num_sets);
     cache->blksize_shift = pow_of_two(blksize);
+    cache->accesses = 0;
+    cache->misses = 0;
 
     for (i = 0; i < cache->num_sets; i++) {
         cache->sets[i].blocks = g_new0(CacheBlock, assoc);
@@ -263,6 +272,24 @@ static Cache *cache_init(int blksize, int assoc, int cachesize)
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
@@ -353,6 +380,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
 {
     uint64_t effective_addr;
     struct qemu_plugin_hwaddr *hwaddr;
+    int cache_idx;
     InsnData *insn;
 
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
@@ -361,32 +389,35 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     }
 
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
+    cache_idx = vcpu_index % cores;
 
-    g_mutex_lock(&mtx);
-    if (!access_cache(dcache, effective_addr)) {
+    g_mutex_lock(&dcache_locks[cache_idx]);
+    if (!access_cache(dcaches[cache_idx], effective_addr)) {
         insn = (InsnData *) userdata;
-        insn->dmisses++;
-        dmisses++;
+        __atomic_fetch_add(&insn->dmisses, 1, __ATOMIC_SEQ_CST);
+        dcaches[cache_idx]->misses++;
     }
-    dmem_accesses++;
-    g_mutex_unlock(&mtx);
+    dcaches[cache_idx]->accesses++;
+    g_mutex_unlock(&dcache_locks[cache_idx]);
 }
 
 static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
 {
     uint64_t insn_addr;
     InsnData *insn;
+    int cache_idx;
 
-    g_mutex_lock(&mtx);
     insn_addr = ((InsnData *) userdata)->addr;
 
-    if (!access_cache(icache, insn_addr)) {
+    cache_idx = vcpu_index % cores;
+    g_mutex_lock(&icache_locks[cache_idx]);
+    if (!access_cache(icaches[cache_idx], insn_addr)) {
         insn = (InsnData *) userdata;
-        insn->imisses++;
-        imisses++;
+        __atomic_fetch_add(&insn->imisses, 1, __ATOMIC_SEQ_CST);
+        icaches[cache_idx]->misses++;
     }
-    imem_accesses++;
-    g_mutex_unlock(&mtx);
+    icaches[cache_idx]->accesses++;
+    g_mutex_unlock(&icache_locks[cache_idx]);
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -411,7 +442,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
          * new entries for those instructions. Instead, we fetch the same
          * entry from the hash table and register it for the callback again.
          */
-        g_mutex_lock(&mtx);
+        g_mutex_lock(&hashtable_lock);
         data = g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effective_addr));
         if (data == NULL) {
             data = g_new0(InsnData, 1);
@@ -421,7 +452,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             g_hash_table_insert(miss_ht, GUINT_TO_POINTER(effective_addr),
                                (gpointer) data);
         }
-        g_mutex_unlock(&mtx);
+        g_mutex_unlock(&hashtable_lock);
 
         qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
                                          QEMU_PLUGIN_CB_NO_REGS,
@@ -453,6 +484,15 @@ static void cache_free(Cache *cache)
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
@@ -461,6 +501,37 @@ static int dcmp(gconstpointer a, gconstpointer b)
     return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
 }
 
+static void append_stats_line(GString *line, uint64_t daccess, uint64_t dmisses,
+                              uint64_t iaccess, uint64_t imisses)
+{
+    double dmiss_rate, imiss_rate;
+
+    dmiss_rate = ((double) dmisses) / (daccess) * 100.0;
+    imiss_rate = ((double) imisses) / (iaccess) * 100.0;
+
+    g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
+                           " %9.4lf%%\n",
+                           daccess,
+                           dmisses,
+                           daccess ? dmiss_rate : 0.0,
+                           iaccess,
+                           imisses,
+                           iaccess ? imiss_rate : 0.0);
+}
+
+static void sum_stats(void)
+{
+    int i;
+
+    g_assert(cores > 1);
+    for (i = 0; i < cores; i++) {
+        all_imisses += icaches[i]->misses;
+        all_dmisses += dcaches[i]->misses;
+        all_imem_accesses += icaches[i]->accesses;
+        all_dmem_accesses += dcaches[i]->accesses;
+    }
+}
+
 static int icmp(gconstpointer a, gconstpointer b)
 {
     InsnData *insn_a = (InsnData *) a;
@@ -471,19 +542,29 @@ static int icmp(gconstpointer a, gconstpointer b)
 
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
+    int i;
+    Cache *icache, *dcache;
+
+    g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
+                                          " dmiss rate, insn accesses,"
+                                          " insn misses, imiss rate\n");
+
+    for (i = 0; i < cores; i++) {
+        g_string_append_printf(rep, "%-8d", i);
+        dcache = dcaches[i];
+        icache = icaches[i];
+        append_stats_line(rep, dcache->accesses, dcache->misses,
+                icache->accesses, icache->misses);
+    }
+
+    if (cores > 1) {
+        sum_stats();
+        g_string_append_printf(rep, "%-8s", "sum");
+        append_stats_line(rep, all_dmem_accesses, all_dmisses,
+                all_imem_accesses, all_imisses);
+    }
 
+    g_string_append(rep, "\n");
     qemu_plugin_outs(rep->str);
 }
 
@@ -530,8 +611,8 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     log_stats();
     log_top_insns();
 
-    cache_free(dcache);
-    cache_free(icache);
+    caches_free(dcaches);
+    caches_free(icaches);
 
     g_hash_table_destroy(miss_ht);
 }
@@ -579,6 +660,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy = LRU;
 
+    cores = sys ? qemu_plugin_n_vcpus() : 1;
+
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "iblksize=")) {
@@ -595,6 +678,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "cores=")) {
+            cores = g_ascii_strtoll(opt + 6, NULL, 10);
         } else if (g_str_has_prefix(opt, "evict=")) {
             gchar *p = opt + 6;
             if (g_strcmp0(p, "rand") == 0) {
@@ -615,22 +700,25 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
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
 
+    dcache_locks = g_new0(GMutex, cores);
+    icache_locks = g_new0(GMutex, cores);
+
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
 
-- 
2.30.2


