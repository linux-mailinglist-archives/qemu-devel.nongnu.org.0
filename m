Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF734446C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:13:56 +0100 (CET)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJpk-0007pc-1v
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJo8-000519-PG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJo6-00073E-Oq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2373253wme.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3OZRZ6+tmKnw7GakdlKZKV5dmhTWdnq+opHPpGWJrY=;
 b=AHnyp3VAe0vHGV2nC6gIWb6AF+UHDQ9JwQGeaHTn/hHC8iIDTmm1mrhEo9QyOZN9Vc
 MwoUQk/C5mCF3v51juyFmh9Azr5gKOL818MVqipInrFuPUv87VT58L4M28xcTcZTI9G6
 Uk4ZU+k5cUzI5eJwa/rcVhYmmQMVpxhXCsOESJ75EA0ymHfpYc+fipgEr7XOh9IpXNqI
 moZHigQDcituR2FNd1wChAb4WNtstvq55soTMVbg54XqL9RF6VDHBte/rQ1CFRkB7rSG
 i5K8TMnWbZvP4hwncKxv1K8Egq3vo2fmbDu8OBe2xo6/T+yg34BS9NmKwfNEu3MefrfH
 oIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3OZRZ6+tmKnw7GakdlKZKV5dmhTWdnq+opHPpGWJrY=;
 b=HLRVkvfzfChngzq3xSJvbR9V/7EdIwL/O5PT2/gAdI+f0Coh/0YE8G1tHw4KfFLMJ9
 VOzN/PR2XkNhZTwOOWId56WHP7JvVBYePYHiGMmgXO2jmGlHCNOs/Oa6CmtBB+DNV5tq
 C1IkIiU7XDA+f+BQW5ytjwDrkEbzg4lObbtDxBba19EpdMop/JWhkbIXBBDvraSR7N0M
 11yA8O1HVtNzxKkpAgVZCOC3dDRJf09yiufm0Fsw85zDEiE3BK9vAwa3ibJtm9+kFT1t
 R+AjSP2v0mxHNFOEmPLy5tNJ6hmXwyU5QvVSWE0DF3XjG3X3NS/pSoisDPB+XAYTHQmi
 ihiA==
X-Gm-Message-State: AOAM530+Ha4HF9oWe9MFaON6JcaqaISBSrDAlgyxZS9aYBcu1RhyFhne
 rJsTmGPmfP7RzZD2Mn/gxY2KNQ==
X-Google-Smtp-Source: ABdhPJz9JUwj/IbRSFOZT+onF1OStCVO4+GXLT4LP2iY9BPvvvGBcvD2SuWQUI5+LPDWlzfUtKlmAQ==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr16493532wmi.182.1635959532931; 
 Wed, 03 Nov 2021 10:12:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm2415170wmj.40.2021.11.03.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BFD11FFAB;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/21] plugins/cache: make L2 emulation optional through args
Date: Wed,  3 Nov 2021 17:05:50 +0000
Message-Id: <20211103170558.717981-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

By default L2 is not enabled and is enabled by either using the
newly-introduced "l2" boolean argument, or by setting any of the L2
cache parameters using args. On specifying "l2=on", the default cache
configuration is used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-5-ma.mandourr@gmail.com>
Message-Id: <20211026102234.3961636-17-alex.bennee@linaro.org>

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
2.30.2


