Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F95EE0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:53:25 +0200 (CEST)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZNE-000485-6E
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odWHg-0000DS-2s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:35:28 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:46570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odWHd-0007dZ-MP
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:35:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F95121E56;
 Wed, 28 Sep 2022 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664368524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSzfV9aVkKBi4RUSAYcotFgKaFppwCwm6Z+WuUujujo=;
 b=I+i7LHwEp+uQdJJuulAXW1ywFEn2ynB5gGhxVrcMUl3jg/T4HZOEsR8qvtsh27IlYNsneF
 FZ40hnp1tew3X8Yg5W51uS+wpEhfAZ2is8a0A31ZDmW6tqd+1dA9jf+WAA7779oC3+rs4o
 AWvBSwYH3rf90hVZ6NACY4jJ4HvsRwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664368524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSzfV9aVkKBi4RUSAYcotFgKaFppwCwm6Z+WuUujujo=;
 b=i+ZnLfIa4BeSZycVbQoQM4jOOIUHIPSeqaYdDmI2jv/y+ptmHEpMDxHiZZL4IVSK5HNxHn
 dbNW7/CPe5QPEXBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECCB813A84;
 Wed, 28 Sep 2022 12:35:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eCzJN4s/NGM7QgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 28 Sep 2022 12:35:23 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v8 2/5] module: rename module_load_one to module_load
Date: Wed, 28 Sep 2022 14:29:56 +0200
Message-Id: <20220928122959.16679-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220928122959.16679-1-cfontana@suse.de>
References: <20220928122959.16679-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/audio.c         |  2 +-
 block.c               |  4 ++--
 block/dmg.c           |  4 ++--
 hw/core/qdev.c        |  2 +-
 include/qemu/module.h | 10 +++++-----
 qom/object.c          |  4 ++--
 softmmu/qtest.c       |  2 +-
 ui/console.c          |  6 +++---
 util/module.c         | 14 +++++++-------
 9 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 76b8735b44..0a682336a0 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -79,7 +79,7 @@ audio_driver *audio_driver_lookup(const char *name)
         }
     }
 
-    audio_module_load_one(name);
+    audio_module_load(name);
     QLIST_FOREACH(d, &audio_drivers, next) {
         if (strcmp(name, d->name) == 0) {
             return d;
diff --git a/block.c b/block.c
index bc85f46eed..72c7f6d47d 100644
--- a/block.c
+++ b/block.c
@@ -464,7 +464,7 @@ BlockDriver *bdrv_find_format(const char *format_name)
     /* The driver isn't registered, maybe we need to load a module */
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (!strcmp(block_driver_modules[i].format_name, format_name)) {
-            block_module_load_one(block_driver_modules[i].library_name);
+            block_module_load(block_driver_modules[i].library_name);
             break;
         }
     }
@@ -976,7 +976,7 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (block_driver_modules[i].protocol_name &&
             !strcmp(block_driver_modules[i].protocol_name, protocol)) {
-            block_module_load_one(block_driver_modules[i].library_name);
+            block_module_load(block_driver_modules[i].library_name);
             break;
         }
     }
diff --git a/block/dmg.c b/block/dmg.c
index 98db18d82a..007b8d9996 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -446,8 +446,8 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    block_module_load_one("dmg-bz2");
-    block_module_load_one("dmg-lzfse");
+    block_module_load("dmg-bz2");
+    block_module_load("dmg-lzfse");
 
     s->n_chunks = 0;
     s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0806d8fcaa..25dfc08468 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -148,7 +148,7 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
 DeviceState *qdev_new(const char *name)
 {
     if (!object_class_by_name(name)) {
-        module_load_qom_one(name);
+        module_load_qom(name);
     }
     return DEVICE(object_new(name));
 }
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 8c012bbe03..b7911ce791 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -61,16 +61,16 @@ typedef enum {
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
 #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
-#define block_module_load_one(lib) module_load_one("block-", lib)
-#define ui_module_load_one(lib) module_load_one("ui-", lib)
-#define audio_module_load_one(lib) module_load_one("audio-", lib)
+#define block_module_load(lib) module_load("block-", lib)
+#define ui_module_load(lib) module_load("ui-", lib)
+#define audio_module_load(lib) module_load("audio-", lib)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-bool module_load_one(const char *prefix, const char *lib_name);
-void module_load_qom_one(const char *type);
+bool module_load(const char *prefix, const char *lib_name);
+void module_load_qom(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
diff --git a/qom/object.c b/qom/object.c
index d34608558e..4f834f3bf6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -526,7 +526,7 @@ void object_initialize(void *data, size_t size, const char *typename)
 
 #ifdef CONFIG_MODULES
     if (!type) {
-        module_load_qom_one(typename);
+        module_load_qom(typename);
         type = type_get_by_name(typename);
     }
 #endif
@@ -1033,7 +1033,7 @@ ObjectClass *module_object_class_by_name(const char *typename)
     oc = object_class_by_name(typename);
 #ifdef CONFIG_MODULES
     if (!oc) {
-        module_load_qom_one(typename);
+        module_load_qom(typename);
         oc = object_class_by_name(typename);
     }
 #endif
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 76eb7bac56..fc5b733c63 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -756,7 +756,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(words[1] && words[2]);
 
         qtest_send_prefix(chr);
-        if (module_load_one(words[1], words[2])) {
+        if (module_load(words[1], words[2])) {
             qtest_sendf(chr, "OK\n");
         } else {
             qtest_sendf(chr, "FAIL\n");
diff --git a/ui/console.c b/ui/console.c
index 765892f84f..4913c55684 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2632,7 +2632,7 @@ bool qemu_display_find_default(DisplayOptions *opts)
 
     for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
         if (dpys[prio[i]] == NULL) {
-            ui_module_load_one(DisplayType_str(prio[i]));
+            ui_module_load(DisplayType_str(prio[i]));
         }
         if (dpys[prio[i]] == NULL) {
             continue;
@@ -2650,7 +2650,7 @@ void qemu_display_early_init(DisplayOptions *opts)
         return;
     }
     if (dpys[opts->type] == NULL) {
-        ui_module_load_one(DisplayType_str(opts->type));
+        ui_module_load(DisplayType_str(opts->type));
     }
     if (dpys[opts->type] == NULL) {
         error_report("Display '%s' is not available.",
@@ -2680,7 +2680,7 @@ void qemu_display_help(void)
     printf("none\n");
     for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
         if (!dpys[idx]) {
-            ui_module_load_one(DisplayType_str(idx));
+            ui_module_load(DisplayType_str(idx));
         }
         if (dpys[idx]) {
             printf("%s\n",  DisplayType_str(dpys[idx]->type));
diff --git a/util/module.c b/util/module.c
index 8563edd626..ad89cd50dc 100644
--- a/util/module.c
+++ b/util/module.c
@@ -206,7 +206,7 @@ out:
 }
 #endif
 
-bool module_load_one(const char *prefix, const char *lib_name)
+bool module_load(const char *prefix, const char *lib_name)
 {
     bool success = false;
 
@@ -254,7 +254,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    module_load_one("", *sl);
+                    module_load("", *sl);
                 }
             } else {
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
@@ -312,7 +312,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
 
 static bool module_loaded_qom_all;
 
-void module_load_qom_one(const char *type)
+void module_load_qom(const char *type)
 {
     const QemuModinfo *modinfo;
     const char **sl;
@@ -331,7 +331,7 @@ void module_load_qom_one(const char *type)
         }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
-                module_load_one("", modinfo->name);
+                module_load("", modinfo->name);
             }
         }
     }
@@ -352,7 +352,7 @@ void module_load_qom_all(void)
         if (!module_check_arch(modinfo)) {
             continue;
         }
-        module_load_one("", modinfo->name);
+        module_load("", modinfo->name);
     }
     module_loaded_qom_all = true;
 }
@@ -368,7 +368,7 @@ void qemu_load_module_for_opts(const char *group)
         }
         for (sl = modinfo->opts; *sl != NULL; sl++) {
             if (strcmp(group, *sl) == 0) {
-                module_load_one("", modinfo->name);
+                module_load("", modinfo->name);
             }
         }
     }
@@ -378,7 +378,7 @@ void qemu_load_module_for_opts(const char *group)
 
 void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
-void module_load_qom_one(const char *type) {}
+void module_load_qom(const char *type) {}
 void module_load_qom_all(void) {}
 
 #endif
-- 
2.26.2


