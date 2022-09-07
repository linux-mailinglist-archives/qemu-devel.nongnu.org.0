Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E15B067C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:26:08 +0200 (CEST)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVw0F-0001t9-8t
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVvyL-0000Jr-Cl
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:24:09 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVvyH-0006fI-QR
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:24:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04A3C2044C;
 Wed,  7 Sep 2022 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662560642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3zw7RgIHmRzWyGd6EO5zcTBCIt/jlSWGcXOaonLVl08=;
 b=VSmLf5/1SACpyeY6RYFUYZy2qo0MnOkDyRhaVhfsdRfaGkrX5o/fzckDT9czWHLQy5Ma+R
 Roi0drIxifOlcSXU/u0sP3waCVb0dzSOZtOEjwARA5K/7YhD17NrBohqxpnndGA1PFw+aQ
 60c1l6Fq/DVkjUbRqLooIm86sw5erFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662560642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3zw7RgIHmRzWyGd6EO5zcTBCIt/jlSWGcXOaonLVl08=;
 b=L6yGvTIX7e5x0G0b6eGKA0n5zotxx0ub23aESUzSgkeo6Ifksp9afkr8CHct/boDbENZXO
 tMPhJkWuJscPhKBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A09A513A66;
 Wed,  7 Sep 2022 14:24:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BIzuJIGpGGMMQgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 07 Sep 2022 14:24:01 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] audio: add help option (?) for -audiodev
Date: Wed,  7 Sep 2022 16:23:59 +0200
Message-Id: <20220907142359.31827-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

add a simple help option for -audiodev, so users can do

qemu -audiodev ?

to get the list of drivers available.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 audio/audio.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 4f4bb10cce..bd8c18c3cd 100644
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
 
+static void audio_help(void)
+{
+    int i;
+
+    printf("Available audiodev types:\n");
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
+        exit(0);
+    }
     Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
     visit_type_Audiodev(v, NULL, &dev, &error_fatal);
     visit_free(v);
-- 
2.26.2


