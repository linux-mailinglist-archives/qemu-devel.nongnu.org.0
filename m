Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94E6941A1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNi-0005kP-4H; Mon, 13 Feb 2023 04:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNf-0005a7-5H
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:15 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNZ-0002kj-OQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281449; x=1707817449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6sx2xoPeUi9UWQYIRBggQhvuX755Dv7fYyMtVhuONw=;
 b=gsSNB2KacTq5dlvaZULwApImD4PGlWklDo4l12XTWLP2pC0HB9lX/fFg
 +mCaDyaGijE030yGqb84eVusHgquhIBtZ3gzBQZUE5aVWDcQN8mEsRYKk
 EAxB4RMK1Iafl8YN7AqWpHkk8116CtwoCmF3/JX86xtHsE2H66CWrFO/t
 SMkNxdnqdVwlR+fmDCe6UmMYpSMLr6TeW82djzVDYk8divv3Ss3NfDaMd
 tcOb9IO/jpm1+2/vFqT4wl+p4QcaghWuIDzn/2kpqsdOrrasjQpQaf/ob
 h4RNUpYgctS5VW2vr/ZdQJjsrESyCO1i9iz0XQ0yMhMsTRRN5ZNfvu15L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486570"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759892"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759892"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:00 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC 16/52] plugins: Use generic topology name and helper
Date: Mon, 13 Feb 2023 17:49:59 +0800
Message-Id: <20230213095035.158240-17-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

As the generic code, here we should respect the different topologies:
smp or hybrid.

So rename qemu_info_t.system.smp_vcpus to qemu_info_t.system.vcpus to
decouple with smp topology.

And use generic topology helpers to get topology information.

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexandre Iooss <erdnaxe@crans.org>
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 contrib/plugins/hwprofile.c | 2 +-
 include/qemu/qemu-plugin.h  | 4 ++--
 plugins/api.c               | 4 ++--
 plugins/loader.c            | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 691d4edb0c67..839175396932 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -307,7 +307,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     }
 
     /* Just warn about overflow */
-    if (info->system.smp_vcpus > 64 ||
+    if (info->system.vcpus > 64 ||
         info->system.max_vcpus > 64) {
         fprintf(stderr, "hwprofile: can only track up to 64 CPUs\n");
     }
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adfe3..529fcc54e43e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -74,8 +74,8 @@ typedef struct qemu_info_t {
     union {
         /** @system: information relevant to system emulation */
         struct {
-            /** @system.smp_vcpus: initial number of vCPUs */
-            int smp_vcpus;
+            /** @system.vcpus: initial number of vCPUs */
+            int vcpus;
             /** @system.max_vcpus: maximum possible number of vCPUs */
             int max_vcpus;
         } system;
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb02..22018083d0cd 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -374,7 +374,7 @@ int qemu_plugin_n_vcpus(void)
 #ifdef CONFIG_USER_ONLY
     return -1;
 #else
-    return get_ms()->smp.cpus;
+    return machine_topo_get_cpus(get_ms());
 #endif
 }
 
@@ -383,7 +383,7 @@ int qemu_plugin_n_max_vcpus(void)
 #ifdef CONFIG_USER_ONLY
     return -1;
 #else
-    return get_ms()->smp.max_cpus;
+    return machine_topo_get_max_cpus(get_ms());
 #endif
 }
 
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d6a..c17ece9acc49 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -298,8 +298,8 @@ int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     info->system_emulation = true;
-    info->system.smp_vcpus = ms->smp.cpus;
-    info->system.max_vcpus = ms->smp.max_cpus;
+    info->system.vcpus = machine_topo_get_cpus(ms);
+    info->system.max_vcpus = machine_topo_get_max_cpus(ms);
 #else
     info->system_emulation = false;
 #endif
-- 
2.34.1


