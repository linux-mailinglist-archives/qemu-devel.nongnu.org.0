Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736585EF99C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:58:12 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvvO-0001GZ-UO
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odtne-0007CD-Hh
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odtnZ-0005T0-U5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664458916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S0/J0TM3OGmhWXQDpKcFz1ELW3OBbyV+Q/NwWwAADug=;
 b=TLGdUcvzjioTJMPejfx3SkoDyaRHVz2nKsGtyXkBJY5O3i/oiD7XrkaTG0naBNpPwLfnYa
 ilOHraCkrdbive5b2+r4glIKxU2XYXIknPBHkyMcVB7zXmKPtCMcyBawgm/xEPZLhXmPo7
 x9M6wrLL2TRK4TnY7cLe2SgiRZTQNj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-RzDq5_E-NeGqewRSRK8wPQ-1; Thu, 29 Sep 2022 09:41:54 -0400
X-MC-Unique: RzDq5_E-NeGqewRSRK8wPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DF7F185A7AD;
 Thu, 29 Sep 2022 13:41:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4444E4EA48;
 Thu, 29 Sep 2022 13:41:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] win32: set threads name
Date: Thu, 29 Sep 2022 17:41:50 +0400
Message-Id: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_TRY_3LD=1.979 autolearn=no autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As described in:
https://learn.microsoft.com/en-us/visualstudio/debugger/how-to-set-a-thread-name-in-native-code?view=vs-2022

SetThreadDescription() is available since Windows 10, version 1607 and
in some versions only by "Run Time Dynamic Linking". Its declaration is
not yet in mingw, so we lookup the function the same way glib does.

Tested with Visual Studio Community 2022 debugger.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/qemu-thread-win32.c | 54 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index a2d5a6e825..9861ec5b89 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -19,12 +19,40 @@
 
 static bool name_threads;
 
+typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
+                                                 PCWSTR lpThreadDescription);
+static pSetThreadDescription SetThreadDescriptionFunc = NULL;
+static HMODULE kernel32_module = NULL;
+
+static bool
+load_set_thread_description(void)
+{
+  static gsize _init_once = 0;
+
+  if (g_once_init_enter(&_init_once)) {
+      kernel32_module = LoadLibraryW(L"kernel32.dll");
+      if (kernel32_module) {
+          SetThreadDescriptionFunc =
+              (pSetThreadDescription)GetProcAddress(kernel32_module,
+                                                    "SetThreadDescription");
+          if (!SetThreadDescriptionFunc) {
+              FreeLibrary(kernel32_module);
+          }
+      }
+      g_once_init_leave(&_init_once, 1);
+  }
+
+  return !!SetThreadDescriptionFunc;
+}
+
 void qemu_thread_naming(bool enable)
 {
     /* But note we don't actually name them on Windows yet */
     name_threads = enable;
 
-    fprintf(stderr, "qemu: thread naming not supported on this host\n");
+    if (enable && !load_set_thread_description()) {
+        fprintf(stderr, "qemu: thread naming not supported on this host\n");
+    }
 }
 
 static void error_exit(int err, const char *msg)
@@ -400,6 +428,26 @@ void *qemu_thread_join(QemuThread *thread)
     return ret;
 }
 
+static bool
+set_thread_description(HANDLE h, const char *name)
+{
+  HRESULT hr;
+  g_autofree wchar_t *namew = NULL;
+
+  if (!load_set_thread_description() || !name) {
+      return false;
+  }
+
+  namew = g_utf8_to_utf16(name, -1, NULL, NULL, NULL);
+  if (!namew) {
+      return false;
+  }
+
+  hr = SetThreadDescriptionFunc(h, namew);
+
+  return SUCCEEDED(hr);
+}
+
 void qemu_thread_create(QemuThread *thread, const char *name,
                        void *(*start_routine)(void *),
                        void *arg, int mode)
@@ -423,7 +471,11 @@ void qemu_thread_create(QemuThread *thread, const char *name,
     if (!hThread) {
         error_exit(GetLastError(), __func__);
     }
+    if (name_threads) {
+        set_thread_description(hThread, name);
+    }
     CloseHandle(hThread);
+
     thread->data = data;
 }
 
-- 
2.37.3


