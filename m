Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AA5B0B9F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:40:59 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVz2n-00011S-VF
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVyt5-0005ax-Hu
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:30:57 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVysz-0003VN-Hc
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:30:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BD7133F97;
 Wed,  7 Sep 2022 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662571846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QxEWORtaIzD6mLatiuockkKIYpoDS1BvuIc57ArbeQE=;
 b=BIUwFJu3Vr0kkesZL2dpB9EgQgXb1DEnF5KG6hi4z+uwd36kOh7Ddhrdd2Fl11/QTSfNwU
 uTMOm7SoNeiHxavSkWYePwXbbg7wa32IwRjb54kQjdfb9z2J/Y87fwB53u1x+NDwJuHG26
 myWHqHuNS/jrergCttC0y4JaphvaX8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662571846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QxEWORtaIzD6mLatiuockkKIYpoDS1BvuIc57ArbeQE=;
 b=szbA7A/qnlKhDmvrY+GKz/rKDvBY8+oFgJBoNVSDiQAD4+fuxQZryKaP90ORKNvPlo9eDj
 FsTH2MliN779W3DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA66E13A66;
 Wed,  7 Sep 2022 17:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0IGBM0XVGGNbCgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 07 Sep 2022 17:30:45 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2] audio: add help option for -audio and -audiodev
Date: Wed,  7 Sep 2022 19:30:44 +0200
Message-Id: <20220907173044.12669-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

add a simple help option for -audio and -audiodev
to show the list of available drivers, and document them.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 audio/audio.c   | 20 ++++++++++++++++++++
 audio/audio.h   |  1 +
 qemu-options.hx | 10 ++++++----
 softmmu/vl.c    |  9 +++++++--
 4 files changed, 34 insertions(+), 6 deletions(-)

v1 -> v2: also extend the help to -audio.

 -audio help
 -audio driver=help
 -audiodev help

will all show the same results.

diff --git a/audio/audio.c b/audio/audio.c
index 4f4bb10cce..ffb09ec825 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -32,6 +32,7 @@
 #include "qapi/qapi-visit-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
+#include "qemu/help_option.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
@@ -2105,10 +2106,29 @@ static void audio_validate_opts(Audiodev *dev, Error **errp)
     }
 }
 
+void audio_help(void)
+{
+    int i;
+
+    printf("Available audio drivers:\n");
+    printf("none\n");
+
+    for (i = 0; audio_prio_list[i]; i++) {
+        audio_driver *driver = audio_driver_lookup(audio_prio_list[i]);
+        if (driver) {
+            printf("%s\n", driver->name);
+        }
+    }
+}
+
 void audio_parse_option(const char *opt)
 {
     Audiodev *dev = NULL;
 
+    if (is_help_option(opt)) {
+        audio_help();
+        exit(EXIT_SUCCESS);
+    }
     Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
     visit_type_Audiodev(v, NULL, &dev, &error_fatal);
     visit_free(v);
diff --git a/audio/audio.h b/audio/audio.h
index 27e67079a0..01bdc567fb 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -171,6 +171,7 @@ void audio_sample_from_uint64(void *samples, int pos,
 void audio_define(Audiodev *audio);
 void audio_parse_option(const char *opt);
 bool audio_init_audiodevs(void);
+void audio_help(void);
 void audio_legacy_help(void);
 
 AudioState *audio_state_by_name(const char *name);
diff --git a/qemu-options.hx b/qemu-options.hx
index 31c04f7eea..04cd4dacfc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -704,10 +704,11 @@ SRST
 ``-audio [driver=]driver,model=value[,prop[=value][,...]]``
     This option is a shortcut for configuring both the guest audio
     hardware and the host audio backend in one go.
-    The host backend options are the same as with the corresponding
-    ``-audiodev`` options below. The guest hardware model can be set with
-    ``model=modelname``. Use ``model=help`` to list the available device
-    types.
+    The driver option is the same as with the corresponding ``-audiodev`` option below.
+    The guest hardware model can be set with ``model=modelname``.
+
+    Use ``driver=help`` to list the available drivers,
+    and ``model=help`` to list the available device types.
 
     The following two example do exactly the same, to show how ``-audio``
     can be used to shorten the command line length:
@@ -721,6 +722,7 @@ ERST
 DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev [driver=]driver,id=id[,prop[=value][,...]]\n"
     "                specifies the audio backend to use\n"
+    "                Use ``-audiodev help`` to list the available drivers\n"
     "                id= identifier of the backend\n"
     "                timer-period= timer period in microseconds\n"
     "                in|out.mixing-engine= use mixing engine to mix streams inside QEMU\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index dea4005e47..2f8eecf5c1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2842,11 +2842,16 @@ void qemu_init(int argc, char **argv, char **envp)
                 audio_parse_option(optarg);
                 break;
             case QEMU_OPTION_audio: {
-                QDict *dict = keyval_parse(optarg, "driver", NULL, &error_fatal);
+                bool help;
                 char *model;
                 Audiodev *dev = NULL;
                 Visitor *v;
-
+                QDict *dict = keyval_parse(optarg, "driver", &help, &error_fatal);
+                if (help || (qdict_haskey(dict, "driver") &&
+                             is_help_option(qdict_get_str(dict, "driver")))) {
+                    audio_help();
+                    exit(EXIT_SUCCESS);
+                }
                 if (!qdict_haskey(dict, "id")) {
                     qdict_put_str(dict, "id", "audiodev0");
                 }
-- 
2.26.2


