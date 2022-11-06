Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F661E11C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:55:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPy-0001sJ-E9; Sun, 06 Nov 2022 03:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPo-0001m1-7U
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPj-0002yG-D3
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP8L+i3smBJwnsnZOqw14mIBwknuPdevOPzr2DbodaM=;
 b=BZzCmRDA7rCTEuR2SQYlZ0jUX5bWuNDe+Wg7txBJ6IB4Zpc+4ffKJWGqHwiIx6fV7XqW6Z
 7x4ULTCopPLvk/wEHxLxQHDAJ9YFljjgu971v/jb5pmpEUd0Lpu4EQRTyYo61oXlklFYca
 AfjDaP8KFfNeFOB02Kgo53Z4GJUFgGY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-lnuf9linPymXlQGlSjaqrw-1; Sun, 06 Nov 2022 03:53:57 -0500
X-MC-Unique: lnuf9linPymXlQGlSjaqrw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso1997212wrb.8
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jP8L+i3smBJwnsnZOqw14mIBwknuPdevOPzr2DbodaM=;
 b=nHE6Iz1QZcA8RWY79PEWrSkz1EOtv2BNHa5z6E+XcnWrVkuvs0m17zR2/YOXYmFG0P
 cy/ICsS+WhJ5kLldCYe1IbfK9IIcbX8PmeYguJKWjBvx3Ibtl54GLSit6GP6/HMoGpGZ
 MTEk3OnmtZA/6OR2/aB7k/fSzkB0HEMN6av7rv73WTLP819oFIEh9ojcNyweIwjYCV5T
 H6E1MA6Kw02tIQw43oKluvdMf/dF4LHGxlIXhqxbNzy6GHRI+Dy8qsIC+gRYYu5ZX0vq
 tRGlP7sCo+HdgbJgPXrKb6uJhAlbcP9viFPeHqNWUZQqBjOaDRBN5WPAU4M27AAjIP+r
 N1ZQ==
X-Gm-Message-State: ACrzQf1qkGBxfYVDWou53gGK783jRqbDWGTIAVP3shqoVwnZZNYqrVQG
 6bR9xcEcorxZcauhLIPQ6GRyUhMPfdW/Ib0laajujYhx86mFR3EEO/TB83ieTZniEXg5AifLicj
 5ZYRJ25pr0EecfDElKOuniPmt0leapVdmxDJE2Jc0PG5rVdHuIPfTnOe5gEECb6Ny4vw=
X-Received: by 2002:a05:6000:1f18:b0:236:8e08:68e1 with SMTP id
 bv24-20020a0560001f1800b002368e0868e1mr27812527wrb.67.1667724835286; 
 Sun, 06 Nov 2022 01:53:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QVzuj315ScJ8DuGkKd5WhBmCtaA6Z/GgTAyUk3yu+LvS6ALNuiMlftJOgp1wx1zWOPVjg3w==
X-Received: by 2002:a05:6000:1f18:b0:236:8e08:68e1 with SMTP id
 bv24-20020a0560001f1800b002368e0868e1mr27812499wrb.67.1667724834712; 
 Sun, 06 Nov 2022 01:53:54 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a5d4050000000b002366dd0e030sm4119355wrp.68.2022.11.06.01.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/12] module: add Error arguments to module_load and
 module_load_qom
Date: Sun,  6 Nov 2022 09:51:13 +0100
Message-Id: <20221106085115.257018-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

improve error handling during module load, by changing:

bool module_load(const char *prefix, const char *lib_name);
void module_load_qom(const char *type);

to:

int module_load(const char *prefix, const char *name, Error **errp);
int module_load_qom(const char *type, Error **errp);

where the return value is:

 -1 on module load error, and errp is set with the error
  0 on module or one of its dependencies are not installed
  1 on module load success
  2 on module load success (module already loaded or built-in)

module_load_qom_one has been introduced in:

commit 28457744c345 ("module: qom module support"), which built on top of
module_load_one, but discarded the bool return value. Restore it.

Adapt all callers to emit errors, or ignore them, or fail hard,
as appropriate in each context.

Replace the previous emission of errors via fprintf in _some_ error
conditions with Error and error_report, so as to emit to the appropriate
target.

A memory leak is also fixed as part of the module_load changes.

audio: when attempting to load an audio module, report module load errors.
Note that still for some callers, a single issue may generate multiple
error reports, and this could be improved further.
Regarding the audio code itself, audio_add() seems to ignore errors,
and this should probably be improved.

block: when attempting to load a block module, report module load errors.
For the code paths that already use the Error API, take advantage of those
to report module load errors into the Error parameter.
For the other code paths, we currently emit the error, but this could be
improved further by adding Error parameters to all possible code paths.

console: when attempting to load a display module, report module load errors.

qdev: when creating a new qdev Device object (DeviceState), report load errors.
      If a module cannot be loaded to create that device, now abort execution
      (if no CONFIG_MODULE) or exit (if CONFIG_MODULE).

qom/object.c: when initializing a QOM object, or looking up class_by_name,
              report module load errors.

qtest: when processing the "module_load" qtest command, report errors
       in the load of the module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929093035.4231-4-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/audio.c         |  16 ++--
 block.c               |  20 +++-
 block/dmg.c           |  14 ++-
 hw/core/qdev.c        |  17 +++-
 include/qemu/module.h |  37 +++++++-
 qom/object.c          |  18 +++-
 softmmu/qtest.c       |   8 +-
 ui/console.c          |  18 +++-
 util/module.c         | 209 +++++++++++++++++++++++-------------------
 9 files changed, 234 insertions(+), 123 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 379f19dc891f..065602ce1b95 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -73,20 +73,24 @@ void audio_driver_register(audio_driver *drv)
 audio_driver *audio_driver_lookup(const char *name)
 {
     struct audio_driver *d;
+    Error *local_err = NULL;
+    int rv;
 
     QLIST_FOREACH(d, &audio_drivers, next) {
         if (strcmp(name, d->name) == 0) {
             return d;
         }
     }
-
-    audio_module_load(name);
-    QLIST_FOREACH(d, &audio_drivers, next) {
-        if (strcmp(name, d->name) == 0) {
-            return d;
+    rv = audio_module_load(name, &local_err);
+    if (rv > 0) {
+        QLIST_FOREACH(d, &audio_drivers, next) {
+            if (strcmp(name, d->name) == 0) {
+                return d;
+            }
         }
+    } else if (rv < 0) {
+        error_report_err(local_err);
     }
-
     return NULL;
 }
 
diff --git a/block.c b/block.c
index ddd743c44735..c5e20c0beae3 100644
--- a/block.c
+++ b/block.c
@@ -464,12 +464,18 @@ BlockDriver *bdrv_find_format(const char *format_name)
     /* The driver isn't registered, maybe we need to load a module */
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (!strcmp(block_driver_modules[i].format_name, format_name)) {
-            block_module_load(block_driver_modules[i].library_name);
+            Error *local_err = NULL;
+            int rv = block_module_load(block_driver_modules[i].library_name,
+                                       &local_err);
+            if (rv > 0) {
+                return bdrv_do_find_format(format_name);
+            } else if (rv < 0) {
+                error_report_err(local_err);
+            }
             break;
         }
     }
-
-    return bdrv_do_find_format(format_name);
+    return NULL;
 }
 
 static int bdrv_format_is_whitelisted(const char *format_name, bool read_only)
@@ -981,12 +987,16 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (block_driver_modules[i].protocol_name &&
             !strcmp(block_driver_modules[i].protocol_name, protocol)) {
-            block_module_load(block_driver_modules[i].library_name);
+            int rv = block_module_load(block_driver_modules[i].library_name, errp);
+            if (rv > 0) {
+                drv1 = bdrv_do_find_protocol(protocol);
+            } else if (rv < 0) {
+                return NULL;
+            }
             break;
         }
     }
 
-    drv1 = bdrv_do_find_protocol(protocol);
     if (!drv1) {
         error_setg(errp, "Unknown protocol '%s'", protocol);
     }
diff --git a/block/dmg.c b/block/dmg.c
index b5a93b086b20..ba8ec344d479 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -444,9 +444,17 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
     if (ret < 0) {
         return ret;
     }
-
-    block_module_load("dmg-bz2");
-    block_module_load("dmg-lzfse");
+    /*
+     * NB: if uncompress submodules are absent,
+     * ie block_module_load return value == 0, the function pointers
+     * dmg_uncompress_bz2 and dmg_uncompress_lzfse will be NULL.
+     */
+    if (block_module_load("dmg-bz2", errp) < 0) {
+        return -EINVAL;
+    }
+    if (block_module_load("dmg-lzfse", errp) < 0) {
+        return -EINVAL;
+    }
 
     s->n_chunks = 0;
     s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 25dfc0846801..014550190447 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -147,8 +147,21 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
 
 DeviceState *qdev_new(const char *name)
 {
-    if (!object_class_by_name(name)) {
-        module_load_qom(name);
+    ObjectClass *oc = object_class_by_name(name);
+#ifdef CONFIG_MODULES
+    if (!oc) {
+        int rv = module_load_qom(name, &error_fatal);
+        if (rv > 0) {
+            oc = object_class_by_name(name);
+        } else {
+            error_report("could not find a module for type '%s'", name);
+            exit(1);
+        }
+    }
+#endif
+    if (!oc) {
+        error_report("unknown type '%s'", name);
+        abort();
     }
     return DEVICE(object_new(name));
 }
diff --git a/include/qemu/module.h b/include/qemu/module.h
index b7911ce79161..c37ce74b16ff 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -61,16 +61,43 @@ typedef enum {
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
 #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
-#define block_module_load(lib) module_load("block-", lib)
-#define ui_module_load(lib) module_load("ui-", lib)
-#define audio_module_load(lib) module_load("audio-", lib)
+#define block_module_load(lib, errp) module_load("block-", lib, errp)
+#define ui_module_load(lib, errp) module_load("ui-", lib, errp)
+#define audio_module_load(lib, errp) module_load("audio-", lib, errp)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-bool module_load(const char *prefix, const char *lib_name);
-void module_load_qom(const char *type);
+
+/*
+ * module_load: attempt to load a module from a set of directories
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
+ * Return value:   -1 on error (errp set if not NULL).
+ *                 0 if module or one of its dependencies are not installed,
+ *                 1 if the module is found and loaded,
+ *                 2 if the module is already loaded, or module is built-in.
+ */
+int module_load(const char *prefix, const char *name, Error **errp);
+
+/*
+ * module_load_qom: attempt to load a module to provide a QOM type
+ *
+ * type:           the type to be provided
+ * errp:           error to set.
+ *
+ * Return value:   as per module_load.
+ */
+int module_load_qom(const char *type, Error **errp);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
diff --git a/qom/object.c b/qom/object.c
index aba942bdf31c..e25f1e96db1e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -526,8 +526,13 @@ void object_initialize(void *data, size_t size, const char *typename)
 
 #ifdef CONFIG_MODULES
     if (!type) {
-        module_load_qom(typename);
-        type = type_get_by_name(typename);
+        int rv = module_load_qom(typename, &error_fatal);
+        if (rv > 0) {
+            type = type_get_by_name(typename);
+        } else {
+            error_report("missing object type '%s'", typename);
+            exit(1);
+        }
     }
 #endif
     if (!type) {
@@ -1033,8 +1038,13 @@ ObjectClass *module_object_class_by_name(const char *typename)
     oc = object_class_by_name(typename);
 #ifdef CONFIG_MODULES
     if (!oc) {
-        module_load_qom(typename);
-        oc = object_class_by_name(typename);
+        Error *local_err = NULL;
+        int rv = module_load_qom(typename, &local_err);
+        if (rv > 0) {
+            oc = object_class_by_name(typename);
+        } else if (rv < 0) {
+            error_report_err(local_err);
+        }
     }
 #endif
     return oc;
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 774354565165..d3e0ab4eda26 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -753,12 +753,18 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
     } else if (strcmp(words[0], "module_load") == 0) {
+        Error *local_err = NULL;
+        int rv;
         g_assert(words[1] && words[2]);
 
         qtest_send_prefix(chr);
-        if (module_load(words[1], words[2])) {
+        rv = module_load(words[1], words[2], &local_err);
+        if (rv > 0) {
             qtest_sendf(chr, "OK\n");
         } else {
+            if (rv < 0) {
+                error_report_err(local_err);
+            }
             qtest_sendf(chr, "FAIL\n");
         }
     } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
diff --git a/ui/console.c b/ui/console.c
index 44dfb0f52b1c..3c0d9b061ac5 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2632,7 +2632,11 @@ bool qemu_display_find_default(DisplayOptions *opts)
 
     for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
         if (dpys[prio[i]] == NULL) {
-            ui_module_load(DisplayType_str(prio[i]));
+            Error *local_err = NULL;
+            int rv = ui_module_load(DisplayType_str(prio[i]), &local_err);
+            if (rv < 0) {
+                error_report_err(local_err);
+            }
         }
         if (dpys[prio[i]] == NULL) {
             continue;
@@ -2650,7 +2654,11 @@ void qemu_display_early_init(DisplayOptions *opts)
         return;
     }
     if (dpys[opts->type] == NULL) {
-        ui_module_load(DisplayType_str(opts->type));
+        Error *local_err = NULL;
+        int rv = ui_module_load(DisplayType_str(opts->type), &local_err);
+        if (rv < 0) {
+            error_report_err(local_err);
+        }
     }
     if (dpys[opts->type] == NULL) {
         error_report("Display '%s' is not available.",
@@ -2680,7 +2688,11 @@ void qemu_display_help(void)
     printf("none\n");
     for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
         if (!dpys[idx]) {
-            ui_module_load(DisplayType_str(idx));
+            Error *local_err = NULL;
+            int rv = ui_module_load(DisplayType_str(idx), &local_err);
+            if (rv < 0) {
+                error_report_err(local_err);
+            }
         }
         if (dpys[idx]) {
             printf("%s\n",  DisplayType_str(dpys[idx]->type));
diff --git a/util/module.c b/util/module.c
index ad89cd50dc2a..32e263163c75 100644
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
+                "Only modules from the same build can be loaded.\n");
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
 
-bool module_load(const char *prefix, const char *lib_name)
+int module_load(const char *prefix, const char *name, Error **errp)
 {
-    bool success = false;
-
-#ifdef CONFIG_MODULES
-    char *fname = NULL;
+    int rv = -1;
 #ifdef CONFIG_MODULE_UPGRADES
     char *version_dir;
 #endif
@@ -219,54 +209,29 @@ bool module_load(const char *prefix, const char *lib_name)
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
-        return false;
+        error_setg(errp, "%s", "this platform does not support GLib modules");
+        return -1;
     }
 
     if (!loaded_modules) {
         loaded_modules = g_hash_table_new(g_str_hash, g_str_equal);
     }
 
-    module_name = g_strdup_printf("%s%s", prefix, lib_name);
+    /* allocate all resources managed by the out: label here */
+    module_name = g_strdup_printf("%s%s", prefix, name);
 
     if (g_hash_table_contains(loaded_modules, module_name)) {
         g_free(module_name);
-        return true;
+        return 2; /* module already loaded */
     }
     g_hash_table_add(loaded_modules, module_name);
 
-    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
-        if (modinfo->arch) {
-            if (strcmp(modinfo->name, module_name) == 0) {
-                if (!module_check_arch(modinfo)) {
-                    return false;
-                }
-            }
-        }
-        if (modinfo->deps) {
-            if (strcmp(modinfo->name, module_name) == 0) {
-                /* we depend on other module(s) */
-                for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    module_load("", *sl);
-                }
-            } else {
-                for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    if (strcmp(module_name, *sl) == 0) {
-                        /* another module depends on us */
-                        export_symbols = true;
-                    }
-                }
-            }
-        }
-    }
-
     search_dir = getenv("QEMU_MODULE_DIR");
     if (search_dir != NULL) {
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
@@ -279,46 +244,87 @@ bool module_load(const char *prefix, const char *lib_name)
                              '_');
     dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
 #endif
-
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
-    for (i = 0; i < n_dirs; i++) {
-        fname = g_strdup_printf("%s/%s%s",
-                dirs[i], module_name, CONFIG_HOST_DSOSUF);
-        ret = module_load_file(fname, export_symbols);
-        g_free(fname);
-        fname = NULL;
-        /* Try loading until loaded a module file */
-        if (!ret) {
-            success = true;
-            break;
+    /* end of resources managed by the out: label */
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (modinfo->arch) {
+            if (strcmp(modinfo->name, module_name) == 0) {
+                if (!module_check_arch(modinfo)) {
+                    error_setg(errp, "module arch does not match: "
+                        "expected '%s', got '%s'", module_arch, modinfo->arch);
+                    goto out;
+                }
+            }
+        }
+        if (modinfo->deps) {
+            if (strcmp(modinfo->name, module_name) == 0) {
+                /* we depend on other module(s) */
+                for (sl = modinfo->deps; *sl != NULL; sl++) {
+                    int subrv = module_load("", *sl, errp);
+                    if (subrv <= 0) {
+                        rv = subrv;
+                        goto out;
+                    }
+                }
+            } else {
+                for (sl = modinfo->deps; *sl != NULL; sl++) {
+                    if (strcmp(module_name, *sl) == 0) {
+                        /* another module depends on us */
+                        export_symbols = true;
+                    }
+                }
+            }
         }
     }
 
-    if (!success) {
+    for (i = 0; i < n_dirs; i++) {
+        char *fname = g_strdup_printf("%s/%s%s",
+                                      dirs[i], module_name, CONFIG_HOST_DSOSUF);
+        int ret = access(fname, F_OK);
+        if (ret != 0 && (errno == ENOENT || errno == ENOTDIR)) {
+            /*
+             * if we don't find the module in this dir, try the next one.
+             * If we don't find it in any dir, that can be fine too: user
+             * did not install the module. We will return 0 in this case
+             * with no error set.
+             */
+            g_free(fname);
+            continue;
+        } else if (ret != 0) {
+            /* most common is EACCES here */
+            error_setg_errno(errp, errno, "error trying to access %s", fname);
+        } else if (module_load_dso(fname, export_symbols, errp)) {
+            rv = 1; /* module successfully loaded */
+        }
+        g_free(fname);
+        goto out;
+    }
+    rv = 0; /* module not found */
+
+out:
+    if (rv <= 0) {
         g_hash_table_remove(loaded_modules, module_name);
         g_free(module_name);
     }
-
     for (i = 0; i < n_dirs; i++) {
         g_free(dirs[i]);
     }
-
-#endif
-    return success;
+    return rv;
 }
 
-#ifdef CONFIG_MODULES
-
 static bool module_loaded_qom_all;
 
-void module_load_qom(const char *type)
+int module_load_qom(const char *type, Error **errp)
 {
     const QemuModinfo *modinfo;
     const char **sl;
+    int rv = 0;
 
     if (!type) {
-        return;
+        error_setg(errp, "%s", "type is NULL");
+        return -1;
     }
 
     trace_module_lookup_object_type(type);
@@ -331,15 +337,24 @@ void module_load_qom(const char *type)
         }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
-                module_load("", modinfo->name);
+                if (rv > 0) {
+                    error_setg(errp, "multiple modules providing '%s'", type);
+                    return -1;
+                }
+                rv = module_load("", modinfo->name, errp);
+                if (rv < 0) {
+                    return rv;
+                }
             }
         }
     }
+    return rv;
 }
 
 void module_load_qom_all(void)
 {
     const QemuModinfo *modinfo;
+    Error *local_err = NULL;
 
     if (module_loaded_qom_all) {
         return;
@@ -352,7 +367,9 @@ void module_load_qom_all(void)
         if (!module_check_arch(modinfo)) {
             continue;
         }
-        module_load("", modinfo->name);
+        if (module_load("", modinfo->name, &local_err) < 0) {
+            error_report_err(local_err);
+        }
     }
     module_loaded_qom_all = true;
 }
@@ -368,7 +385,10 @@ void qemu_load_module_for_opts(const char *group)
         }
         for (sl = modinfo->opts; *sl != NULL; sl++) {
             if (strcmp(group, *sl) == 0) {
-                module_load("", modinfo->name);
+                Error *local_err = NULL;
+                if (module_load("", modinfo->name, &local_err) < 0) {
+                    error_report_err(local_err);
+                }
             }
         }
     }
@@ -378,7 +398,8 @@ void qemu_load_module_for_opts(const char *group)
 
 void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
-void module_load_qom(const char *type) {}
+int module_load(const char *prefix, const char *name, Error **errp) { return 2; }
+int module_load_qom(const char *type, Error **errp) { return 2; }
 void module_load_qom_all(void) {}
 
 #endif
-- 
2.38.1


