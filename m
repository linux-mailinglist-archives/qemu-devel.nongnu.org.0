Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B3394CEA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 17:25:31 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln0qA-0006oU-OK
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 11:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n9-0001M3-GQ
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n5-0006eX-Bn
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c3so6166021wrp.8
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OrbkiY834csv3Yxp5ryuGtCuPFWhDkCpFIaiXtPwQE=;
 b=HJt9Hxh57AcNLJCLo24k+jbbjRDIhDQNGXN2NnBWOq3HiLw2pIK+k1TR4jni977yX0
 dbM9PxxGk96J/BMKuuVYGFzI8tlKuws/+LZwhkJDV1jcJWlk8/NkohTsQgVI3v4Gsx9D
 i/V39cvxBfak6iXMQQKWL9+evDK1/kqJSDSoTX4TneuLo56yz6dpn0S2d56umbOFxzVs
 orMea5B9iTe2h5fLt4RbhozUMq5UU23UvAeB02etb+2i5l7ODLkRL+wbCZ+cV3DeJDQU
 u3SKMbr4YkbsNrbUJpXeN3qhAtO5fxNBgnEIHl2UXA1nA+jPgi8n5zP+JSSkC71OstKb
 1maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OrbkiY834csv3Yxp5ryuGtCuPFWhDkCpFIaiXtPwQE=;
 b=LMWD+nD6HnL2ZAHXOtE2YPB2xK3oZLALKzCIhwsFnKqNchNckLRzb7Tb0/plZ65gfM
 C/3rtHStsuNHQ6ZSYlm230OmCdqTv8rSEA1Iry/4/4DJYNujinvlOYry9saIf8I4Fzo/
 ZmG6KsI0NKmpXxWb+I83HHI9uHIeeBrc9yJ3T8DqEYR9bOuDleUTKiutiHn5+dA+qgZL
 IRmhoZYsgEAWeLZYu2rppUiE6SvkPs6S0e6UItZoWK1owf1XAES5XuznWsl4lOOX7Jde
 MISPMXDbiWWOGrieH3PX2ZpYAcUGPa/HaLkv1PweDegExpivhVYCfGwGhkC+Okuplvox
 4+QQ==
X-Gm-Message-State: AOAM530tclCjNCQ4f1NNyTGxT7OsPfjj31J1FkWiSB80Gg4xwIfj2OGT
 GzyQOYVrKgVFOGSa6UY4a5HfgfeZmk4iWw==
X-Google-Smtp-Source: ABdhPJwtyx3yPYuqR20eue13mZwvGeHp5ZePrBNHW+mS/eayAfV9TPLRLcRI/0FsQu+SZmPcZ6Zgxw==
X-Received: by 2002:adf:efca:: with SMTP id i10mr203903wrp.139.1622301737751; 
 Sat, 29 May 2021 08:22:17 -0700 (PDT)
Received: from localhost.localdomain ([102.47.172.201])
 by smtp.gmail.com with ESMTPSA id s7sm17019164wmh.35.2021.05.29.08.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:22:17 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] plugins: Added a new cache modelling plugin
Date: Sat, 29 May 2021 17:22:01 +0200
Message-Id: <20210529152203.40358-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210529152203.40358-1-ma.mandourr@gmail.com>
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
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

Added a cache modelling plugin that uses a static configuration used in
many of the commercial microprocessors and uses random eviction policy.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/Makefile |   1 +
 contrib/plugins/cache.c  | 398 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 399 insertions(+)
 create mode 100644 contrib/plugins/cache.c

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..2237b47f8b 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -18,6 +18,7 @@ NAMES += hotpages
 NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
+NAMES += cache
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
new file mode 100644
index 0000000000..f8c15ebed2
--- /dev/null
+++ b/contrib/plugins/cache.c
@@ -0,0 +1,398 @@
+/*
+ * Copyright (C) 2021, Mahmoud Mandour <ma.mandourr@gmail.com>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static GRand *rng;
+static GHashTable *dmiss_ht;
+static GHashTable *imiss_ht;
+
+static GMutex dmtx, imtx;
+
+static int limit;
+static bool sys;
+
+static uint64_t dmem_accesses;
+static uint64_t dmisses;
+
+static uint64_t imem_accesses;
+static uint64_t imisses;
+
+static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
+
+enum AccessResult {
+    HIT = 0,
+    MISS = 1
+};
+
+struct InsnData {
+    char *disas_str;
+    uint64_t addr;
+    uint64_t misses;
+};
+
+struct CacheBlock {
+    uint64_t tag;
+    bool valid;
+};
+
+struct CacheSet {
+    struct CacheBlock *blocks;
+};
+
+struct Cache {
+    struct CacheSet *sets;
+    int num_sets;
+
+    int cachesize;
+    int blksize;
+    int assoc;
+
+    uint64_t blk_mask;
+    uint64_t set_mask;
+    uint64_t tag_mask;
+};
+
+struct Cache *dcache, *icache;
+
+static int pow_of_two(int num)
+{
+    g_assert((num & (num - 1)) == 0);
+    int ret = 0;
+    while (num /= 2) {
+        ret++;
+    }
+    return ret;
+}
+
+static inline uint64_t extract_tag(struct Cache *cache, uint64_t addr)
+{
+    return (addr & cache->tag_mask) >>
+        (pow_of_two(cache->num_sets) + pow_of_two(cache->blksize));
+}
+
+static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
+{
+    return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
+}
+
+static struct Cache *cache_init(int blksize, int assoc, int cachesize)
+{
+    struct Cache *cache;
+    int i;
+
+    cache = g_new(struct Cache, 1);
+    cache->blksize = blksize;
+    cache->assoc = assoc;
+    cache->cachesize = cachesize;
+    cache->num_sets = cachesize / (blksize * assoc);
+    cache->sets = g_new(struct CacheSet, cache->num_sets);
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].blocks = g_new0(struct CacheBlock, assoc);
+    }
+
+    cache->blk_mask = blksize - 1;
+    cache->set_mask = ((cache->num_sets - 1) << (pow_of_two(cache->blksize)));
+    cache->tag_mask = ~(cache->set_mask | cache->blk_mask);
+
+    return cache;
+}
+
+static int get_invalid_block(struct Cache *cache, uint64_t set)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (!cache->sets[set].blocks[i].valid) {
+            /* conflict miss */
+            return i;
+        }
+    }
+
+    /* compulsary miss */
+    return -1;
+}
+
+static int get_replaced_block(struct Cache *cache)
+{
+    return g_rand_int_range(rng, 0, cache->assoc);
+}
+
+static bool in_cache(struct Cache *cache, uint64_t addr)
+{
+    int i;
+    uint64_t tag, set;
+
+    tag = extract_tag(cache, addr);
+    set = extract_set(cache, addr);
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (cache->sets[set].blocks[i].tag == tag &&
+                cache->sets[set].blocks[i].valid) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)
+{
+    uint64_t tag, set;
+    int replaced_blk;
+
+    if (in_cache(cache, addr)) {
+        return HIT;
+    }
+
+    tag = extract_tag(cache, addr);
+    set = extract_set(cache, addr);
+
+    replaced_blk = get_invalid_block(cache, set);
+
+    if (replaced_blk == -1) {
+        replaced_blk = get_replaced_block(cache);
+    }
+
+    cache->sets[set].blocks[replaced_blk].tag = tag;
+    cache->sets[set].blocks[replaced_blk].valid = true;
+
+    return MISS;
+}
+
+struct InsnData *get_or_create(GHashTable *ht, struct InsnData *insn_data,
+                               uint64_t addr)
+{
+    struct InsnData *insn = g_hash_table_lookup(ht, GUINT_TO_POINTER(addr));
+    if (!insn) {
+        g_hash_table_insert(ht, GUINT_TO_POINTER(addr), (gpointer) insn_data);
+        insn = insn_data;
+    }
+
+    return insn;
+}
+
+static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_t info,
+                            uint64_t vaddr, void *userdata)
+{
+    uint64_t insn_addr;
+    uint64_t effective_addr;
+    struct qemu_plugin_hwaddr *hwaddr;
+
+    g_mutex_lock(&dmtx);
+    hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
+        g_free(userdata);
+        return;
+    }
+
+    insn_addr = ((struct InsnData *) userdata)->addr;
+    effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
+
+    if (access_cache(dcache, effective_addr) == MISS) {
+        struct InsnData *insn = get_or_create(dmiss_ht, userdata, insn_addr);
+        insn->misses++;
+        dmisses++;
+    }
+    dmem_accesses++;
+    g_mutex_unlock(&dmtx);
+}
+
+static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
+{
+    uint64_t addr;
+
+    g_mutex_lock(&imtx);
+    addr = ((struct InsnData *) userdata)->addr;
+
+    if (access_cache(icache, addr) == MISS) {
+        struct InsnData *insn = get_or_create(imiss_ht, userdata, addr);
+        insn->misses++;
+        imisses++;
+    }
+    imem_accesses++;
+    g_mutex_unlock(&imtx);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns;
+    size_t i;
+
+    n_insns = qemu_plugin_tb_n_insns(tb);
+    for (i = 0; i < n_insns; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        uint64_t effective_addr;
+
+        if (sys) {
+            effective_addr = (uint64_t) qemu_plugin_insn_haddr(insn);
+        } else {
+            effective_addr = (uint64_t) qemu_plugin_insn_vaddr(insn);
+        }
+
+        struct InsnData *ddata = g_new(struct InsnData, 1);
+        struct InsnData *idata = g_new(struct InsnData, 1);
+
+        ddata->disas_str = qemu_plugin_insn_disas(insn);
+        ddata->misses = 0;
+        ddata->addr = effective_addr;
+
+        idata->disas_str = g_strdup(ddata->disas_str);
+        idata->misses = 0;
+        idata->addr = effective_addr;
+
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         rw, ddata);
+
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                               QEMU_PLUGIN_CB_NO_REGS, idata);
+    }
+}
+
+static void print_entry(gpointer data)
+{
+    struct InsnData *insn = (struct InsnData *) data;
+    g_autoptr(GString) xx = g_string_new("");
+    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
+            insn->addr, insn->disas_str, insn->misses);
+    qemu_plugin_outs(xx->str);
+}
+
+static void free_insn(gpointer data)
+{
+    struct InsnData *insn = (struct InsnData *) data;
+    g_free(insn->disas_str);
+    g_free(insn);
+}
+
+static void free_cache(struct Cache *cache)
+{
+    for (int i = 0; i < cache->num_sets; i++) {
+        g_free(cache->sets[i].blocks);
+    }
+
+    g_free(cache->sets);
+}
+
+static int cmp(gconstpointer a, gconstpointer b)
+{
+    struct InsnData *insn_a = (struct InsnData *) a;
+    struct InsnData *insn_b = (struct InsnData *) b;
+
+    return insn_a->misses < insn_b->misses ? 1 : -1;
+}
+
+static void print_stats()
+{
+    g_autoptr(GString) rep = g_string_new("");
+    g_string_append_printf(rep,
+            "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+            dmem_accesses,
+            dmisses,
+            ((double)dmisses / dmem_accesses) * 100.0);
+
+    g_string_append_printf(rep,
+            "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+            imem_accesses,
+            imisses,
+            ((double)imisses / imem_accesses) * 100.0);
+
+    qemu_plugin_outs(rep->str);
+}
+
+static void plugin_exit()
+{
+    GList *curr;
+    int i;
+
+    g_mutex_lock(&imtx);
+    g_mutex_lock(&dmtx);
+    GList *dmiss_insns = g_hash_table_get_values(dmiss_ht);
+    GList *imiss_insns = g_hash_table_get_values(imiss_ht);
+    dmiss_insns = g_list_sort(dmiss_insns, cmp);
+    imiss_insns = g_list_sort(imiss_insns, cmp);
+
+    print_stats();
+
+    qemu_plugin_outs("Most data-missing instructions\n");
+    for (curr = dmiss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        print_entry(curr->data);
+    }
+
+    qemu_plugin_outs("\nMost fetch-missing instructions\n");
+    for (curr = imiss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        print_entry(curr->data);
+    }
+
+    free_cache(dcache);
+    free_cache(icache);
+
+    g_list_free(dmiss_insns);
+    g_list_free(imiss_insns);
+
+    g_hash_table_destroy(dmiss_ht);
+    g_hash_table_destroy(imiss_ht);
+
+    g_mutex_unlock(&dmtx);
+    g_mutex_unlock(&imtx);
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    int i;
+    int iassoc, iblksize, icachesize;
+    int dassoc, dblksize, dcachesize;
+
+    limit = 32;
+    sys = info->system_emulation;
+
+    dassoc = 8;
+    dblksize = 64;
+    dcachesize = dblksize * dassoc * 32;
+
+    iassoc = 8;
+    iblksize = 64;
+    icachesize = iblksize * iassoc * 32;
+
+    rng = g_rand_new();
+
+    for (i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        if (g_str_has_prefix(opt, "limit=")) {
+            limit = g_ascii_strtoull(opt + 6, NULL, 10);
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
+    dcache = cache_init(dblksize, dassoc, dcachesize);
+    icache = cache_init(iblksize, iassoc, icachesize);
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    dmiss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL, free_insn);
+    imiss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL, free_insn);
+
+    return 0;
+}
-- 
2.25.1


