Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A56A5465
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvOX-00073h-5W; Tue, 28 Feb 2023 03:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pWvOU-0006yt-DO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:31:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pWvOS-0007DN-8w
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:31:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id bh1so9573048plb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1677573086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dtaVeFaGDQJ+M6OvzwKHmn2qzQLBA1m0UYmlyf2ZwYY=;
 b=y8LotopNjIrO2jQ1GgeSV+tjOWJAWaRduZC8/W7IG9uYF1KEq9tS2dxpo9S4WiXcxi
 H2Yt+ekkv/0982cSBqvxMFNrgFQwg7nS8s5U4PmWR6v6TIwh7dclqDZsRq1j4BZ8G87s
 l5n+4rWRe0LlQmYlI9f9kCgMFW1xhOVQmFrjKlGBRYJA3g4qJONo8p0QH3gpAECpsI7j
 ouZ9509lIoHEnJOvR7YN83Mmg9lxBwDFtSEfit9CMgv1SE7afeHMV/bJF0L64sek3ddz
 3tB5v9MdiXn0c/DoYw0/j1/SlEHlj+jw7086+YI9UC3yX+QhM7/W61CxBlj+UhCN2g0E
 erCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677573086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtaVeFaGDQJ+M6OvzwKHmn2qzQLBA1m0UYmlyf2ZwYY=;
 b=JwDhPvdGWWmXNyzbTl8AJ7tUylE7HUIiw3DsTGUfSJ8bNaUmga66ZCMcvISqoF/piz
 1VpTpLHK9jVkV2sp/vpH+NcnRgWnbhzLGJNkRjnXvlvTTG1hv2EkzhNVSb8EoZ6ptOAs
 QXUIuDNuakuBeDSRVNCbk9EOTQ9p581RhI4DzJ3JiLLbzRGMdDTogR01XTdZ3yovb1fe
 dcmvEEtr2HYzEAUf1MLGx5JOb7UvTM3QkTUCBibhbK3B0Gt3SyqU4z/EF1DfBwEz83G6
 p9mLsOm+zCxi4o3sshN1/QzhPtCZSrsaiGM9vCGFPPGMTiUyxJlRwBg/I+G8g08PG4GP
 JiUg==
X-Gm-Message-State: AO0yUKUjJJK2D0Ty68uMRSxgY9ErPxF1GUXJIgqeEAVPiDv+1fMbVb9P
 /5/7F+0oO79QXO0XAQ7PQxFesE0boZnYekr1
X-Google-Smtp-Source: AK7set9YpVPRT6+MTeuXAx2P3WNAZA2T1ZVNNV//cR1LZnkyE86YcEGr4auEDuaaOlerr8Bb1131MA==
X-Received: by 2002:a17:902:c941:b0:196:5787:d73a with SMTP id
 i1-20020a170902c94100b001965787d73amr2376929pla.53.1677573086178; 
 Tue, 28 Feb 2023 00:31:26 -0800 (PST)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.14])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm5952894plb.63.2023.02.28.00.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:31:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] ui/cocoa: Override windowDidResignKey
Date: Tue, 28 Feb 2023 17:31:19 +0900
Message-Id: <20230228083119.2863-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
index 52e750f8a2..ac1cee09cd 100644
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
2.39.1


