Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611539ED64
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:09:45 +0200 (CEST)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqT3g-0006Y5-71
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2D-0003rJ-7J
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2A-0008Lv-PD
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so1011985wms.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1I2CE71tnr4W36avsXm1UTgdaLBFwCxU4cDRslNiU+M=;
 b=k0jJu/b7utSLBB5fxRuXKI+3oYANnCwFlm87fYiYLkTEc/UzuOJNzFKZ14gevZDypv
 LK8AkupXEhi3vAuGhhrjJaqgZxRb8bnBMEZ442gK1XMkGh9eDM8jJQXfVLAj06LhYuok
 /YP/myT9S6+E+xjPptcjic9gb8lGoszFBxFIpepKcnAKyy6kb7cFz2Fz7nPDwB6/Fzdp
 kKthy3lZkbyTBGLzHSkeAPHa1XQ7e3A5eE2guqlkwTqs8eWLs2sQ2wA7teR/2VYktVQ0
 +Y5RF8UEYrPTRiRjDcwSlCnXj2mBsdNw90AmGPw3JmzrO14g3P9kT4Y3rKRBxKS0mRFP
 Sv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1I2CE71tnr4W36avsXm1UTgdaLBFwCxU4cDRslNiU+M=;
 b=iv1bpPgYTDjrQ4sRweRgj7nELkp6D83D3We8tDqPPL6OJnaK3gqKfUmWwrR2wTq+vY
 J0vd6T0qP57eAVx8Medh9+3ksWmnkm0m0LCP0Iqf4gsBxgLjAYV94Juhv1ndAfBzPpte
 F0/41IybFBxMvvgeLQtYEPQHZ6o4FFNbD6HNB/5QPmjHuHWQQw8nHWenLwIqdFdFBo9+
 hYGVhe8JjsNgMQZ0W2mOh/ASX1dCMbR0udH4hk2TR9KRR6WMb+2cGpMHx6heAYMPOO9o
 kVwj+BR3jdrNw/ym2GS4wdfWGYmcCbL0JPm6aP7zKC4IyRpGo4li38kx1gChGqkxkuQx
 l+ZQ==
X-Gm-Message-State: AOAM532bREdgtoYWHDwOvWPLQSCpuVS/bR5EAVwcSK3AwXSRDHKmohqd
 /ZOb5R7v1Fe1gTZCV1Ej9yU0NAK0T1vyvg==
X-Google-Smtp-Source: ABdhPJyNZ9sBW6/6WuQmkeIgIkvHsNwEgXmXRcjytatRLWKktU7rS52FxIiy/zf41peLH1LqbjoTaw==
X-Received: by 2002:a1c:3183:: with SMTP id x125mr1988251wmx.80.1623125288996; 
 Mon, 07 Jun 2021 21:08:08 -0700 (PDT)
Received: from localhost.localdomain ([197.61.123.212])
 by smtp.gmail.com with ESMTPSA id y189sm16862008wmy.25.2021.06.07.21.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:08:08 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/4] plugins: Added a new cache modelling plugin.
Date: Tue,  8 Jun 2021 06:05:30 +0200
Message-Id: <20210608040532.56449-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608040532.56449-1-ma.mandourr@gmail.com>
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
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

Added a cache modelling plugin that uses a static configuration used in
many of the commercial microprocessors and uses random eviction policy.

The purpose of the plugin is to identify the most cache-thrashing
instructions for both instruction cache and data cache.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/Makefile |   1 +
 contrib/plugins/cache.c  | 423 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 424 insertions(+)
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
index 0000000000..715e5443b0
--- /dev/null
+++ b/contrib/plugins/cache.c
@@ -0,0 +1,423 @@
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
+static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
+
+static GRand *rng;
+static GHashTable *miss_ht;
+
+static GMutex mtx;
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
+/*
+ * A CacheSet is a set of cache blocks. A memory block that maps to a set can be
+ * put in any of the blocks inside the set. The number of block per set is
+ * called the associativity (assoc).
+ *
+ * Each block contains the the stored tag and a valid bit. Since this is not
+ * a functional simulator, the data itself is not stored. We only identify
+ * whether a block is in the cache or not by searching for its tag.
+ *
+ * In order to search for memory data in the cache, the set identifier and tag
+ * are extracted from the address and the set is probed to see whether a tag
+ * match occur.
+ *
+ * An address is logically divided into three portions: The block offset,
+ * the set number, and the tag.
+ *
+ * The set number is used to identify the set in which the block may exist.
+ * The tag is compared against all the tags of a set to search for a match. If a
+ * match is found, then the access is a hit.
+ */
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
+    int cachesize;
+    int assoc;
+    int blksize_shift;
+    uint64_t set_mask;
+    uint64_t tag_mask;
+};
+
+struct InsnData {
+    char *disas_str;
+    const char *symbol;
+    uint64_t addr;
+    uint64_t dmisses;
+    uint64_t imisses;
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
+    return addr & cache->tag_mask;
+}
+
+static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
+{
+    return (addr & cache->set_mask) >> cache->blksize_shift;
+}
+
+static struct Cache *cache_init(int blksize, int assoc, int cachesize)
+{
+    struct Cache *cache;
+    int i;
+    uint64_t blk_mask;
+
+    cache = g_new(struct Cache, 1);
+    cache->assoc = assoc;
+    cache->cachesize = cachesize;
+    cache->num_sets = cachesize / (blksize * assoc);
+    cache->sets = g_new(struct CacheSet, cache->num_sets);
+    cache->blksize_shift = pow_of_two(blksize);
+
+    for (i = 0; i < cache->num_sets; i++) {
+        cache->sets[i].blocks = g_new0(struct CacheBlock, assoc);
+    }
+
+    blk_mask = blksize - 1;
+    cache->set_mask = ((cache->num_sets - 1) << cache->blksize_shift);
+    cache->tag_mask = ~(cache->set_mask | blk_mask);
+    return cache;
+}
+
+static int get_invalid_block(struct Cache *cache, uint64_t set)
+{
+    int i;
+
+    for (i = 0; i < cache->assoc; i++) {
+        if (!cache->sets[set].blocks[i].valid) {
+            return i;
+        }
+    }
+
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
+/**
+ * access_cache(): Simulate a cache access
+ * @cache: The cache under simulation
+ * @addr: The address of the requested memory location
+ *
+ * Returns true if the requsted data is hit in the cache and false when missed.
+ * The cache is updated on miss for the next access.
+ */
+static bool access_cache(struct Cache *cache, uint64_t addr)
+{
+    uint64_t tag, set;
+    int replaced_blk;
+
+    if (in_cache(cache, addr)) {
+        return true;
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
+    return false;
+}
+
+static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_t info,
+                            uint64_t vaddr, void *userdata)
+{
+    uint64_t insn_addr;
+    uint64_t effective_addr;
+    struct qemu_plugin_hwaddr *hwaddr;
+    struct InsnData *insn;
+
+    g_mutex_lock(&mtx);
+    hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
+        g_mutex_unlock(&mtx);
+        return;
+    }
+
+    insn_addr = ((struct InsnData *) userdata)->addr;
+    effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
+
+    if (!access_cache(dcache, effective_addr)) {
+        insn = (struct InsnData *) userdata;
+        insn->dmisses++;
+        dmisses++;
+    }
+    dmem_accesses++;
+    g_mutex_unlock(&mtx);
+}
+
+static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
+{
+    uint64_t insn_addr;
+    struct InsnData *insn;
+
+    g_mutex_lock(&mtx);
+    insn_addr = ((struct InsnData *) userdata)->addr;
+
+    if (!access_cache(icache, insn_addr)) {
+        insn = (struct InsnData *) userdata;
+        insn->imisses++;
+        imisses++;
+    }
+    imem_accesses++;
+    g_mutex_unlock(&mtx);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns;
+    size_t i;
+    struct InsnData *data;
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
+        /*
+         * Instructions might get translated multiple times, we do not create
+         * new entries for those instructions. Instead, we fetch the same
+         * entry from the hash table and register it for the callback again.
+         */
+        data = g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effective_addr));
+        if (data == NULL) {
+            data = g_new0(struct InsnData, 1);
+            data->disas_str = qemu_plugin_insn_disas(insn);
+            data->symbol = qemu_plugin_insn_symbol(insn);
+            data->addr = effective_addr;
+            g_hash_table_insert(miss_ht, GUINT_TO_POINTER(effective_addr),
+                               (gpointer) data);
+        }
+
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         rw, data);
+
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                               QEMU_PLUGIN_CB_NO_REGS, data);
+    }
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
+    g_free(cache);
+}
+
+static int dcmp(gconstpointer a, gconstpointer b)
+{
+    struct InsnData *insn_a = (struct InsnData *) a;
+    struct InsnData *insn_b = (struct InsnData *) b;
+
+    return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
+}
+
+static int icmp(gconstpointer a, gconstpointer b)
+{
+    struct InsnData *insn_a = (struct InsnData *) a;
+    struct InsnData *insn_b = (struct InsnData *) b;
+
+    return insn_a->imisses < insn_b->imisses ? 1 : -1;
+}
+
+static void log_stats()
+{
+    g_autoptr(GString) rep = g_string_new("");
+    g_string_append_printf(rep,
+        "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+        dmem_accesses,
+        dmisses,
+        ((double) dmisses / dmem_accesses) * 100.0);
+
+    g_string_append_printf(rep,
+        "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
+        imem_accesses,
+        imisses,
+        ((double) imisses / imem_accesses) * 100.0);
+
+    qemu_plugin_outs(rep->str);
+}
+
+static void plugin_exit()
+{
+    GList *curr, *miss_insns;
+    int i;
+    struct InsnData *insn;
+
+    g_mutex_lock(&mtx);
+
+    log_stats();
+
+    miss_insns = g_hash_table_get_values(miss_ht);
+    miss_insns = g_list_sort(miss_insns, dcmp);
+    g_autoptr(GString) rep = g_string_new("");
+    g_string_append_printf(rep, "%s", "address, data misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (struct InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->dmisses,
+                               insn->disas_str);
+    }
+
+    miss_insns = g_list_sort(miss_insns, icmp);
+    g_string_append_printf(rep, "%s", "\naddress, fetch misses, instruction\n");
+
+    for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
+        insn = (struct InsnData *) curr->data;
+        g_string_append_printf(rep, "0x%" PRIx64, insn->addr);
+        if (insn->symbol) {
+            g_string_append_printf(rep, " (%s)", insn->symbol);
+        }
+        g_string_append_printf(rep, ", %ld, %s\n", insn->imisses,
+                               insn->disas_str);
+    }
+
+    qemu_plugin_outs(rep->str);
+
+    free_cache(dcache);
+    free_cache(icache);
+
+    g_list_free(miss_insns);
+
+    g_hash_table_destroy(miss_ht);
+    g_mutex_unlock(&mtx);
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
+    miss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL, free_insn);
+
+    return 0;
+}
-- 
2.25.1


