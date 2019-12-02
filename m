Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F810E5F6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 07:30:12 +0100 (CET)
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibfDn-00043Y-7t
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 01:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ibfCm-0003Dd-On
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 01:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ibfCl-0007cN-2U
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 01:29:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:35661)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ibfCk-0007bm-Q0
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 01:29:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 22:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="360703500"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga004.jf.intel.com with ESMTP; 01 Dec 2019 22:29:00 -0800
From: Tao Xu <tao3.xu@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH 3/4] target/i386: Add new property note to versioned CPU models
Date: Mon,  2 Dec 2019 14:28:50 +0800
Message-Id: <20191202062852.27948-4-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202062852.27948-2-tao3.xu@intel.com>
References: <20191202062852.27948-2-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: tao3.xu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add additional information for -cpu help to indicate the changes in this
version of CPU model.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b09ac38409..7b3bd6d4db 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1693,6 +1693,7 @@ typedef struct PropValue {
 typedef struct X86CPUVersionDefinition {
     X86CPUVersion version;
     const char *alias;
+    const char *note;
     PropValue *props;
 } X86CPUVersionDefinition;
 
@@ -1723,6 +1724,7 @@ struct X86CPUModel {
     X86CPUDefinition *cpudef;
     /* CPU model version */
     X86CPUVersion version;
+    const char *note;
     /*
      * If true, this is an alias CPU model.
      * This matters only for "-cpu help" and query-cpu-definitions
@@ -4788,6 +4790,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     char *name = x86_cpu_class_get_model_name(cc);
     char *desc = g_strdup(cc->model_description);
     char *alias_of = x86_cpu_class_get_alias_of(cc);
+    char *model_id = x86_cpu_class_get_model_id(cc);
 
     if (!desc && alias_of) {
         if (cc->model && cc->model->version == CPU_VERSION_AUTO) {
@@ -4796,14 +4799,18 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
             desc = g_strdup_printf("(alias of %s)", alias_of);
         }
     }
+    if (!desc && cc->model && cc->model->note) {
+        desc = g_strdup_printf("%s [%s]", model_id, cc->model->note);
+    }
     if (!desc) {
-        desc = x86_cpu_class_get_model_id(cc);
+        desc = g_strdup_printf("%s", model_id);
     }
 
-    qemu_printf("x86 %-20s  %-48s\n", name, desc);
+    qemu_printf("x86 %-20s  %-58s\n", name, desc);
     g_free(name);
     g_free(desc);
     g_free(alias_of);
+    g_free(model_id);
 }
 
 /* list available CPU models and flags */
@@ -5280,6 +5287,7 @@ static void x86_register_cpudef_types(X86CPUDefinition *def)
         X86CPUModel *m = g_new0(X86CPUModel, 1);
         m->cpudef = def;
         m->version = vdef->version;
+        m->note = vdef->note;
         name = x86_cpu_versioned_model_name(def, vdef->version);
         x86_register_cpu_model_type(name, m);
         g_free(name);
-- 
2.20.1


