Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B084830B8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:48:13 +0100 (CET)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Loy-0000vG-2r
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4LmE-0006en-As; Mon, 03 Jan 2022 06:45:22 -0500
Received: from [2a00:1450:4864:20::431] (port=36414
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4LmC-00025k-SW; Mon, 03 Jan 2022 06:45:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id r17so69348199wrc.3;
 Mon, 03 Jan 2022 03:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=Ed/ZjFGQ57CfLs2xZtzopdldQ8WY6IYbdN6URwTDwKg=;
 b=Rm0KEQ6qutu25t+oMxUIQVYMYCJ/FCT9ew91YMSDNHORBpvQG8MkKjQ682udcKzpmv
 cZqQEOD/0X2wDwQWbWyV003glgx1rOrjaooHCHLLM/yCwJOCBJgmqQYUixtSz4vm6OVd
 AiQ2A9dBl09WAh+HgY3lVD9Zmxd40lJN4AEtmN/Zug8rF3U83qk3I/gwL1rSQqXwkXYS
 so29H5/dS2wpYwA2PRzgMOQxMz9HVYHdEzBTKPa3zPTdshF2NLpSMYHd8he/E2mF1Yd9
 t/OkUiqwqWQDYfBfZ8y04D3W3QvfJn745mpnGTewum4xaMYF7I8FDQDvmMnlDlEtDVSL
 Ig8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=Ed/ZjFGQ57CfLs2xZtzopdldQ8WY6IYbdN6URwTDwKg=;
 b=MMDR9oRkT6vj1F6AJKr1BemrfoH5w04cGjcumemtsf/nRRs8ixo7HkxKFe44bBeJ9w
 KJvF2xRWZ4byowCDrxA+7Kcq6BnrRA0uur2tr8BgdZGnYoEOlYHXU2DCFS7uN0Y1qolE
 5i1ms9JIlKSuxvjG+3lXfZfiZvN1KTfPMLb9bsAw1XTzV49+NbOur+FrvHZDlTfUmmZy
 7G+go7gFaXdLWW1LiYUmOcowO+cr8DM2rrnI2R0AvIZ5oEktk7GFLtM20ZiSMtr9H4T1
 r+qelR0JAqUxxZQIawByA6kDBRbbSMtfGlCw5puCe99Xqf8v5PIOr+Fc1StC4zIILiFD
 pbsA==
X-Gm-Message-State: AOAM533L/y07dnKQXeS8V4WE+t1yKkNHKOsNUjs/aBwypWB8lNM3kTrV
 QwEEHaHWllOkP3YGc5i5ouZeSD9WHcc=
X-Google-Smtp-Source: ABdhPJx1+j0kBKYCWzx7z1sp8XlvUGAXLvuCr9ZwPZdPfuygYF3/i1ZUlPsQ9jlzar+XrUWG1jXzKw==
X-Received: by 2002:adf:e683:: with SMTP id r3mr37617687wrm.480.1641210319401; 
 Mon, 03 Jan 2022 03:45:19 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201]) by smtp.googlemail.com with ESMTPSA id
 g198sm38831631wme.23.2022.01.03.03.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:45:19 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ui/cocoa: show/hide menu in fullscreen on mouse
 ungrab/grab
Date: Mon,  3 Jan 2022 11:45:15 +0000
Message-Id: <20220103114515.24020-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103114515.24020-1-carwynellis@gmail.com>
References: <20220103114515.24020-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 ui/cocoa.m | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b..42dcf47da4 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1037,7 +1037,9 @@ QemuCocoaView *cocoaView;
 {
     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
 
-    if (!isFullscreen) {
+    if (isFullscreen) {
+        [NSMenu setMenuBarVisible: FALSE];
+    } else {
         if (qemu_name)
             [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
         else
@@ -1052,7 +1054,9 @@ QemuCocoaView *cocoaView;
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
2.34.1


