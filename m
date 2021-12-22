Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966CC47CA25
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 01:15:30 +0100 (CET)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzpI1-0002YX-Oi
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 19:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDz-0005dH-KC; Tue, 21 Dec 2021 19:11:19 -0500
Received: from [2607:f8b0:4864:20::f31] (port=44791
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDx-0004Zk-32; Tue, 21 Dec 2021 19:11:18 -0500
Received: by mail-qv1-xf31.google.com with SMTP id kd9so779704qvb.11;
 Tue, 21 Dec 2021 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44mJjow7wtP7my1Oge4NMepORsoR1Fb+vR3g0iLdrxs=;
 b=Ds8r0yY2tQiBHuPlCBLpBZM0oMghVMX88I//GGkaNjGobvoSg80WyG5ZB1nCJ8T637
 m7B82WY18jdjwOUIil0C8OL5Rn5HQhUtfW5eciGJ57/ifYeLSMjGxhjS3Z3Rseph6Efe
 Ms0oiYt7MUlreIEqAQVZZKaSuUKsDJtesmJ2Uq3bNXsHazJqrK+aNm9xN+gj17o8vtj1
 DA8b3+/B9GPG+EhvPlZLRq4aLea9GUgdpWvAu1k8pMLM6wnPXSzu4UahU70THWb4Du8n
 CBdT0gkgaAenZ0jvAInAwp5EWWHkXtb3GGbjWvPqGXYdR0xRM/KlOaC+bs2Zv53/+pwS
 OAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44mJjow7wtP7my1Oge4NMepORsoR1Fb+vR3g0iLdrxs=;
 b=M/nRrHWGw5H8q+XhJayuUAsEv4lrkyZPDwQu236sfgrEWiFn+9kA2H7lscMax1U46T
 Xr9t+pYC4Mbmm17LCfi3sZp9nZL/LrYrjFApARtXP9I8qO4WFIB/bEwl3A8HOQ3xHTDZ
 tcChpz3G4CUY7jtsQmEMEzYTIjB9dk5hf4YxLgYN9DPOHY1LHHUTX8Y3soImAlQWE64V
 QtgC8zJ5bpgrKR/T04FjgXADrwRvTLhxNAceFMy1WwoIBgQQqFD2OGDJC02lPA4T+o1f
 OXJxqKFoM6bqiHuSt8+A5xFAFzTCWmztYwDGOxborkyqP2RDG+0prnyanMBZYRfmeejT
 PF2g==
X-Gm-Message-State: AOAM5332pLLf2NP1uxp4XJUladHFksn9O0fsBHndkYkRAHWzA7ioNT3n
 H6McJn70tzPTMfrkc0pawH5D6tSoRuu3xg==
X-Google-Smtp-Source: ABdhPJw7UVg24R5CwiCfmqeO81omCTOQBe+StGD96AmbXocb9Peh0xQ/jK+EmnCaIAfDZSjuNesHvQ==
X-Received: by 2002:a05:6214:2343:: with SMTP id
 hu3mr683008qvb.22.1640131875925; 
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id i6sm503410qkn.26.2021.12.21.16.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/3] ui: Revert: "fix incorrect pointer position on highdpi
 with gtk"
Date: Tue, 21 Dec 2021 19:10:50 -0500
Message-Id: <20211222001051.2295513-3-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
References: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu trivial <qemu-trivial@nongnu.org>,
 Mark-Andre Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit f14aab420c58b57e07189d6d9e6d3fbfab4761a6.

This commit was originally tested on gtk/gl which corrected behavior
there. Turns out, the OpenGL texture representing the virtual console
was being rendered in the incorrect place and not that the cursor
was incorrectly being handled.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 824334ff3d..b7f296fac7 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -836,7 +836,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     int x, y;
     int mx, my;
     int fbh, fbw;
-    int ww, wh, ws;
+    int ww, wh;
 
     if (!vc->gfx.ds) {
         return TRUE;
@@ -847,8 +847,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 
     ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
     wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
-    ws = gdk_window_get_scale_factor(
-            gtk_widget_get_window(vc->gfx.drawing_area));
 
     mx = my = 0;
     if (ww > fbw) {
@@ -858,8 +856,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         my = (wh - fbh) / 2;
     }
 
-    x = (motion->x - mx) / vc->gfx.scale_x * ws;
-    y = (motion->y - my) / vc->gfx.scale_y * ws;
+    x = (motion->x - mx) / vc->gfx.scale_x;
+    y = (motion->y - my) / vc->gfx.scale_y;
 
     if (qemu_input_is_absolute()) {
         if (x < 0 || y < 0 ||
-- 
2.34.1


