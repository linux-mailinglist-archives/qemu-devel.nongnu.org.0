Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339AE34646E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:07:36 +0100 (CET)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjZ9-0001lN-2g
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFs-0007Go-MM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:54794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFb-0000pi-Kz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 752ADAF45;
 Tue, 23 Mar 2021 15:46:58 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 33/55] target/arm: cleanup cpu includes
Date: Tue, 23 Mar 2021 16:46:17 +0100
Message-Id: <20210323154639.23477-26-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

cpu.c,
cpu32.c,
cpu64.c,
tcg/sysemu/tcg-cpu.c,

all need a good cleanup when it comes to included header files.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.c                |  8 ++------
 target/arm/cpu32.c              | 14 --------------
 target/arm/cpu64.c              |  6 ------
 target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
 4 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 97cb6ec8a8..3491e615c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -19,28 +19,24 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/qemu-print.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
-#include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
+
 #ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "cpu32.h"
-#include "internals.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
 #endif
-#include "sysemu/sysemu.h"
+
 #include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 655f0a4263..52b5411af6 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -20,26 +20,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
 #include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
 #include "hw/boards.h"
 #endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
 #include "cpu-mmu.h"
 #include "cpu32.h"
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d7e9a812cd..b3475a93cc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -22,13 +22,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 6ab49ba614..327b2a5073 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -19,29 +19,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
-#include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
 #include "semihosting/common-semi.h"
-#include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#include "hw/boards.h"
-#endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
-#include "cpu-mmu.h"
+#include "qemu/log.h"
 #include "tcg/tcg-cpu.h"
 
 /*
-- 
2.26.2


