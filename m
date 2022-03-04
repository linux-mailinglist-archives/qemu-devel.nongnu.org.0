Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CA4CDD2A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:11:13 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDKa-0000aV-8s
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDBB-0005mK-2h
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:01:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDB9-00012a-1a
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPLLuTRTyOTntH+3PhTuadV8ba4sTU1iWiZPc25GVYk=;
 b=X85xRv2RY3rGhdoelEKXY2xEGlU3PU+P6dGRFbDWIX7j1NmzRwlkVet/Siy5u5KPkIxv4q
 SdyA5XVf2koSfxZBl23AerS/obVGsdVcREOCIsxjwKQulGG7DUSAGrgSg5RuuXE8t8iCiO
 40vE61Fa6UFf1ZhKD7DjKUZiYpHdnsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551--hQQT2S0NsK77xXnwtwLbQ-1; Fri, 04 Mar 2022 14:01:22 -0500
X-MC-Unique: -hQQT2S0NsK77xXnwtwLbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51B061091DA0;
 Fri,  4 Mar 2022 19:01:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 966B860BF1;
 Fri,  4 Mar 2022 19:00:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] chardev: add API to block use of the stdio
 implementation
Date: Fri,  4 Mar 2022 18:56:18 +0000
Message-Id: <20220304185620.3272401-7-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When daemonizing QEMU it is not possible to use the stdio chardev
backend because the file descriptors are connected to /dev/null.
Currently the chardev checks for this scenario directly, but to
decouple it from the system emulator daemonizing code, we reverse
the relationship. Now the system emulator calls a helper to
explicitly disable use of the stdio backend.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-stdio.c         | 12 ++++++++++--
 include/chardev/char-stdio.h | 29 +++++++++++++++++++++++++++++
 softmmu/vl.c                 |  2 ++
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 include/chardev/char-stdio.h

diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da308c9..bab0f5ade1 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -28,6 +28,7 @@
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "chardev/char.h"
+#include "chardev/char-stdio.h"
 
 #ifdef _WIN32
 #include "chardev/char-win.h"
@@ -37,6 +38,13 @@
 #include "chardev/char-fd.h"
 #endif
 
+static bool stdio_disabled;
+
+void qemu_chr_stdio_disable(void)
+{
+    stdio_disabled = true;
+}
+
 #ifndef _WIN32
 /* init terminal so that we can grab keys */
 static struct termios oldtty;
@@ -90,8 +98,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
     ChardevStdio *opts = backend->u.stdio.data;
     struct sigaction act;
 
-    if (is_daemonized()) {
-        error_setg(errp, "cannot use stdio with -daemonize");
+    if (stdio_disabled) {
+        error_setg(errp, "cannot use stdio with this configuration");
         return;
     }
 
diff --git a/include/chardev/char-stdio.h b/include/chardev/char-stdio.h
new file mode 100644
index 0000000000..eae93a2900
--- /dev/null
+++ b/include/chardev/char-stdio.h
@@ -0,0 +1,29 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef CHAR_STDIO_H
+#define CHAR_STDIO_H
+
+void qemu_chr_stdio_disable(void);
+
+#endif /* CHAR_STDIO_H */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 30342b9df2..12b714795d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -69,6 +69,7 @@
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "chardev/char.h"
+#include "chardev/char-stdio.h"
 #include "qemu/bitmap.h"
 #include "qemu/log.h"
 #include "sysemu/blockdev.h"
@@ -3667,6 +3668,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 if (is_daemonized()) {
                     qemu_log_stdio_disable();
+                    qemu_chr_stdio_disable();
                 }
             }
         }
-- 
2.34.1


