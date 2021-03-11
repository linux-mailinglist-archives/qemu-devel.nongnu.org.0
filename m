Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A4A3372FB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:46:21 +0100 (CET)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKho-0006m9-3c
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWF-0003gC-IX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWA-0006WH-6P
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=To8A17QUJLYh0uveAu5VbheglTSlu/oogbKxNVlHls4=;
 b=IIUREMwfkC0EGzOYzBvLLBFaGta+uc/vJl0h7I+Y2bIXIAwRayjUWhhIozGx73hJBWIeUT
 mTCDSYjBPy+32V62MZz866JptxiKq96Bbc3Z61slSufI/9bHqarR685rNWnpcnjcKQJ8hr
 AyP0qmao23XcnzNCHmN31NylIrcza2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-T65FOOrCMn6kWe14KlaHnA-1; Thu, 11 Mar 2021 07:34:13 -0500
X-MC-Unique: T65FOOrCMn6kWe14KlaHnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCBA1100C61A;
 Thu, 11 Mar 2021 12:34:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C68F60853;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1245C1800914; Thu, 11 Mar 2021 13:34:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] ui/cocoa: Fix mouse association state
Date: Thu, 11 Mar 2021 13:34:01 +0100
Message-Id: <20210311123401.340122-9-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-Id: <20210222150714.21766-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 3af167f0712f..a7848ae0a30e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -304,7 +304,6 @@ static void handleAnyDeviceErrors(Error * err)
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
-    BOOL isMouseDeassociated;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
@@ -321,14 +320,9 @@ static void handleAnyDeviceErrors(Error * err)
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
@@ -972,10 +966,7 @@ QemuCocoaView *cocoaView;
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
 
@@ -990,17 +981,18 @@ QemuCocoaView *cocoaView;
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
2.29.2


