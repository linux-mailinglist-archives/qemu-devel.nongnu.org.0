Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AEA50A15E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:56:53 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXIi-0005Pr-FR
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXC5-0002M4-IR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXC3-0005kh-TX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650548999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6v6jDJ+XZxNcbHmeAT2FvQGZW2TxMf3PLFKAjVyAxGs=;
 b=ii1thkGISHeNHE3Rno1c0ldfqsZi8azSAlz25mCGNO1mhsKgIAnC8u+VsU5QaxA09KHJVw
 za+yPYS1wXkDpub1QFr986qZsxXT+YZKeKr6CjSDA7EsK28wVrc3Az+5HvEJJtSY4wzXDd
 I+pUID1zOF0V/lQw5ESOJjCtcKmsXQo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-xnJPbSxLOeOrQGXAIOquxg-1; Thu, 21 Apr 2022 09:49:58 -0400
X-MC-Unique: xnJPbSxLOeOrQGXAIOquxg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93D6D1014A63;
 Thu, 21 Apr 2022 13:49:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C189357233C;
 Thu, 21 Apr 2022 13:49:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] Simplify softmmu/main.c
Date: Thu, 21 Apr 2022 17:49:13 +0400
Message-Id: <20220421134940.2887768-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move qemu_main() declaration to a new header.

Simplify main.c since both cocoa & sdl cannot be enabled together.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-5-marcandre.lureau@redhat.com>
---
 include/qemu-common.h |  5 -----
 include/qemu-main.h   | 10 ++++++++++
 softmmu/main.c        | 25 +++++++++----------------
 ui/cocoa.m            |  1 +
 4 files changed, 20 insertions(+), 21 deletions(-)
 create mode 100644 include/qemu-main.h

diff --git a/include/qemu-common.h b/include/qemu-common.h
index a923ed28d5bf..ba32cc8b1f39 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -10,9 +10,4 @@
     "See <https://qemu.org/contribute/report-a-bug> for how to report bugs.\n" \
     "More information on the QEMU project at <https://qemu.org>."
 
-/* main function, renamed */
-#if defined(CONFIG_COCOA)
-int qemu_main(int argc, char **argv, char **envp);
-#endif
-
 #endif
diff --git a/include/qemu-main.h b/include/qemu-main.h
new file mode 100644
index 000000000000..6a3e90d0ad59
--- /dev/null
+++ b/include/qemu-main.h
@@ -0,0 +1,10 @@
+/*
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_MAIN_H
+#define QEMU_MAIN_H
+
+int qemu_main(int argc, char **argv, char **envp);
+
+#endif /* QEMU_MAIN_H */
diff --git a/softmmu/main.c b/softmmu/main.c
index 639c67ff4893..c00432ff098e 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -23,28 +23,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu-main.h"
 #include "sysemu/sysemu.h"
 
 #ifdef CONFIG_SDL
-#if defined(__APPLE__) || defined(main)
 #include <SDL.h>
-static int qemu_main(int argc, char **argv, char **envp);
-int main(int argc, char **argv)
-{
-    return qemu_main(argc, argv, NULL);
-}
-#undef main
-#define main qemu_main
 #endif
-#endif /* CONFIG_SDL */
-
-#ifdef CONFIG_COCOA
-#undef main
-#define main qemu_main
-#endif /* CONFIG_COCOA */
 
-int main(int argc, char **argv, char **envp)
+int qemu_main(int argc, char **argv, char **envp)
 {
     qemu_init(argc, argv, envp);
     qemu_main_loop();
@@ -52,3 +38,10 @@ int main(int argc, char **argv, char **envp)
 
     return 0;
 }
+
+#ifndef CONFIG_COCOA
+int main(int argc, char **argv)
+{
+    return qemu_main(argc, argv, NULL);
+}
+#endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index c4e5468f9e64..839ae4f58a69 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -28,6 +28,7 @@
 #include <crt_externs.h>
 
 #include "qemu-common.h"
+#include "qemu-main.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
-- 
2.36.0


