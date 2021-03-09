Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C758E3325FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:03:03 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJc0s-0004mK-Sk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJbNw-0007az-3Q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:22:48 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJbNu-0004gZ-Ij
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:22:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fu20so810098pjb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tpimQkkd/08GAgP446IN11jO++3Y9xP+PLHlyIh3/fc=;
 b=i8AbzbTrgo/4pPRJ9uCLnCaKVQ2W+lnqAcTEBsDoA1Z+SDCXucmP4Bn4WGzE6GROgt
 vThlJkiK53fQn9kDY20cNsb6TOEdVSa2hL2QXOtNE7j+GgJYvAvwwV3IFfneUcbjb3Ad
 uUk/ql/q3N9KZ8NbARVxf9vU21lyX4STZsitMrD29zBvf6ZWVj7CN4VUdWk/evfB8OFc
 1gUTq9PDFCaHGsKTMzxVSEHLKZIrH4yM36VlryzjTFkVP2ttRru+rukpdIsL//SIEaE8
 tkkgxq+K1Ru2jRzHVEl/w3OnhKZUC8wOHcV8kyTHPJjY+sDaZk/Ffs7zgFN9OHZXqsIN
 P2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpimQkkd/08GAgP446IN11jO++3Y9xP+PLHlyIh3/fc=;
 b=fqla2NQgn3Zb6oQDsjH0a1zgSDPlXRimo5HZJ6M4X0yVxtmYzlV3vJV/YN96Vqu0T1
 ZKjb9IuCJDcYJP2jmN21KuAJI/bvZGf0DTFAP/aPLh9TbO1RKfbUgflnenRyGCxM7zYx
 zZC8FhnysU3oLnrBhLgYPFaJ1FDsAWghG3lMltc4Aji6cYuAxtxDOVTJBgqfbCzvJF5H
 T7ozHOhCzBpylrsy8amq2mjeqYu3xO+nNTB1YHcvc5vIIyjYjVdSC/3iZVyik2WK0jC8
 CxmUckq2HNBxNtV1LJVhMs1f4a0phFnZclP45sfCImOV7wrY0g2O2uP/F4Pz2H1UWSjL
 GqrQ==
X-Gm-Message-State: AOAM533YICLqsCTeleBvObnkFzbWx7aoELkL4VzS5Xbg6XQlrRcYy1W/
 qJP4Dbc+JX4dOTB3rSxFPD6nqcw6+pKZ9A==
X-Google-Smtp-Source: ABdhPJwj+96DQCTVuVTARWJnTq8dS1DV0fIirYTD0rlgoEzVgXyZblhFpWUVb2ljhv+QnJCeyVDT7w==
X-Received: by 2002:a17:902:509:b029:e5:9944:f763 with SMTP id
 9-20020a1709020509b02900e59944f763mr26027291plf.35.1615292564987; 
 Tue, 09 Mar 2021 04:22:44 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d12c:1da1:5934:88c6])
 by smtp.gmail.com with ESMTPSA id l4sm9910596pgi.19.2021.03.09.04.22.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 04:22:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/2] ui/cocoa: Do not rely on the first argument
Date: Tue,  9 Mar 2021 21:22:26 +0900
Message-Id: <20210309122226.23117-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210309122226.23117-1-akihiko.odaki@gmail.com>
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102d.google.com
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

The first argument of the executable was used to get its path, but it is
not reliable because the executer can specify any arbitrary string. Use the
interfaces provided by QEMU and the platform to get those paths.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index d8eacea6d22..6e94301c0d6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1414,20 +1414,21 @@ - (void)make_about_window
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
2.24.3 (Apple Git-128)


