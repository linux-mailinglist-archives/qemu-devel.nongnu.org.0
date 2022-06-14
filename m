Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3686254BCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:23:04 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1E07-0000TO-4q
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dyp-0008D8-OR
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:21:44 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dyo-00018d-C7
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:21:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so8794443plg.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btdQ+R2HHDB1UsMJWhkF7l+jp1k6MrTxiJ068SuyRHQ=;
 b=jWtZC+IvY4yFtzv9oLPunp/VomBcrFZeEaq3NiP+oampcUZffwqaQvhrmxF8rT81PV
 tak+uDnhFGVM4LUcs1S06cfQx5bWkP+xB5sZ70gx37RBISY0ozK+829gNwjHbTmdih36
 L5/TRNWNRAgwTDAtSe2bITh42r2pxiQFZZ1ttqqnRnBOcQLgcJAcE38l+Hvub4t1dxv8
 WiWf+7HL+LrigGbHDE2V5Z4b/4RBQS+qXrPyzliHZxoqSVbo7UlZqX/Vnz2VWh6P0T2m
 sVZ33aCSeU/420MxcqfPx3cxGGniR2p5nZPcQj0BLTe0MC8gLOnwCoc8YUv+SMG4sGK7
 gbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btdQ+R2HHDB1UsMJWhkF7l+jp1k6MrTxiJ068SuyRHQ=;
 b=UkyX5V0m/DUVx0B8dagkPrs+Lbxd/z06SQ/CNziF0l8YaNv8kp1vR7iMTJtkTj0mp6
 ukO8npiqJvKGcoGXzSY4HYozpl8Te+c9Qy2iWL8Hdk3mwrY80/xkm1EvwCOJaX74s1ju
 sGQH9rFGuNCZdqc71nGbYbUzidT8NcY/jX0Zfl8yApM2sqPNNt5Z45Ro6dQjTCIy3vlE
 8lDqKpzCx47AukTnsp5E4Ki+dqhYU4ZsRUDqoos4Fr1zzZy0JNY1btfXcLnCAePSxHqA
 np5mtibvERK0uD/nrRsvDOoH1PI3H6kRWTY++5bVTc64wNvBF9ZWuwqxwRrvGbE+NSBT
 iqUQ==
X-Gm-Message-State: AJIora/tnz2ME7rA0iWUlrdFMParAEEitkyhrySWfsNdgd/tzqI+swf2
 DjAg/DiWRI8Go+8GKmpBDY0=
X-Google-Smtp-Source: AGRyM1stmqYriJMhAyLYmdQbr0I7Yy4Fwt7bYzM9x4wdK3cJeuz4MXzjGWHin6DYz8bki7R75vnqdw==
X-Received: by 2002:a17:902:cf10:b0:168:ef35:5bee with SMTP id
 i16-20020a170902cf1000b00168ef355beemr4121715plg.99.1655241700772; 
 Tue, 14 Jun 2022 14:21:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a540e00b001e095a5477bsm45015pjh.33.2022.06.14.14.21.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:21:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] ui/cocoa: Fix clipboard text release
Date: Wed, 15 Jun 2022 06:21:31 +0900
Message-Id: <20220614212131.94696-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[-NSPasteboard dataForType:] returns an autoreleased NSString,
and callings its release method will result in double-free when
the global autorelease pool is released. Use NSAutoreleasePool to
release it properly.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5..6a4dccff7f0 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1894,16 +1894,18 @@ static void cocoa_clipboard_notify(Notifier *notifier, void *data)
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type)
 {
+    NSAutoreleasePool *pool;
     NSData *text;
 
     switch (type) {
     case QEMU_CLIPBOARD_TYPE_TEXT:
+        pool = [[NSAutoreleasePool alloc] init];
         text = [[NSPasteboard generalPasteboard] dataForType:NSPasteboardTypeString];
         if (text) {
             qemu_clipboard_set_data(&cbpeer, info, type,
                                     [text length], [text bytes], true);
-            [text release];
         }
+        [pool release];
         break;
     default:
         break;
-- 
2.32.1 (Apple Git-133)


