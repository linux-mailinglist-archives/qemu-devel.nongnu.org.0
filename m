Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA592F6263
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:51:08 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l031n-0008Ts-FE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02xN-0004Mh-EJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:33 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02xL-00012A-Rz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so5805045wrr.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=jwKtt/c9EZ4J6l8X8BG7KGgArLvJGsRRNGzOmX1lFslJft5L+DSGnqb0NBuSEIJ33M
 4zvLKaZiYAP/ATxzHToy80chMCiWu+jvLGDNGwxe2EdpK22A7Q+3UoPu+mSRSgtyDwWo
 lGBHhCGoZJD+GUP0wQ6UlT5/V8c1QP35qG4U9l/+Qdu8Xn2g/rj70uafddz1TzlmmUL0
 sxJ61thDWd7PoTvQXqjoZvvLoaHDa+IaR7iIS57TwgzoKPJy2Lx60qTqTb21jyyqa7e4
 yullcV9eoEVENOxPpuzVWEOtNsmsk7b0EORdz8KgmOxOzht1OI6vFGGT7bmjLXYjCLKC
 YIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=Y2TtoLY8XNeh1qwLx/AUfzW4ouRUWgU3f92eUVyXW/Ve8SSeCSiEL0qtEZ+mlN3dtO
 U517SlhY1hyrA1iGcPhiBADGfGhKEEv7hOnbd6dMgz1U9a+slCuoyMc14PvO17XSQaoB
 /Qad0CQCNzhNT9aJ/hJO79rELjb4jeJKOvvJwp4776bKap1arUDdHw2y28WX4vd08Y4P
 WtzmsP/+06JVmd1R1ofIPKyKv4RynSO8vvQd4hHfpB7NfSjWoMLgw2DbJqJi/0fHLLeP
 IMRe8GPkaOPw2F2d9ZkIIg6pUahlstcmKEuN5RUGjNpI36pZn2r2zNkYb376/pkcfIK9
 uZ/A==
X-Gm-Message-State: AOAM5317JiOYQLRYx/Nmjcejw/m/R4MPykmz7syNH4eL7ZP6qb1h1CHM
 9KjnZFwiarm6LKSpJmhT4Jz9jndlTyQQew7P
X-Google-Smtp-Source: ABdhPJzq7ErTpymyD4p4Fmwf/5sq9Ct27zvRlf95pfGAawClgO///++UiBjpd7KdpTUSNCvuOxnq9g==
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr8157164wrc.125.1610631989994; 
 Thu, 14 Jan 2021 05:46:29 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id h184sm8832924wmh.23.2021.01.14.05.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:46:29 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH 2/2] ui/gtk: update monitor interval on egl displays
Date: Thu, 14 Jan 2021 14:45:57 +0100
Message-Id: <20210114134557.292337-3-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114134557.292337-1-pavlica.nikola@gmail.com>
References: <20210114134557.292337-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x42f.google.com
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


