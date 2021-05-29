Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF2394CE4
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 17:23:55 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln0oc-0003Uj-HU
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0nE-0001OO-Db
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n9-0006f0-76
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id m18so6197204wrv.2
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NglVq6XPSNfI2OlftVxELyprFxY+6DW+HIvyv6La3O0=;
 b=IvUxECjeE/ADHD8FA+rz/gtmfPdXYHSm28p0bt0qSjrG/tM3nnDmcYBeZ2T8HlNxQV
 jO1tyZQqlxYxN/KbTTeRz8pXXOVtFtbg8eDVSj1FtttxRpMLPrZ9U64us2dMBnAJpZuC
 WhjRJxpKykZU/eWbVPdRODT/RBy4+gV2Kq81Thg+qf6uVuYEtAuN39WVGLUT56p+RtLX
 cPtgit2eB6NlhG6Ft14AIYnvYIEumPia4p0M9TqXeb0zwi+TLYxBmNPbR9N/rqv7asVH
 7ZXtgSwCJnsdKR7PXaTxN5m6gkNUintbS00Tik6T8OFFSMUpN7KuDMI9DEAA82ZV/o+y
 PbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NglVq6XPSNfI2OlftVxELyprFxY+6DW+HIvyv6La3O0=;
 b=VCECnvoF/7E4PYrOlFupm21yZNNhJSuRKY8CPMA8yhZ3dDkALV2ZHBNbkSmG0em5ix
 78b/xDgnHRROhI3g5Aa27NrwHNeIkjGCtVEIn0NwUVbzP9T3N/R/5dLzDNL4xVjttATV
 OFRjVYZcWioHf7yqkOBFYyOgZiJwKVoQKOZ3ZGfk0ifvmHB5VuZodzf7JmYQUVreylkI
 UoP+1VJUbFkD8p4xmvPMAIil0cmDTkgqRnMVDlk41OJTA9tg4MtOcZuI/VS5hSvktFvP
 WqbGFVUUY8izCAiLrN11iuTLMlZAVFnIoIMookxP1R1pSTCqZaYTCHo0kNixnErtw7pL
 +UDQ==
X-Gm-Message-State: AOAM533W4rQTf7pFo99JUt2qVIQvZuLGngHoxcTt4A5hJT8x8tAm8fmW
 +vmI2XWwrCeKxiCiw5RcnBIlgISRSHz6HA==
X-Google-Smtp-Source: ABdhPJxCaPZEu1nycBeJEyf3rERQEGgTcYt97jXFaeccqj/rDM1HvNVvFt2JMhid9lVi3Y84J5+qxA==
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr998056wrz.236.1622301740894; 
 Sat, 29 May 2021 08:22:20 -0700 (PDT)
Received: from localhost.localdomain ([102.47.172.201])
 by smtp.gmail.com with ESMTPSA id s7sm17019164wmh.35.2021.05.29.08.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:22:20 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] plugins: cache: Added FIFO and LRU eviction policies.
Date: Sat, 29 May 2021 17:22:03 +0200
Message-Id: <20210529152203.40358-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210529152203.40358-1-ma.mandourr@gmail.com>
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now one of the three eviction policies can be chosen as an argument. On
not specifying an argument, LRU is used by default.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 146 insertions(+), 13 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 7d1d185480..341cd64e41 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -18,6 +18,8 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+static bool fifo, lru, rnd;
+
 static GRand *rng;
 static GHashTable *dmiss_ht;
 static GHashTable *imiss_ht;
@@ -55,6 +57,8 @@ struct CacheBlock {
 
 struct CacheSet {
     struct CacheBlock *blocks;
+    uint16_t *priorities;
+    GQueue *evict_queue;
 };
 
 struct Cache {
@@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
     return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
 }
 
+static void lru_priorities_init(struct Cache *cache)
+{
+    int i, j;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].priorities = g_new(uint16_t, cache->assoc);
+        for (j = 0; j < cache->assoc; j++) {
+            cache->sets[i].priorities[j] = cache->assoc - j - 1;
+        }
+    }
+}
+
+static void lru_update_on_miss(struct Cache *cache,
+                                      int set_idx,
+                                      int blk_idx)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        cache->sets[set_idx].priorities[i]++;
+    }
+
+    cache->sets[set_idx].priorities[blk_idx] = 0;
+}
+
+static void lru_update_on_hit(struct Cache *cache,
+                                         int set_idx,
+                                         int blk_idx)
+{
+    uint16_t blk_priority;
+    int i;
+
+    blk_priority = cache->sets[set_idx].priorities[blk_idx];
+    for (i = 0; i < cache->assoc; i++) {
+        if (cache->sets[set_idx].priorities[i] < blk_priority) {
+            cache->sets[set_idx].priorities[i]++;
+        }
+    }
+    cache->sets[set_idx].priorities[blk_idx] = 0;
+}
+
+static int lru_get_lru_block(struct Cache *cache, int set_idx)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (cache->sets[set_idx].priorities[i] == cache->assoc - 1) {
+            return i;
+        }
+    }
+
+    g_assert_not_reached();
+}
+
+static void fifo_init(struct Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].evict_queue = g_queue_new();
+    }
+}
+
+static int fifo_get_first_in_block(struct Cache *cache, int set)
+{
+    GQueue *q = cache->sets[set].evict_queue;
+    return GPOINTER_TO_INT(g_queue_pop_tail(q));
+}
+
+static void fifo_update_on_miss(struct Cache *cache,
+                                int set,
+                                int blk_idx)
+{
+    GQueue *q = cache->sets[set].evict_queue;
+    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
+}
+
+
 static struct Cache *cache_init(int blksize, int assoc, int cachesize)
 {
     struct Cache *cache;
@@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int assoc, int cachesize)
     cache->set_mask = ((cache->num_sets - 1) << (pow_of_two(cache->blksize)));
     cache->tag_mask = ~(cache->set_mask | cache->blk_mask);
 
+    if (lru) {
+        lru_priorities_init(cache);
+    } else if (fifo) {
+        fifo_init(cache);
+    }
+
     return cache;
 }
 
@@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache, uint64_t set)
     return -1;
 }
 
-static int get_replaced_block(struct Cache *cache)
+static int get_replaced_block(struct Cache *cache, int set)
 {
-    return g_rand_int_range(rng, 0, cache->assoc);
+    if (rnd) {
+        return g_rand_int_range(rng, 0, cache->assoc);
+    } else if (lru) {
+        return lru_get_lru_block(cache, set);
+    } else if (fifo) {
+        return fifo_get_first_in_block(cache, set);
+    }
+
+    g_assert_not_reached();
 }
 
-static bool in_cache(struct Cache *cache, uint64_t addr)
+static int in_cache(struct Cache *cache, uint64_t addr)
 {
     int i;
     uint64_t tag, set;
@@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64_t addr)
     for (i = 0; i < cache->assoc; i++) {
         if (cache->sets[set].blocks[i].tag == tag &&
                 cache->sets[set].blocks[i].valid) {
-            return true;
+            return i;
         }
     }
 
-    return false;
+    return -1;
 }
 
 static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)
 {
     uint64_t tag, set;
-    int replaced_blk;
-
-    if (in_cache(cache, addr)) {
-        return HIT;
-    }
+    int hit_blk, replaced_blk;
 
     tag = extract_tag(cache, addr);
     set = extract_set(cache, addr);
+    hit_blk = in_cache(cache, addr);
+
+    if (hit_blk != -1) {
+        if (lru) {
+            lru_update_on_hit(cache, set, hit_blk);
+        }
+        return HIT;
+    }
 
     replaced_blk = get_invalid_block(cache, set);
 
     if (replaced_blk == -1) {
-        replaced_blk = get_replaced_block(cache);
+        replaced_blk = get_replaced_block(cache, set);
+    }
+
+    if (lru) {
+        lru_update_on_miss(cache, set, replaced_blk);
+    } else if (fifo) {
+        fifo_update_on_miss(cache, set, replaced_blk);
     }
 
     cache->sets[set].blocks[replaced_blk].tag = tag;
@@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)
 {
     for (int i = 0; i < cache->num_sets; i++) {
         g_free(cache->sets[i].blocks);
+        if (lru) {
+            g_free(cache->sets[i].priorities);
+        } else if (fifo) {
+            g_queue_free(cache->sets[i].evict_queue);
+        }
     }
 
     g_free(cache->sets);
@@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     iblksize = 64;
     icachesize = iblksize * iassoc * 32;
 
-    rng = g_rand_new();
-
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
         if (g_str_has_prefix(opt, "I=")) {
@@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             if (!tracefile) {
                 fprintf(stderr, "could not open: %s for writing\n", file_name);
             }
+        } else if (g_str_has_prefix(opt, "evict=")) {
+            if (lru || rnd || fifo) {
+                fprintf(stderr, "eviction policy specified more than once\n");
+                return -1;
+            }
+            gchar *policy = opt + 6;
+            if (g_strcmp0(policy, "rand") == 0) {
+                rnd = true;
+            } else if (g_strcmp0(policy, "lru") == 0) {
+                lru = true;
+            } else if (g_strcmp0(policy, "fifo") == 0) {
+                fifo = true;
+            } else {
+                fprintf(stderr, "invalid eviction policy: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
@@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         return -1;
     }
 
+    if (!rnd && !lru && !fifo) {
+        lru = true;
+    }
+
+    if (rnd) {
+        rng = g_rand_new();
+    }
+
     dcache = cache_init(dblksize, dassoc, dcachesize);
     icache = cache_init(iblksize, iassoc, icachesize);
 
-- 
2.25.1


