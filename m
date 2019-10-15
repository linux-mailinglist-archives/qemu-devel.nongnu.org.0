Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C18D6CBD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 03:09:03 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKBKg-0007of-3e
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 21:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hikarupsp@gmail.com>) id 1iKBJb-000768-Ep
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 21:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hikarupsp@gmail.com>) id 1iKBJa-00073v-ES
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 21:07:55 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hikarupsp@gmail.com>) id 1iKBJa-00073R-97
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 21:07:54 -0400
Received: by mail-pl1-x643.google.com with SMTP id c3so8757690plo.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 18:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w/id44KoQSpmV9UDEkk07NlV1r3HtkmhgrenrSAqWU=;
 b=Tuf69UV6R6I9wMaGUPVRCJVvOPivK2V13wCfD0DszvjPA94oxbls425J5zzEA0yiq7
 TJZqaZ0jOLtkFjBBypuqJeCYCl0hDadoo3b06lZ3PG27JYx6Qq3cVw16DdQ2FaU4PsMd
 phXnbXjyBKtw282I7j6WKuIRK3pGuqRDex2IurqbkOuaZ6P17S2Pd9Ez9zMGjLjAey44
 ki43oaHt+nmNExwcFjpkdyXd7ZVJcl87H/tsQYaBzBj6+jnirNh1avT6ddUs4Gal7LOo
 w+jxWEl3wz+lMXw9PQzZMQOhN+AUm+QMipuOkMRFNF4bLj16+E8sNME0KagK0qMAPTB+
 NgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w/id44KoQSpmV9UDEkk07NlV1r3HtkmhgrenrSAqWU=;
 b=p9d6EWhXbikEnVitdwI4jTeLR/oUZlF+DEehgg0JQ17F9Tybjn1stcmGX63nhhm3GD
 nXX2q6xfWUM5rAsKwcy8K7sHcWUTc+rnFytHSkU4iJa4pFTb9IFh1vz/ljpc6odLCV1+
 I6VmnBK360cWtnZWZqkbXYUDCZMbhyoc+3MIcnxp9FywnFdVT2gMr8n4SifB3RS/M/bC
 wiTGuVUEmAfPbIMWgpONv/9H6HH2tI2Z/cTHj0zJtlAUHOz07vBl8BsofmlcmQqfPLMs
 D7J2QvhwAvxCbVG4MA7Rx7utcoDDpCn7qck5OhO2pvNDd6wcHa+/WnNoxy1dorRKcRiE
 II0w==
X-Gm-Message-State: APjAAAVCj8HJDTNhI0/lK09QCLPkUrClO5A13SSuiT6uIYx9qWi/OP+o
 5xDo7x4Hy0VjXPjlS7uzJGkUDhbiyxw=
X-Google-Smtp-Source: APXvYqw65CeTJk7/GSzfZunCkxgxsPMp3rQk4juePS9efJT8s94mSDqE80d31R6iR1isenqwIlPBgg==
X-Received: by 2002:a17:902:9008:: with SMTP id
 a8mr33297664plp.218.1571101672733; 
 Mon, 14 Oct 2019 18:07:52 -0700 (PDT)
Received: from t03.z01.hikalium.com.com (113x36x63x49.ap113.ftth.ucom.ne.jp.
 [113.36.63.49])
 by smtp.gmail.com with ESMTPSA id z2sm23511296pfq.58.2019.10.14.18.07.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 18:07:51 -0700 (PDT)
From: hikarupsp@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3] ui: Fix hanging up Cocoa display on macOS 10.15 (Catalina)
Date: Tue, 15 Oct 2019 10:07:34 +0900
Message-Id: <20191015010734.85229-1-hikarupsp@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hikaru Nishida <hikarupsp@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hikaru Nishida <hikarupsp@gmail.com>

macOS API documentation says that before applicationDidFinishLaunching
is called, any events will not be processed. However, some events are
fired before it is called in macOS Catalina. This causes deadlock of
iothread_lock in handleEvent while it will be released after the
app_started_sem is posted.
This patch avoids processing events before the app_started_sem is
posted to prevent this deadlock.

Buglink: https://bugs.launchpad.net/qemu/+bug/1847906
Signed-off-by: Hikaru Nishida <hikarupsp@gmail.com>
---
 ui/cocoa.m | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f12e21df6e..fbb5b1b45f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -134,6 +134,7 @@
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
+static bool allow_events;
 
 // Utility functions to run specified code block with iothread lock held
 typedef void (^CodeBlock)(void);
@@ -729,6 +730,16 @@ - (void) handleMonitorInput:(NSEvent *)event
 
 - (bool) handleEvent:(NSEvent *)event
 {
+    if(!allow_events) {
+        /*
+         * Just let OSX have all events that arrive before
+         * applicationDidFinishLaunching.
+         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
+         * will not drop until after the app_started_sem is posted. (In theory
+         * there should not be any such events, but OSX Catalina now emits some.)
+         */
+        return false;
+    }
     return bool_with_iothread_lock(^{
         return [self handleEventLocked:event];
     });
@@ -1156,6 +1167,7 @@ - (void) dealloc
 - (void)applicationDidFinishLaunching: (NSNotification *) note
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
+    allow_events = true;
     /* Tell cocoa_display_init to proceed */
     qemu_sem_post(&app_started_sem);
 }
-- 
2.21.0 (Apple Git-122)


