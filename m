Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7205E6D8D6F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 04:27:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkFL2-0005KA-D7; Wed, 05 Apr 2023 22:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKu-0005Dz-Gv
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:53 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKr-0007ho-Q7
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680748010; x=1712284010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5SZrsjIl/mB+iqg8pDGatsH/Hcyyzb65uOJ38ijiHn4=;
 b=Ieuzjanm0AkHOGAvdOC4Ose9mmSHopoOL0vh82rmUsUgyns0lTjZuaOr
 7+dQ2HBNZy2IEBluSgII0ImPutZLq4UslzICBvH0FALbqdfpImhKUxCdT
 LVd14VXaHI/k59RR1cL40hk8+uALw70IZo0nHW930byYRGygDBggLf9F7
 +xdWVj/bDBRvSLi7LaTErw94qC7hWuxsMma7TebdrAZrruRjtBI/DjvlS
 kUXyuT7shYc8wKNQu72pdDuQuvL6+x/Wfx4jPDSG4J6hYagvkUUgjuw5b
 TQ/CagpH9ihVlRPKZhusBOwj2gGPYuShnKs+v9uFzA8DZmfJGuSWxvi/o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322269681"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322269681"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 19:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751487705"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="751487705"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 19:26:36 -0700
From: Fei Wu <fei2.wu@intel.com>
To: richard.henderson@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Thu,  6 Apr 2023 10:27:50 +0800
Message-Id: <20230406022751.757980-2-fei2.wu@intel.com>
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

The translation ratio of host to guest instruction count is one of the
key performance factor of binary translation. TCG doesn't collect host
instruction count at present, it does collect host instruction size
instead, although they are not the same thing as instruction size might
not be fixed, instruction size is still a valid estimation.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 accel/tcg/plugin-gen.c       | 1 +
 include/qemu/plugin.h        | 2 ++
 include/qemu/qemu-plugin.h   | 8 ++++++++
 plugins/api.c                | 5 +++++
 plugins/qemu-plugins.symbols | 1 +
 5 files changed, 17 insertions(+)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 5efb8db258..4a3ca8fa2f 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -881,6 +881,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
         ptb->mem_helper = false;
+        ptb->host_insn_size = &db->tb->tc.size;
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index bc0781cab8..b38fd139e1 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -151,6 +151,8 @@ struct qemu_plugin_tb {
     /* if set, the TB calls helpers that might access guest memory */
     bool mem_helper;
 
+    uint64_t *host_insn_size;
+
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
 
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 50a9957279..2397574a21 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -336,6 +336,14 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
  */
 size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_tb_n_insns() - query helper for host insns size in TB
+ * @tb: opaque handle to TB passed to callback
+ *
+ * Returns: address of host insns size of this block
+ */
+void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb);
+
 /**
  * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
  * @tb: opaque handle to TB passed to callback
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb..0d70cb1f0f 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -188,6 +188,11 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb)
     return tb->n;
 }
 
+void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb)
+{
+    return tb->host_insn_size;
+}
+
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
 {
     return tb->vaddr;
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..3e92c3b8ba 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -39,6 +39,7 @@
   qemu_plugin_start_code;
   qemu_plugin_tb_get_insn;
   qemu_plugin_tb_n_insns;
+  qemu_plugin_tb_host_insn_size;
   qemu_plugin_tb_vaddr;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
-- 
2.25.1


