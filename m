Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E146941E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNe-0005FT-0y; Mon, 13 Feb 2023 04:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNX-0004by-4j
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:07 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNS-0002kj-ET
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281442; x=1707817442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WY6IxCCknZ3zJfmSFqMLb00x/oqyGd+SH7S/bFXoZ4s=;
 b=HN/A0SnTfzcSC8U2HSlwTloC0Y99BpPsYh4C8kU5rzzSZ8PN6mjhrkJD
 /rMYWWRgiE9opdc6PfJKKocAwoqM0USVoclgCrev0Wv4SKQ4Eh1VS5QTw
 LokJBtVi4ZeyaJ446tZ5tih/wY89N4uPA7H5+RFBkfW47MlUQeH4HilGr
 3k50GAfwU76iAFiJn8YBmAnZ3X6rz1sXiOk5uuuH5+wrfMWAsYh3/Ex90
 Ow0b6PaD/nGzSpHmuN5be8+2zZU2nQn90Iu7nryFjUX+K9OowT6szQ3vY
 db63h6Lj2LLnPZdOsPR64tl0UyygUiIM2fbbss9T0ZCksqPY9MeuvO5yb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486557"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759866"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759866"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:55 -0800
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
 Zhao Liu <zhao1.liu@intel.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC 15/52] migration/postcopy-ram: Use generic topology name and
 helper
Date: Mon, 13 Feb 2023 17:49:58 +0800
Message-Id: <20230213095035.158240-16-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
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

So rename PostcopyBlocktimeContext.smp_cpus_down to
PostcopyBlocktimeContext.cpus_down, and also rename other local
variables from smp_cpus to cpus_num, to decouple with smp topology.

And use generic topology helpers to get topology information.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 migration/postcopy-ram.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 53299b7a5ebd..1e861e313258 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -122,7 +122,7 @@ typedef struct PostcopyBlocktimeContext {
     /* point in time when last page fault was initiated */
     uint32_t last_begin;
     /* number of vCPU are suspended */
-    int smp_cpus_down;
+    int cpus_down;
     uint64_t start_time;
 
     /*
@@ -150,11 +150,11 @@ static void migration_exit_cb(Notifier *n, void *data)
 static struct PostcopyBlocktimeContext *blocktime_context_new(void)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int cpus_num = machine_topo_get_cpus(ms);
     PostcopyBlocktimeContext *ctx = g_new0(PostcopyBlocktimeContext, 1);
-    ctx->page_fault_vcpu_time = g_new0(uint32_t, smp_cpus);
-    ctx->vcpu_addr = g_new0(uintptr_t, smp_cpus);
-    ctx->vcpu_blocktime = g_new0(uint32_t, smp_cpus);
+    ctx->page_fault_vcpu_time = g_new0(uint32_t, cpus_num);
+    ctx->vcpu_addr = g_new0(uintptr_t, cpus_num);
+    ctx->vcpu_blocktime = g_new0(uint32_t, cpus_num);
 
     ctx->exit_notifier.notify = migration_exit_cb;
     ctx->start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
@@ -168,7 +168,7 @@ static uint32List *get_vcpu_blocktime_list(PostcopyBlocktimeContext *ctx)
     uint32List *list = NULL;
     int i;
 
-    for (i = ms->smp.cpus - 1; i >= 0; i--) {
+    for (i = machine_topo_get_cpus(ms) - 1; i >= 0; i--) {
         QAPI_LIST_PREPEND(list, ctx->vcpu_blocktime[i]);
     }
 
@@ -798,7 +798,7 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
 
     low_time_offset = get_low_time_offset(dc);
     if (dc->vcpu_addr[cpu] == 0) {
-        qatomic_inc(&dc->smp_cpus_down);
+        qatomic_inc(&dc->cpus_down);
     }
 
     qatomic_xchg(&dc->last_begin, low_time_offset);
@@ -814,7 +814,7 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
     if (already_received) {
         qatomic_xchg(&dc->vcpu_addr[cpu], 0);
         qatomic_xchg(&dc->page_fault_vcpu_time[cpu], 0);
-        qatomic_dec(&dc->smp_cpus_down);
+        qatomic_dec(&dc->cpus_down);
     }
     trace_mark_postcopy_blocktime_begin(addr, dc, dc->page_fault_vcpu_time[cpu],
                                         cpu, already_received);
@@ -852,7 +852,7 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyBlocktimeContext *dc = mis->blocktime_ctx;
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int cpus_num = machine_topo_get_cpus(ms);
     int i, affected_cpu = 0;
     bool vcpu_total_blocktime = false;
     uint32_t read_vcpu_time, low_time_offset;
@@ -866,7 +866,7 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
      * that algorithm looks straightforward, but it's not
      * optimal, more optimal algorithm is keeping tree or hash
      * where key is address value is a list of  */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < cpus_num; i++) {
         uint32_t vcpu_blocktime = 0;
 
         read_vcpu_time = qatomic_fetch_add(&dc->page_fault_vcpu_time[i], 0);
@@ -881,14 +881,14 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
          * faulted page, another possible case it's prefetched
          * page and in that case we shouldn't be here */
         if (!vcpu_total_blocktime &&
-            qatomic_fetch_add(&dc->smp_cpus_down, 0) == smp_cpus) {
+            qatomic_fetch_add(&dc->cpus_down, 0) == cpus_num) {
             vcpu_total_blocktime = true;
         }
         /* continue cycle, due to one page could affect several vCPUs */
         dc->vcpu_blocktime[i] += vcpu_blocktime;
     }
 
-    qatomic_sub(&dc->smp_cpus_down, affected_cpu);
+    qatomic_sub(&dc->cpus_down, affected_cpu);
     if (vcpu_total_blocktime) {
         dc->total_blocktime += low_time_offset - qatomic_fetch_add(
                 &dc->last_begin, 0);
-- 
2.34.1


