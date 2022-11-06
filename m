Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456861E118
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPm-0001hL-St; Sun, 06 Nov 2022 03:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPi-0001fB-3r
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPg-0002y2-C5
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXaoN5h+kIRJQLunlG4TfAn8JghviI3r62UKEdPtDr8=;
 b=GIKB5GA7XmDOERPB+HLJntrYJU+0hbq4BJeKptfEqSG2BiQD7jgXCQXmAnY0wI+s0f4ht9
 SrAQRLRq7oLaht7K9AbbkzV9zMzdNxeJCet3s1p6JERBFfC/27Mra0l2HVjtW7HXXGOQmv
 oMjfBBu+t/D4VGp9LhDMh4ip2gyEBnk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-Y0592lfVPUK8n4cOodoKvQ-1; Sun, 06 Nov 2022 03:53:54 -0500
X-MC-Unique: Y0592lfVPUK8n4cOodoKvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6862050wms.1
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXaoN5h+kIRJQLunlG4TfAn8JghviI3r62UKEdPtDr8=;
 b=j5ogkUTkNCk3w4Xd/7EfEQZALvZUecLceyn1GE5oGwThRbfpkSxOMrrhu1O/o1d3xI
 /yo50a/XyU5dlK5G8iP0v6ctVlQ52O/bzIY3GgRN3PN8C6zU2IA8nUp9Dyn1G3GE+DeR
 bLf7AP8Swp3+tApkxyfbkmDPJj8Od4Xc/DVkf+6LPgRLgVfd8097r4Fcxey5MMWsaHeE
 pH6ixVLiKV+bHn2bybQNbkbMeRIcipANCia34efgQMdl1uZSIctfR510XnokRn0QUFAl
 nWtUaGZPqGkKgU7mzlYqVmor/SHjisnYNKGUcJzK3aza0gSQwZ3gOH+keK/FozjYQ87J
 9ltw==
X-Gm-Message-State: ACrzQf3tWJ2mZblGJXpnAJsx+hG2Jza2q/kmslWTpfsC2psftxjdowqC
 smrJFqbcU2TGZ7UQAX9chcYfrwf84U4eXnrjeNIsAOdR0ChSkG91Czeou25hATkSLtduXX6+Dw0
 Lr/b4WDAMkm8zcJPYAPv+36jyxYR2zpTcHzfp1QI9EdZUmih5JtuBArPm3OpG7Rfd/UQ=
X-Received: by 2002:adf:f9c9:0:b0:236:9c40:c57c with SMTP id
 w9-20020adff9c9000000b002369c40c57cmr27625833wrr.47.1667724832429; 
 Sun, 06 Nov 2022 01:53:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7W0AOet7m3hCFar7yMbPZ2JEF2mGs9pxRR+zvOABh9Sdr0uCnCww4y0QZM2irakeebY1szlw==
X-Received: by 2002:adf:f9c9:0:b0:236:9c40:c57c with SMTP id
 w9-20020adff9c9000000b002369c40c57cmr27625812wrr.47.1667724832050; 
 Sun, 06 Nov 2022 01:53:52 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056000104300b0022584c82c80sm4135109wrx.19.2022.11.06.01.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/12] module: rename module_load_one to module_load
Date: Sun,  6 Nov 2022 09:51:12 +0100
Message-Id: <20221106085115.257018-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929093035.4231-3-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index cc664271ebb5..379f19dc891f 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -80,7 +80,7 @@ audio_driver *audio_driver_lookup(const char *name)
         }
     }
 
-    audio_module_load_one(name);
+    audio_module_load(name);
     QLIST_FOREACH(d, &audio_drivers, next) {
         if (strcmp(name, d->name) == 0) {
             return d;
diff --git a/block.c b/block.c
index 3bd594eb2aed..ddd743c44735 100644
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
@@ -981,7 +981,7 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
         if (block_driver_modules[i].protocol_name &&
             !strcmp(block_driver_modules[i].protocol_name, protocol)) {
-            block_module_load_one(block_driver_modules[i].library_name);
+            block_module_load(block_driver_modules[i].library_name);
             break;
         }
     }
diff --git a/block/dmg.c b/block/dmg.c
index 422136276aa4..b5a93b086b20 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -445,8 +445,8 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    block_module_load_one("dmg-bz2");
-    block_module_load_one("dmg-lzfse");
+    block_module_load("dmg-bz2");
+    block_module_load("dmg-lzfse");
 
     s->n_chunks = 0;
     s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0806d8fcaaac..25dfc0846801 100644
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
index 8c012bbe038d..b7911ce79161 100644
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
index e5cef30f6d1a..aba942bdf31c 100644
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
index ff74c5d7092e..774354565165 100644
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
index 65c117874ca0..44dfb0f52b1c 100644
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
index 8563edd6267c..ad89cd50dc2a 100644
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
2.38.1


