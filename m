Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D519D3372E3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:40:22 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKc1-00004x-Ph
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWB-0003f1-JR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW5-0006Uh-KA
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hItlt2rz+ypHQJ0JcSDbJEMqcGZ5UqN4LOprhKfFsEU=;
 b=Hf9L3C7Xwyu/op96xMuKyLGLRg+5QmlVPZYpqNWVOFSY84NzgkLsKHeA/O8kMHiK63fbC8
 EYTS0ffF9T6Yaiqm7Xwi63jK0aiMcyQKmaUMTgNiRutOAyiPC7Nzfw+LiUiYdt++B9LHif
 HA8WEvPBYoFZP9371oqu7F3cGDIjQ64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-VVbw03LlNX2z1QBEgi8ftg-1; Thu, 11 Mar 2021 07:34:09 -0500
X-MC-Unique: VVbw03LlNX2z1QBEgi8ftg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829E919253C6;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 498425DAA5;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4A551800911; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] ui/cocoa: Do not rely on the first argument
Date: Thu, 11 Mar 2021 13:33:58 +0100
Message-Id: <20210311123401.340122-6-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The first argument of the executable was used to get its path, but it is
not reliable because the executer can specify any arbitrary string. Use the
interfaces provided by QEMU and the platform to get those paths.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210309122226.23117-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index e589534fa460..4753bb2f8800 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1398,20 +1398,21 @@ QemuCocoaView *cocoaView;
     [superView addSubview: picture_view];
 
     /* Make the name label */
-    x = 0;
-    y = y - 25;
-    int name_width = about_width, name_height = 20;
-    NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
-    NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
-    [name_label setEditable: NO];
-    [name_label setBezeled: NO];
-    [name_label setDrawsBackground: NO];
-    [name_label setAlignment: NSTextAlignmentCenter];
-    NSString *qemu_name = [[NSString alloc] initWithCString: gArgv[0]
-                                            encoding: NSASCIIStringEncoding];
-    qemu_name = [qemu_name lastPathComponent];
-    [name_label setStringValue: qemu_name];
-    [superView addSubview: name_label];
+    NSBundle *bundle = [NSBundle mainBundle];
+    if (bundle) {
+        x = 0;
+        y = y - 25;
+        int name_width = about_width, name_height = 20;
+        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
+        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
+        [name_label setEditable: NO];
+        [name_label setBezeled: NO];
+        [name_label setDrawsBackground: NO];
+        [name_label setAlignment: NSTextAlignmentCenter];
+        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
+        [name_label setStringValue: qemu_name];
+        [superView addSubview: name_label];
+    }
 
     /* Set the version label's attributes */
     x = 0;
-- 
2.29.2


