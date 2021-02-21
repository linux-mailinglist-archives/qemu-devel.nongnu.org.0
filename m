Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F4320CA1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 19:35:39 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDtZx-0006I3-UH
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 13:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDtWM-0004qG-Au
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 13:31:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDtWH-00019W-Uu
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 13:31:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l18so7282492pji.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 10:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WzcKcf/cVBwjUvXgWgMMbJxDqMOS3ifxPSX5GwImQks=;
 b=Bx29NY6YwuooekxVSTNZtuWmNeUdYIKnhgaBgfMKUDAYBPGbz0KCR0ja5CxSUse5PM
 WPKxhVix9ikhfdVSxmtOw3JBLTO48UOHMhpx7SM+wdMPt9VCILyUnAX3QC8J3lfN9ir7
 MN0NkanAsrREyCMZoFI2XKy7S/oW4Ky7NHUE02P439CF7RaTzPMD1unZC1jUYH606+74
 rOOGZEkMdrcg7Qsx+xvhNWD8hpufstcZWmXVWluTsPY1WJnUl8XiFZXf0xl+FGXkWZPO
 Oqz13BnZ+KIkhfsdepYhu8L/aj8P7N/8im4CJyO1RzcGTunMqM9ZbnUL7hfU0y/cSS7n
 bdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WzcKcf/cVBwjUvXgWgMMbJxDqMOS3ifxPSX5GwImQks=;
 b=DGlLgaNtgO5OOwEkkP7vceRWa6mNbd8EaKPJP/NcL8/JYh17UeqCuA2o1QkfutMPCF
 O9GxzdR/J28yz3mT/0M6AOlV6WM9l1LoLK0+oaiOdjDF51UJn2AzL7XkZvK7jApary8j
 hMcQF6zM97KCxtE3uguwsSRAIrsFU/8P2APy9HzbpKVFCMRqWcw1Po+njK+DOAd/BWQK
 0Ej64Sn27Q1TWaZ8Cwnsayc3rdwT9lMg16YeHCiB2SuJvH99NP2SFbsxA6cMvosL5L9y
 BOCIwqgcvhUCsfNw182cWEwllEiRK5h1s9hx6M4gNtsqKb8pEpF+ApqE0IrsRbahcDfA
 iFCw==
X-Gm-Message-State: AOAM533fdOuL8+chmBcfxO5s5e4+PefsBYsI7sjjGwKnLTsvyvUbjNdL
 NmMtb2XT4Z9OKvWDoz8hDbt3rshRDW26uw==
X-Google-Smtp-Source: ABdhPJw9a32248jHiSD6pnvwDZAQo9sgqUHNc6qNdVpUwm1u3rhRaRbtkamIcQYoSrzplTgkiZNIDA==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id
 n11mr18980987pjq.85.1613932307511; 
 Sun, 21 Feb 2021 10:31:47 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:b418:f77:22b4:17c9])
 by smtp.gmail.com with ESMTPSA id w3sm15189831pjt.4.2021.02.21.10.31.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Feb 2021 10:31:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Fix mouse association state
Date: Mon, 22 Feb 2021 03:30:55 +0900
Message-Id: <20210221183055.60338-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
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


