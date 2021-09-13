Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8B9408B5B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:52:41 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlRw-0001K4-9o
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPklW-0002KX-Dq; Mon, 13 Sep 2021 08:08:50 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44044 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklT-0004ic-94; Mon, 13 Sep 2021 08:08:48 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 36BE960805EC;
 Mon, 13 Sep 2021 14:08:45 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 03/10] hvf: Introduce hvf_arch_init() callback
Date: Mon, 13 Sep 2021 14:08:35 +0200
Message-Id: <20210913120842.62116-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need to install a migration helper for the ARM hvf backend.
Let's introduce an arch callback for the overall hvf init chain to
do so.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 3 ++-
 include/sysemu/hvf_int.h  | 1 +
 target/i386/hvf/hvf.c     | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 71cc2fa70f..65d431868f 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -324,7 +324,8 @@ static int hvf_accel_init(MachineState *ms)
 
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    return 0;
+
+    return hvf_arch_init();
 }
 
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 8b66a4e7d0..0466106d16 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -48,6 +48,7 @@ struct hvf_vcpu_state {
 };
 
 void assert_hvf_ok(hv_return_t ret);
+int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 79ba4ed93a..abef24a9c8 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
+int hvf_arch_init(void)
+{
+    return 0;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
-- 
2.30.1 (Apple Git-130)


