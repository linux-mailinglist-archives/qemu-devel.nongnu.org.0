Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088025BFD0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 13:03:54 +0200 (CEST)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDn21-0006KJ-OV
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 07:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmuz-0003IN-V0
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:48990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmuy-0004Yy-3v
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50DC4B6A9;
 Thu,  3 Sep 2020 10:56:25 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v7 11/16] cpus: remove checks for non-NULL cpus_accel
Date: Thu,  3 Sep 2020 12:56:09 +0200
Message-Id: <20200903105614.17772-12-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903105614.17772-1-cfontana@suse.de>
References: <20200903105614.17772-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

now that all accelerators support the CpusAccel interface,
we can remove most checks for non-NULL cpus_accel,
we just add a sanity check/assert at vcpu creation.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/cpus.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 3d8350fba9..f32ecb4bb9 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -166,34 +166,46 @@ void cpu_synchronize_all_pre_loadvm(void)
 
 void cpu_synchronize_state(CPUState *cpu)
 {
-    if (cpus_accel && cpus_accel->synchronize_state) {
+    if (cpus_accel->synchronize_state) {
         cpus_accel->synchronize_state(cpu);
     }
 }
 
 void cpu_synchronize_post_reset(CPUState *cpu)
 {
-    if (cpus_accel && cpus_accel->synchronize_post_reset) {
+    if (cpus_accel->synchronize_post_reset) {
         cpus_accel->synchronize_post_reset(cpu);
     }
 }
 
 void cpu_synchronize_post_init(CPUState *cpu)
 {
-    if (cpus_accel && cpus_accel->synchronize_post_init) {
+    if (cpus_accel->synchronize_post_init) {
         cpus_accel->synchronize_post_init(cpu);
     }
 }
 
 void cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
-    if (cpus_accel && cpus_accel->synchronize_pre_loadvm) {
+    if (cpus_accel->synchronize_pre_loadvm) {
         cpus_accel->synchronize_pre_loadvm(cpu);
     }
 }
 
 int64_t cpus_get_virtual_clock(void)
 {
+    /*
+     * XXX
+     *
+     * need to check that cpus_accel is not NULL, because qcow2 calls
+     * qemu_get_clock_ns(CLOCK_VIRTUAL) without any accel initialized and
+     * with ticks disabled in some io-tests:
+     * 030 040 041 060 099 120 127 140 156 161 172 181 191 192 195 203 229 249 256 267
+     *
+     * is this expected?
+     *
+     * XXX
+     */
     if (cpus_accel && cpus_accel->get_virtual_clock) {
         return cpus_accel->get_virtual_clock();
     }
@@ -207,7 +219,7 @@ int64_t cpus_get_virtual_clock(void)
  */
 int64_t cpus_get_elapsed_ticks(void)
 {
-    if (cpus_accel && cpus_accel->get_elapsed_ticks) {
+    if (cpus_accel->get_elapsed_ticks) {
         return cpus_accel->get_elapsed_ticks();
     }
     return cpu_get_ticks();
@@ -399,7 +411,7 @@ void cpus_kick_thread(CPUState *cpu)
 void qemu_cpu_kick(CPUState *cpu)
 {
     qemu_cond_broadcast(cpu->halt_cond);
-    if (cpus_accel && cpus_accel->kick_vcpu_thread) {
+    if (cpus_accel->kick_vcpu_thread) {
         cpus_accel->kick_vcpu_thread(cpu);
     } else { /* default */
         cpus_kick_thread(cpu);
@@ -573,12 +585,9 @@ void qemu_init_vcpu(CPUState *cpu)
         cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
     }
 
-    if (cpus_accel) {
-        /* accelerator already implements the CpusAccel interface */
-        cpus_accel->create_vcpu_thread(cpu);
-    } else {
-        g_assert_not_reached();
-    }
+    /* accelerators all implement the CpusAccel interface */
+    g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
+    cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
         qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
-- 
2.26.2


