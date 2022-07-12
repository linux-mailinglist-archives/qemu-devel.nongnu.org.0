Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9A57292C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:19:34 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOE9-0004vH-9d
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBV-0007cw-Hw
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBS-0002U1-Gn
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so185740wmb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAKkygkMO1TUtVaK/7uVgYzViBXQ1KnHrGHWUDPP7AE=;
 b=P6jvTc26WoW9mGGPpngwUR0CDdsgB68NIOQTH35UuE23TcorudpzQkaMdakCmGk5U0
 EDpZVITphXPqXyHQ+/zVaUpPwOoGhg7YxrnfxQ7HGZfDtHGXDIC+aPp0VmwX2dlElM7i
 TqprLGu0S//lTfI0CJ512FwPzobAETfSgoVfcWL/+aVBrwEU5/JA4QEIvpxfixbnLmqa
 XVMR/V9DmIdPyaHip4OjHKsU0CfAYqX/VoCI/xepmk6aevZ/AF6A901bWRoQAH7mBdNj
 gLsofPH2I9tAdJw8ugM9gV2RfPMcwpHGZm2nOpkTnv/6upppRk/EyZTlyQWF1A9hKK4U
 ppJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAKkygkMO1TUtVaK/7uVgYzViBXQ1KnHrGHWUDPP7AE=;
 b=fTsXYkVKsP719Vt4kl73BnHqv2FJkbcpQW8majj9D8N661FxC113Ddo7kDRouAbnbl
 5YO2crhjr57bnRLGZEsVNY5h6tWpkxpVKzuLEob3gzUnJsPGoFI+81dsPuu8NJ85ALIc
 ke/iGa45zJK1shzYOhLuVCDgae0QASBY7tnfKKF3FZoPOcXpLI20helNk6KDQF1EIAcS
 z5W+6CcOksBoMzx1IdOruZGF4R/t9DOzPTITy+wdjhJCYhswhnnLe7kTNevsBGtbfQ2Y
 YjhPtAHA0hQtiBKtQdTs9D1B+s1/suJkt1mDH8E8u8eWoiYZmZ+SRCi3MBa6Nn4CfbLY
 m9CA==
X-Gm-Message-State: AJIora/P7By5vclium0T33ht/uzqeonsvL5MeDMf956HOWYa0BdqIs3w
 rCQO0n53XSUJEUvTSKGRGVuw/rwe1p5mbGOM
X-Google-Smtp-Source: AGRyM1uqp1Zlw04TWTdCzEZBBEymzCc+K8V/sERb4NDmaPr/TjVN2xW+AH6cGmgSHkyLARdAVCGWGA==
X-Received: by 2002:a05:600c:3507:b0:3a1:9fbb:4d62 with SMTP id
 h7-20020a05600c350700b003a19fbb4d62mr174945wmq.161.1657664205139; 
 Tue, 12 Jul 2022 15:16:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfea45000000b0021d6a23fdf3sm9212775wrn.15.2022.07.12.15.16.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:44 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PULL 3/5] ui/cocoa: Fix switched_to_fullscreen warning
Date: Wed, 13 Jul 2022 00:16:05 +0200
Message-Id: <20220712221607.9933-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
References: <20220712221607.9933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Peter Delevoryas <peter@pjd.dev>

I noticed this error while building QEMU on Mac OS X:

    [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
    ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
        static bool switched_to_fullscreen = false;
                    ^
    1 warning generated.

I think the behavior is fine if you remove "switched_to_fullscreen", I can
still switch in and out of mouse grabbed mode and fullscreen mode with this
change, and Command keycodes will only be passed to the guest if the mouse
is grabbed, which I think is the right behavior. I'm not sure why a static
piece of state was needed to handle that in the first place. Perhaps the
refactoring of the flags-state-change fixed that by toggling the Command
keycode on.

I tested this with an Ubuntu core image on macOS 12.4

    wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
    xz -d ubuntu-core-18-i386.img.xz
    qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw

Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220702044304.90553-1-peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6a4dccff7f..e883c7466e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
     int buttons = 0;
     int keycode = 0;
     bool mouse_event = false;
-    static bool switched_to_fullscreen = false;
     // Location of event in virtual screen coordinates
     NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
@@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
 
             // forward command key combos to the host UI unless the mouse is grabbed
             if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
-                /*
-                 * Prevent the command key from being stuck down in the guest
-                 * when using Command-F to switch to full screen mode.
-                 */
-                if (keycode == Q_KEY_CODE_F) {
-                    switched_to_fullscreen = true;
-                }
                 return false;
             }
 
-- 
2.36.1


