Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6C631A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox1ME-0003xb-2J; Mon, 21 Nov 2022 02:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ox1Lx-0003xP-AN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ox1Lv-0002HU-MY
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669016187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWjes4iTCkN/Q1u2GAYHBP3z40CvnXWTLSO8icGv1T0=;
 b=Oni6btDL1U+qFbSqUQH+3USg71uXKqMy0OY7c7ibIV4l++7hZqYyqLGK/7ulhF/QomKUNl
 MsWtv3WBdMOXkjo5tdLL1Bg9vmChuEnMur+b4S5YhzasQ0Zl2Lvgp85z/LVVy/sA6AFXzs
 T4ZEIfiDzsJeH53WYs8bdcS8pY1qJlQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-YDemhgd_N4OfEZB6Pjy-Og-1; Mon, 21 Nov 2022 02:36:23 -0500
X-MC-Unique: YDemhgd_N4OfEZB6Pjy-Og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB84585A59D;
 Mon, 21 Nov 2022 07:36:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 127A2492B06;
 Mon, 21 Nov 2022 07:36:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PULL 1/1] chardev/char-win-stdio: Pass Ctrl+C to guest with a
 multiplexed monitor
Date: Mon, 21 Nov 2022 11:36:11 +0400
Message-Id: <20221121073611.1337690-2-marcandre.lureau@redhat.com>
In-Reply-To: <20221121073611.1337690-1-marcandre.lureau@redhat.com>
References: <20221121073611.1337690-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

At present when pressing Ctrl+C from a guest running on QEMU Windows
with a multiplexed monitor, e.g.: -serial mon:stdio, QEMU executable
just exits. This behavior is inconsistent with the Linux version.

Such behavior is caused by unconditionally setting the input mode
ENABLE_PROCESSED_INPUT for a console's input buffer. Fix this by
testing whether the chardev is allowed to do so.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221025141015.612291-1-bin.meng@windriver.com>
---
 chardev/char-win-stdio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index a4771ab82e..eb830eabd9 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -146,6 +146,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
                                 bool *be_opened,
                                 Error **errp)
 {
+    ChardevStdio *opts = backend->u.stdio.data;
+    bool stdio_allow_signal = !opts->has_signal || opts->signal;
     WinStdioChardev *stdio = WIN_STDIO_CHARDEV(chr);
     DWORD              dwMode;
     int                is_console = 0;
@@ -193,7 +195,11 @@ static void qemu_chr_open_stdio(Chardev *chr,
     if (is_console) {
         /* set the terminal in raw mode */
         /* ENABLE_QUICK_EDIT_MODE | ENABLE_EXTENDED_FLAGS */
-        dwMode |= ENABLE_PROCESSED_INPUT;
+        if (stdio_allow_signal) {
+            dwMode |= ENABLE_PROCESSED_INPUT;
+        } else {
+            dwMode &= ~ENABLE_PROCESSED_INPUT;
+        }
     }
 
     SetConsoleMode(stdio->hStdIn, dwMode);
-- 
2.38.1


