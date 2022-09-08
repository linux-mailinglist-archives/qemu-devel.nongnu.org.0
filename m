Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15635B219F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 17:09:13 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWJ9U-0005xl-17
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 11:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWJ0t-00046S-80
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 11:00:22 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWJ0p-0002m9-Gi
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 11:00:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ABDC1F8E6;
 Thu,  8 Sep 2022 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662649214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybl8mAnoUHzLVFI/Q03er6yLC/R8GMakLvVe1gjPsP0=;
 b=Z4NCu9TGxv8katc18jbqNpAARQnyWdDy2He6sGlzaKzgyZpJPS/LY4My+PXt2Mv/9BLqBF
 rbE7HAP8Sqcd5azvtz7jNMvsyQCD1mhSsk+jE5veD/BU+Y7I1Q1B6O3sdXtI83PosC5W8f
 TXpuJm9PQMAbxlRSzlPC3fUqDBnkWTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662649214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybl8mAnoUHzLVFI/Q03er6yLC/R8GMakLvVe1gjPsP0=;
 b=wqhrtOi40dEkl+Q/sVOm16DPAB/O7pfOUc0Upauq4Vzr2vejNqutbfbZ7jToctonBFdYdr
 kWRQtGkf8OE2hrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5BE01322C;
 Thu,  8 Sep 2022 15:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SOLiLn0DGmMZZQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 15:00:13 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v3 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Date: Thu,  8 Sep 2022 17:00:09 +0200
Message-Id: <20220908150010.31095-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220908150010.31095-1-cfontana@suse.de>
References: <20220908150010.31095-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

improve error handling during module load, by changing:

bool module_load_one(const char *prefix, const char *lib_name);
void module_load_qom_one(const char *type);

to:

bool module_load_one(const char *prefix, const char *name, Error **errp);
bool module_load_qom_one(const char *type, Error **errp);

module_load_qom_one has been introduced in:

commit 28457744c345 ("module: qom module support"), which built on top of
module_load_one, but discarded the bool return value. Restore it.

Adapt all callers to emit errors, or ignore them, or fail hard,
as appropriate in each context.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 audio/audio.c         |   6 +-
 block.c               |  12 +++-
 block/dmg.c           |  10 ++-
 hw/core/qdev.c        |  10 ++-
 include/qemu/module.h |  38 ++++++++++--
 qom/object.c          |  15 ++++-
 softmmu/qtest.c       |   6 +-
 ui/console.c          |  18 +++++-
 util/module.c         | 140 ++++++++++++++++++++++++------------------
 9 files changed, 177 insertions(+), 78 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 76b8735b44..4f4bb10cce 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
 audio_driver *audio_driver_lookup(const char *name)
 {
     struct audio_driver *d;
+    Error *local_err = NULL;
 
     QLIST_FOREACH(d, &audio_drivers, next) {
         if (strcmp(name, d->name) == 0) {
@@ -79,7 +80,10 @@ audio_driver *audio_driver_lookup(const char *name)
         }
     }
 
-    audio_module_load_one(name);
+    if (!audio_module_load_one(name, &local_err) && local_err) {
+        error_report_err(local_err);
+    }
+
     QLIST_FOREACH(d, &audio_drivers, next) {
         if (strcmp(name, d->name) == 0) {
             return d;
diff --git a/block.c b/block.c
index bc85f46eed..85c3742d7a 100644
--- a/block.c
+++ b/block.c
@@ -464,7 +464,11 @@ BlockDriver *bdrv_find_format(const char *format_name)
     /* The driver isn't registered, maybe we need to load a module */
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (!strcmp(block_driver_modules[i].format_name, format_name)) {
-            block_module_load_one(block_driver_modules[i].library_name);
+            Error *local_err = NULL;
+            if (!block_module_load_one(block_driver_modules[i].library_name,
+                                       &local_err) && local_err) {
+                error_report_err(local_err);
+            }
             break;
         }
     }
@@ -976,7 +980,11 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (block_driver_modules[i].protocol_name &&
             !strcmp(block_driver_modules[i].protocol_name, protocol)) {
-            block_module_load_one(block_driver_modules[i].library_name);
+            Error *local_err = NULL;
+            if (!block_module_load_one(block_driver_modules[i].library_name,
+                                       &local_err) && local_err) {
+                error_report_err(local_err);
+            }
             break;
         }
     }
diff --git a/block/dmg.c b/block/dmg.c
index 98db18d82a..349b05d20b 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
     uint64_t plist_xml_offset, plist_xml_length;
     int64_t offset;
     int ret;
+    Error *local_err = NULL;
 
     ret = bdrv_apply_auto_read_only(bs, NULL, errp);
     if (ret < 0) {
@@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    block_module_load_one("dmg-bz2");
-    block_module_load_one("dmg-lzfse");
+    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
+        error_report_err(local_err);
+    }
+    local_err = NULL;
+    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
+        error_report_err(local_err);
+    }
 
     s->n_chunks = 0;
     s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0806d8fcaa..5902c59c94 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -148,7 +148,15 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
 DeviceState *qdev_new(const char *name)
 {
     if (!object_class_by_name(name)) {
-        module_load_qom_one(name);
+        Error *local_err = NULL;
+        if (!module_load_qom_one(name, &local_err)) {
+            if (local_err) {
+                error_report_err(local_err);
+            } else {
+                error_report("could not find a module for type '%s'", name);
+            }
+            abort();
+        }
     }
     return DEVICE(object_new(name));
 }
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 8c012bbe03..78d4c4de96 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -61,16 +61,44 @@ typedef enum {
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
 #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
-#define block_module_load_one(lib) module_load_one("block-", lib)
-#define ui_module_load_one(lib) module_load_one("ui-", lib)
-#define audio_module_load_one(lib) module_load_one("audio-", lib)
+#define block_module_load_one(lib, errp) module_load_one("block-", lib, errp)
+#define ui_module_load_one(lib, errp) module_load_one("ui-", lib, errp)
+#define audio_module_load_one(lib, errp) module_load_one("audio-", lib, errp)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-bool module_load_one(const char *prefix, const char *lib_name);
-void module_load_qom_one(const char *type);
+
+/*
+ * module_load_one: attempt to load a module from a set of directories
+ *
+ * directories searched are:
+ * - getenv("QEMU_MODULE_DIR")
+ * - get_relocated_path(CONFIG_QEMU_MODDIR);
+ * - /var/run/qemu/${version_dir}
+ *
+ * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
+ * name:           name of the module
+ * errp:           error to set in case the module is found, but load failed.
+ *
+ * Return value:   true on success (found and loaded);
+ *                 if module if found, but load failed, errp will be set.
+ *                 if module is not found, errp will not be set.
+ */
+bool module_load_one(const char *prefix, const char *name, Error **errp);
+
+/*
+ * module_load_qom_one: attempt to load a module to provide a QOM type
+ *
+ * type:           the type to be provided
+ * errp:           error to set.
+ *
+ * Return value:   true on success (found and loaded), false on failure.
+ *                 If a module is simply not found for the type,
+ *                 errp will not be set.
+ */
+bool module_load_qom_one(const char *type, Error **errp);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
diff --git a/qom/object.c b/qom/object.c
index d34608558e..6a74e6a478 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -526,8 +526,14 @@ void object_initialize(void *data, size_t size, const char *typename)
 
 #ifdef CONFIG_MODULES
     if (!type) {
-        module_load_qom_one(typename);
-        type = type_get_by_name(typename);
+        Error *local_err = NULL;
+        if (!module_load_qom_one(typename, &local_err)) {
+            if (local_err) {
+                error_report_err(local_err);
+            }
+        } else {
+            type = type_get_by_name(typename);
+        }
     }
 #endif
     if (!type) {
@@ -1033,7 +1039,10 @@ ObjectClass *module_object_class_by_name(const char *typename)
     oc = object_class_by_name(typename);
 #ifdef CONFIG_MODULES
     if (!oc) {
-        module_load_qom_one(typename);
+        Error *local_err = NULL;
+        if (!module_load_qom_one(typename, &local_err) && local_err) {
+            error_report_err(local_err);
+        }
         oc = object_class_by_name(typename);
     }
 #endif
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 76eb7bac56..bb83c7aae9 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -753,12 +753,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
     } else if (strcmp(words[0], "module_load") == 0) {
+        Error *local_err = NULL;
         g_assert(words[1] && words[2]);
 
         qtest_send_prefix(chr);
-        if (module_load_one(words[1], words[2])) {
+        if (module_load_one(words[1], words[2], &local_err)) {
             qtest_sendf(chr, "OK\n");
         } else {
+            if (local_err) {
+                error_report_err(local_err);
+            }
             qtest_sendf(chr, "FAIL\n");
         }
     } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
diff --git a/ui/console.c b/ui/console.c
index 765892f84f..34dd206167 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2632,7 +2632,11 @@ bool qemu_display_find_default(DisplayOptions *opts)
 
     for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
         if (dpys[prio[i]] == NULL) {
-            ui_module_load_one(DisplayType_str(prio[i]));
+            Error *local_err = NULL;
+            if (!ui_module_load_one(DisplayType_str(prio[i]), &local_err)
+                && local_err) {
+                error_report_err(local_err);
+            }
         }
         if (dpys[prio[i]] == NULL) {
             continue;
@@ -2650,7 +2654,11 @@ void qemu_display_early_init(DisplayOptions *opts)
         return;
     }
     if (dpys[opts->type] == NULL) {
-        ui_module_load_one(DisplayType_str(opts->type));
+        Error *local_err = NULL;
+        if (!ui_module_load_one(DisplayType_str(opts->type), &local_err)
+            && local_err) {
+            error_report_err(local_err);
+        }
     }
     if (dpys[opts->type] == NULL) {
         error_report("Display '%s' is not available.",
@@ -2680,7 +2688,11 @@ void qemu_display_help(void)
     printf("none\n");
     for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
         if (!dpys[idx]) {
-            ui_module_load_one(DisplayType_str(idx));
+            Error *local_err = NULL;
+            if (!ui_module_load_one(DisplayType_str(idx), &local_err)
+                && local_err) {
+                error_report_err(local_err);
+            }
         }
         if (dpys[idx]) {
             printf("%s\n",  DisplayType_str(dpys[idx]->type));
diff --git a/util/module.c b/util/module.c
index 8563edd626..102884ae22 100644
--- a/util/module.c
+++ b/util/module.c
@@ -21,6 +21,7 @@
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
+#include "qapi/error.h"
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
@@ -144,25 +145,22 @@ static bool module_check_arch(const QemuModinfo *modinfo)
     return true;
 }
 
-static int module_load_file(const char *fname, bool export_symbols)
+/*
+ * module_load_dso: attempt to load an existing dso file
+ *
+ * fname:          full pathname of the file to load
+ * export_symbols: if true, add the symbols to the global name space
+ * errp:           error to set.
+ *
+ * Return value:   true on success, false on error, and errp will be set.
+ */
+static bool module_load_dso(const char *fname, bool export_symbols,
+                            Error **errp)
 {
     GModule *g_module;
     void (*sym)(void);
-    const char *dsosuf = CONFIG_HOST_DSOSUF;
-    int len = strlen(fname);
-    int suf_len = strlen(dsosuf);
     ModuleEntry *e, *next;
-    int ret, flags;
-
-    if (len <= suf_len || strcmp(&fname[len - suf_len], dsosuf)) {
-        /* wrong suffix */
-        ret = -EINVAL;
-        goto out;
-    }
-    if (access(fname, F_OK)) {
-        ret = -ENOENT;
-        goto out;
-    }
+    int flags;
 
     assert(QTAILQ_EMPTY(&dso_init_list));
 
@@ -172,46 +170,38 @@ static int module_load_file(const char *fname, bool export_symbols)
     }
     g_module = g_module_open(fname, flags);
     if (!g_module) {
-        fprintf(stderr, "Failed to open module: %s\n",
-                g_module_error());
-        ret = -EINVAL;
-        goto out;
+        error_setg(errp, "failed to open module: %s", g_module_error());
+        return false;
     }
     if (!g_module_symbol(g_module, DSO_STAMP_FUN_STR, (gpointer *)&sym)) {
-        fprintf(stderr, "Failed to initialize module: %s\n",
-                fname);
-        /* Print some info if this is a QEMU module (but from different build),
-         * this will make debugging user problems easier. */
+        error_setg(errp, "failed to initialize module: %s", fname);
+        /*
+         * Print some info if this is a QEMU module (but from different build),
+         * this will make debugging user problems easier.
+         */
         if (g_module_symbol(g_module, "qemu_module_dummy", (gpointer *)&sym)) {
-            fprintf(stderr,
-                    "Note: only modules from the same build can be loaded.\n");
+            error_append_hint(errp,
+                              "Only modules from the same build can be loaded");
         }
         g_module_close(g_module);
-        ret = -EINVAL;
-    } else {
-        QTAILQ_FOREACH(e, &dso_init_list, node) {
-            e->init();
-            register_module_init(e->init, e->type);
-        }
-        ret = 0;
+        return false;
     }
 
+    QTAILQ_FOREACH(e, &dso_init_list, node) {
+        e->init();
+        register_module_init(e->init, e->type);
+    }
     trace_module_load_module(fname);
     QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
         QTAILQ_REMOVE(&dso_init_list, e, node);
         g_free(e);
     }
-out:
-    return ret;
+    return true;
 }
-#endif
 
-bool module_load_one(const char *prefix, const char *lib_name)
+bool module_load_one(const char *prefix, const char *name, Error **errp)
 {
     bool success = false;
-
-#ifdef CONFIG_MODULES
-    char *fname = NULL;
 #ifdef CONFIG_MODULE_UPGRADES
     char *version_dir;
 #endif
@@ -219,14 +209,13 @@ bool module_load_one(const char *prefix, const char *lib_name)
     char *dirs[5];
     char *module_name;
     int i = 0, n_dirs = 0;
-    int ret;
     bool export_symbols = false;
     static GHashTable *loaded_modules;
     const QemuModinfo *modinfo;
     const char **sl;
 
     if (!g_module_supported()) {
-        fprintf(stderr, "Module is not supported by system.\n");
+        error_setg(errp, "%s", "this platform does not support GLib modules");
         return false;
     }
 
@@ -234,7 +223,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
         loaded_modules = g_hash_table_new(g_str_hash, g_str_equal);
     }
 
-    module_name = g_strdup_printf("%s%s", prefix, lib_name);
+    module_name = g_strdup_printf("%s%s", prefix, name);
 
     if (g_hash_table_contains(loaded_modules, module_name)) {
         g_free(module_name);
@@ -246,6 +235,8 @@ bool module_load_one(const char *prefix, const char *lib_name)
         if (modinfo->arch) {
             if (strcmp(modinfo->name, module_name) == 0) {
                 if (!module_check_arch(modinfo)) {
+                    error_setg(errp, "module arch does not match: "
+                        "expected '%s', got '%s'", module_arch, modinfo->arch);
                     return false;
                 }
             }
@@ -254,7 +245,9 @@ bool module_load_one(const char *prefix, const char *lib_name)
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    module_load_one("", *sl);
+                    if (!(module_load_one("", *sl, errp))) {
+                        return false;
+                    }
                 }
             } else {
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
@@ -283,16 +276,26 @@ bool module_load_one(const char *prefix, const char *lib_name)
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
     for (i = 0; i < n_dirs; i++) {
-        fname = g_strdup_printf("%s/%s%s",
-                dirs[i], module_name, CONFIG_HOST_DSOSUF);
-        ret = module_load_file(fname, export_symbols);
-        g_free(fname);
-        fname = NULL;
-        /* Try loading until loaded a module file */
-        if (!ret) {
-            success = true;
+        char *fname = g_strdup_printf("%s/%s%s",
+                                      dirs[i], module_name, CONFIG_HOST_DSOSUF);
+        int ret = access(fname, F_OK);
+        if (ret != 0) {
+            if (errno == ENOENT || errno == ENOTDIR) {
+                /*
+                 * if we just don't find the module in this dir, try the next one.
+                 * If we don't find it in any dir, that can be fine too, user or
+                 * distro did not install the module. We will return false in this
+                 * case, with no error set.
+                 */
+                continue;
+            }
+            /* most common is EACCES here */
+            error_setg_errno(errp, errno, "error trying to access %s", fname);
             break;
         }
+        success = module_load_dso(fname, export_symbols, errp);
+        g_free(fname);
+        break;
     }
 
     if (!success) {
@@ -304,21 +307,20 @@ bool module_load_one(const char *prefix, const char *lib_name)
         g_free(dirs[i]);
     }
 
-#endif
     return success;
 }
 
-#ifdef CONFIG_MODULES
-
 static bool module_loaded_qom_all;
 
-void module_load_qom_one(const char *type)
+bool module_load_qom_one(const char *type, Error **errp)
 {
+    bool found = false;
     const QemuModinfo *modinfo;
     const char **sl;
 
     if (!type) {
-        return;
+        error_setg(errp, "%s", "type is NULL");
+        return false;
     }
 
     trace_module_lookup_object_type(type);
@@ -331,15 +333,26 @@ void module_load_qom_one(const char *type)
         }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
-                module_load_one("", modinfo->name);
+                if (found) {
+                    error_setg(errp, "multiple modules providing '%s'", type);
+                    found = false;
+                    break;
+                }
+                found = module_load_one("", modinfo->name, errp);
+                if (!found) {
+                    /* errp optionally set in module_load_one */
+                    break;
+                }
             }
         }
     }
+    return found;
 }
 
 void module_load_qom_all(void)
 {
     const QemuModinfo *modinfo;
+    Error *local_err = NULL;
 
     if (module_loaded_qom_all) {
         return;
@@ -352,7 +365,9 @@ void module_load_qom_all(void)
         if (!module_check_arch(modinfo)) {
             continue;
         }
-        module_load_one("", modinfo->name);
+        if (!module_load_one("", modinfo->name, &local_err) && local_err) {
+            error_report_err(local_err);
+        }
     }
     module_loaded_qom_all = true;
 }
@@ -368,7 +383,11 @@ void qemu_load_module_for_opts(const char *group)
         }
         for (sl = modinfo->opts; *sl != NULL; sl++) {
             if (strcmp(group, *sl) == 0) {
-                module_load_one("", modinfo->name);
+                Error *local_err = NULL;
+                if (!module_load_one("", modinfo->name, &local_err)
+                    && local_err) {
+                    error_report_err(local_err);
+                }
             }
         }
     }
@@ -378,7 +397,8 @@ void qemu_load_module_for_opts(const char *group)
 
 void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
-void module_load_qom_one(const char *type) {}
+bool module_load_one(const char *prefix, const char *name, Error **errp) { return true; }
+bool module_load_qom_one(const char *type, Error **errp) { return true; }
 void module_load_qom_all(void) {}
 
 #endif
-- 
2.26.2


