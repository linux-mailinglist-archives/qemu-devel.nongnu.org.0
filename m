Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD24E7050
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 10:53:28 +0100 (CET)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXgdK-0003OK-Jo
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 05:53:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nXgbq-0002Yf-5i
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 05:51:54 -0400
Received: from [2607:f8b0:4864:20::102c] (port=39808
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nXgbo-0008MU-Ow
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 05:51:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so11865179pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 02:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeXh2QLCUpfYL7QWtnsVCSkbguCzP0sPOCA1tgQvfmU=;
 b=a9YjhsQ8dwhvBb7yF3xOZ3EDIzDstFyzuPVUZZFgz8v5Hsvlsw6EWD3w+D4gDIONZo
 6g95B5G2u8LoIug9RT0nwf2lnI9HbiIh0jZj3yresWA+BhbnAkOROR1XW1tbSg2W34/t
 1fQ0QFq1iV5lTpyrGAuENH5igEyWMPieVMGeWYmshzsPMs5DtSiJ/jS4ahXS2KptJ8pC
 guMFZPl3TgzwF6jTJmrhZJBQAcHWOHsIY2CCXwLCEZff33BXZbQU3+sfwE6rdVviGCl8
 uOvbssyuWLyXvpc8hUYMJjv6b+/j47SWoK9k7RlSf5z37xoZxtII7GKtX0BuQyR/vHKX
 0w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeXh2QLCUpfYL7QWtnsVCSkbguCzP0sPOCA1tgQvfmU=;
 b=hCpGOdYqNEiwVCJM2SdCn0tuWCuDEwiNKGM450tim3nbC91wi4nz9PEzv0JGB8flQA
 JxkrezoKLv6UnMGETIVYQ4CZK0GkCfMx7eB5XG836T7SNHW7l1AuE9N8lkx6q/wOZ4A8
 n+yH5RtZ51MnqoN6VtiX/s1nVkJitwr4nWPT7zmbpyHHzXWm4SVxLbhLkckxToNdqk9m
 jQFmwT1BHVCm7NZbWBQCM1EgzciHPZyLOQ3Asys81U1opXx1GC7PBs1NAuuJlvybZW63
 /2FcNTX7en0TrUhA4/jTvWHFTHtKk0+qS+kBlMRORfWpDSJYL3R6Gp08jIn4+x74CmyH
 Lzvw==
X-Gm-Message-State: AOAM533JrJPELjs/QDGnaEFzHhEMKu4WW6Z636NjMm28AyHDcTVmjwA8
 H6WpGHeTT3ODWLa7a+kgdmysW1U0ooA=
X-Google-Smtp-Source: ABdhPJzxt8NsLu9f+732NLUpm4Pwg6h9sV0UKhi19ASvagLd1GlCdA35NhqBVeHhWycoyB7jMkhOBg==
X-Received: by 2002:a17:90b:164f:b0:1c7:8d27:91fc with SMTP id
 il15-20020a17090b164f00b001c78d2791fcmr15725853pjb.228.1648201910626; 
 Fri, 25 Mar 2022 02:51:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:8d22:c417:625c:7a80])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a639919000000b00364f999aed5sm4861406pge.20.2022.03.25.02.51.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Mar 2022 02:51:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/console: Check console before emitting GL event
Date: Fri, 25 Mar 2022 18:51:34 +0900
Message-Id: <20220325095134.68689-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
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


