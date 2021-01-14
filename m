Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5872F62DB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:18:34 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03SK-00031N-Ri
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DM-0004m0-VT
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DK-0008Mr-JK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v184so574834wma.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=Gawksh+FlMNzGfN2aYRZuywtA4JNM4QtZdrxl99D+KLTk+q2JaF1CpRiI8CActyZcv
 2mFZ+0aPwqS7M+I9ttZk3RtIXcSKO9g8WeEWnHOeCh2fZx+ffiDNLQXlrfwTBiETauFt
 YAwnIkQhKu3RZ5EldtLXfMpLUKBZBsTPm/2F6LAnQiSd9ZUoXv2p1JbnMctcof/s661u
 QxFOHAA+/58tZM2/sKXQ0a4J/9gjHF4xwd5f8RK9Dg7OC629wB74pSYOwdAPoHpx4XKr
 +My5u8gAtb7XLtMDUW8eajpUNScc5eoAz44H8LVEl5tbcfO+MV5GoIt+X9K93grsrWKG
 5D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=R4kx/pMiSSDhd+ymV64Yia+rak8Su5EMpzlum4VgxatrdiPgSwnc2VOyY+kjWsDHrB
 u7R1xsawRaVRenRgl/tfmtZz9BgJCmwtFNGghsiKeDYrz7LejuP4iLLT7ZplZiRDBQdc
 H0UgDzLYF0Vr5v42A6sDJjMh42hkam6rmn6fsDgjawHRbUibgnUxJMaN/wvdqelQ9hFD
 PLiYD+VBecN344qzLPf1U+57SB7a96LSzj5RV0yNb32zVLg/sXhGtQ8sy5vKfrjF2aXo
 TcPwdPZRDI/0qPIiCWirXfSsgdm1IgbBqnbx9f5ER8femtjSTdUbXZ8W1zcnBMKjdsK5
 ex4Q==
X-Gm-Message-State: AOAM533XFB8Hm9w3qtQSzy2s7rqlIH2zQYW/B52KR2K2UVEnFuhLS40Q
 6BIAeoCXbt6MjdSquOwSzPVYGRd8oIGWoGwj
X-Google-Smtp-Source: ABdhPJz31d4856O+oopfKmh54LRtC7zBZacfC/QBEZsUm//MNy/iGBdILjG3JddTrRCWUWJqdi7lcw==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr4023743wmd.75.1610632976838;
 Thu, 14 Jan 2021 06:02:56 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id h13sm10128002wrm.28.2021.01.14.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:02:56 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/gtk: expose gd_monitor_update_interval
Date: Thu, 14 Jan 2021 15:01:52 +0100
Message-Id: <20210114140153.301473-2-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114140153.301473-1-pavlica.nikola@gmail.com>
References: <20210114140153.301473-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: r_qemu@t-online.de, philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gd_egl_refresh function, as the name suggests, is responsible for
refreshing displays when using EGL graphics with QEMU's GTK UI. This is
a perfect candidate for a function to update the refresh rate in.

Since gd_monitor_update_interval is inaccessible from the gd_egl_refresh
function, we need to expose/globalize it in the include/ui/gtk.h file.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 include/ui/gtk.h | 1 +
 ui/gtk.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 80851fb4c7..3f395d7f94 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -86,6 +86,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
+int gd_monitor_update_interval(GtkWidget *widget);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index d2004a4dc1..26665cd2e6 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the update interval of the monitor in ms,
  * else return 0 (the default update interval).
  */
-static int gd_monitor_update_interval(GtkWidget *widget)
+int gd_monitor_update_interval(GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(widget);
-- 
2.30.0


