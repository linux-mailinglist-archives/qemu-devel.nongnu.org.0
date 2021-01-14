Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DADF2F62B3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:08:37 +0100 (CET)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Ii-00027c-Fd
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DO-0004mj-Ja
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DK-0008NU-Jb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id k10so4626622wmi.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=H6lhrgBiBXtw7hLt9rxBpQDSylaJpNgZylvk1XNfyxHcbRm4rg091wI8n5U0dU+HV4
 CvSnSuUSvoSw6/lKYLZ+VYR/iUbDfgaQqAouDLtLk6ebWpRi/MeqbUAzj1WJYXSJOidP
 ynFJXW80B9Er+hNATDwNwkiQgfwjkX78IqvoVEeM3lL0fKBWQtVOv+AJVxnLLrDTXsPk
 8sIli1c/BCWVQONvEG76sBctpJ/HNVJGXvquOZ1sZruE73AsnPWJD2Y+WE7QMijqPM5Z
 Ht1mpCAxXK5LCxhl/8X7jDlfnbHAx7rQOghs6fw4riqwqcMsZsHO3/dIQ32R3V6MwA/J
 v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=flwmdGHHWZTmhbo+6EWmHoL4h+qEBVyZ3P3cBYmEzYcaIT7l8VkKV18qjd1fxxXLZe
 YY2JoWEi6zMpOJf0BvfG57M8VEq/Bj+hq7AAytySix14m+JGGIUX5UfZd8cDWaF5iGZF
 kd1caL9u376RcsSS6GKrCgb9R7ShkQ3017nGa4oL0dj6ccZKDSPVpVQ1I0oYsYlxyrQd
 KXl3oV/S+TVZE/nUXWMG/WV5VZ2THG82bXsHztpgZvRflxqs6JPxjlIM72z0V3QT/x3m
 /+GzfG/J0lJBJ2pak/05lsvIQjdhivNg0177ulCfIHfqEeL3ktSRzLAQRcbEoKkjaAry
 rqFQ==
X-Gm-Message-State: AOAM530EbSFpGAPuuEwYgQQ1432w+mi9lmtOa5H7OOKZt+qfRlhbzEFL
 Z7l8rOkLY+BcW6b2p7AfQsDkDFBYbzPs8ES/
X-Google-Smtp-Source: ABdhPJzpbBG4NmDUUOb7gW55hjqlZDPp7hQBQwsecoLsbl7boLZ/f0jFtf6E8FmXcKHjgKyoHc9KMg==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr4138878wmb.76.1610632978861; 
 Thu, 14 Jan 2021 06:02:58 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id h13sm10128002wrm.28.2021.01.14.06.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:02:58 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui/gtk: update monitor interval on egl displays
Date: Thu, 14 Jan 2021 15:01:53 +0100
Message-Id: <20210114140153.301473-3-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114140153.301473-1-pavlica.nikola@gmail.com>
References: <20210114140153.301473-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x330.google.com
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

When running QEMU's GTK UI without EGL or OGL, the
gd_monitor_update_interval function gets executed and the display refresh
rate gets updated accordingly. However, when using EGL or just regular
OGL, the function never gets executed.

Which is why I decided that the function should be in gd_egl_refresh
where the display output gets updated, in the same vain as how it's done
for normal GTK UIs (aka. those without EGL) - in it's display refresh
function.

Since the gd_monitor_update_interval function now is exposed, we are
going to use it to update the refresh rate.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 ui/gtk-egl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 99231a3597..71c3d698b4 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -113,6 +113,9 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
+            vc->window ? vc->window : vc->gfx.drawing_area);
+
     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
         if (!vc->gfx.esurface) {
-- 
2.30.0


