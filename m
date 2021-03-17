Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E523C33F86A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:49:46 +0100 (CET)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbEn-0005hn-Vn
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawa-00041B-1B
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:30:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:48016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawK-0007dX-TH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:30:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46F06AE74;
 Wed, 17 Mar 2021 18:30:22 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 13/50] target/arm: kvm: add stubs for some helpers
Date: Wed, 17 Mar 2021 19:29:36 +0100
Message-Id: <20210317183013.25772-14-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317183013.25772-1-cfontana@suse.de>
References: <20210317183013.25772-1-cfontana@suse.de>
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

at least the armv7m one should go away with proper
configuration changes (only enabling possible boards for KVM).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/kvm/helper-stubs.c | 27 +++++++++++++++++++++++++++
 target/arm/kvm/meson.build    |  3 +++
 target/arm/meson.build        |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 target/arm/kvm/helper-stubs.c
 create mode 100644 target/arm/kvm/meson.build

diff --git a/target/arm/kvm/helper-stubs.c b/target/arm/kvm/helper-stubs.c
new file mode 100644
index 0000000000..8e952c91fa
--- /dev/null
+++ b/target/arm/kvm/helper-stubs.c
@@ -0,0 +1,27 @@
+/*
+ * QEMU ARM KVM stubs for some helper functions
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+/* return the effective value of HCR_EL2. For KVM, always 0. */
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    return 0;
+}
+
+int fp_exception_el(CPUARMState *env, int cur_el)
+{
+    return 0;
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
new file mode 100644
index 0000000000..1015fc0afb
--- /dev/null
+++ b/target/arm/kvm/meson.build
@@ -0,0 +1,3 @@
+arm_ss.add(when: 'CONFIG_TCG', if_false: files(
+  'helper-stubs.c',
+))
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 7a6d0d6ba4..cd2ae221a6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -34,6 +34,7 @@ arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
 arm_user_ss = ss.source_set()
 
 subdir('tcg')
+subdir('kvm')
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.26.2


