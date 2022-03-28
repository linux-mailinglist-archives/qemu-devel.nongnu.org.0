Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C94EA32B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:48:28 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy9z-0003i0-GJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:48:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2x-0002q0-09
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:41:16 -0400
Received: from [2607:f8b0:4864:20::632] (port=36576
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2v-0007v5-FD
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:41:10 -0400
Received: by mail-pl1-x632.google.com with SMTP id m18so11105945plx.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsNUrLATsn2EyMjj08DCLj2HaIRq67iesWEjKrJXNEM=;
 b=ECNqqydX944kLg2AB0xJFSvh1x19bXUTJoPX2Zn0NFmKsN4hod2AfLRYdR6R0aLtS0
 OOmYoMM50a2Bw+qAri2ctngw5F9AZuh6IDdvd9EMR34Vhs3li+MNF1i9DTo6r84nKbtq
 uUZgkv6g75+WHqXY1ChqK6uYwAeZfx4XVfP0aoWcWLOOc5yKGl4IwAO8BP64a3BejWeD
 EHWQz1knHIMlmxXbGIXWzpoKec7awEjxYadbYmnoVlokNXyDYYsdllUfFYFDzJ8Wlg4g
 bC67lNs9VCimevTJKWdI+YobIdvrDkN8XMEF1klaZlo7ttRDShuxabeSzXQPSgYD3odG
 KzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YsNUrLATsn2EyMjj08DCLj2HaIRq67iesWEjKrJXNEM=;
 b=wA4Q2XWQqD6tKhe03P1MJpf0SkUpoUNLDVfiTDJ0o+TPK0RIvpCIhojWMx8ha9SUbi
 iFuRF/2zQtEUiygbXVGJOG5Th/tsSmEgrYUkxNwXjIgX0oyS84FFXBxj+FGTs4KQym3I
 kyOcvV/NDPBqJyd2Kmn19/xDRtGx59iHAFT6OAOho9ZcVcZzZaJMZc6hB3P3NbyRngY2
 VrXSBpKFtmhrrQvpCCODoAV8UW4NGRgJ2fMzwBd/mlZPzv9Fthe3j4qwUv6njoNPgyve
 w3DiNy+SuF43U7YaUE4jwX0/Kw8Ws9jl5LqzgaOD7zT6obOXInzNwFE4v6ycsdmbiUth
 8iAQ==
X-Gm-Message-State: AOAM530QlgcPpuun8jb5d7q1lrnR97+K8FX9lyXyHCqB+xHxAXJvN80n
 Sr6DQ8C611CBN59rNu1g8FjJPq3zq1UvyQ==
X-Google-Smtp-Source: ABdhPJxbAt0TmbFsMy2mYmf0Ni/jUgbUwf0mTuEyrU33p9s8FzqhtcvT7NOva3hPARzFpYeAn4TZqg==
X-Received: by 2002:a17:90b:4c49:b0:1c7:d6c1:bb0f with SMTP id
 np9-20020a17090b4c4900b001c7d6c1bb0fmr1340365pjb.230.1648507267785; 
 Mon, 28 Mar 2022 15:41:07 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b001c9c3e2a177sm489743pjk.27.2022.03.28.15.41.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Mar 2022 15:41:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] ui/console: Check console before emitting GL event
Date: Tue, 29 Mar 2022 00:40:12 +0200
Message-Id: <20220328224012.32737-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Without this change, The GL output of a console overwrites the
other consoles and makes them unusable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220325161216.74582-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/console.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..1752f2ec88 100644
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
2.35.1


