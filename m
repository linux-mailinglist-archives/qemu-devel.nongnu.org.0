Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED63D04AE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:32:59 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5yIM-0004je-4h
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH2-0003Qh-13
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:36 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH0-00029f-Du
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:35 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68156224AE;
 Tue, 20 Jul 2021 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626820293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO4Lc9qD4ayC2VxE6eKkc5Eo6fENhtdc5D33vXzFd0=;
 b=yBCu9he8NvbqCB1quUJHlaBpmmMmfksFUhYbMprtpsX6a0aOPW9iz15vjle4O88YrnWT3v
 56ZfgBoFh96+LMWLPlltp+/PeHMvWKYXf6/7jyIASYrgE8TaJChjdkuCEwbqiInUdngDn7
 SXb4FdZV77b3+cuymST29PkKlBh4H5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626820293;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO4Lc9qD4ayC2VxE6eKkc5Eo6fENhtdc5D33vXzFd0=;
 b=Jry9/RLMhIaY6ZM96hN3etk/IM3fvbTHUuBf2HTP2ogjROuOMTjaqFvHuLxZu1yipuvNYn
 Cz/wT4UAJ6SqmQAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1048213BAD;
 Tue, 20 Jul 2021 22:31:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OIDFMcJO92BzFgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 22:31:30 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] modules: Implement new helper functions
Date: Tue, 20 Jul 2021 19:31:19 -0300
Message-Id: <20210720223120.21711-2-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720223120.21711-1-jziviani@suse.de>
References: <20210720223120.21711-1-jziviani@suse.de>
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
 "Jose R. Ziviani" <jziviani@suse.de>, richard.henderson@linaro.org,
 cfontana@suse.de, pbonzini@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function module_load_one() fills a hash table with modules that
were successfuly loaded. However, that table is a static variable of
module_load_one(). This patch changes it and creates a function that
informs whether a given module was loaded or not.

It also creates a function that returns the module name given the
typename.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 include/qemu/module.h |  4 +++
 util/module.c         | 57 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 3deac0078b..f45773718d 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -14,6 +14,7 @@
 #ifndef QEMU_MODULE_H
 #define QEMU_MODULE_H
 
+#include <stdbool.h>
 
 #define DSO_STAMP_FUN         glue(qemu_stamp, CONFIG_STAMP)
 #define DSO_STAMP_FUN_STR     stringify(DSO_STAMP_FUN)
@@ -74,6 +75,9 @@ void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
+bool module_is_loaded(const char *name);
+const char *module_get_name_from_obj(const char *obj);
+
 /**
  * DOC: module info annotation macros
  *
diff --git a/util/module.c b/util/module.c
index 6bb4ad915a..f23adc65bf 100644
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
@@ -377,6 +372,39 @@ void qemu_load_module_for_opts(const char *group)
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
+const char *module_get_name_from_obj(const char *obj)
+{
+    const QemuModinfo *modinfo;
+    const char **sl;
+
+    if (!obj) {
+        return NULL;
+    }
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->objs) {
+            continue;
+        }
+
+        for (sl = modinfo->objs; *sl != NULL; sl++) {
+            if (strcmp(obj, *sl) == 0) {
+                return modinfo->name;
+            }
+        }
+    }
+
+    return NULL;
+}
+
 #else
 
 void module_allow_arch(const char *arch) {}
@@ -384,4 +412,19 @@ void qemu_load_module_for_opts(const char *group) {}
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
+char *module_get_name_from_obj(const char *obj)
+{
+    return NULL;
+}
+
 #endif
-- 
2.32.0


