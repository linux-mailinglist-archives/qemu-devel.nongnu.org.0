Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968512CE31D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 00:51:20 +0100 (CET)
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkyNb-0005LB-KT
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 18:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLX-0002cH-3L; Thu, 03 Dec 2020 18:49:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57574
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLT-0003PV-M3; Thu, 03 Dec 2020 18:49:10 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id EBB5239004FC;
 Fri,  4 Dec 2020 00:49:00 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/11] arm: Set PSCI to 0.2 for HVF
Date: Fri,  4 Dec 2020 00:48:51 +0100
Message-Id: <20201203234857.21051-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
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
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v3 -> v4:

  - Combine both if statements
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a..6728426551 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1059,8 +1059,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (tcg_enabled() || hvf_enabled()) {
+        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
     }
 }
 
-- 
2.24.3 (Apple Git-128)


