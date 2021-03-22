Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F0344FC7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:20:36 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQ6N-0006pc-A0
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1x-0004x6-9F; Mon, 22 Mar 2021 15:16:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:48550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1s-0003SH-Oz; Mon, 22 Mar 2021 15:16:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 853DFAED7;
 Mon, 22 Mar 2021 19:15:54 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v1 2/5] target/s390x: start moving TCG-only code to tcg/
Date: Mon, 22 Mar 2021 20:15:48 +0100
Message-Id: <20210322191551.25752-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322191551.25752-1-cfontana@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move everything related to translate, as well as HELPER code in tcg/

mmu_helper.c stays put for now, as it contains both TCG and KVM code.

removed the tcg-stub.c file, as it seems unnecessary,
due to all calls being wrapped by if (tcg_enabled()),
and the prototype being available.

The internal.h file is renamed to s390x-internal.h, because from inside
tcg/ , the name collides with other files called the same way
(accel/tcg/internal.h).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/s390x/tod.h                        |  2 +-
 target/s390x/{internal.h => s390x-internal.h} |  0
 target/s390x/{ => tcg}/s390-tod.h             |  0
 target/s390x/{ => tcg}/tcg_s390x.h            |  0
 target/s390x/{ => tcg}/vec.h                  |  0
 hw/s390x/tod-qemu.c                           |  2 +-
 target/s390x/arch_dump.c                      |  2 +-
 target/s390x/cpu.c                            |  2 +-
 target/s390x/cpu_models.c                     |  2 +-
 target/s390x/diag.c                           |  2 +-
 target/s390x/gdbstub.c                        |  2 +-
 target/s390x/helper.c                         |  2 +-
 target/s390x/interrupt.c                      |  4 +--
 target/s390x/ioinst.c                         |  2 +-
 target/s390x/kvm.c                            |  2 +-
 target/s390x/machine.c                        |  4 +--
 target/s390x/mmu_helper.c                     |  2 +-
 target/s390x/sigp.c                           |  2 +-
 target/s390x/tcg-stub.c                       | 30 -------------------
 target/s390x/{ => tcg}/cc_helper.c            |  2 +-
 target/s390x/{ => tcg}/crypto_helper.c        |  2 +-
 target/s390x/{ => tcg}/excp_helper.c          |  2 +-
 target/s390x/{ => tcg}/fpu_helper.c           |  2 +-
 target/s390x/{ => tcg}/int_helper.c           |  2 +-
 target/s390x/{ => tcg}/mem_helper.c           |  2 +-
 target/s390x/{ => tcg}/misc_helper.c          |  2 +-
 target/s390x/{ => tcg}/translate.c            |  2 +-
 target/s390x/{ => tcg}/vec_fpu_helper.c       |  2 +-
 target/s390x/{ => tcg}/vec_helper.c           |  2 +-
 target/s390x/{ => tcg}/vec_int_helper.c       |  0
 target/s390x/{ => tcg}/vec_string_helper.c    |  2 +-
 target/s390x/{ => tcg}/translate_vx.c.inc     |  0
 target/s390x/meson.build                      | 17 ++---------
 target/s390x/{ => tcg}/insn-data.def          |  0
 target/s390x/{ => tcg}/insn-format.def        |  0
 target/s390x/tcg/meson.build                  | 14 +++++++++
 36 files changed, 43 insertions(+), 72 deletions(-)
 rename target/s390x/{internal.h => s390x-internal.h} (100%)
 rename target/s390x/{ => tcg}/s390-tod.h (100%)
 rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ => tcg}/vec.h (100%)
 delete mode 100644 target/s390x/tcg-stub.c
 rename target/s390x/{ => tcg}/cc_helper.c (99%)
 rename target/s390x/{ => tcg}/crypto_helper.c (98%)
 rename target/s390x/{ => tcg}/excp_helper.c (99%)
 rename target/s390x/{ => tcg}/fpu_helper.c (99%)
 rename target/s390x/{ => tcg}/int_helper.c (99%)
 rename target/s390x/{ => tcg}/mem_helper.c (99%)
 rename target/s390x/{ => tcg}/misc_helper.c (99%)
 rename target/s390x/{ => tcg}/translate.c (99%)
 rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_helper.c (99%)
 rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ => tcg}/vec_string_helper.c (99%)
 rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
 rename target/s390x/{ => tcg}/insn-data.def (100%)
 rename target/s390x/{ => tcg}/insn-format.def (100%)
 create mode 100644 target/s390x/tcg/meson.build

diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index ff3195a4bf..0935e85089 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -12,7 +12,7 @@
 #define HW_S390_TOD_H
 
 #include "hw/qdev-core.h"
-#include "target/s390x/s390-tod.h"
+#include "tcg/s390-tod.h"
 #include "qom/object.h"
 
 typedef struct S390TOD {
diff --git a/target/s390x/internal.h b/target/s390x/s390x-internal.h
similarity index 100%
rename from target/s390x/internal.h
rename to target/s390x/s390x-internal.h
diff --git a/target/s390x/s390-tod.h b/target/s390x/tcg/s390-tod.h
similarity index 100%
rename from target/s390x/s390-tod.h
rename to target/s390x/tcg/s390-tod.h
diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
similarity index 100%
rename from target/s390x/tcg_s390x.h
rename to target/s390x/tcg/tcg_s390x.h
diff --git a/target/s390x/vec.h b/target/s390x/tcg/vec.h
similarity index 100%
rename from target/s390x/vec.h
rename to target/s390x/tcg/vec.h
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-qemu.c
index e91b9590f5..4b3e65050a 100644
--- a/hw/s390x/tod-qemu.c
+++ b/hw/s390x/tod-qemu.c
@@ -16,7 +16,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "cpu.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 
 static void qemu_s390_tod_get(const S390TODState *td, S390TOD *tod,
                               Error **errp)
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index cc1330876b..08daf93ae1 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "elf.h"
 #include "sysemu/dump.h"
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1b..ae054d264b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 050dcf2d42..4ff8cba7e5 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 1a48429564..86b7032b5b 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/address-spaces.h"
 #include "hw/watchdog/wdt_diag288.h"
 #include "sysemu/cpus.h"
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index d6fce5ff1e..1dbe2973f4 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/bitops.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 7678994feb..2254873cef 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "qemu/qemu-print.h"
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 4cdbbc8849..d0e58d6e8d 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -11,12 +11,12 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "kvm_s390x.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "hw/s390x/ioinst.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/s390_flic.h"
 #endif
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index 1ee11522e1..4eb0a7a9f8 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "hw/s390x/ioinst.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-bus.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 4fb3bbfef5..2a22cc69f6 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -26,7 +26,7 @@
 
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm_int.h"
 #include "qemu/cutils.h"
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 5b4e82f1ab..81a8a7ff99 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -16,10 +16,10 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "migration/vmstate.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index d492b23a17..52fdd86c63 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f17710..320dddbae2 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
diff --git a/target/s390x/tcg-stub.c b/target/s390x/tcg-stub.c
deleted file mode 100644
index d22c898802..0000000000
--- a/target/s390x/tcg-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU TCG support -- s390x specific function stubs.
- *
- * Copyright (C) 2018 Red Hat Inc
- *
- * Authors:
- *   David Hildenbrand <david@redhat.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "tcg_s390x.h"
-
-void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
-{
-}
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra)
-{
-    g_assert_not_reached();
-}
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
-                                           uintptr_t ra)
-{
-    g_assert_not_reached();
-}
diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
similarity index 99%
rename from target/s390x/cc_helper.c
rename to target/s390x/tcg/cc_helper.c
index e7039d0d18..f0663f7a3e 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
similarity index 98%
rename from target/s390x/crypto_helper.c
rename to target/s390x/tcg/crypto_helper.c
index ff3fbc3950..138d9e7ad9 100644
--- a/target/s390x/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/tcg/excp_helper.c
similarity index 99%
rename from target/s390x/excp_helper.c
rename to target/s390x/tcg/excp_helper.c
index c48cd6b46f..ecc830cea0 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
similarity index 99%
rename from target/s390x/fpu_helper.c
rename to target/s390x/tcg/fpu_helper.c
index f155bc048c..bc89ef7cc8 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/s390x/int_helper.c b/target/s390x/tcg/int_helper.c
similarity index 99%
rename from target/s390x/int_helper.c
rename to target/s390x/tcg/int_helper.c
index 658507dd6d..954542388a 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
diff --git a/target/s390x/mem_helper.c b/target/s390x/tcg/mem_helper.c
similarity index 99%
rename from target/s390x/mem_helper.c
rename to target/s390x/tcg/mem_helper.c
index 12e84a4285..a91791a1b7 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/misc_helper.c b/target/s390x/tcg/misc_helper.c
similarity index 99%
rename from target/s390x/misc_helper.c
rename to target/s390x/tcg/misc_helper.c
index 7ea90d414a..33e6999e15 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -22,7 +22,7 @@
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/translate.c b/target/s390x/tcg/translate.c
similarity index 99%
rename from target/s390x/translate.c
rename to target/s390x/tcg/translate.c
index 4f953ddfba..ac236888a0 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -30,7 +30,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
similarity index 99%
rename from target/s390x/vec_fpu_helper.c
rename to target/s390x/tcg/vec_fpu_helper.c
index c1564e819b..850fac721e 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg_s390x.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_helper.c b/target/s390x/tcg/vec_helper.c
similarity index 99%
rename from target/s390x/vec_helper.c
rename to target/s390x/tcg/vec_helper.c
index 986e7cc825..ddd0a8be5b 100644
--- a/target/s390x/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -11,7 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
similarity index 100%
rename from target/s390x/vec_int_helper.c
rename to target/s390x/tcg/vec_int_helper.c
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
similarity index 99%
rename from target/s390x/vec_string_helper.c
rename to target/s390x/tcg/vec_string_helper.c
index c516c0ceeb..ac315eb095 100644
--- a/target/s390x/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
similarity index 100%
rename from target/s390x/translate_vx.c.inc
rename to target/s390x/tcg/translate_vx.c.inc
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 1219f64112..60d7f1b908 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,21 +8,6 @@ s390x_ss.add(files(
   'interrupt.c',
 ))
 
-s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cc_helper.c',
-  'crypto_helper.c',
-  'excp_helper.c',
-  'fpu_helper.c',
-  'int_helper.c',
-  'mem_helper.c',
-  'misc_helper.c',
-  'translate.c',
-  'vec_fpu_helper.c',
-  'vec_helper.c',
-  'vec_int_helper.c',
-  'vec_string_helper.c',
-), if_false: files('tcg-stub.c'))
-
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
 gen_features = executable('gen-features', 'gen-features.c', native: true,
@@ -60,6 +45,8 @@ endif
 
 s390x_user_ss = ss.source_set()
 
+subdir('tcg')
+
 target_arch += {'s390x': s390x_ss}
 target_softmmu_arch += {'s390x': s390x_softmmu_ss}
 target_user_arch += {'s390x': s390x_user_ss}
diff --git a/target/s390x/insn-data.def b/target/s390x/tcg/insn-data.def
similarity index 100%
rename from target/s390x/insn-data.def
rename to target/s390x/tcg/insn-data.def
diff --git a/target/s390x/insn-format.def b/target/s390x/tcg/insn-format.def
similarity index 100%
rename from target/s390x/insn-format.def
rename to target/s390x/tcg/insn-format.def
diff --git a/target/s390x/tcg/meson.build b/target/s390x/tcg/meson.build
new file mode 100644
index 0000000000..ee4e8fec77
--- /dev/null
+++ b/target/s390x/tcg/meson.build
@@ -0,0 +1,14 @@
+s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cc_helper.c',
+  'crypto_helper.c',
+  'excp_helper.c',
+  'fpu_helper.c',
+  'int_helper.c',
+  'mem_helper.c',
+  'misc_helper.c',
+  'translate.c',
+  'vec_fpu_helper.c',
+  'vec_helper.c',
+  'vec_int_helper.c',
+  'vec_string_helper.c',
+))
-- 
2.26.2


