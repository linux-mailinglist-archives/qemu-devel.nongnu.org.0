Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9862C5DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:54:02 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPDF-0005Sk-H3
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9m-0001lk-HF; Thu, 26 Nov 2020 16:50:30 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60628
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9k-0005mr-Le; Thu, 26 Nov 2020 16:50:26 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id E832E39005A8;
 Thu, 26 Nov 2020 22:50:20 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hvf: Use OS provided vcpu kick function
Date: Thu, 26 Nov 2020 22:50:15 +0100
Message-Id: <20201126215017.41156-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When kicking another vCPU, we get an OS function that explicitly does that for us
on Apple Silicon. That works better than the current signaling logic, let's make
use of it there.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index b9f674478d..74a272d2e8 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -418,8 +418,20 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+#ifdef __aarch64__
+static void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    if (!qemu_cpu_is_self(cpu)) {
+        hv_vcpus_exit(&cpu->hvf_fd, 1);
+    }
+}
+#endif
+
 static const CpusAccel hvf_cpus = {
     .create_vcpu_thread = hvf_start_vcpu_thread,
+#ifdef __aarch64__
+    .kick_vcpu_thread = hvf_kick_vcpu_thread,
+#endif
 
     .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
     .synchronize_post_init = hvf_cpu_synchronize_post_init,
-- 
2.24.3 (Apple Git-128)


