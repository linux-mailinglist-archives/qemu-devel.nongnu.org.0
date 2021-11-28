Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507594602C4
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 02:18:50 +0100 (CET)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr8q8-0003j2-Im
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 20:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <juro.bystricky@intel.com>)
 id 1mr8oS-00031h-MI; Sat, 27 Nov 2021 20:17:04 -0500
Received: from mga18.intel.com ([134.134.136.126]:59618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <juro.bystricky@intel.com>)
 id 1mr8oM-00050I-TI; Sat, 27 Nov 2021 20:17:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="222668209"
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="222668209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2021 17:16:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="608276451"
Received: from vm-rhel-devel-juro.jf.intel.com ([10.54.87.224])
 by orsmga004.jf.intel.com with ESMTP; 27 Nov 2021 17:16:54 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] tests/plugin/syscall.c: fix compiler warnings
Date: Sat, 27 Nov 2021 17:15:51 -0800
Message-Id: <20211128011551.2115468-1-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=juro.bystricky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jurobystricky@hotmail.com, erdnaxe@crans.org, ma.mandourr@gmail.com,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix compiler warnings. The warnings can result in a broken build.
This patch fixes warnings such as:

In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘print_entry’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
       used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:82:23: note: ‘out’ was declared here
     g_autofree gchar *out;
                       ^~~
In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘vcpu_syscall_ret’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
        used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:73:27: note: ‘out’ was declared here
         g_autofree gchar *out;
                           ^~~
cc1: all warnings being treated as errors

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 tests/plugin/syscall.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 484b48de49..96040c578f 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -70,19 +70,17 @@ static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
         }
         g_mutex_unlock(&lock);
     } else {
-        g_autofree gchar *out;
-        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-                num, ret);
+        g_autofree gchar *out = g_strdup_printf(
+             "syscall #%" PRIi64 " returned -> %" PRIi64 "\n", num, ret);
         qemu_plugin_outs(out);
     }
 }
 
 static void print_entry(gpointer val, gpointer user_data)
 {
-    g_autofree gchar *out;
     SyscallStats *entry = (SyscallStats *) val;
     int64_t syscall_num = entry->num;
-    out = g_strdup_printf(
+    g_autofree gchar *out = g_strdup_printf(
         "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
         syscall_num, entry->calls, entry->errors);
     qemu_plugin_outs(out);
-- 
2.27.0


