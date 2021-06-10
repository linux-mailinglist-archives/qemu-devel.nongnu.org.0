Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DE3A2450
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:14:03 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDx4-0004Vb-QF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjP-0005k9-AD
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjN-0002Uo-Gt
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sV4aB/aDk6IWBiZQ3qH+tzuJbJ738mCY2QlQR4APApY=;
 b=XAfwrzjDH7nbTD1quVSADyEs2IyuXZpsmNoZCgdqsB/x9hSSjX3YoGxDm+cRdagKLUaM9I
 0eRepmb/ZlKU+KLiqQrGXV7lbG4NjxnLI35ihx/H/25o2xnQY/2/1a8g6iJtwxqYoO92fY
 JHWjfLqGPhDQllxWmE4RhOaIHPxDyhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-5RuFhQ0sMdmZpnMVHNGS4A-1; Thu, 10 Jun 2021 01:59:49 -0400
X-MC-Unique: 5RuFhQ0sMdmZpnMVHNGS4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC061101C8A9;
 Thu, 10 Jun 2021 05:59:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FEC119C46;
 Thu, 10 Jun 2021 05:59:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EBA5718017D3; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] modules: add module_load_path_init helper
Date: Thu, 10 Jun 2021 07:57:49 +0200
Message-Id: <20210610055755.538119-13-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor out module search path initialization to the new
module_load_path_init() helper.  Also store the search path in
global variables and keep it so we have to do it only once.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 58 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/util/module.c b/util/module.c
index eee8ff2de136..3a2d6dde9734 100644
--- a/util/module.c
+++ b/util/module.c
@@ -110,6 +110,36 @@ void module_call_init(module_init_type type)
 }
 
 #ifdef CONFIG_MODULES
+
+static char *module_dirs[5];
+static int module_ndirs;
+
+static void module_load_path_init(void)
+{
+    const char *search_dir;
+
+    if (module_ndirs) {
+        return;
+    }
+
+    search_dir = getenv("QEMU_MODULE_DIR");
+    if (search_dir != NULL) {
+        module_dirs[module_ndirs++] = g_strdup_printf("%s", search_dir);
+    }
+    module_dirs[module_ndirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
+    module_dirs[module_ndirs++] = g_strdup(qemu_get_exec_dir());
+
+#ifdef CONFIG_MODULE_UPGRADES
+    version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
+                             G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
+                             '_');
+    module_dirs[module_ndirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
+#endif
+
+    assert(module_ndirs <= ARRAY_SIZE(module_dirs));
+
+}
+
 static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
 {
     GModule *g_module;
@@ -204,10 +234,8 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 #ifdef CONFIG_MODULE_UPGRADES
     char *version_dir;
 #endif
-    const char *search_dir;
-    char *dirs[5];
     char *module_name;
-    int i = 0, n_dirs = 0;
+    int i = 0;
     int ret, dep;
     bool export_symbols = false;
     static GHashTable *loaded_modules;
@@ -240,25 +268,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     }
     g_hash_table_add(loaded_modules, module_name);
 
-    search_dir = getenv("QEMU_MODULE_DIR");
-    if (search_dir != NULL) {
-        dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
-    }
-    dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-    dirs[n_dirs++] = g_strdup(qemu_get_exec_dir());
+    module_load_path_init();
 
-#ifdef CONFIG_MODULE_UPGRADES
-    version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-                             G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
-                             '_');
-    dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
-#endif
-
-    assert(n_dirs <= ARRAY_SIZE(dirs));
-
-    for (i = 0; i < n_dirs; i++) {
+    for (i = 0; i < module_ndirs; i++) {
         fname = g_strdup_printf("%s/%s%s",
-                dirs[i], module_name, CONFIG_HOST_DSOSUF);
+                module_dirs[i], module_name, CONFIG_HOST_DSOSUF);
         ret = module_load_file(fname, mayfail, export_symbols);
         g_free(fname);
         fname = NULL;
@@ -274,10 +288,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         g_free(module_name);
     }
 
-    for (i = 0; i < n_dirs; i++) {
-        g_free(dirs[i]);
-    }
-
 #endif
     return success;
 }
-- 
2.31.1


