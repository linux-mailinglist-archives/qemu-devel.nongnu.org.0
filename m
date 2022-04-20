Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783AF508A1A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:08:54 +0200 (CEST)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhB0n-0006wx-26
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMA-0005cY-Ox
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAM8-0004Oh-JF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkHd9aRc6umLQw7YHMixbPXa7YU/gymxfRWJvTK+VUA=;
 b=AHEn5mp/ytkj5lRnHEFetoUmqTM/HMjIUa8BI1UO0oxf21t4NMfMOPVUWdxDTAy4hblzH+
 wMAKVrLh0vQ8pvSCoPTzBaN0t0TPaBC4hqCi2WG4foP9LbZF9hAwY5PRuDE42z61VGKzSH
 0FQy+jPtYFjhtuX+Gsuw/RSPInWxikg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-ma-D7gQ_PSigmfs9hP4ENg-1; Wed, 20 Apr 2022 09:26:46 -0400
X-MC-Unique: ma-D7gQ_PSigmfs9hP4ENg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB50629AA3B0;
 Wed, 20 Apr 2022 13:26:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1265046A3A9;
 Wed, 20 Apr 2022 13:26:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/41] Simplify softmmu/main.c
Date: Wed, 20 Apr 2022 17:25:47 +0400
Message-Id: <20220420132624.2439741-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
2.35.1.693.g805e0a68082a


