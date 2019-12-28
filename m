Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9812BD30
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Dec 2019 10:49:23 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1il8in-0001jV-OM
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 04:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1il8i5-0001Jr-O4
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 04:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1il8i3-0001zn-P6
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 04:48:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:1272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1il8i3-0001jI-Dq
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 04:48:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Dec 2019 01:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,366,1571727600"; d="scan'208";a="392793886"
Received: from lxy-clx-4s.sh.intel.com ([10.239.43.57])
 by orsmga005.jf.intel.com with ESMTP; 28 Dec 2019 01:48:29 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] accel/kvm: Make "kernel_irqchip" default on
Date: Sat, 28 Dec 2019 17:32:22 +0800
Message-Id: <20191228093222.18431-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <CABgObfbKM_QNXJaAk7m2JYOoZgAAa+98d2x3==eYUkTi_CGw6Q@mail.gmail.com>
References: <CABgObfbKM_QNXJaAk7m2JYOoZgAAa+98d2x3==eYUkTi_CGw6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 11bc4a13d1f4 ("kvm: convert "-machine kernel_irqchip" to an
accelerator property") moves kernel_irqchip property from "-machine" to
"-accel kvm", but it forgets to set the default value of
kernel_irqchip_allowed and kernel_irqchip_split.

Also cleaning up the three useless members (kernel_irqchip_allowed,
kernel_irqchip_required, kernel_irqchip_split) in struct MachineState.

Fixes: 11bc4a13d1f4 ("kvm: convert "-machine kernel_irqchip" to an accelerator property")
Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 accel/kvm/kvm-all.c | 3 +++
 include/hw/boards.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b2f1a5bcb5ef..40f74094f8d3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3044,8 +3044,11 @@ bool kvm_kernel_irqchip_split(void)
 static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(current_machine);
 
     s->kvm_shadow_mem = -1;
+    s->kernel_irqchip_allowed = true;
+    s->kernel_irqchip_split = mc->default_kernel_irqchip_split;
 }
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 61f8bb8e5a42..fb1b43d5b972 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -271,9 +271,6 @@ struct MachineState {
 
     /*< public >*/
 
-    bool kernel_irqchip_allowed;
-    bool kernel_irqchip_required;
-    bool kernel_irqchip_split;
     char *dtb;
     char *dumpdtb;
     int phandle_start;
-- 
2.19.1


