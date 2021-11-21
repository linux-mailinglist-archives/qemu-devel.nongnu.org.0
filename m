Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9E45829B
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 09:56:23 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moie6-0003S2-6C
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 03:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglU-0005Lc-BX
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 01:55:52 -0500
Received: from [2607:f8b0:4864:20::f31] (port=37828
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglR-000329-Ri
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 01:55:52 -0500
Received: by mail-qv1-xf31.google.com with SMTP id u16so10217539qvk.4
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 22:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xpZ/oN69NYjWLiOy9aVbPuud8yfHwuHeUJvbpO6fBg=;
 b=eoHiy6o2iL8UJo5skue0d5T8vzkd4GP6n2gbWGOg5Jq5ySW5cFz+5U6tokejHlZlXR
 DqfkSmjUsV+2IVZrfHEBXkmX93jnI0OcL5lUKIrdUy1PP7R4b5eMmyeBdAj2d37+qJqj
 0SWUcQuJEiH+bbeyBI7qJXti+bxrsQx3QXoyyVJoOJw+cRBZIe3hzJJNR0RcbDX4LE6q
 /3xMIR9E7SWwtSg2qy5v3UjlSwGNJ5GTOwdeTg8lAgwsiW40q2GxbSypI6ggk0Jpze8K
 prmTVoiL8c6GI3wTwXPne38hZaEgiIUpLz9IVIpG1qGI7CgCeU0SRkCRMVmdfM7+UK1d
 UeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xpZ/oN69NYjWLiOy9aVbPuud8yfHwuHeUJvbpO6fBg=;
 b=DDjSQK4YGkehQRUhOI03InoP84mzxVZdGPRL0KiQ2NiA0HPtMz/9foxo6OHfIpQpyX
 a8nMAQ8ryJLwRgGedTsWgTz4S+igAndKT7klUDebc05ErJPkJFJ1S4NYhoJ4GfPdERkZ
 mfMqgcb0Ir8GeubCaq6xjACNUFPArBe88raC8SL0QZBHJxB9dLzoMspp3D2gVJt3XEC2
 Tj7GjlWUBoAUVjha74Hg9nrx/O4zA0MxzmS0VYWScqhzWPeQP7t03AYYc14SlMHAo+tz
 k7bOQPYPXCasPq4/38Yo68Cm2Gq4SN764LhjpS40y6z/StMcf1V0qZe3zlun/mfmJMUp
 Yg+w==
X-Gm-Message-State: AOAM532wn2PbJ0uh93U/rpEuFVLLGejegNVJIbSuhz7QN2b+JUYYPyHM
 qQO+/8Mttwi4v7vFfc/sv7FQuFuC3mv1Yv8UYAE=
X-Google-Smtp-Source: ABdhPJxqz9LsPPaKXGFf8Qm8j8b8aruisM+vCYWfvSCkHn6JSR5ZbcJPXa0/Nw77TDxueFHHEUJbeg==
X-Received: by 2002:a05:6214:8e5:: with SMTP id
 dr5mr88671674qvb.28.1637477748618; 
 Sat, 20 Nov 2021 22:55:48 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id j24sm2489860qkg.133.2021.11.20.22.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 22:55:48 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui: fix incorrect scaling on highdpi with gtk/opengl
Date: Sun, 21 Nov 2021 01:55:03 -0500
Message-Id: <20211121065504.29101-2-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
References: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Nov 2021 03:51:47 -0500
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
Cc: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk-gl-area.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 461da7712f..d3565698ae 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -41,15 +41,16 @@ void gd_gl_area_draw(VirtualConsole *vc)
 #ifdef CONFIG_GBM
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 #endif
-    int ww, wh, y1, y2;
+    int ww, wh, ws, y1, y2;
 
     if (!vc->gfx.gls) {
         return;
     }
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
-    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
-    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
+    ws = gdk_window_get_scale_factor (gtk_widget_get_window(vc->gfx.drawing_area));
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area) * ws;
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area) * ws;
 
     if (vc->gfx.scanout_mode) {
         if (!vc->gfx.guest_fb.framebuffer) {
-- 
2.34.0


