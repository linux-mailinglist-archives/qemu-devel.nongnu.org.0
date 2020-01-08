Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D8133B99
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 07:17:20 +0100 (CET)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip4ed-0005Og-JG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 01:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ip4ca-0003jV-7U
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ip4cY-00069i-V9
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:12 -0500
Received: from mga17.intel.com ([192.55.52.151]:12859)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ip4cY-000620-Li
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 22:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,408,1571727600"; d="scan'208";a="254121002"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2020 22:15:03 -0800
From: Tao Xu <tao3.xu@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH RESEND v2 3/4] target/i386: Add new property note to versioned
 CPU models
Date: Wed,  8 Jan 2020 14:14:57 +0800
Message-Id: <20200108061458.8080-4-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108061458.8080-1-tao3.xu@intel.com>
References: <20200108061458.8080-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
 target/i386/cpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a6eb1b81fd..736b4c7326 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1690,6 +1690,7 @@ typedef struct PropValue {
 typedef struct X86CPUVersionDefinition {
     X86CPUVersion version;
     const char *alias;
+    const char *note;
     PropValue *props;
 } X86CPUVersionDefinition;
 
@@ -1720,6 +1721,7 @@ struct X86CPUModel {
     X86CPUDefinition *cpudef;
     /* CPU model version */
     X86CPUVersion version;
+    const char *note;
     /*
      * If true, this is an alias CPU model.
      * This matters only for "-cpu help" and query-cpu-definitions
@@ -4846,6 +4848,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     g_autofree char *name = x86_cpu_class_get_model_name(cc);
     g_autofree char *desc = g_strdup(cc->model_description);
     g_autofree char *alias_of = x86_cpu_class_get_alias_of(cc);
+    g_autofree char *model_id = x86_cpu_class_get_model_id(cc);
 
     if (!desc && alias_of) {
         if (cc->model && cc->model->version == CPU_VERSION_AUTO) {
@@ -4854,11 +4857,14 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
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
 }
 
 /* list available CPU models and flags */
@@ -5335,6 +5341,7 @@ static void x86_register_cpudef_types(X86CPUDefinition *def)
             x86_cpu_versioned_model_name(def, vdef->version);
         m->cpudef = def;
         m->version = vdef->version;
+        m->note = vdef->note;
         x86_register_cpu_model_type(name, m);
 
         if (vdef->alias) {
-- 
2.20.1


