Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DA6D8D70
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 04:27:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkFL6-0005Tz-9D; Wed, 05 Apr 2023 22:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKy-0005K8-Ms
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:57 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKv-0007ho-Rx
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680748014; x=1712284014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kDHQnfJgU6ibBWZVvy1+72aoPESwVWeS6Oj+qyGolVs=;
 b=L55vAleDs+ZSOZebTJrFhLtudRcfTGPxdyGiSKrnH4ahuZLuxzGkGeo9
 ZywKxM2h30kyCP24bpF28mE+4ZodfOah9k2RyxokNyIloFW07FACiJgcG
 N9lH2MjbV7W1UGy4JJ/lzdK1KLXX4JD1W7B4M9AMy3hQWwAIrKRGlXtEc
 3dPoI/ksAk1R3h4RwLeqGZjf/xVurUFnfw0gBNp0GQLUW58ZSCrsqWU4V
 sI+DPTjk/iEvN1Ri3oQj2eHMvQjkCC/p7bWY9HCALEt34CZwsK8sZ++gl
 loSdAOzwTjDqylMo2APoIqTOiZ2VQyWtsZaQOtJvHGEZeKvmDaZLzY+ww Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322269685"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322269685"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 19:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751487715"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="751487715"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 19:26:42 -0700
From: Fei Wu <fei2.wu@intel.com>
To: richard.henderson@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH 2/2] plugins/hotblocks: add host insn size
Date: Thu,  6 Apr 2023 10:27:51 +0800
Message-Id: <20230406022751.757980-3-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406022751.757980-1-fei2.wu@intel.com>
References: <20230406022751.757980-1-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=fei2.wu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's only valid when inline=false, otherwise it's default to 0.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 contrib/plugins/hotblocks.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 062200a7a4..c9716da7fe 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -37,6 +37,8 @@ typedef struct {
     uint64_t exec_count;
     int      trans_count;
     unsigned long insns;
+    void    *p_host_insn_size;
+    uint64_t host_insn_size;
 } ExecCount;
 
 static gint cmp_exec_count(gconstpointer a, gconstpointer b)
@@ -59,13 +61,17 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     it = g_list_sort(counts, cmp_exec_count);
 
     if (it) {
-        g_string_append_printf(report, "pc, tcount, icount, ecount\n");
+        g_string_append_printf(report,
+                               "host isize is only valid when inline=false\n"
+                               "pc, tcount, icount, ecount, host isize\n");
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             ExecCount *rec = (ExecCount *) it->data;
-            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64"\n",
+            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"PRId64
+                                   ", %"PRIu64"\n",
                                    rec->start_addr, rec->trans_count,
-                                   rec->insns, rec->exec_count);
+                                   rec->insns, rec->exec_count,
+                                   rec->host_insn_size);
         }
 
         g_list_free(it);
@@ -82,14 +88,13 @@ static void plugin_init(void)
 
 static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
 {
-    ExecCount *cnt;
-    uint64_t hash = (uint64_t) udata;
+    ExecCount *cnt = (ExecCount *) udata;
 
     g_mutex_lock(&lock);
-    cnt = (ExecCount *) g_hash_table_lookup(hotblocks, (gconstpointer) hash);
-    /* should always succeed */
-    g_assert(cnt);
     cnt->exec_count++;
+    if (cnt->host_insn_size == 0) {
+        cnt->host_insn_size = *((uint64_t *)cnt->p_host_insn_size);
+    }
     g_mutex_unlock(&lock);
 }
 
@@ -114,6 +119,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         cnt->start_addr = pc;
         cnt->trans_count = 1;
         cnt->insns = insns;
+        cnt->p_host_insn_size = qemu_plugin_tb_host_insn_size(tb);
         g_hash_table_insert(hotblocks, (gpointer) hash, (gpointer) cnt);
     }
 
@@ -125,7 +131,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     } else {
         qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
                                              QEMU_PLUGIN_CB_NO_REGS,
-                                             (void *)hash);
+                                             (void *)cnt);
     }
 }
 
-- 
2.25.1


