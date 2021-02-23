Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C23322B41
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:12:37 +0100 (CET)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEXUR-0007Jn-Qj
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEXTG-0006fO-JK
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:11:22 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEXTE-0001CO-9J
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:11:22 -0500
Received: by mail-pf1-x435.google.com with SMTP id b145so8753960pfb.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f36agglzQtVXDCzzWQFFTGTElkz2bE7iY7xKpHii8/U=;
 b=jAiEUm7c7/FrzFtzUfJEnnNcbDvVFkK2XrvQgP6Uv/rttshTyZ4a7EVzU072YjU+bB
 brF7SjzogKgrUxo2+nWimwYdtxNEmLKzY4dirg2I5bRQZaCa/Qx18+Kn7YuwMWq5yrEi
 AKmvbnrFibmux8y+YtdtEOMJgTsCR3y+q2n4fYjeELOYM0nnX/7fAr2L9wyNZ+wDf3KF
 M+i8h7mThS4jhs6taNfnpZc+MCGXZwRO/4vz1lTPAHVyr4zDzX9CquQrYRkwkCdRQpt9
 zI/H9w0Mq5bxlSS0vGGTkrQKtsKqKjZTYz0NhaLQ5AzmT2U3GwQ3NT1bAF+j5Q3xk9NB
 HjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f36agglzQtVXDCzzWQFFTGTElkz2bE7iY7xKpHii8/U=;
 b=fxvfvSMCtT8pFTwZRmFHp+5Qe4+oLp2p3+OO1uteamqfxsmWBHCOlTfH49j8dLcZj8
 WVgsVtL/DUpuNE4QNQmN+2Ul7z8lhtInXKCHKrQMMutH75YcZ/vF7pUjV8/OlI1CKSd7
 gDMFWQHDIf8W3dnTJGd/IzD8x6vPQhnTcUNii/OTtZlOp3bWPMxsl++qqgXCVLfQErb6
 Oz0RHuucMkSSs+aeLHAfLDI/mn2McAWxZmyGQiuphRULMqGaCmShbBnt8HSdF+PT8Jni
 x1g1nsnhwA5z0RgLio22wU0TYKlB/aKPhrckti4LLRhr3/Xf7MP2pjEAA/gB+pIW9sY3
 UT2Q==
X-Gm-Message-State: AOAM533UFMTjkpXYSAEGqFCglO5iYnvI+95wpOpTdiE3e2Pys56C/JdB
 R+pv/5/HQsvBgpwN5+ZDSJ7RG9XnGveJ4g==
X-Google-Smtp-Source: ABdhPJx2sQ5yxKVJb9VwNG6q2bZimaYOLAkbL+kYWmEhgZSlV7v681WkHWJaE2UvN2VwA1t6RvkF/w==
X-Received: by 2002:aa7:8d04:0:b029:1ed:2328:f677 with SMTP id
 j4-20020aa78d040000b02901ed2328f677mr2212722pfe.26.1614085878593; 
 Tue, 23 Feb 2021 05:11:18 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id fz24sm3554843pjb.35.2021.02.23.05.11.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Feb 2021 05:11:18 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Replace fprintf with error_report
Date: Tue, 23 Feb 2021 22:11:06 +0900
Message-Id: <20210223131106.21166-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
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
 ui/cocoa.m | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..900bc984733 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -270,7 +270,7 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
 static int cocoa_keycode_to_qemu(int keycode)
 {
     if (ARRAY_SIZE(mac_to_qkeycode_map) <= keycode) {
-        fprintf(stderr, "(cocoa) warning unknown keycode 0x%x\n", keycode);
+        error_report("(cocoa) warning unknown keycode 0x%x", keycode);
         return 0;
     }
     return mac_to_qkeycode_map[keycode];
@@ -1071,7 +1071,7 @@ - (id) init
         // create a view and add it to the window
         cocoaView = [[QemuCocoaView alloc] initWithFrame:NSMakeRect(0.0, 0.0, 640.0, 480.0)];
         if(!cocoaView) {
-            fprintf(stderr, "(cocoa) can't create a view\n");
+            error_report("(cocoa) can't create a view");
             exit(1);
         }
 
@@ -1080,7 +1080,7 @@ - (id) init
             styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskClosable
             backing:NSBackingStoreBuffered defer:NO];
         if(!normalWindow) {
-            fprintf(stderr, "(cocoa) can't create window\n");
+            error_report("(cocoa) can't create window");
             exit(1);
         }
         [normalWindow setAcceptsMouseMovedEvents:YES];
-- 
2.24.3 (Apple Git-128)


