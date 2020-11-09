Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B822AC26C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 18:34:54 +0100 (CET)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcB49-0000kD-J9
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 12:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcAxo-0002ur-As
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:28:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:56768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kcAxm-0005SS-8R
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:28:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E658AAD2D;
 Mon,  9 Nov 2020 17:28:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v1 10/10] module: add priority to module_init
Date: Mon,  9 Nov 2020 18:27:55 +0100
Message-Id: <20201109172755.16500-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109172755.16500-1-cfontana@suse.de>
References: <20201109172755.16500-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 21:17:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add a new version of module_init that also takes a priority argument,
and use it to be able to run a constructor last for INIT_ACCEL_CPU,

and thus avoid the manual work of keeping track how to conditionalize
the generic x86 cpu models registration.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/qemu/module.h | 17 ++++++++++++++++-
 target/i386/cpu.c     | 16 ++++++++++++----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 485eda986a..1f4fac6791 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -30,6 +30,13 @@ static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
 {                                                                           \
     register_dso_module_init(function, type);                               \
 }
+
+#define module_init_prio(function, type, prio)                                 \
+static void __attribute__((constructor(prio))) do_qemu_init_ ## function(void) \
+{                                                                              \
+    register_dso_module_init(function, type);                                  \
+}
+
 #else
 /* This should not be used directly.  Use block_init etc. instead.  */
 #define module_init(function, type)                                         \
@@ -37,6 +44,11 @@ static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
 {                                                                           \
     register_module_init(function, type);                                   \
 }
+#define module_init_prio(function, type, prio)                                 \
+static void __attribute__((constructor(prio))) do_qemu_init_ ## function(void) \
+{                                                                              \
+    register_module_init(function, type);                                      \
+}
 #endif
 
 typedef enum {
@@ -55,7 +67,10 @@ typedef enum {
 #define block_init(function) module_init(function, MODULE_INIT_BLOCK)
 #define opts_init(function) module_init(function, MODULE_INIT_OPTS)
 #define type_init(function) module_init(function, MODULE_INIT_QOM)
-#define accel_cpu_init(function) module_init(function, MODULE_INIT_ACCEL_CPU)
+#define accel_cpu_init(function) \
+    module_init_prio(function, MODULE_INIT_ACCEL_CPU, 101)
+#define accel_cpu_init_last(function) \
+    module_init_prio(function, MODULE_INIT_ACCEL_CPU, 65535)
 #define trace_init(function) module_init(function, MODULE_INIT_TRACE)
 #define xen_backend_init(function) module_init(function, \
                                                MODULE_INIT_XEN_BACKEND)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b547c9d39d..aeaebfde02 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7050,8 +7050,16 @@ static TypeInfo x86_base_cpu_type_info = {
  */
 void x86_cpu_register_cpu_models(const char *parent_type)
 {
+    static bool x86_cpu_models_registered;
     int i;
 
+    if (x86_cpu_models_registered) {
+        /*
+         * already registered by an accelerator-specific specialization
+         * of x86_cpu
+         */
+        return;
+    }
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef(&builtin_x86_defs[i], parent_type);
     }
@@ -7060,6 +7068,8 @@ void x86_cpu_register_cpu_models(const char *parent_type)
 
     x86_base_cpu_type_info.parent = parent_type;
     type_register(&x86_base_cpu_type_info);
+
+    x86_cpu_models_registered = true;
 }
 
 static void x86_cpu_register_base_type(void)
@@ -7077,9 +7087,7 @@ static void x86_cpu_type_init(void)
     /*
      * I would like something better than this check.
      */
-    if (!tcg_enabled() && !kvm_enabled() && !hvf_enabled()) {
-        x86_cpu_register_cpu_models(TYPE_X86_CPU);
-    }
+    x86_cpu_register_cpu_models(TYPE_X86_CPU);
 }
 
-accel_cpu_init(x86_cpu_type_init);
+accel_cpu_init_last(x86_cpu_type_init);
-- 
2.26.2


