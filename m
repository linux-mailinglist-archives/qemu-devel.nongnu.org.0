Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB65AE96B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:24:07 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYYg-000690-5E
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXAg-0005mJ-3r
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:55:14 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:57170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXAa-0006WX-MX
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:55:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 408EE1F9D2;
 Tue,  6 Sep 2022 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662465304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4L5t01RoSvLFc7n/IRLFdqy9eyH/xhBEeEPfT71PCJI=;
 b=qhNQfb4x5qVTE/BqHs1NElzqqwMMXCAZT/2E4nkCzGVBX7/hhrroSFeXAHR3ads3ReNOBR
 xQZQEKvTHRSkF68vu5IYkyIlDaCmTjFwY8ppf5B8MEqpnPCy6WVdu0Pqv/Jg2YlIsy4w/G
 i7Kzfrnhs8jVfsp9AdEqVye+7xj5XlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662465304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4L5t01RoSvLFc7n/IRLFdqy9eyH/xhBEeEPfT71PCJI=;
 b=525VKn2gGGh2eo1J7uz1ZDsLQ64Wb2Xn1gUo14N314ux+OQG6bRybMRGoITmYcMaRH089s
 6Ur4qtViAqDaFkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4F0A13A93;
 Tue,  6 Sep 2022 11:55:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2FM0Nhc1F2NYMwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 06 Sep 2022 11:55:03 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/3] module: removed unused function argument "mayfail"
Date: Tue,  6 Sep 2022 13:54:59 +0200
Message-Id: <20220906115501.28581-2-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220906115501.28581-1-cfontana@suse.de>
References: <20220906115501.28581-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

mayfail is always passed as false for every invocation throughout the program.
It controls whether to printf or not to printf an error on
g_module_open failure.

Remove this unused argument.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/module.h |  8 ++++----
 softmmu/qtest.c       |  2 +-
 util/module.c         | 20 +++++++++-----------
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index bd73607104..8c012bbe03 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -61,15 +61,15 @@ typedef enum {
 #define fuzz_target_init(function) module_init(function, \
                                                MODULE_INIT_FUZZ_TARGET)
 #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
-#define block_module_load_one(lib) module_load_one("block-", lib, false)
-#define ui_module_load_one(lib) module_load_one("ui-", lib, false)
-#define audio_module_load_one(lib) module_load_one("audio-", lib, false)
+#define block_module_load_one(lib) module_load_one("block-", lib)
+#define ui_module_load_one(lib) module_load_one("ui-", lib)
+#define audio_module_load_one(lib) module_load_one("audio-", lib)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
+bool module_load_one(const char *prefix, const char *lib_name);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..76eb7bac56 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -756,7 +756,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(words[1] && words[2]);
 
         qtest_send_prefix(chr);
-        if (module_load_one(words[1], words[2], false)) {
+        if (module_load_one(words[1], words[2])) {
             qtest_sendf(chr, "OK\n");
         } else {
             qtest_sendf(chr, "FAIL\n");
diff --git a/util/module.c b/util/module.c
index 8ddb0e18f5..8563edd626 100644
--- a/util/module.c
+++ b/util/module.c
@@ -144,7 +144,7 @@ static bool module_check_arch(const QemuModinfo *modinfo)
     return true;
 }
 
-static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
+static int module_load_file(const char *fname, bool export_symbols)
 {
     GModule *g_module;
     void (*sym)(void);
@@ -172,10 +172,8 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
     }
     g_module = g_module_open(fname, flags);
     if (!g_module) {
-        if (!mayfail) {
-            fprintf(stderr, "Failed to open module: %s\n",
-                    g_module_error());
-        }
+        fprintf(stderr, "Failed to open module: %s\n",
+                g_module_error());
         ret = -EINVAL;
         goto out;
     }
@@ -208,7 +206,7 @@ out:
 }
 #endif
 
-bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
+bool module_load_one(const char *prefix, const char *lib_name)
 {
     bool success = false;
 
@@ -256,7 +254,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
-                    module_load_one("", *sl, false);
+                    module_load_one("", *sl);
                 }
             } else {
                 for (sl = modinfo->deps; *sl != NULL; sl++) {
@@ -287,7 +285,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     for (i = 0; i < n_dirs; i++) {
         fname = g_strdup_printf("%s/%s%s",
                 dirs[i], module_name, CONFIG_HOST_DSOSUF);
-        ret = module_load_file(fname, mayfail, export_symbols);
+        ret = module_load_file(fname, export_symbols);
         g_free(fname);
         fname = NULL;
         /* Try loading until loaded a module file */
@@ -333,7 +331,7 @@ void module_load_qom_one(const char *type)
         }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
-                module_load_one("", modinfo->name, false);
+                module_load_one("", modinfo->name);
             }
         }
     }
@@ -354,7 +352,7 @@ void module_load_qom_all(void)
         if (!module_check_arch(modinfo)) {
             continue;
         }
-        module_load_one("", modinfo->name, false);
+        module_load_one("", modinfo->name);
     }
     module_loaded_qom_all = true;
 }
@@ -370,7 +368,7 @@ void qemu_load_module_for_opts(const char *group)
         }
         for (sl = modinfo->opts; *sl != NULL; sl++) {
             if (strcmp(group, *sl) == 0) {
-                module_load_one("", modinfo->name, false);
+                module_load_one("", modinfo->name);
             }
         }
     }
-- 
2.26.2


