Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9744B3901
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:49:13 +0100 (CET)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4wq-0005eb-GL
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qk-0004Ja-1H
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:54 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33770
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qi-0000QG-BO
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:53 -0500
Received: by mail-pl1-x62c.google.com with SMTP id l9so6212318plg.0
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqQR88Nzla96DoEfOEM1dCa6bJG2cdl9EhvbtrZm9+0=;
 b=N1+iRG77s3tBhYFneEPNHzfud+fWjmDGyXRdg2v5lQyJ1bZnK5GrhOgcsOJvnh6a7L
 AiqwL0O9tJFrfyJ9atEZg6ShFD9nJvU7NTZVlFzIuQIzgOfZYf0iDd7JHVXlfn2YadJO
 051fDpb49aRxy7nSrzuAxA9uDxupkC48HeMWJ+Sc0EXSl+SpV0W6nPg/RLunuyxnY+cV
 Px1dO4345p6jxHNmvJx9T5H6991AgnVuz0DTFEUsbZoDBSUIhSFph3vq+aPHOsCiQFTf
 NSUHz6tPPwE2giqNLnLuBy7Ea1StQ88qoBvMQAvlin6rDsVoL2Cj91AE2jtPK0KfDpba
 U4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqQR88Nzla96DoEfOEM1dCa6bJG2cdl9EhvbtrZm9+0=;
 b=YyRT0g3Z8HVT3uJDfm1bbv8Pya7T6YCL39ThAXlO5MoFIoYNOk/KBHta5lbCW+a0ZV
 uBchqb9qqkBjD0D9nk4RxD9Rkt2cl/Modstq4MdIionzIp3YQt9P/WBnknVq3Z1fMiso
 3hgUCCB1nQoGkFKVAKBxia72O5ivrb3oxD8Lp9+3p/WBhLOKJ4F3VAxdNNEjt0Nfx6HC
 Uf/S9rr9ToovICiATZT34dpG2/gsQ1kqhsoz6fmyafApfy98L6U9AMzQ20+QHBzjhm85
 +/4VXYeJ2rYVRaUMBgzCabY/3n00qDtrlQUKeaqzh/sdBHznYXx1j3vT0JOPnDzhBVSW
 fSzw==
X-Gm-Message-State: AOAM533X6gezrImWcJcL5esnVxef9344exJTGQIeB6Q8DZXUPs0PDmyL
 EKDRrvH/QeB7AzyV1C0ED0iEISk2+E0=
X-Google-Smtp-Source: ABdhPJxDeSsEvg6AN1sqBPn82f6Fg4d220kug6+sPsyquZXL+GeyILhpJtUy82eiUk8J5BbD3MSwhw==
X-Received: by 2002:a17:902:f1cb:: with SMTP id
 e11mr8465318plc.48.1644720171076; 
 Sat, 12 Feb 2022 18:42:51 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:50 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 6/6] Revert "ui: factor out qemu_console_set_display_gl_ctx()"
Date: Sun, 13 Feb 2022 11:42:22 +0900
Message-Id: <20220213024222.3548-7-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 4f4181499170dcf80182745b319607802ea32896.
This eliminates the situation where a display is registered as a GL
context provider but not as a listener.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/console.h |  3 ---
 ui/console.c         | 22 ++++++++--------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 58722312534..760dde770d1 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -409,9 +409,6 @@ void graphic_hw_gl_block(QemuConsole *con, bool block);
 
 void qemu_console_early_init(void);
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con,
-                                     DisplayChangeListener *dcl);
-
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
 QemuConsole *qemu_console_lookup_by_device_name(const char *device_id,
diff --git a/ui/console.c b/ui/console.c
index f3d72655bb6..dce2ed3e1de 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1458,19 +1458,6 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con,
-                                     DisplayChangeListener *dcl)
-{
-    /* display has opengl support */
-    assert(dcl->con);
-    if (dcl->con->gl) {
-        fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
-                dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
-        exit(1);
-    }
-    dcl->con->gl = dcl;
-}
-
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
@@ -1481,7 +1468,14 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     assert(!dcl->ds);
 
     if (dcl->ops->dpy_gl_ctx_create) {
-        qemu_console_set_display_gl_ctx(dcl->con, dcl);
+        /* display has opengl support */
+        assert(dcl->con);
+        if (dcl->con->gl) {
+            error_report("can't register two opengl displays (%s, %s)\n",
+                         dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
+            exit(1);
+        }
+        dcl->con->gl = dcl;
     }
 
     if (dcl->con) {
-- 
2.32.0 (Apple Git-132)


