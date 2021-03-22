Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B39344779
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:36:41 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLfc-0001Da-JQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL96-0005bj-4X
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL92-0005MH-Vm
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA45FAF4E;
 Mon, 22 Mar 2021 14:02:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v10 38/49] target/arm: move kvm post init initialization to kvm
 cpu accel
Date: Mon, 22 Mar 2021 15:01:55 +0100
Message-Id: <20210322140206.9513-39-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322140206.9513-1-cfontana@suse.de>
References: <20210322140206.9513-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.c         | 4 ----
 target/arm/kvm/kvm-cpu.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a76461e5b..5e0f6bd01d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -778,10 +778,6 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
 
-    if (kvm_enabled()) {
-        kvm_arm_add_vcpu_properties(obj);
-    }
-
 #ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
         cpu_isar_feature(aa64_mte, cpu)) {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 5fbb127e61..9f65010c0c 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -63,6 +63,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
      * the same interface as non-KVM CPUs.
      */
     qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+    kvm_arm_add_vcpu_properties(OBJECT(cs));
 }
 
 static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
-- 
2.26.2


