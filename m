Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140AC4E56A6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:39:30 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX41B-0004qW-5U
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:39:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Qn-0006AM-Tf
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Qk-0005iq-8t
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vW+cmibmwtlJMSAg7mhqsrsTo57gGCekMPZJbQthKcE=;
 b=Xs7ijUzSTEEpj38uWVbyE2BE3IgaHgwvez0szGkgEnoqDoc2GXn8rb7of0xpwSolBTR8kB
 KwW0c7nssf9Mj49y2HBW9i96u5zOEyi3gvkir/E0bh0cg2R7zj81w+bQkCcHBJIw6j6Rrd
 8AU8qMRgUF+OZd5FdSowOIJQe8sa3P0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-hrTyeIXRNfijpnCwrgl3Bg-1; Wed, 23 Mar 2022 12:01:44 -0400
X-MC-Unique: hrTyeIXRNfijpnCwrgl3Bg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6635C3801ECC;
 Wed, 23 Mar 2022 16:01:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D66A401E36;
 Wed, 23 Mar 2022 16:01:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 31/32] RFC: Simplify softmmu/main.c
Date: Wed, 23 Mar 2022 19:57:42 +0400
Message-Id: <20220323155743.1585078-32-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

(there might be some small conflict with the RFC patch "cocoa: run qemu_init
in the main thread", but the two look like they could be used together
to improve the code)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h |  5 -----
 include/qemu-main.h   |  6 ++++++
 softmmu/main.c        | 25 +++++++++----------------
 ui/cocoa.m            |  1 +
 4 files changed, 16 insertions(+), 21 deletions(-)
 create mode 100644 include/qemu-main.h

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 65483f70d4fe..0498acd16b78 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -19,9 +19,4 @@
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
index 000000000000..74d670bbf9a7
--- /dev/null
+++ b/include/qemu-main.h
@@ -0,0 +1,6 @@
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
index cb6e7c41dc6f..e566372b8f73 100644
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
2.35.1.273.ge6ebfd0e8cbb


