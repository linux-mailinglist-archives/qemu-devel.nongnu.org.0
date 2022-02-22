Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A87D4BFFD4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:11:21 +0100 (CET)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYh6-0007uI-KK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYcn-0002Ck-44
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:53 -0500
Received: from [2a00:1450:4864:20::32a] (port=46695
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMYcl-0005Lb-1M
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:06:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so2350503wmp.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4QWuB/UtXQh+ieQ/jNh6PJp6YckfgfBwGNcqYRWs2I=;
 b=Ltr2wsw6oofF9T/BROXMRAfysZNx3uCAzNXtdYRWoiD3Aery6eTEZx0KuAhV0KiyIj
 2X4vVL7fx/mug2egGgU3FJ9iqB6ipE+lNa52LpEVq3SSAD31Q+hbe2qokl9Cf4YS6/bf
 wqztcZpLA4MM4l5AkFs/lihfMCc/zVaAvBOXBHgD6VqyciptRzZI0aLUFSI8cPsuahPV
 /MRHBwMyBfx+yBYyWmv51vy4ZCVHO6fbweo/H09b2Sxseg9afzCOXAKotbOPnUqbdDRA
 8BxgVWqWnwa+zOUJSffu8kf4CMCSkxVyf4aeA9WUvRl/jiMQaF/dgQVw8by+NUuUg/It
 yIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4QWuB/UtXQh+ieQ/jNh6PJp6YckfgfBwGNcqYRWs2I=;
 b=3/Q6qSqOq53anrvrdxRcX49U5RIr6VIUu9MGyhFKNB95wIaB6uiPcTFgSrIQhNCFI3
 a0gpXweqzZWNCHx4B0kZdsmwwKnSPDI1/y98f0oqrR6HHOcBUtEGX7QHV0IPsjYimKKq
 4H80P2c5222czzIEALV8abKJkttg0XtRdHlmMFZ9R1xWjZMDlhozgF/9q7zuF26Kn+hw
 oauNuBCFigIbIqlv6JV1Yd15XPoGvTU2WmQPzvvdfLLLQ8CbAEVQRpLGlMlHgx33Rz4B
 23+JfCz3o8iTzUrVi6Jv9FzRvS3AedSQMCEqjLJfspCSis5c4jOkpr9ZIetQNi2euD89
 zj3Q==
X-Gm-Message-State: AOAM532DTBK3ZwDplVTDWecMz+HiXAAZboXegylmAlevIyHZhCNTrjx5
 oPKKyNsnatiV4gZ58GK2ohuP7MGfWeQqXw==
X-Google-Smtp-Source: ABdhPJwL5fLWhaUDok1j8ZpmPc22s2CtCiuqQcRHSe1ywUd32f7X70jCMxALNs3rjIL8KPf4LtXxLA==
X-Received: by 2002:a1c:6a16:0:b0:37b:f4b0:65d8 with SMTP id
 f22-20020a1c6a16000000b0037bf4b065d8mr4151481wmc.80.1645549609233; 
 Tue, 22 Feb 2022 09:06:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b0037c32873258sm2813113wmi.2.2022.02.22.09.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:06:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/cocoa.m: Fix updateUIInfo threading issues
Date: Tue, 22 Feb 2022 17:06:44 +0000
Message-Id: <20220222170645.860661-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222170645.860661-1-peter.maydell@linaro.org>
References: <20220222170645.860661-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The updateUIInfo method makes Cocoa API calls.  It also calls back
into QEMU functions like dpy_set_ui_info().  To do this safely, we
need to follow two rules:
 * Cocoa API calls are made on the Cocoa UI thread
 * When calling back into QEMU we must hold the iothread lock

Fix the places where we got this wrong, by taking the iothread lock
while executing updateUIInfo, and moving the call in cocoa_switch()
inside the dispatch_async block.

Some of the Cocoa UI methods which call updateUIInfo are invoked as
part of the initial application startup, while we're still doing the
little cross-thread dance described in the comment just above
call_qemu_main().  This meant they were calling back into the QEMU UI
layer before we'd actually finished initializing our display and
registered the DisplayChangeListener, which isn't really valid.  Once
updateUIInfo takes the iothread lock, we no longer get away with
this, because during this startup phase the iothread lock is held by
the QEMU main-loop thread which is waiting for us to finish our
display initialization.  So we must suppress updateUIInfo until
applicationDidFinishLaunching allows the QEMU main-loop thread to
continue, and instead defer telling the UI layer about our initial
window size until later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..f8d3d8ad7a6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -522,8 +522,9 @@ QemuCocoaView *cocoaView;
     }
 }
 
-- (void) updateUIInfo
+- (void) doUpdateUIInfo
 {
+    /* Must be called with the iothread lock, i.e. via updateUIInfo */
     NSSize frameSize;
     QemuUIInfo info;
 
@@ -554,6 +555,22 @@ QemuCocoaView *cocoaView;
     dpy_set_ui_info(dcl.con, &info, TRUE);
 }
 
+- (void) updateUIInfo
+{
+    if (!allow_events) {
+        /*
+         * Don't try to tell QEMU about UI information in the application
+         * startup phase -- we haven't yet registered dcl with the QEMU UI
+         * layer, and also trying to take the iothread lock would deadlock.
+         */
+        return;
+    }
+
+    with_iothread_lock(^{
+        [self doUpdateUIInfo];
+    });
+}
+
 - (void)viewDidMoveToWindow
 {
     [self updateUIInfo];
@@ -1985,8 +2002,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
     COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
 
-    [cocoaView updateUIInfo];
-
     // The DisplaySurface will be freed as soon as this callback returns.
     // We take a reference to the underlying pixman image here so it does
     // not disappear from under our feet; the switchSurface method will
@@ -1994,6 +2009,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
     pixman_image_ref(image);
 
     dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView updateUIInfo];
         [cocoaView switchSurface:image];
     });
     [pool release];
@@ -2057,6 +2073,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    /* Now we're set up, tell the UI layer our initial window size */
+    dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView updateUIInfo];
+    });
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.25.1


