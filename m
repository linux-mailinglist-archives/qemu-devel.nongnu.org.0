Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDD44356A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:17:26 +0100 (CET)
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyLd-00068w-BJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy9N-00050W-QC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy9L-0003ES-1A
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCPlJwz20dvo9LjFvfUlYknIDODH+9s13N4cFn8+m3Q=;
 b=dCdiT2J0zaYUbw5kKcK0A6zcLeTMyQTZ7NoWv4KSr0VZ+IcrInzJ4AWOiEAUPeL16g+Lxy
 wGfvrGvo4+BF49dMd7Yfy8utb67sLvlnwQhQcXExGQ208qe0Z3yiRd3vdXK0/+dzeSs7FW
 o7MpDn3NHAKPu75H+oWzTeAAdHIRbDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-WGeGJ2JpNleYskvhgRQqkQ-1; Tue, 02 Nov 2021 14:04:39 -0400
X-MC-Unique: WGeGJ2JpNleYskvhgRQqkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09E355074B;
 Tue,  2 Nov 2021 18:04:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B555F19C59;
 Tue,  2 Nov 2021 18:03:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] qapi: introduce x-query-jit QMP command
Date: Tue,  2 Nov 2021 17:56:59 +0000
Message-Id: <20211102175700.1175996-18-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info jit" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/tcg/cpu-exec.c       | 37 ++++++++++++----
 accel/tcg/hmp.c            | 15 ++-----
 accel/tcg/translate-all.c  | 80 ++++++++++++++++++----------------
 include/exec/cpu-all.h     |  4 +-
 include/tcg/tcg.h          |  2 +-
 qapi/machine.json          | 13 ++++++
 tcg/tcg.c                  | 88 ++++++++++++++++++++------------------
 tests/qtest/qmp-cmd-test.c |  2 +
 8 files changed, 140 insertions(+), 101 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c9764c1325..4212645cb6 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -20,6 +20,9 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/type-helpers.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
@@ -38,6 +41,7 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
 #include "tb-hash.h"
 #include "tb-context.h"
@@ -1028,23 +1032,38 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
 
-void dump_drift_info(void)
+void dump_drift_info(GString *buf)
 {
     if (!icount_enabled()) {
         return;
     }
 
-    qemu_printf("Host - Guest clock  %"PRIi64" ms\n",
-                (cpu_get_clock() - icount_get()) / SCALE_MS);
+    g_string_append_printf(buf, "Host - Guest clock  %"PRIi64" ms\n",
+                           (cpu_get_clock() - icount_get()) / SCALE_MS);
     if (icount_align_option) {
-        qemu_printf("Max guest delay     %"PRIi64" ms\n",
-                    -max_delay / SCALE_MS);
-        qemu_printf("Max guest advance   %"PRIi64" ms\n",
-                    max_advance / SCALE_MS);
+        g_string_append_printf(buf, "Max guest delay     %"PRIi64" ms\n",
+                               -max_delay / SCALE_MS);
+        g_string_append_printf(buf, "Max guest advance   %"PRIi64" ms\n",
+                               max_advance / SCALE_MS);
     } else {
-        qemu_printf("Max guest delay     NA\n");
-        qemu_printf("Max guest advance   NA\n");
+        g_string_append_printf(buf, "Max guest delay     NA\n");
+        g_string_append_printf(buf, "Max guest advance   NA\n");
     }
 }
 
+HumanReadableText *qmp_x_query_jit(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "JIT information is only available with accel=tcg");
+        return NULL;
+    }
+
+    dump_exec_info(buf);
+    dump_drift_info(buf);
+
+    return human_readable_text_from_str(buf);
+}
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index a6e72fdb3e..01c767a464 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -1,20 +1,11 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "exec/exec-all.h"
 #include "monitor/monitor.h"
 #include "sysemu/tcg.h"
 
-static void hmp_info_jit(Monitor *mon, const QDict *qdict)
-{
-    if (!tcg_enabled()) {
-        error_report("JIT information is only available with accel=tcg");
-        return;
-    }
-
-    dump_exec_info();
-    dump_drift_info();
-}
-
 static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 {
     dump_opcount_info();
@@ -22,7 +13,7 @@ static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 
 static void hmp_tcg_register(void)
 {
-    monitor_register_hmp("jit", true, hmp_info_jit);
+    monitor_register_hmp_info_hrt("jit", qmp_x_query_jit);
     monitor_register_hmp("opcount", true, hmp_info_opcount);
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index fb9ebfad9e..8f17a91858 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1991,7 +1991,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     cpu_loop_exit_noexc(cpu);
 }
 
-static void print_qht_statistics(struct qht_stats hst)
+static void print_qht_statistics(struct qht_stats hst, GString *buf)
 {
     uint32_t hgram_opts;
     size_t hgram_bins;
@@ -2000,9 +2000,11 @@ static void print_qht_statistics(struct qht_stats hst)
     if (!hst.head_buckets) {
         return;
     }
-    qemu_printf("TB hash buckets     %zu/%zu (%0.2f%% head buckets used)\n",
-                hst.used_head_buckets, hst.head_buckets,
-                (double)hst.used_head_buckets / hst.head_buckets * 100);
+    g_string_append_printf(buf, "TB hash buckets     %zu/%zu "
+                           "(%0.2f%% head buckets used)\n",
+                           hst.used_head_buckets, hst.head_buckets,
+                           (double)hst.used_head_buckets /
+                           hst.head_buckets * 100);
 
     hgram_opts =  QDIST_PR_BORDER | QDIST_PR_LABELS;
     hgram_opts |= QDIST_PR_100X   | QDIST_PR_PERCENT;
@@ -2010,8 +2012,9 @@ static void print_qht_statistics(struct qht_stats hst)
         hgram_opts |= QDIST_PR_NODECIMAL;
     }
     hgram = qdist_pr(&hst.occupancy, 10, hgram_opts);
-    qemu_printf("TB hash occupancy   %0.2f%% avg chain occ. Histogram: %s\n",
-                qdist_avg(&hst.occupancy) * 100, hgram);
+    g_string_append_printf(buf, "TB hash occupancy   %0.2f%% avg chain occ. "
+                           "Histogram: %s\n",
+                           qdist_avg(&hst.occupancy) * 100, hgram);
     g_free(hgram);
 
     hgram_opts = QDIST_PR_BORDER | QDIST_PR_LABELS;
@@ -2023,8 +2026,9 @@ static void print_qht_statistics(struct qht_stats hst)
         hgram_opts |= QDIST_PR_NODECIMAL | QDIST_PR_NOBINRANGE;
     }
     hgram = qdist_pr(&hst.chain, hgram_bins, hgram_opts);
-    qemu_printf("TB hash avg chain   %0.3f buckets. Histogram: %s\n",
-                qdist_avg(&hst.chain), hgram);
+    g_string_append_printf(buf, "TB hash avg chain   %0.3f buckets. "
+                           "Histogram: %s\n",
+                           qdist_avg(&hst.chain), hgram);
     g_free(hgram);
 }
 
@@ -2061,7 +2065,7 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
     return false;
 }
 
-void dump_exec_info(void)
+void dump_exec_info(GString *buf)
 {
     struct tb_tree_stats tst = {};
     struct qht_stats hst;
@@ -2070,44 +2074,48 @@ void dump_exec_info(void)
     tcg_tb_foreach(tb_tree_stats_iter, &tst);
     nb_tbs = tst.nb_tbs;
     /* XXX: avoid using doubles ? */
-    qemu_printf("Translation buffer state:\n");
+    g_string_append_printf(buf, "Translation buffer state:\n");
     /*
      * Report total code size including the padding and TB structs;
      * otherwise users might think "-accel tcg,tb-size" is not honoured.
      * For avg host size we use the precise numbers from tb_tree_stats though.
      */
-    qemu_printf("gen code size       %zu/%zu\n",
-                tcg_code_size(), tcg_code_capacity());
-    qemu_printf("TB count            %zu\n", nb_tbs);
-    qemu_printf("TB avg target size  %zu max=%zu bytes\n",
-                nb_tbs ? tst.target_size / nb_tbs : 0,
-                tst.max_target_size);
-    qemu_printf("TB avg host size    %zu bytes (expansion ratio: %0.1f)\n",
-                nb_tbs ? tst.host_size / nb_tbs : 0,
-                tst.target_size ? (double)tst.host_size / tst.target_size : 0);
-    qemu_printf("cross page TB count %zu (%zu%%)\n", tst.cross_page,
-                nb_tbs ? (tst.cross_page * 100) / nb_tbs : 0);
-    qemu_printf("direct jump count   %zu (%zu%%) (2 jumps=%zu %zu%%)\n",
-                tst.direct_jmp_count,
-                nb_tbs ? (tst.direct_jmp_count * 100) / nb_tbs : 0,
-                tst.direct_jmp2_count,
-                nb_tbs ? (tst.direct_jmp2_count * 100) / nb_tbs : 0);
+    g_string_append_printf(buf, "gen code size       %zu/%zu\n",
+                           tcg_code_size(), tcg_code_capacity());
+    g_string_append_printf(buf, "TB count            %zu\n", nb_tbs);
+    g_string_append_printf(buf, "TB avg target size  %zu max=%zu bytes\n",
+                           nb_tbs ? tst.target_size / nb_tbs : 0,
+                           tst.max_target_size);
+    g_string_append_printf(buf, "TB avg host size    %zu bytes "
+                           "(expansion ratio: %0.1f)\n",
+                           nb_tbs ? tst.host_size / nb_tbs : 0,
+                           tst.target_size ?
+                           (double)tst.host_size / tst.target_size : 0);
+    g_string_append_printf(buf, "cross page TB count %zu (%zu%%)\n",
+                           tst.cross_page,
+                           nb_tbs ? (tst.cross_page * 100) / nb_tbs : 0);
+    g_string_append_printf(buf, "direct jump count   %zu (%zu%%) "
+                           "(2 jumps=%zu %zu%%)\n",
+                           tst.direct_jmp_count,
+                           nb_tbs ? (tst.direct_jmp_count * 100) / nb_tbs : 0,
+                           tst.direct_jmp2_count,
+                           nb_tbs ? (tst.direct_jmp2_count * 100) / nb_tbs : 0);
 
     qht_statistics_init(&tb_ctx.htable, &hst);
-    print_qht_statistics(hst);
+    print_qht_statistics(hst, buf);
     qht_statistics_destroy(&hst);
 
-    qemu_printf("\nStatistics:\n");
-    qemu_printf("TB flush count      %u\n",
-                qatomic_read(&tb_ctx.tb_flush_count));
-    qemu_printf("TB invalidate count %u\n",
-                qatomic_read(&tb_ctx.tb_phys_invalidate_count));
+    g_string_append_printf(buf, "\nStatistics:\n");
+    g_string_append_printf(buf, "TB flush count      %u\n",
+                           qatomic_read(&tb_ctx.tb_flush_count));
+    g_string_append_printf(buf, "TB invalidate count %u\n",
+                           qatomic_read(&tb_ctx.tb_phys_invalidate_count));
 
     tlb_flush_counts(&flush_full, &flush_part, &flush_elide);
-    qemu_printf("TLB full flushes    %zu\n", flush_full);
-    qemu_printf("TLB partial flushes %zu\n", flush_part);
-    qemu_printf("TLB elided flushes  %zu\n", flush_elide);
-    tcg_dump_info();
+    g_string_append_printf(buf, "TLB full flushes    %zu\n", flush_full);
+    g_string_append_printf(buf, "TLB partial flushes %zu\n", flush_part);
+    g_string_append_printf(buf, "TLB elided flushes  %zu\n", flush_elide);
+    tcg_dump_info(buf);
 }
 
 void dump_opcount_info(void)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 32cfb634c6..d92f6fa7a9 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -429,9 +429,9 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 
 #ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
-void dump_drift_info(void);
+void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
-void dump_exec_info(void);
+void dump_exec_info(GString *buf);
 void dump_opcount_info(void);
 #endif /* CONFIG_TCG */
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7069a401f1..7c8019a9b2 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -937,7 +937,7 @@ int tcg_check_temp_count(void);
 #endif
 
 int64_t tcg_cpu_exec_time(void);
-void tcg_dump_info(void);
+void tcg_dump_info(GString *buf);
 void tcg_dump_op_count(void);
 
 #define TCG_CT_CONST  1 /* any constant of register size */
diff --git a/qapi/machine.json b/qapi/machine.json
index ca49358292..422a44661f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1424,6 +1424,19 @@
 { 'command': 'x-query-irq',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-jit:
+#
+# Query TCG compiler statistics
+#
+# Returns: TCG compiler statistics
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-jit',
+  'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG' }
+
 ##
 # @x-query-numa:
 #
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6332cdceca..f9ede8e62e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4383,7 +4383,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 }
 
 #ifdef CONFIG_PROFILER
-void tcg_dump_info(void)
+void tcg_dump_info(GString *buf)
 {
     TCGProfile prof = {};
     const TCGProfile *s;
@@ -4397,53 +4397,59 @@ void tcg_dump_info(void)
     tb_div_count = tb_count ? tb_count : 1;
     tot = s->interm_time + s->code_time;
 
-    qemu_printf("JIT cycles          %" PRId64 " (%0.3f s at 2.4 GHz)\n",
-                tot, tot / 2.4e9);
-    qemu_printf("translated TBs      %" PRId64 " (aborted=%" PRId64
-                " %0.1f%%)\n",
-                tb_count, s->tb_count1 - tb_count,
-                (double)(s->tb_count1 - s->tb_count)
-                / (s->tb_count1 ? s->tb_count1 : 1) * 100.0);
-    qemu_printf("avg ops/TB          %0.1f max=%d\n",
-                (double)s->op_count / tb_div_count, s->op_count_max);
-    qemu_printf("deleted ops/TB      %0.2f\n",
-                (double)s->del_op_count / tb_div_count);
-    qemu_printf("avg temps/TB        %0.2f max=%d\n",
-                (double)s->temp_count / tb_div_count, s->temp_count_max);
-    qemu_printf("avg host code/TB    %0.1f\n",
-                (double)s->code_out_len / tb_div_count);
-    qemu_printf("avg search data/TB  %0.1f\n",
-                (double)s->search_out_len / tb_div_count);
+    g_string_append_printf(buf, "JIT cycles          %" PRId64
+                           " (%0.3f s at 2.4 GHz)\n",
+                           tot, tot / 2.4e9);
+    g_string_append_printf(buf, "translated TBs      %" PRId64
+                           " (aborted=%" PRId64 " %0.1f%%)\n",
+                           tb_count, s->tb_count1 - tb_count,
+                           (double)(s->tb_count1 - s->tb_count)
+                           / (s->tb_count1 ? s->tb_count1 : 1) * 100.0);
+    g_string_append_printf(buf, "avg ops/TB          %0.1f max=%d\n",
+                           (double)s->op_count / tb_div_count, s->op_count_max);
+    g_string_append_printf(buf, "deleted ops/TB      %0.2f\n",
+                           (double)s->del_op_count / tb_div_count);
+    g_string_append_printf(buf, "avg temps/TB        %0.2f max=%d\n",
+                           (double)s->temp_count / tb_div_count,
+                           s->temp_count_max);
+    g_string_append_printf(buf, "avg host code/TB    %0.1f\n",
+                           (double)s->code_out_len / tb_div_count);
+    g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
+                           (double)s->search_out_len / tb_div_count);
     
-    qemu_printf("cycles/op           %0.1f\n",
-                s->op_count ? (double)tot / s->op_count : 0);
-    qemu_printf("cycles/in byte      %0.1f\n",
-                s->code_in_len ? (double)tot / s->code_in_len : 0);
-    qemu_printf("cycles/out byte     %0.1f\n",
-                s->code_out_len ? (double)tot / s->code_out_len : 0);
-    qemu_printf("cycles/search byte     %0.1f\n",
-                s->search_out_len ? (double)tot / s->search_out_len : 0);
+    g_string_append_printf(buf, "cycles/op           %0.1f\n",
+                           s->op_count ? (double)tot / s->op_count : 0);
+    g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
+                           s->code_in_len ? (double)tot / s->code_in_len : 0);
+    g_string_append_printf(buf, "cycles/out byte     %0.1f\n",
+                           s->code_out_len ? (double)tot / s->code_out_len : 0);
+    g_string_append_printf(buf, "cycles/search byte     %0.1f\n",
+                           s->search_out_len ?
+                           (double)tot / s->search_out_len : 0);
     if (tot == 0) {
         tot = 1;
     }
-    qemu_printf("  gen_interm time   %0.1f%%\n",
-                (double)s->interm_time / tot * 100.0);
-    qemu_printf("  gen_code time     %0.1f%%\n",
-                (double)s->code_time / tot * 100.0);
-    qemu_printf("optim./code time    %0.1f%%\n",
-                (double)s->opt_time / (s->code_time ? s->code_time : 1)
-                * 100.0);
-    qemu_printf("liveness/code time  %0.1f%%\n",
-                (double)s->la_time / (s->code_time ? s->code_time : 1) * 100.0);
-    qemu_printf("cpu_restore count   %" PRId64 "\n",
-                s->restore_count);
-    qemu_printf("  avg cycles        %0.1f\n",
-                s->restore_count ? (double)s->restore_time / s->restore_count : 0);
+    g_string_append_printf(buf, "  gen_interm time   %0.1f%%\n",
+                           (double)s->interm_time / tot * 100.0);
+    g_string_append_printf(buf, "  gen_code time     %0.1f%%\n",
+                           (double)s->code_time / tot * 100.0);
+    g_string_append_printf(buf, "optim./code time    %0.1f%%\n",
+                           (double)s->opt_time / (s->code_time ?
+                                                  s->code_time : 1)
+                           * 100.0);
+    g_string_append_printf(buf, "liveness/code time  %0.1f%%\n",
+                           (double)s->la_time / (s->code_time ?
+                                                 s->code_time : 1) * 100.0);
+    g_string_append_printf(buf, "cpu_restore count   %" PRId64 "\n",
+                           s->restore_count);
+    g_string_append_printf(buf, "  avg cycles        %0.1f\n",
+                           s->restore_count ?
+                           (double)s->restore_time / s->restore_count : 0);
 }
 #else
-void tcg_dump_info(void)
+void tcg_dump_info(GString *buf)
 {
-    qemu_printf("[TCG profiler not compiled]\n");
+    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
 }
 #endif
 
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 0d52ea6c4b..ea24fde1a3 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -51,6 +51,8 @@ static int query_error_class(const char *cmd)
 #endif
         /* Only valid with a USB bus added */
         { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
+        /* Only valid with accel=tcg */
+        { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


