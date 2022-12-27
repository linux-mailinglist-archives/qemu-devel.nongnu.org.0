Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBA3656CD9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 17:28:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pACmp-00057V-C4; Tue, 27 Dec 2022 11:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f57895c22bf8e9e5c8afee80547460aa71fe4640@lizzy.crudebyte.com>)
 id 1pACmm-00057F-Pa
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:26:40 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f57895c22bf8e9e5c8afee80547460aa71fe4640@lizzy.crudebyte.com>)
 id 1pACml-0004rT-Ap
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 11:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=FNTNwU9fbD3uwT1gi0VOAgurmPJrUUx897oj+StnUxU=; b=YQxLp
 K7NY6VishuSYX95BKa1NDARWa4Ob/w42iQj4/d0qUY/EStWdGdWID1N/GG2M+PuykGWza2HBI9ski
 WwaYc8ygFRO8rGgQZ3SnK8ZNQUJechyAwtVLVAguiQnOD3eqBjdJ4EpJ1pdqW8/4PAPLHhH9Hgb+v
 5ZtrdK5qn7EXWP9WQfZrLzUTXzvFM8U56Q8spZbwBi+XQpakkBW70e0MKjHl3ujA2p0uuYSiMhIMK
 vh5Qy3+DX7jXzK2zo/muQNCMZV1SY9c0y4+SFJkUyKDCJ3KswSHrTYnaIISaE+IDb/vUSsiIm18Fq
 jdvVvvjcvJamwldXkB3POaGc48y7g==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 27 Dec 2022 17:15:31 +0100
Subject: [PATCH] ui/cocoa: user friendly characters for release mouse
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
    Peter Maydell <peter.maydell@linaro.org>,
    "Philippe Mathieu-Daudé" <philmd@linaro.org>,
    Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f57895c22bf8e9e5c8afee80547460aa71fe4640@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

While mouse is grabbed, window title contains a hint for the user what
keyboard keys to press to release the mouse. Make that hint text a bit
more user friendly for a Mac user:

 - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
   keys typically displayed for them on a Mac (encode those symbols by
   using UTF-8 characters).

 - Drop " + " in between the keys, as that's not common on macOS for
   documenting keyboard shortcuts.

 - Convert lower case "g" to upper case "G", as that's common on macOS.

 - Add one additional space at start and end of key stroke set, to
   visually separate the key strokes from the rest of the text.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 ui/cocoa.m | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index e915c344a8..289a2b193e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -72,6 +72,9 @@
 
 #define cgrect(nsrect) (*(CGRect *)&(nsrect))
 
+#define UC_CTRL_KEY "\xe2\x8c\x83"
+#define UC_ALT_KEY "\xe2\x8c\xa5"
+
 typedef struct {
     int width;
     int height;
@@ -1135,9 +1138,9 @@ - (void) grabMouse
 
     if (!isFullscreen) {
         if (qemu_name)
-            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
+            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name]];
         else
-            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
+            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)"];
     }
     [self hideCursor];
     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
-- 
2.32.0 (Apple Git-132)


