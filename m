Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFB3E5C2F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:51:01 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS9k-0002KR-1W
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7s-0007cq-FG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7p-0008LG-4P
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k29so13593881wrd.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSBV1PDMcfpLWnLgYuNH0qNm2EyfP3KNIAyT7TZN/I0=;
 b=QBIDsEoiMmfTx3Jdd6idoUD7PpY1SrMvq7OQSc3LoIl6SBwzn14rH2RPvewQL/Akrc
 LZdMQwjbr8OlxAG4YkXlHmoHnxPD6poH1bS9j22XIxrW9BjE7dnflIe9sOBZObLU5jg3
 vjBBemw6YIAsL5PgKKBAJVu9VA74TnAuke07coKudsNnmG6dpPU73x7gAaXBeM1oA7Gf
 9ELrZHZc9v8qioP91gGmRmxajAwxgK4Erp7l3pj4/AeacYiGG9KKnnBPJTyeIyKGD/HG
 E9McC0heZK+U8Qz+IFy0HTi12WW2CA8QMaMam9c8zhWUnsAkPVx3+uWYS4+Ev47mxEBT
 8jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSBV1PDMcfpLWnLgYuNH0qNm2EyfP3KNIAyT7TZN/I0=;
 b=qWzuFp0ms3NyGHl1gYvFjO/VZEMbmeDQ6+qya+NDXZN26sMjx4InJ1GgVNuLcMA9j4
 ZfZAj+uNNWsyeEvNvnPgi9fxjwoBRK6U+9lpt9XzqMKQXUgAtJWNyHahXxmhn01ok2wg
 Ipwl04FHVIKw9OMpmTPSnc50FeDRu4qRr2R2vxiWVPLENJURWRN93mvsXnMyucDJ+qi9
 zEpoc8ajA7KCvbiWCDBJO7O6TTi8UnAJx20kcg+H/lKhWZFf7C6hl0XOzsaDpRdjATAy
 dGc7+Tf5TFP6xviuxiYDGVgU6kwfKkx0VmXk6h4nrZqKjwmZE/Dm+cWp1pSj5/G9Y9yF
 VYKg==
X-Gm-Message-State: AOAM530qwSkEtmsG2qMFakZk2LgO7eqMdrEeWPqHpUe1vtoeaUhRk0Fx
 2jnml8zqeAaYT7dRDyp5HllIO6lTESU=
X-Google-Smtp-Source: ABdhPJz89378AGmc9gQk0Ga+24TCBcAHfwlCNIwB0ZD5Th2r645OOCGAHVx4xI/6xhRJ+ZRHIDcnfQ==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr954296wrs.307.1628603339608;
 Tue, 10 Aug 2021 06:48:59 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:48:59 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] plugins/cache: make L2 emulation optional through args
Date: Tue, 10 Aug 2021 15:48:43 +0200
Message-Id: <20210810134844.166490-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42b.google.com
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

By default L2 is not enabled and is enabled by either using the
newly-introduced "l2" boolean argument, or by setting any of the L2
cache parameters using args. On specifying "l2=on", the default cache
configuration is used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 76 +++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index ff325beb9f..b9226e7c40 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -97,6 +97,8 @@ void (*metadata_destroy)(Cache *cache);
 
 static int cores;
 static Cache **l1_dcaches, **l1_icaches;
+
+static bool use_l2;
 static Cache **l2_ucaches;
 
 static GMutex *l1_dcache_locks;
@@ -410,7 +412,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     l1_dcaches[cache_idx]->accesses++;
     g_mutex_unlock(&l1_dcache_locks[cache_idx]);
 
-    if (hit_in_l1) {
+    if (hit_in_l1 || !use_l2) {
         /* No need to access L2 */
         return;
     }
@@ -445,7 +447,7 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     l1_icaches[cache_idx]->accesses++;
     g_mutex_unlock(&l1_icache_locks[cache_idx]);
 
-    if (hit_in_l1) {
+    if (hit_in_l1 || !use_l2) {
         /* No need to access L2 */
         return;
     }
@@ -542,19 +544,25 @@ static void append_stats_line(GString *line, uint64_t l1_daccess,
 
     l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
     l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
-    l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
 
     g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
-                           " %9.4lf%%  %-12lu %-11lu %10.4lf%%\n",
+                           " %9.4lf%%",
                            l1_daccess,
                            l1_dmisses,
                            l1_daccess ? l1_dmiss_rate : 0.0,
                            l1_iaccess,
                            l1_imisses,
-                           l1_iaccess ? l1_imiss_rate : 0.0,
-                           l2_access,
-                           l2_misses,
-                           l2_access ? l2_miss_rate : 0.0);
+                           l1_iaccess ? l1_imiss_rate : 0.0);
+
+    if (use_l2) {
+        l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
+        g_string_append_printf(line, "  %-12lu %-11lu %10.4lf%%",
+                               l2_access,
+                               l2_misses,
+                               l2_access ? l2_miss_rate : 0.0);
+    }
+
+    g_string_append(line, "\n");
 }
 
 static void sum_stats(void)
@@ -568,8 +576,10 @@ static void sum_stats(void)
         l1_imem_accesses += l1_icaches[i]->accesses;
         l1_dmem_accesses += l1_dcaches[i]->accesses;
 
-        l2_misses += l2_ucaches[i]->misses;
-        l2_mem_accesses += l2_ucaches[i]->accesses;
+        if (use_l2) {
+            l2_misses += l2_ucaches[i]->misses;
+            l2_mem_accesses += l2_ucaches[i]->accesses;
+        }
     }
 }
 
@@ -604,25 +614,31 @@ static void log_stats(void)
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-                                          " insn misses, imiss rate,"
-                                          " l2 accesses, l2 misses,"
-                                          " l2 miss rate\n");
+                                          " insn misses, imiss rate");
+
+    if (use_l2) {
+        g_string_append(rep, ", l2 accesses, l2 misses, l2 miss rate");
+    }
+
+    g_string_append(rep, "\n");
 
     for (i = 0; i < cores; i++) {
         g_string_append_printf(rep, "%-8d", i);
         dcache = l1_dcaches[i];
         icache = l1_icaches[i];
-        l2_cache = l2_ucaches[i];
+        l2_cache = use_l2 ? l2_ucaches[i] : NULL;
         append_stats_line(rep, dcache->accesses, dcache->misses,
-                icache->accesses, icache->misses, l2_cache->accesses,
-                l2_cache->misses);
+                icache->accesses, icache->misses,
+                l2_cache ? l2_cache->accesses : 0,
+                l2_cache ? l2_cache->misses : 0);
     }
 
     if (cores > 1) {
         sum_stats();
         g_string_append_printf(rep, "%-8s", "sum");
         append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
-                l1_imem_accesses, l1_imisses, l2_mem_accesses, l2_misses);
+                l1_imem_accesses, l1_imisses,
+                l2_cache ? l2_mem_accesses : 0, l2_cache ? l2_misses : 0);
     }
 
     g_string_append(rep, "\n");
@@ -663,6 +679,10 @@ static void log_top_insns(void)
                                insn->disas_str);
     }
 
+    if (!use_l2) {
+        goto finish;
+    }
+
     miss_insns = g_list_sort(miss_insns, l2_cmp);
     g_string_append_printf(rep, "%s", "\naddress, L2 misses, instruction\n");
 
@@ -676,6 +696,7 @@ static void log_top_insns(void)
                                insn->disas_str);
     }
 
+finish:
     qemu_plugin_outs(rep->str);
     g_list_free(miss_insns);
 }
@@ -687,11 +708,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     caches_free(l1_dcaches);
     caches_free(l1_icaches);
-    caches_free(l2_ucaches);
 
     g_free(l1_dcache_locks);
     g_free(l1_icache_locks);
-    g_free(l2_ucache_locks);
+
+    if (use_l2) {
+        caches_free(l2_ucaches);
+        g_free(l2_ucache_locks);
+    }
 
     g_hash_table_destroy(miss_ht);
 }
@@ -767,11 +791,19 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         } else if (g_strcmp0(tokens[0], "cores") == 0) {
             cores = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2cachesize") == 0) {
+            use_l2 = true;
             l2_cachesize = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2blksize") == 0) {
+            use_l2 = true;
             l2_blksize = STRTOLL(tokens[1]);
         } else if (g_strcmp0(tokens[0], "l2assoc") == 0) {
+            use_l2 = true;
             l2_assoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &use_l2)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else if (g_strcmp0(tokens[0], "evict") == 0) {
             if (g_strcmp0(tokens[1], "rand") == 0) {
                 policy = RAND;
@@ -807,8 +839,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         return -1;
     }
 
-    l2_ucaches = caches_init(l2_blksize, l2_assoc, l2_cachesize);
-    if (!l2_ucaches) {
+    l2_ucaches = use_l2 ? caches_init(l2_blksize, l2_assoc, l2_cachesize) : NULL;
+    if (!l2_ucaches && use_l2) {
         const char *err = cache_config_error(l2_blksize, l2_assoc, l2_cachesize);
         fprintf(stderr, "L2 cache cannot be constructed from given parameters\n");
         fprintf(stderr, "%s\n", err);
@@ -817,7 +849,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     l1_dcache_locks = g_new0(GMutex, cores);
     l1_icache_locks = g_new0(GMutex, cores);
-    l2_ucache_locks = g_new0(GMutex, cores);
+    l2_ucache_locks = use_l2 ? g_new0(GMutex, cores) : NULL;
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


