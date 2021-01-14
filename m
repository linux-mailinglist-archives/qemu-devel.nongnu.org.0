Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181602F6253
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:49:36 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l030J-0006af-4c
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02xO-0004OZ-JL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02xJ-00010j-Ul
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d13so5795490wrc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=VAFif2PrSady+Myc3KFcrNz0WA1W/1AwJrpLSBkTYDt/BUeF0TieIBQ0RMWZaDbVAR
 /mdH1bGRRxl9bAlPs5/BDvVEMh2T+8he0sKcEoY7TDWGTp8GFRhcvmlqEDHS0OV8R6TU
 bokusEI4UbcVDCd537XJQWCc9cFaYokqwuCG/ocDNgfvDFGKYu/5PQgT1xNHZ/HPX5FO
 i6D51+g8GNh+VX3zMuzeih7pZNRhDqpENVFNnyeZEeWE0Ob/eq8M/GDWsZoh3Novi9x6
 xK8SNYhGtXMhL2zAxPOb+6fOu5ONiS8nJQqiw9myWQ3QnVZ8u/H9fXpNMPkYjt52mDto
 w4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76J19Z46dfDAROoPlZLlI73X5SF0+xkfiFl0PfM58YM=;
 b=NMdrkFPKl47C99Np1VuAY70EPaPLyCVMz8paavQUHSKVOfugRw5mUXx5jkaPtFGXR0
 PT5XuIxYOMMyq/90S97ckJCUdWrJ8Xbx90LmStfsDh0dDOvxIG2awvkvQNGmIZZ9bxe0
 6n+Ro7sfviCds7mHlfiZblYgGXeIEcI2cFfV7RSWXy6zbxfMTB+uCZCizvaEaMsJZnzZ
 9h5X2nkus8r72UCLABiXpu+8qzoFe0h+60ntdATjcA4DyjBQhY+KXAv8HRqaMIqF7nbJ
 zL7ho/T2Sw3Q3owd7yO7ed4GPzLnQeHEEiEWhakTKxd2dUXISgsXXQiDHI4BThxwvZ/y
 HWtw==
X-Gm-Message-State: AOAM532zkaCq5b56orrOn/RJX1l/NvBoolM7L8jy9HjpBtabhMAcFlve
 skIQQ6xr/QqrMmpthtJtOx/HBPGuu8S4f8iw
X-Google-Smtp-Source: ABdhPJzW90JhJK3wmuN77EQhW8F6RzS3HddToPShz3mU9+nF+fwTQAfy+lH80MYn9GuFrAQr5GbmcQ==
X-Received: by 2002:adf:e541:: with SMTP id z1mr8034942wrm.143.1610631988221; 
 Thu, 14 Jan 2021 05:46:28 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id h184sm8832924wmh.23.2021.01.14.05.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:46:27 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH 1/2] ui/gtk: expose gd_monitor_update_interval
Date: Thu, 14 Jan 2021 14:45:56 +0100
Message-Id: <20210114134557.292337-2-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114134557.292337-1-pavlica.nikola@gmail.com>
References: <20210114134557.292337-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x42e.google.com
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


