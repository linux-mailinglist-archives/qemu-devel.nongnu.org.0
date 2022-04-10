Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056F4FAFC8
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 21:35:40 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nddLX-0006Uu-0Y
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 15:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nddIa-00050N-Ku; Sun, 10 Apr 2022 15:32:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nddIZ-00030b-2n; Sun, 10 Apr 2022 15:32:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e8so3759475wra.7;
 Sun, 10 Apr 2022 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=DxI01Lhb3PVVR1+hRo1spjyaUCy+NfvJh23lqBfJ0nM=;
 b=Z2ub7WibYAC6D+kXdXWl2tJKCCn6nJeX733VHRg00mSkZJ1bVzMGplpTXZ2FfOVz4z
 OSZWgT2YuK2vPz8uY2lpls+SB7DkJk/BvFV/R2DuLCEHftRARuzVm2gD6cAvYjf7ivIp
 95I6zgv25BLftayqEG0vDZbIbjfP8a9DWqIhncizCYwf+ZT1QyrA9pR65lhkNCSwMK6E
 AgmKUTsv4VI5UY79zd9KMmXhKc1UaPzs9K+bxfwO82GIupvoPlGFObaj0PyJdjr1PfwG
 7rKJCEu4RP33xM6I51XABCu6wVf3XydzbOfyHR2RDp6SbCVlA5IeWEMx7PzYlkx5PTWS
 zawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=DxI01Lhb3PVVR1+hRo1spjyaUCy+NfvJh23lqBfJ0nM=;
 b=Ai+BoGfjifH/hx/+IUS1gkYu8svD23sOmkz0oiUNCkYMsNcjTKnJKoN8F3LnqSO5Rp
 oCVgPE1pxDaW/UY4zjKG026YSRG3p8221lcDrTn532RI1StjC9FwjZ2K5SYax4sejgOJ
 lcyrg6uYnnTxeidnzeqVrV0aEI2abYQx9BjB1qOOWUS4Y9H5um2yFB/Ed9n0o4Eps4eC
 sh80n+hEula2bNu9Q9Erlj5mDvh7z+VykSDTi1Dloi8vQbo4nw7UYFj7G27O1Hp0vfLo
 bfCfycIYILFgeCR4oEJwNS0HWhGG9Fz6NPp71gI33bmEBqgS/jjlyzeta9IQ6Tgs5gob
 9BjQ==
X-Gm-Message-State: AOAM5335NnTvWIZLdsXoZpj37kwA5b8tWIzPceDLDXQ9ow3nt2DaWakK
 ZcbLAERwlThu4ONS7FQBrnyo2wcGz5k=
X-Google-Smtp-Source: ABdhPJw2fZ75tbGTGvy4RSzTebOGSf/3UF+5YRznvac/9HJFEfNsWX6O9QNB/b/5XH1EWv2O7ym0UQ==
X-Received: by 2002:a5d:4cce:0:b0:207:a1f1:6f50 with SMTP id
 c14-20020a5d4cce000000b00207a1f16f50mr4849111wrt.139.1649619153254; 
 Sun, 10 Apr 2022 12:32:33 -0700 (PDT)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201]) by smtp.googlemail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm19179596wrn.114.2022.04.10.12.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 12:32:32 -0700 (PDT)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] ui/cocoa: show/hide menu in fullscreen on mouse
 ungrab/grab
Date: Sun, 10 Apr 2022 20:32:20 +0100
Message-Id: <20220410193220.99168-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410193220.99168-1-carwynellis@gmail.com>
References: <20220410193220.99168-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The menu bar is only accessible when the Cocoa UI is windowed. In order
to allow the menu bar to be accessible in fullscreen mode, this change
makes the menu visible when the mouse is ungrabbed.

When the mouse is grabbed the menu is hidden again.

Incorporates changes in response to review feedback from Akihiko Odaki.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 ui/cocoa.m | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index c4e5468f9e..ea2cd4ece0 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -656,13 +656,11 @@ - (void) toggleFullScreen:(id)sender
         [fullScreenWindow close];
         [normalWindow setContentView: self];
         [normalWindow makeKeyAndOrderFront: self];
-        [NSMenu setMenuBarVisible:YES];
     } else { // switch from desktop to fullscreen
         isFullscreen = TRUE;
         [normalWindow orderOut: nil]; /* Hide the window */
         [self grabMouse];
         [self setContentDimensions];
-        [NSMenu setMenuBarVisible:NO];
         fullScreenWindow = [[NSWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame]
             styleMask:NSWindowStyleMaskBorderless
             backing:NSBackingStoreBuffered
@@ -1141,7 +1139,9 @@ - (void) grabMouse
 {
     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
 
-    if (!isFullscreen) {
+    if (isFullscreen) {
+        [NSMenu setMenuBarVisible: FALSE];
+    } else {
         if (qemu_name)
             [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
         else
@@ -1156,7 +1156,9 @@ - (void) ungrabMouse
 {
     COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
 
-    if (!isFullscreen) {
+    if (isFullscreen) {
+        [NSMenu setMenuBarVisible: TRUE];
+    } else {
         if (qemu_name)
             [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
         else
-- 
2.35.1


