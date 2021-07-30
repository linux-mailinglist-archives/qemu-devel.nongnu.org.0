Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BB3DBA00
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:05:52 +0200 (CEST)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T95-0007gV-RP
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2k-0004vC-63
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2i-0006iY-IZ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n11so6050156wmd.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2bcYufkvfsmpiC13AyXKhfn6hctOEG8Yo4KBaOoajc=;
 b=uBELWrMa+/GJmPSX2W6wyxuK62gTVkBEBoRHuW6cSlsn1dYoHxE2DvQvUJMi7H8uyp
 BeZGjMF4mLIbvBCO/fnpCkx+LZ/ikovJtB/ZOI5H9WqE4BFfepOUvtfrW75GQyfBjNZE
 NGLOhmdgaGvdbpHJamf1BftOAnJOgYMOTlTStoiyfjE9meP93ZRdWOHl9TeSq0G0yN+M
 Vkqekwh4vw0GgsUA4G8ZIwSlmX/sBHciHOKbJyJZngQEWI7ntvazbfF4wV6+wroBqzux
 3U6svnfVTcMx+k/s7dtv2pn/p/MRVV5gCe6aOPCaObXixAL1lCBvRtqBlowLtQeT2O+G
 /Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2bcYufkvfsmpiC13AyXKhfn6hctOEG8Yo4KBaOoajc=;
 b=OFi0KJFQSr40kitrBG6S02Wkxj/MzBRK/Gxyu7i2LZ7y8zZMxY1BZaQBhl7K/7yU15
 +hzePvYTRWmj+Lhjwnmq4XqTs/h+4t9+Wa8qLevGWTvxPoZdLc+YsJ7xiKZ/KwPuTngX
 1L5KLeH03c9qjRltyNhYv67wQxCotaAiIAgtXSYFdyFfLOGiICDl32MtuSb2vvtkk8dR
 LwzN/cc34jPiaGgCvIudJXm2uW+TVGdVOwcN/Qekmt6InmjgArdGTtuoKd4EEM+NPKjU
 s85EczpozyuiZqqI+hMDAAn8zc+onlveoK5jGAC1ZbNCNChGjIwrG1LNeWa8rEOfWbMD
 fDpg==
X-Gm-Message-State: AOAM531lfpJKNd/LRc3cYYaO0dUJWCPEpwi+QczZ9tJf2rpzBY9KSVVf
 apAwTodY/ICPYEUv1UErhbyb3sF7y6M=
X-Google-Smtp-Source: ABdhPJymWTxooNX6iAPpYBP/mf8CIyu0aXhYAPQZijtqv+IOws93uTsJPYjvZ3y8i/1+/gKUCYIXyw==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr3114082wma.133.1627653554989; 
 Fri, 30 Jul 2021 06:59:14 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:14 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/13] tests/plugins/mem: introduce "track" arg and make
 args not positional
Date: Fri, 30 Jul 2021 15:58:15 +0200
Message-Id: <20210730135817.17816-12-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit makes the plugin adhere to the new plugins arg-passing
scheme by expecting full-form boolean args instead of short-form
booleans. This necessitates that we introduce a new argument, here
"track", to accept "r", "w", or "rw".

Also, it makes arguments not positional and we only care about the last
value specified for a certain argument.

callback/inline args are now supplied separately as bool arguments so
that both can be enabled individually.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/mem.c | 47 ++++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index afd1d27e5c..4570f7d815 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -80,29 +80,40 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc) {
-        if (argc >= 3) {
-            if (!strcmp(argv[2], "haddr")) {
-                do_haddr = true;
-            }
-        }
-        if (argc >= 2) {
-            const char *str = argv[1];
 
-            if (!strcmp(str, "r")) {
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "haddr") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_haddr)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "r") == 0) {
                 rw = QEMU_PLUGIN_MEM_R;
-            } else if (!strcmp(str, "w")) {
+            } else if (g_strcmp0(tokens[1], "w") == 0) {
                 rw = QEMU_PLUGIN_MEM_W;
+            } else if (g_strcmp0(tokens[1], "rw") == 0) {
+                rw = QEMU_PLUGIN_MEM_RW;
+            } else {
+                fprintf(stderr, "invaild value for argument track: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "callback") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_callback)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
             }
-        }
-        if (!strcmp(argv[0], "inline")) {
-            do_inline = true;
-            do_callback = false;
-        } else if (!strcmp(argv[0], "both")) {
-            do_inline = true;
-            do_callback = true;
         } else {
-            do_callback = true;
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
         }
     }
 
-- 
2.25.1


