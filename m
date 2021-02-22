Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AA321ACE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:09:00 +0100 (CET)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECpX-0005WL-Hh
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lECo0-0004DN-Sl
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:07:24 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lECnz-0006xR-21
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:07:24 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l18so9248720pji.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGQmI+iOzSpbOXUMS4jcVlQFa1E428khTWTSNBL82Z0=;
 b=PveUOb7M/ZoiRz9KurWLFMizdd/hjxqZNscB6nadH1zuzLeoQxDvuAKQ13Z2LHP/0U
 LhmaYpnuSGmZOoPq4yUx2454jbln73hkoJ0D2Y8KWZLMlTrPIJ9rslGOP0zIfxnAwsyV
 zI0FwUike4gZUUwVN8U85+oE+nUrDkWV2wLDa8ubmKH3rFk6ysQYtrYrcNzfSwd2E8Vn
 uSPv3MNDslqkWQQQMqRIrBEZc5dkuyu899NZMrGrrXbLYNltQ5kc84cw+Jvg+722NPSe
 lQz1bJ7KnMqvpg/dWpDmwDeoNqRVKHH9Iguy0V6lcjTzCEE9F338gj8dddc7hB0fo4Rq
 VWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGQmI+iOzSpbOXUMS4jcVlQFa1E428khTWTSNBL82Z0=;
 b=mustKzsUNWAbIgLp215uaeCgBgiyK+M/MII0JSHGwDZRO1IGR9ndU6M9mmaXpa6XYY
 4/qBVFCN8uEKwdCexPWz8FNmPUP32K8qvitX6KEAr7lLIlAQsLnsqHPU88NfXBHBnJq4
 8d83PCU5dU4tvHH1Rp8kYQAYBROU7VFj5sYzh+sIpGDbY55o3HD5pcw80BowmGHxTnbJ
 4Ro2jjw4roC2KwsUUlSYcIKca4VnjMPcWm/8QS2k0iQ5ze4nBqUi0SagnncKLsitK5zG
 VbwtsG89xTY3PvEFrXiU47vO0DK3S2S9Y4oByp84jwyE5qlx4OuCx6Xb+tpWk08QA+Mn
 8xXg==
X-Gm-Message-State: AOAM533vg7gW26Ex4zpHc5TYxsx/ACqlVTL/JgKfOdRiPeElt21Llktl
 9NoONRS4Fkrl0DiT5GEeYQCyud8XhG1nrw==
X-Google-Smtp-Source: ABdhPJwy4Lf+c35tUZhdI0mVXkG1i3hxcw0IQu4JNTZtOCKUpa/lVpxAYagZGyCIOMqZUXXXH3M5zQ==
X-Received: by 2002:a17:90a:67ca:: with SMTP id
 g10mr24050106pjm.28.1614006441332; 
 Mon, 22 Feb 2021 07:07:21 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:186c:a15a:d0b6:e217])
 by smtp.gmail.com with ESMTPSA id g19sm18903718pjv.43.2021.02.22.07.07.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:07:20 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Fix mouse association state
Date: Tue, 23 Feb 2021 00:07:14 +0900
Message-Id: <20210222150714.21766-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <CAFEAcA9bP5TTroWz8k4kkB6bAj81zRBFgR4Uzi0L3BjoNd9JkA@mail.gmail.com>
References: <CAFEAcA9bP5TTroWz8k4kkB6bAj81zRBFgR4Uzi0L3BjoNd9JkA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
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

ui/cocoa deassociates the mouse input and the mouse cursor
position only when relative movement inputs are expected. Such
inputs may let the mouse cursor leave the view and cause undesired
side effects if they are associated. On the other hand, the
problem does not occur when inputting absolute points, and the
association allows seamless cursor movement across views.

However, the synchronization of the association and the expected
input type was only done when grabbing the mouse. In reality, the
state whether the emulated input device expects absolute pointing
inputs or relative movement inputs can vary dynamically due to
USB device hot-plugging, for example.

This change adds association state updates according to input type
expectation changes. It also removes an internal flag representing
the association state because the state can now be determined with
the current input type expectation and it only adds the
complexity of the state tracking.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..671af40b252 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -310,7 +310,6 @@ @interface QemuCocoaView : NSView
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
-    BOOL isMouseDeassociated;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
@@ -327,14 +326,9 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  * isMouseGrabbed tracks whether GUI events are directed to the guest;
  *   it controls whether special keys like Cmd get sent to the guest,
  *   and whether we capture the mouse when in non-absolute mode.
- * isMouseDeassociated tracks whether we've told MacOSX to disassociate
- *   the mouse and mouse cursor position by calling
- *   CGAssociateMouseAndMouseCursorPosition(FALSE)
- *   (which basically happens if we grab in non-absolute mode).
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
-- (BOOL) isMouseDeassociated;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
@@ -974,10 +968,7 @@ - (void) grabMouse
             [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
     }
     [self hideCursor];
-    if (!isAbsoluteEnabled) {
-        isMouseDeassociated = TRUE;
-        CGAssociateMouseAndMouseCursorPosition(FALSE);
-    }
+    CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
     isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
 }
 
@@ -992,17 +983,18 @@ - (void) ungrabMouse
             [normalWindow setTitle:@"QEMU"];
     }
     [self unhideCursor];
-    if (isMouseDeassociated) {
-        CGAssociateMouseAndMouseCursorPosition(TRUE);
-        isMouseDeassociated = FALSE;
-    }
+    CGAssociateMouseAndMouseCursorPosition(TRUE);
     isMouseGrabbed = FALSE;
 }
 
-- (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {isAbsoluteEnabled = tIsAbsoluteEnabled;}
+- (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
+    isAbsoluteEnabled = tIsAbsoluteEnabled;
+    if (isMouseGrabbed) {
+        CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
+    }
+}
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
-- (BOOL) isMouseDeassociated {return isMouseDeassociated;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
-- 
2.24.3 (Apple Git-128)


