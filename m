Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DD3B8AF6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 01:30:07 +0200 (CEST)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyjeg-0005wg-Ev
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 19:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjcj-0003VT-Fw
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:05 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjch-0001Io-QI
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:05 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1E612279A;
 Wed, 30 Jun 2021 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJfVoDi1pO/XbYFWOW3cRPVtpKatrx3osqgLwEZBdH8=;
 b=uX+UoSqOjzokht8Dmska0/EK8i9GXZz23zxK8QPnhNyv2dALNqc/rHb6h5slch+4ngZoTv
 PqJ757qoUo0lB5UBRh8Y0uXNrCZAGMaVA3FdHHJp/U97mjkgyoekmgrVoyu8nhwc07hIQZ
 BHtfeLE/jdEZnoQPIavtUQD6JySc3KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJfVoDi1pO/XbYFWOW3cRPVtpKatrx3osqgLwEZBdH8=;
 b=GScGqumomDM4fcPAUJAvCDz0nkqw0PyylMIEKJoaVIwfNBvGxMbSL7aM+gA3P7we7WTEcy
 ZgctDbQNkBHwReDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 543AE118DD;
 Wed, 30 Jun 2021 23:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJfVoDi1pO/XbYFWOW3cRPVtpKatrx3osqgLwEZBdH8=;
 b=uX+UoSqOjzokht8Dmska0/EK8i9GXZz23zxK8QPnhNyv2dALNqc/rHb6h5slch+4ngZoTv
 PqJ757qoUo0lB5UBRh8Y0uXNrCZAGMaVA3FdHHJp/U97mjkgyoekmgrVoyu8nhwc07hIQZ
 BHtfeLE/jdEZnoQPIavtUQD6JySc3KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJfVoDi1pO/XbYFWOW3cRPVtpKatrx3osqgLwEZBdH8=;
 b=GScGqumomDM4fcPAUJAvCDz0nkqw0PyylMIEKJoaVIwfNBvGxMbSL7aM+gA3P7we7WTEcy
 ZgctDbQNkBHwReDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mDC0BQD+3GA/IQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Wed, 30 Jun 2021 23:28:00 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 2/3] modules: Implement module_is_loaded function
Date: Wed, 30 Jun 2021 20:27:48 -0300
Message-Id: <20210630232749.21873-3-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630232749.21873-1-jziviani@suse.de>
References: <20210630232749.21873-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function module_load_one() fills a hash table will all modules that
were successfuly loaded. However, that table is a static variable of
module_load_one(). This patch changes it and creates a function that
informs whether a given module was loaded or not.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 include/qemu/module.h |  3 +++
 util/module.c         | 28 +++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 456e190a55..01779cc7fb 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -14,6 +14,7 @@
 #ifndef QEMU_MODULE_H
 #define QEMU_MODULE_H
 
+#include <stdbool.h>
 
 #define DSO_STAMP_FUN         glue(qemu_stamp, CONFIG_STAMP)
 #define DSO_STAMP_FUN_STR     stringify(DSO_STAMP_FUN)
@@ -74,6 +75,8 @@ void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
+bool module_is_loaded(const char *name);
+
 /**
  * DOC: module info annotation macros
  *
diff --git a/util/module.c b/util/module.c
index 6bb4ad915a..64307b7a25 100644
--- a/util/module.c
+++ b/util/module.c
@@ -119,6 +119,8 @@ static const QemuModinfo module_info_stub[] = { {
 static const QemuModinfo *module_info = module_info_stub;
 static const char *module_arch;
 
+static GHashTable *loaded_modules;
+
 void module_init_info(const QemuModinfo *info)
 {
     module_info = info;
@@ -206,13 +208,10 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
 out:
     return ret;
 }
-#endif
 
 bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 {
     bool success = false;
-
-#ifdef CONFIG_MODULES
     char *fname = NULL;
 #ifdef CONFIG_MODULE_UPGRADES
     char *version_dir;
@@ -223,7 +222,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     int i = 0, n_dirs = 0;
     int ret;
     bool export_symbols = false;
-    static GHashTable *loaded_modules;
     const QemuModinfo *modinfo;
     const char **sl;
 
@@ -307,12 +305,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         g_free(dirs[i]);
     }
 
-#endif
     return success;
 }
 
-#ifdef CONFIG_MODULES
-
 static bool module_loaded_qom_all;
 
 void module_load_qom_one(const char *type)
@@ -377,6 +372,15 @@ void qemu_load_module_for_opts(const char *group)
     }
 }
 
+bool module_is_loaded(const char *name)
+{
+    if (!loaded_modules || !g_hash_table_contains(loaded_modules, name)) {
+        return false;
+    }
+
+    return true;
+}
+
 #else
 
 void module_allow_arch(const char *arch) {}
@@ -384,4 +388,14 @@ void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
 
+bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
+{
+    return false;
+}
+
+bool module_is_loaded(const char *name)
+{
+    return false;
+}
+
 #endif
-- 
2.32.0


