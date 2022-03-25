Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD64E78BF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 17:14:41 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXmaG-0003zA-Ht
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 12:14:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nXmYA-00032T-H8
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 12:12:30 -0400
Received: from [2607:f8b0:4864:20::42e] (port=34784
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nXmY8-0007oI-RL
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 12:12:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h19so5808030pfv.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhK9QGJ4hUbpi+5bI2jZkk1b7Qt0vDasFxAvAfjyZ54=;
 b=jmZ37OuqANbTttsYvlv0g+cDEyDjaQWmPc75Kj2BSz0sL/uo1A83Q7zalfqHUxAdlG
 RUlfCLj2bvsrnxcAjT4RzEe4LR0cQdGk2tGo0d3xschHVByEWshs3xib+mKp72jcU5Y7
 VFKQ1pFXqzB0IBy2P6un8PwOFQC+Boygu9LR27QhtlYSmVSs0fcVtlZN29f8BA1z5Ycr
 nrDZaATkKnktigftAAM+x5NZc5DVEFCCLspAICe0NcpQdiC+QmJGNjgqDClCmiAceAmB
 uKpvBWrqViz2T6lvVcsQ+Vi15aJ/0W9e+5Cg7VQOplFW1nFcTn2hZNsPJ1WHn4NgVyv3
 bqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhK9QGJ4hUbpi+5bI2jZkk1b7Qt0vDasFxAvAfjyZ54=;
 b=Oq3lNb9G8sgTDmMLqXnt9s74W+UgpIKnWuLRy6xdp0NtRyVHWYIExNYLobJACQzQ1C
 a7K8G2NeaJa0FjmfjZU9N8fh4y3mEcXbSb2L8qaa/WnjCmo6hdgOSRBobrXiQ4OR2igs
 BDWvkT8R/IqTipuVzmypsJWj/+oeo7eisIB5KmMUIDykBKUIgF977tFfHouT3tD846h9
 B2wx1VqZuzdY1k/0p1o455OfxB/rWDekQgFzvkDXuly/X0PUICHcCmXK4r08bxXzwrZI
 Rv9XXviUpRNt62y3cIqQmtjo9rfHXR2hUUcWhrKjjGJ2QLV6SW0Gp9AZ06ZMDrsCmJkW
 /BUw==
X-Gm-Message-State: AOAM533xYSEJS1Tl++0FqDlAVbSKZsPdIRZ8I+1s5MFqof47B5XRdK4M
 gEJeb5MTYWcjL5UVluXJh5yvK5AdR00=
X-Google-Smtp-Source: ABdhPJxQCoAeLADCN2HeAmMsHmKCoeAYDp4dEEDavU54vBZAOCVwL5h3DVoET3ixdgZQaQL3+Mz9jQ==
X-Received: by 2002:a05:6a00:1acd:b0:4f7:c17b:28e5 with SMTP id
 f13-20020a056a001acd00b004f7c17b28e5mr10951192pfv.78.1648224746944; 
 Fri, 25 Mar 2022 09:12:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:8d22:c417:625c:7a80])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb266fb186sm434900pfw.73.2022.03.25.09.12.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Mar 2022 09:12:26 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/console: Check console before emitting GL event
Date: Sat, 26 Mar 2022 01:12:16 +0900
Message-Id: <20220325161216.74582-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this change, The GL output of a console overwrites the
other consoles and makes them unusable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index da434ce1b2f..1752f2ec889 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1886,6 +1886,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
         con->scanout.kind = SCANOUT_NONE;
     }
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_scanout_disable) {
             dcl->ops->dpy_gl_scanout_disable(dcl);
         }
@@ -1909,6 +1912,9 @@ void dpy_gl_scanout_texture(QemuConsole *con,
         x, y, width, height
     };
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_scanout_texture) {
             dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
                                              backing_y_0_top,
@@ -1927,6 +1933,9 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     con->scanout.kind = SCANOUT_DMABUF;
     con->scanout.dmabuf = dmabuf;
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_scanout_dmabuf) {
             dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
         }
@@ -1940,6 +1949,9 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
     DisplayChangeListener *dcl;
 
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_cursor_dmabuf) {
             dcl->ops->dpy_gl_cursor_dmabuf(dcl, dmabuf,
                                            have_hot, hot_x, hot_y);
@@ -1954,6 +1966,9 @@ void dpy_gl_cursor_position(QemuConsole *con,
     DisplayChangeListener *dcl;
 
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_cursor_position) {
             dcl->ops->dpy_gl_cursor_position(dcl, pos_x, pos_y);
         }
@@ -1967,6 +1982,9 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
     DisplayChangeListener *dcl;
 
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_release_dmabuf) {
             dcl->ops->dpy_gl_release_dmabuf(dcl, dmabuf);
         }
@@ -1983,6 +2001,9 @@ void dpy_gl_update(QemuConsole *con,
 
     graphic_hw_gl_block(con, true);
     QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (con != (dcl->con ? dcl->con : active_console)) {
+            continue;
+        }
         if (dcl->ops->dpy_gl_update) {
             dcl->ops->dpy_gl_update(dcl, x, y, w, h);
         }
-- 
2.32.0 (Apple Git-132)


