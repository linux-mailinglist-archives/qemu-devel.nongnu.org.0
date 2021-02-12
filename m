Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE8319823
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 02:59:30 +0100 (CET)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lANk1-0004nw-15
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 20:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALzP-0007DF-8r
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:07:15 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALzN-0001Pj-GM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:07:15 -0500
Received: by mail-pf1-x444.google.com with SMTP id c11so4740014pfp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wAw0VpBMjicwts9quVRR0rA3VpeL00JH/8iEg6mw/iM=;
 b=GcKGEts4H4ZZCciUrj438T8CX5GW0SN0zQf6hAzdo0q0S27yXfkMdLACyiXK1zErZR
 qhuBn9f7jI34zb4tT2nG409F37CJHdz+cr/c+Azu43nGC+XCqwpaItk/7BqtWZwRu3bS
 vFA4ghSQgmKU5OAvNoutl9cEYdw6q1/9/2d2rIl6yyLDax7SGmSRRZL5364iRaKCviq3
 +HlcTtU46AKsWNxbAhBSyYVuAPVYyDtsPQRBSEh2Jk5fWEEm+EsKo5tkufdq8IzTOI3s
 ihfYmU3lm16raq4VdsHqNmPGVw5ns/UEIhKggN83GwGeVrvpgNv3PX7QQZOedLUj0Hf+
 oEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wAw0VpBMjicwts9quVRR0rA3VpeL00JH/8iEg6mw/iM=;
 b=pl22OjvtINripdRY7Oq3d7m1jN4ICr41faWEDpxKk78VJGW2w7nrXjbdf0Om7Axrl2
 TtKg9wpXLKaIN0DrrntZcC6EefNuOIbDMvuXe7tqfHnFYal2lOGTk7nXqMVXWJmJfys0
 gB9O9c47IYUWdQRkO0TquERqsk4wyRUrT4+zm+xjhwpTeNqb2HgteMuV4QkiEj9xu3dA
 Dz18MnFPJc+7wGFj6qYo1U2W9E0+JybBhBanfG0HJDzR4KDPalUZyhFFhR/FfhmyL3NR
 jWL5+vUyoHlkhMN1h9z6YhVK+O3WF4F7mtiyC9yWlKI2UVVILKXMlHfsh4DvFGIxrYx2
 Q3Pg==
X-Gm-Message-State: AOAM533BDHA0UH2uJMRdLW5TkStp3gKaXTyX08Bfmy1N6QdOj53NwUkZ
 hHGnONljcRTi9kmoCoG85Fw=
X-Google-Smtp-Source: ABdhPJwR7ru3kCNTHXh45w12K77hznNy4xRumthx5n2Qr/XdYO1akLge7VdYa9PYa/V5bG3UgXBu+w==
X-Received: by 2002:a62:6006:0:b029:1dd:3af9:965f with SMTP id
 u6-20020a6260060000b02901dd3af9965fmr452685pfb.30.1613088432312; 
 Thu, 11 Feb 2021 16:07:12 -0800 (PST)
Received: from localhost.localdomain ([210.227.19.68])
 by smtp.gmail.com with ESMTPSA id j17sm6690914pfh.183.2021.02.11.16.07.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:07:12 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Interpret left button down as is when command is
 pressed
Date: Fri, 12 Feb 2021 09:07:06 +0900
Message-Id: <20210212000706.28616-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Feb 2021 20:57:23 -0500
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Old Macs were not equipped with mice with an ability to perform
"right clicks" and ui/cocoa interpreted left button down with
left command key pressed as right button down as a workaround.

The workaround has an obvious downside: you cannot tell the guest
that the left button is down while the left command key is
pressed.

Today, Macs has trackpads, Apple Mice, or Magic Mice. They are
capable to emulate right clicks with gestures, which also allows
to perform right clicks on "BootCamp" OSes like Windows.

By removing the workaround, we overcome its downside, and provide
a behavior consistent with BootCamp.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..7ca590ff36f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -830,11 +830,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             mouse_event = true;
             break;
         case NSEventTypeLeftMouseDown:
-            if ([event modifierFlags] & NSEventModifierFlagCommand) {
-                buttons |= MOUSE_EVENT_RBUTTON;
-            } else {
-                buttons |= MOUSE_EVENT_LBUTTON;
-            }
+            buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
             break;
         case NSEventTypeRightMouseDown:
@@ -846,11 +842,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             mouse_event = true;
             break;
         case NSEventTypeLeftMouseDragged:
-            if ([event modifierFlags] & NSEventModifierFlagCommand) {
-                buttons |= MOUSE_EVENT_RBUTTON;
-            } else {
-                buttons |= MOUSE_EVENT_LBUTTON;
-            }
+            buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
             break;
         case NSEventTypeRightMouseDragged:
-- 
2.24.3 (Apple Git-128)


