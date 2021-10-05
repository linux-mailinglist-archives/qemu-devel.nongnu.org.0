Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489F42232F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:14:06 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhSX-0004NO-4F
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1mXhQH-0002V9-4Z
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:11:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1mXhQE-0002KX-K2
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:11:44 -0400
Received: by mail-ed1-x52f.google.com with SMTP id p13so48393877edw.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqYYee08Mui7gtsLjag5RmhULj4UoFMDRrUZCyM6ifA=;
 b=UbGMcHBpNvrcbLqxtQLp1+4piOqedklRQE5cATOhkL/5uWdD98ajNVUW7ewVWDugUk
 BIW5J12ZribBteq71Rlaoy7/areIGFKbgLoxIttV3qVIfIOhYTc1InXJpn6C0agLt1sn
 +3egXRIkExBdcAbqp7uqqNakywVEIOGDOzQYiUNZNJFvX4Xu7LMKGKS0Xl7fESVueHG8
 7iRlPzDIf5Stc5yOn/5mzSHgUOUqiGkZ06a4WeB7MBa5F2kzCHrbId8OYF8/lm+qhdVY
 rKXjYaseiESbxh4F5T8TjYpaCsFbkpcTAF4hx1WNKd9j1X1ADbYQI6zDD8b3WqIrwZ5x
 0iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqYYee08Mui7gtsLjag5RmhULj4UoFMDRrUZCyM6ifA=;
 b=4bKhmMZg2zBLZK1A/Bh8vTu6zTzhIXjZSBMI6RypLhaUch0xqD07YhSq2u7NQafq8/
 cUsgLpapBTCe7nUIj5Nne8W62YEx7JTkTDYmkMUOszdZhz39IP0tcEWg9ckjRuyeUFrR
 qVPXkaqRWxHEomIKCuIcpXB2ttplxbhs2A/vP+4ece33dqZIKBcExaHVuQLYwYWA1RIu
 Rzwh5K6EGAr3ORLu2Q6lEjK6wsbDIL/MyW4eVCe6tvzsl2wOmrV6p1dOeJ3VVCNvHjjh
 Fw3i7gLAd3ZcOTgd2gZWo4naqvQPIT21+UgMXkNG1exU7hmYOABuZ9jHirfzxKQaCiII
 zRnw==
X-Gm-Message-State: AOAM533e0ky2nJP5bFJob+NifnMH9DaTYIkAcsBdCZpzGg7L8g+wxHQ7
 O9z5sXvb/1EIOnxLMWpf/LE+ULY6ZKnI+A==
X-Google-Smtp-Source: ABdhPJz8BF1gAWOBTcsJrPDfwu9xsPLC4vWpWhU9fr29TEcsR1C9PICdP3bs9VJGMXDljNqwdG40iA==
X-Received: by 2002:a17:906:a94b:: with SMTP id
 hh11mr23733262ejb.85.1633428700418; 
 Tue, 05 Oct 2021 03:11:40 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.gmail.com with ESMTPSA id c11sm8525932edk.68.2021.10.05.03.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:11:40 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH] ui/gtk: Update the refresh rate for gl-area too
Date: Tue,  5 Oct 2021 12:11:36 +0200
Message-Id: <20211005101136.301085-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bugfix that stretches all the way back to January 2020,
where I initially introduced this problem and potential solutions.

A quick recap of the issue: QEMU did not sync up with the monitors
refresh rate causing the VM to render frames that were NOT displayed
to the user. That "fix" allowed QEMU to obtain the screen refreshrate
information from the system using GDK API's and was for GTK only.

Well, I'm back with the same issue again. But this time on Wayland.

And I did NOT realize there was YET another screen refresh rate
function, this time for Wayland specifically. Thankfully the fix was
simple and without much hassle.

Thanks,
Nikola

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 ui/gtk-gl-area.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index b23523748e..afcb29f658 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -112,6 +112,9 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
+            vc->window ? vc->window : vc->gfx.drawing_area);
+
     if (!vc->gfx.gls) {
         if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
             return;
-- 
2.33.0


