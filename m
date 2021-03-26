Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A975134AFA4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:54:36 +0100 (CET)
Received: from localhost ([::1]:38278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsXT-0001VN-BY
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsH3-0006IZ-UC
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:45422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsH1-0000vf-Vg
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C12E4AF2C;
 Fri, 26 Mar 2021 19:37:24 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 17/65] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
Date: Fri, 26 Mar 2021 20:36:13 +0100
Message-Id: <20210326193701.5981-18-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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

the armv7m one should go away with proper
configuration changes (only enabling possible boards for KVM).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/helper-stubs.c | 21 +++++++++++++++++++++
 target/arm/tcg/meson.build    |  3 +++
 2 files changed, 24 insertions(+)
 create mode 100644 target/arm/tcg/helper-stubs.c

diff --git a/target/arm/tcg/helper-stubs.c b/target/arm/tcg/helper-stubs.c
new file mode 100644
index 0000000000..3df03a28da
--- /dev/null
+++ b/target/arm/tcg/helper-stubs.c
@@ -0,0 +1,21 @@
+/*
+ * QEMU ARM stubs for some TCG helper functions
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
+int fp_exception_el(CPUARMState *env, int cur_el)
+{
+    return 0;
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 21d44404f3..a0ef03a6e3 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -27,6 +27,9 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vfp_helper.c',
   'crypto_helper.c',
   'debug_helper.c',
+
+), if_false: files(
+  'helper-stubs.c',
 ))
 
 arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
-- 
2.26.2


