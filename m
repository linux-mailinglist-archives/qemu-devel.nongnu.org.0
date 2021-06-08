Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7039ED67
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:10:58 +0200 (CEST)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqT4r-0001iy-8S
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2G-0003vb-0Z
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2D-0008Mp-9V
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id r9so3196178wrz.10
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 21:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2WAk/Hd46RzXhp4Qf1TvKjU7cXGKlg3VjTVfixKRX+0=;
 b=Mcw3Y2KEE8Pta0cu3M4/Wa1SY8+NPyL1ZPIeVsaAbcyMsB+4vq8mCuTKGYS/Kyo0QO
 KaEHhPfxtpflMmTR0yR0eDzyEz6xhF963It2hlgkHnSYQpctYykHmpgy4vltWCmxheDe
 Z+sm9Rd7qY0CKZDA2bpcxjN4rN1oSit1udJhu+v2WJc0+IQZoR2nTk5aI9igEHosf4Cz
 CpScQKNvwN/YUTGq/ya5c54WEqjmoc8riaS0ls7zzfas0XBKgxCOrUryzjtatY+lpBfF
 COpYYSJbaJZd4K67+aXZ/tPdxjWdR7U/womfLhcC/LfD8OxNZNYlsYE71kFsMWnqfM+b
 F0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WAk/Hd46RzXhp4Qf1TvKjU7cXGKlg3VjTVfixKRX+0=;
 b=sLYurxWrWkJEHpNC8V5nV3+E33LWZAr3J1L33vuZ+Z1yA/6TBEBZyzi3qZjAbwXHnV
 W0VdpMSZ7IomraBmVTzveEB73rv7uvHDaUT+4cHiNNkvFA8+SPWIjAcDNc5oTNTgFu6K
 i1Edp5a/IfBscXMCpbRPyqnz5Oxtm+u+Wrn51u7pSTK8/e5NhGvDz+ch+oEYByIsv1Tb
 CO2pTLKHw1si2FXT8XBqlmdacsIaQEI3ScVjBrvTiFsRKzDajdJesoXKAVR6TTB3DjC8
 6d2SDc70uOEiiUFJNfPNwskqw2DVK0AEJ6k6lnCZOX1EwzfIGCGuSLEFPgsk46RhY7hO
 1PEA==
X-Gm-Message-State: AOAM532Tp8WGejkuI9GOPamgLqgyE5+ZJwn148XygdyN7EShvNJD+3/h
 KWtU76OVFnkGkmzkR/hxZDqsaYfLPcogzg==
X-Google-Smtp-Source: ABdhPJyQw26AxsWzAFpae9w2lNhZD9CXPElQd8Krr7712FoLyLDkNp0V9whmYBJZx6fLAm4XZWFMHw==
X-Received: by 2002:adf:fd06:: with SMTP id e6mr20374563wrr.335.1623125291633; 
 Mon, 07 Jun 2021 21:08:11 -0700 (PDT)
Received: from localhost.localdomain ([197.61.123.212])
 by smtp.gmail.com with ESMTPSA id y189sm16862008wmy.25.2021.06.07.21.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:08:11 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 4/4] plugins/cache: Added FIFO and LRU eviction
 policies.
Date: Tue,  8 Jun 2021 06:05:32 +0200
Message-Id: <20210608040532.56449-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608040532.56449-1-ma.mandourr@gmail.com>
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x436.google.com
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

Implemented FIFO and LRU eviction policies.
Now one of the three eviction policies can be chosen as an argument. On
not specifying an argument, LRU is used by default.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 205 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 192 insertions(+), 13 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index d8e8c750b6..be817da5b6 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -34,6 +34,14 @@ static uint64_t dmisses;
 static uint64_t imem_accesses;
 static uint64_t imisses;
 
+enum EvictionPolicy {
+    LRU,
+    FIFO,
+    RAND,
+};
+
+enum EvictionPolicy policy;
+
 /*
  * A CacheSet is a set of cache blocks. A memory block that maps to a set can be
  * put in any of the blocks inside the set. The number of block per set is
@@ -53,6 +61,8 @@ static uint64_t imisses;
  * The set number is used to identify the set in which the block may exist.
  * The tag is compared against all the tags of a set to search for a match. If a
  * match is found, then the access is a hit.
+ *
+ * The CacheSet also contains bookkeaping information about eviction details.
  */
 
 struct CacheBlock {
@@ -62,6 +72,9 @@ struct CacheBlock {
 
 struct CacheSet {
     struct CacheBlock *blocks;
+    uint64_t *lru_priorities;
+    uint64_t lru_gen_counter;
+    GQueue *fifo_queue;
 };
 
 struct Cache {
@@ -82,6 +95,12 @@ struct InsnData {
     uint64_t imisses;
 };
 
+void (*update_hit)(struct Cache *cache, int set, int blk);
+void (*update_miss)(struct Cache *cache, int set, int blk);
+
+void (*metadata_init)(struct Cache *cache);
+void (*metadata_destroy)(struct Cache *cache);
+
 struct Cache *dcache, *icache;
 
 static int pow_of_two(int num)
@@ -104,6 +123,103 @@ static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
     return (addr & cache->set_mask) >> cache->blksize_shift;
 }
 
+/*
+ * LRU evection policy: For each set, a generation counter is maintained
+ * alongside a priority array.
+ *
+ * On each set access, the generation counter is incremented.
+ *
+ * On a cache hit: The hit-block is assigned the current generation counter,
+ * indicating that it is the most recently used block.
+ *
+ * On a cache miss: The block with the least priority is searched and replaced
+ * with the newly-cached block, of which the priority is set to the current
+ * generation number.
+ */
+
+static void lru_priorities_init(struct Cache *cache)
+{
+    int i, assoc;
+
+    assoc = cache->assoc;
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].lru_priorities = g_new0(uint64_t, assoc);
+    }
+}
+
+static void lru_update_blk(struct Cache *cache, int set_idx, int blk_idx)
+{
+    struct CacheSet *set = &cache->sets[set_idx];
+    set->lru_priorities[blk_idx] = cache->sets[set_idx].lru_gen_counter;
+    set->lru_gen_counter++;
+}
+
+static int lru_get_lru_block(struct Cache *cache, int set_idx)
+{
+    int i, min_idx, min_priority;
+
+    min_priority = cache->sets[set_idx].lru_priorities[0];
+    min_idx = 0;
+
+    for (i = 1; i < cache->assoc; i++) {
+        if (cache->sets[set_idx].lru_priorities[i] < min_priority) {
+            min_priority = cache->sets[set_idx].lru_priorities[i];
+            min_idx = i;
+        }
+    }
+    return min_idx;
+}
+
+static void lru_priorities_destroy(struct Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        g_free(cache->sets[i].lru_priorities);
+    }
+}
+
+/*
+ * FIFO eviction policy: a FIFO queue is maintained for each CacheSet that
+ * stores accesses to the cache.
+ *
+ * On a compulsory miss: The block index is enqueued to the fifo_queue to
+ * indicate that it's the latest cached block.
+ *
+ * On a conflict miss: The first-in block is removed from the cache and the new
+ * block is put in its place and enqueued to the FIFO queue.
+ */
+
+static void fifo_init(struct Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].fifo_queue = g_queue_new();
+    }
+}
+
+static int fifo_get_first_block(struct Cache *cache, int set)
+{
+    GQueue *q = cache->sets[set].fifo_queue;
+    return GPOINTER_TO_INT(g_queue_pop_tail(q));
+}
+
+static void fifo_update_on_miss(struct Cache *cache, int set, int blk_idx)
+{
+    GQueue *q = cache->sets[set].fifo_queue;
+    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
+}
+
+static void fifo_destroy(struct Cache *cache)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        g_queue_free(cache->sets[i].fifo_queue);
+    }
+}
+
 static bool bad_cache_params(int blksize, int assoc, int cachesize)
 {
     return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc) != 0);
@@ -128,11 +244,17 @@ static struct Cache *cache_init(int blksize, int assoc, int cachesize)
 
     for (i = 0; i < cache->num_sets; i++) {
         cache->sets[i].blocks = g_new0(struct CacheBlock, assoc);
+        cache->sets[i].lru_gen_counter = 0;
     }
 
     blk_mask = blksize - 1;
     cache->set_mask = ((cache->num_sets - 1) << cache->blksize_shift);
     cache->tag_mask = ~(cache->set_mask | blk_mask);
+
+    if (metadata_init) {
+        metadata_init(cache);
+    }
+
     return cache;
 }
 
@@ -149,12 +271,21 @@ static int get_invalid_block(struct Cache *cache, uint64_t set)
     return -1;
 }
 
-static int get_replaced_block(struct Cache *cache)
+static int get_replaced_block(struct Cache *cache, int set)
 {
-    return g_rand_int_range(rng, 0, cache->assoc);
+    switch (policy) {
+    case RAND:
+        return g_rand_int_range(rng, 0, cache->assoc);
+    case LRU:
+        return lru_get_lru_block(cache, set);
+    case FIFO:
+        return fifo_get_first_block(cache, set);
+    defalut:
+        g_assert_not_reached();
+    }
 }
 
-static bool in_cache(struct Cache *cache, uint64_t addr)
+static int in_cache(struct Cache *cache, uint64_t addr)
 {
     int i;
     uint64_t tag, set;
@@ -165,11 +296,11 @@ static bool in_cache(struct Cache *cache, uint64_t addr)
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
 
 /**
@@ -178,24 +309,32 @@ static bool in_cache(struct Cache *cache, uint64_t addr)
  * @addr: The address of the requested memory location
  *
  * Returns true if the requsted data is hit in the cache and false when missed.
- * The cache is updated on miss for the next access.
+ * The cache is then updated for subsequent accesses.
  */
 static bool access_cache(struct Cache *cache, uint64_t addr)
 {
+    int hit_blk, replaced_blk;
     uint64_t tag, set;
-    int replaced_blk;
-
-    if (in_cache(cache, addr)) {
-        return true;
-    }
 
     tag = extract_tag(cache, addr);
     set = extract_set(cache, addr);
 
+    hit_blk = in_cache(cache, addr);
+    if (hit_blk != -1) {
+        if (update_hit) {
+            update_hit(cache, set, hit_blk);
+        }
+        return true;
+    }
+
     replaced_blk = get_invalid_block(cache, set);
 
     if (replaced_blk == -1) {
-        replaced_blk = get_replaced_block(cache);
+        replaced_blk = get_replaced_block(cache, set);
+    }
+
+    if (update_miss) {
+        update_miss(cache, set, replaced_blk);
     }
 
     cache->sets[set].blocks[replaced_blk].tag = tag;
@@ -302,6 +441,10 @@ static void free_cache(struct Cache *cache)
         g_free(cache->sets[i].blocks);
     }
 
+    if (metadata_destroy) {
+        metadata_destroy(cache);
+    }
+
     g_free(cache->sets);
     g_free(cache);
 }
@@ -389,6 +532,28 @@ static void plugin_exit()
     g_mutex_unlock(&mtx);
 }
 
+static void policy_init()
+{
+    switch (policy) {
+    case LRU:
+        update_hit = lru_update_blk;
+        update_miss = lru_update_blk;
+        metadata_init = lru_priorities_init;
+        metadata_destroy = lru_priorities_destroy;
+        break;
+    case FIFO:
+        update_miss = fifo_update_on_miss;
+        metadata_init = fifo_init;
+        metadata_destroy = fifo_destroy;
+        break;
+    case RAND:
+        rng = g_rand_new();
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 QEMU_PLUGIN_EXPORT
 int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
@@ -408,7 +573,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     iblksize = 64;
     icachesize = iblksize * iassoc * 32;
 
-    rng = g_rand_new();
+    policy = LRU;
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
@@ -436,12 +601,26 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
             g_strfreev(toks);
         } else if (g_str_has_prefix(opt, "limit=")) {
             limit = g_ascii_strtoll(opt + 6, NULL, 10);
+        } else if (g_str_has_prefix(opt, "evict=")) {
+            gchar *p = opt + 6;
+            if (g_strcmp0(p, "rand") == 0) {
+                policy = RAND;
+            } else if (g_strcmp0(p, "lru") == 0) {
+                policy = LRU;
+            } else if (g_strcmp0(p, "fifo") == 0) {
+                policy = FIFO;
+            } else {
+                fprintf(stderr, "invalid eviction policy: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
 
+    policy_init();
+
     dcache = cache_init(dblksize, dassoc, dcachesize);
     if (!dcache) {
         fprintf(stderr, "dcache cannot be constructed from given parameters\n");
-- 
2.25.1


