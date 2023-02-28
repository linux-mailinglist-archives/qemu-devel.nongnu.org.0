Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09F6A545B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvIW-0003EO-Uy; Tue, 28 Feb 2023 03:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <person@aki-MacBook-Air.local>)
 id 1pWvIT-0003DJ-S8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:25:17 -0500
Received: from [157.82.194.14] (helo=aki-MacBook-Air.local)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <person@aki-MacBook-Air.local>) id 1pWvIS-0006IB-5L
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:25:17 -0500
Received: by aki-MacBook-Air.local (Postfix, from userid 501)
 id CAAB870FA40; Tue, 28 Feb 2023 16:10:02 +0900 (JST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] ui/cocoa: Override windowDidResignKey
Date: Tue, 28 Feb 2023 16:09:46 +0900
Message-Id: <20230228070946.12370-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 157.82.194.14 (failed)
Received-SPF: none client-ip=157.82.194.14;
 envelope-from=person@aki-MacBook-Air.local; helo=aki-MacBook-Air.local
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_SBL_CSS=3.335, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This fixes pressed keys being stuck when the deck is clicked and the
window loses focus.

In the past, Gustavo Noronha Silva also had a patch to fix this issue
though it only ungrabs mouse and does not release keys, and depends on
another out-of-tree patch:
https://github.com/akihikodaki/qemu/pull/3/commits/e906a80147b1dc6d4f31b6a08064ef9871a2b76c

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 ui/cocoa.m | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 52e750f8a29..ac1cee09cd0 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1330,10 +1330,15 @@ - (BOOL)windowShouldClose:(id)sender
     return NO;
 }
 
-/* Called when QEMU goes into the background */
-- (void) applicationWillResignActive: (NSNotification *)aNotification
+/*
+ * Called when QEMU goes into the background. Note that
+ * [-NSWindowDelegate windowDidResignKey:] is used here instead of
+ * [-NSApplicationDelegate applicationWillResignActive:] because it cannot
+ * detect that the window loses focus when the deck is clicked on macOS 13.2.1.
+ */
+- (void) windowDidResignKey: (NSNotification *)aNotification
 {
-    COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
+    COCOA_DEBUG("%s\n", __func__);
     [cocoaView ungrabMouse];
     [cocoaView raiseAllKeys];
 }
-- 
2.37.1 (Apple Git-137.1)


