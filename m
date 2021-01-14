Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B435A2F6289
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:59:08 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l039X-0000Zk-R2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02zy-0007Qd-Mv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02zv-0002An-42
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id g10so4749140wmh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=KQ2+6vPc/kZaFIdmIc1yEAdS4QFulQgPKMB7VSWzsoSRLJ+OhZL2F19vG9sj/RERis
 lna/KZPF5mQriyW6KjBJTYHP4Tt0/v7aubaBf1+qh6OcCD3ekfEfEuOBW2GYMWRIXnO7
 NykaHnMahJMWbLUoE5YRXUFmIcSWqquSYyC2NGueCePPltfF2z3+8+NrR/OIP7O8cWUB
 VbRaI9Xk4PsB9NNmVz6j5E0k3zJxe9X0CXDn2Iml7mvR1qSU7+D8fsMwY0Jp/9raEbvf
 eg+oY4dVRxoQj129QQOs3C3z+gZzVRQsw2a7PUY+eTTfiNhkAj1IGqRr6ChsTYVaJX9k
 v0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=YU4FDpfZCD+eSMEbvc2Un++zNl1Mek1Tlhmcxmp5gSxmugsgkOtnklWRHetBH9NOZX
 tpReB1aO7auBgF3icglHWUHk+EwykItH+s0YnYC5DxgAcGb57E3LZ9HMy34WDHBsRJEU
 d80MemLAmdqyAhIiTxzn6+1umvIqDwXGuOL06B+sQQiou537MTAzYBI5/e9/s55Qd/hK
 h+K04uFhckmpw13xoZS5TAggVVcW/dkHe62GDsLtlq6TXDrK4IdWGWqoFvBr3BEUM+th
 Pgn4q4nOK7Iu95018TBe9gP1jl/jhypucJI8GdStJVVtQCwLhd0LVYUpuwYpdcpg2BeU
 eU1w==
X-Gm-Message-State: AOAM530A4Gif0/VQkl4sHBSeG26sZeIXsWvSV/7NKC5IlLiWwLtcUUxW
 1X3c/aJ+sRYmz81JWRfDmPoj0kTvVIt32gwQ
X-Google-Smtp-Source: ABdhPJwKfbK1WmO5BSeiZ07ZJlUoumLggWMR+h/WDvyWgQeZmaxQATVR/lTUTzvFAQXwkMrJK1dzEw==
X-Received: by 2002:a1c:b78a:: with SMTP id h132mr3999087wmf.141.1610632149204; 
 Thu, 14 Jan 2021 05:49:09 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id q7sm3611465wmq.0.2021.01.14.05.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:49:08 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH 1/2] ui/gtk: expose gd_monitor_update_interval
Date: Thu, 14 Jan 2021 14:48:50 +0100
Message-Id: <20210114134851.292767-2-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114134851.292767-1-pavlica.nikola@gmail.com>
References: <20210114134851.292767-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x32d.google.com
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


