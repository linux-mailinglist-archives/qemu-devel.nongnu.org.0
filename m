Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A12D8927
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:20:58 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9Vp-0001bo-BG
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9PA-0004bs-K7
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:36582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9P3-0000Hh-WF
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D33BAAEAE;
 Sat, 12 Dec 2020 15:55:41 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 08/23] i386: tcg: remove inline from cpu_load_eflags
Date: Sat, 12 Dec 2020 16:55:15 +0100
Message-Id: <20201212155530.23098-9-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212155530.23098-1-cfontana@suse.de>
References: <20201212155530.23098-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

make it a regular function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/helper-tcg.h  | 15 ++-------------
 target/i386/tcg/misc_helper.c | 13 +++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 148edf49a3..c133c63555 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -78,19 +78,8 @@ void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_int,
 /* cc_helper.c */
 extern const uint8_t parity_table[256];
 
-/*
- * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
- * after generating a call to a helper that uses this.
- */
-static inline void cpu_load_eflags(CPUX86State *env, int eflags,
-                                   int update_mask)
-{
-    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
-    CC_OP = CC_OP_EFLAGS;
-    env->df = 1 - (2 * ((eflags >> 10) & 1));
-    env->eflags = (env->eflags & ~update_mask) |
-        (eflags & update_mask) | 0x2;
-}
+/* misc_helper.c */
+void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 
 /* svm_helper.c */
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index c99370e5e3..0bd6c95749 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -26,6 +26,19 @@
 #include "exec/address-spaces.h"
 #include "helper-tcg.h"
 
+/*
+ * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
+ * after generating a call to a helper that uses this.
+ */
+void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask)
+{
+    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
+    CC_OP = CC_OP_EFLAGS;
+    env->df = 1 - (2 * ((eflags >> 10) & 1));
+    env->eflags = (env->eflags & ~update_mask) |
+        (eflags & update_mask) | 0x2;
+}
+
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.26.2


