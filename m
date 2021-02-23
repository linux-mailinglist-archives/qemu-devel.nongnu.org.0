Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1C32293B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:09:08 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVYy-0006at-02
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEVWm-0004ik-Ki
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:06:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEVWk-00043k-RV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:06:52 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e9so9609214plh.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hlw/O7nd7EbvrI1skYFk3q6wS0RBASlkeNnSOspjNmw=;
 b=eYOu4wByO8/YPQ49Gy6zOVjy6QCSywnCPvFNhZPwl8Xj19ExQv4nrKG/Rut5KNk/8q
 0rMZ1elulQoYhRHi7rKAcpDiHWXy/8SIf/lI5JT5gTM4YvQZ/a0/TYnOVN8aZTZ0TFkD
 0x0wFN+G+VHpIVfrYrzxBTpW7VlPzz7XL4uRjMGcRqPikqtM2xccwPmjfS8LrCwiq3YF
 9/IFzdRHITwQagxI6T3Gh90FX+gXr8dY859B7aKl137T60uBgtAOjsNUf39kWumMwo0u
 YXx8t3Ujdm7S7HetWPpVjw0B2CmrW7d+N1U4fh7Za7fV9pb7H/PxMtGUFrZDuNn49N8o
 nwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hlw/O7nd7EbvrI1skYFk3q6wS0RBASlkeNnSOspjNmw=;
 b=K1cgqj8ob9nvrtdN1RUAJflonIyTXLL141B5tqVy/rjBY6OR8mLhkj/kP9k52VPxZb
 I73K2HS8FEfwfXXmxgRL/lJ5av7ja0YzHaUB01hgWPHYvPbK68GWMoDQehHAyLeYGncU
 5rFLz1dXxDovrn+YaQVmK2977/pxIKKkYf/GdrgtW6+2JFHNZoNCAF40q0mWogk6g1il
 Ag2OfcJz5EDPTuAVzGjIJcY94KCoWYOShDeLCT4BMgtjSA7m4flKOzwenTpoerjVIRnr
 M0GXovTWivA06PtuWymvXo/kuL6jj/qzaP2pspV2Sw231s15+eBiptRIszJu9gJ43rQq
 ZBIw==
X-Gm-Message-State: AOAM532BWRHsZGHNsEOObvainkI/N/F2CaqsI6jEpzKmoigj3w6qKCsg
 hmsy69ihKLJPQu85yjl9CSf+XNNHGluIyA==
X-Google-Smtp-Source: ABdhPJwrIv7koQE7lA6Jtri/2sl0fT2pVwbaye6lkImCe0evDB3x+OGpPc9MkKidXZLB3ZtVIsTilg==
X-Received: by 2002:a17:90a:6342:: with SMTP id
 v2mr27594846pjs.150.1614078408853; 
 Tue, 23 Feb 2021 03:06:48 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id w188sm22922103pfw.177.2021.02.23.03.06.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:06:48 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not rely on the first argument
Date: Tue, 23 Feb 2021 20:06:40 +0900
Message-Id: <20210223110640.73974-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first argument of the executable was used to get its path, but it is
not reliable because the executer can specify any arbitrary string. Use the
interfaces provided by QEMU and the platform to get those paths.

This change also changes the icon shown in the "about" window to QEMU's
cute one.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..b3e7833e7fa 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -39,6 +39,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "sysemu/blockdev.h"
 #include "qemu-version.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include <Carbon/Carbon.h>
@@ -1401,18 +1402,13 @@ - (void)make_about_window
     y = about_height - picture_height - 10;
     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
 
-    /* Get the path to the QEMU binary */
-    NSString *binary_name = [NSString stringWithCString: gArgv[0]
-                                      encoding: NSASCIIStringEncoding];
-    binary_name = [binary_name lastPathComponent];
-    NSString *program_path = [[NSString alloc] initWithFormat: @"%@/%@",
-    [[NSBundle mainBundle] bundlePath], binary_name];
-
     /* Make the picture of QEMU */
     NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
                                                      picture_rect];
-    NSImage *qemu_image = [[NSWorkspace sharedWorkspace] iconForFile:
-                                                         program_path];
+    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
+    g_free(qemu_image_path_c);
+    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
     [picture_view setImage: qemu_image];
     [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
     [superView addSubview: picture_view];
@@ -1427,9 +1423,7 @@ - (void)make_about_window
     [name_label setBezeled: NO];
     [name_label setDrawsBackground: NO];
     [name_label setAlignment: NSTextAlignmentCenter];
-    NSString *qemu_name = [[NSString alloc] initWithCString: gArgv[0]
-                                            encoding: NSASCIIStringEncoding];
-    qemu_name = [qemu_name lastPathComponent];
+    NSString *qemu_name = [[[NSBundle mainBundle] executablePath] lastPathComponent];
     [name_label setStringValue: qemu_name];
     [superView addSubview: name_label];
 
-- 
2.24.3 (Apple Git-128)


