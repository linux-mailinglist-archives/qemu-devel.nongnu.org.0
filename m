Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C064FE0F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 09:23:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6owD-0004w0-HI; Sun, 18 Dec 2022 03:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1p6owB-0004vs-R0
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 03:22:23 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1p6owA-0002nq-A3
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 03:22:23 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4NZbRL3h8Xz8PbP;
 Sun, 18 Dec 2022 03:22:06 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=RNziWqMfUWEsnGpHvzjpWTjmjT8=; b=jus4/ynDGQ50fTSwiETgHTENZmFn
 /R5qqzDvJz1Kycef52tmM2ALF1SW+NKPqyEEpC4FjV533U+ya4ziFXbhTInzBVpL
 n0FtsSrt60jMH1r/pS+g668iV9P/zr83XR1Das7IFidaSMXFWHHNcxG/+EgP/vtZ
 waTxO/ERTNJGPhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=L7/Kyo/eQ79p9qyEq6+GN7BjkTiqT2ql7esthMzmVCf5vpg4fpGEl
 +oQrtISxcVMz8jvZr+2FL+N472l21P6QOBHbPnkPmQ8eZTu4CYdfpEO/4F+bg8NK
 GZ6fjMNvpbCiiEJGIAszwRTZbOexue2OzgZ1plU0k44JWVQU4u+JpE=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:41ac:774f:61ce:e826])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4NZbRL2XHQz8PbN;
 Sun, 18 Dec 2022 03:22:06 -0500 (EST)
Date: Sun, 18 Dec 2022 03:22:04 -0500
From: Brad Smith <brad@comstyle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] thread-posix: add support for setting threads name on OpenBSD
Message-ID: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Make use of pthread_set_name_np() to be able to set the threads name
on OpenBSD.

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 meson.build              | 12 ++++++++++++
 util/qemu-thread-posix.c |  9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..68adcb6291 100644
--- a/meson.build
+++ b/meson.build
@@ -2123,6 +2123,18 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_pre
     pthread_create(&thread, 0, f, 0);
     return 0;
   }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_SET_NAME_NP', cc.links(gnu_source_prefix + '''
+  #include <pthread.h>
+  #include <pthread_np.h>
+
+  static void *f(void *p) { return NULL; }
+  int main(void)
+  {
+    pthread_t thread;
+    pthread_create(&thread, 0, f, 0);
+    pthread_set_name_np(thread, "QEMU");
+    return 0;
+  }''', dependencies: threads))
 config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
   #include <time.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index bae938c670..412caa45ef 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -18,6 +18,10 @@
 #include "qemu/tsan.h"
 #include "qemu/bitmap.h"
 
+#ifdef CONFIG_PTHREAD_SET_NAME_NP
+#include <pthread_np.h>
+#endif
+
 static bool name_threads;
 
 void qemu_thread_naming(bool enable)
@@ -25,7 +29,8 @@ void qemu_thread_naming(bool enable)
     name_threads = enable;
 
 #if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
-    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
+    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID && \
+    !defined CONFIG_PTHREAD_SET_NAME_NP
     /* This is a debugging option, not fatal */
     if (enable) {
         fprintf(stderr, "qemu: thread naming not supported on this host\n");
@@ -480,6 +485,8 @@ static void *qemu_thread_start(void *args)
         pthread_setname_np(pthread_self(), qemu_thread_args->name);
 # elif defined(CONFIG_PTHREAD_SETNAME_NP_WO_TID)
         pthread_setname_np(qemu_thread_args->name);
+# elif defined(CONFIG_PTHREAD_SET_NAME_NP)
+        pthread_set_name_np(pthread_self(), qemu_thread_args->name);
 # endif
     }
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
-- 
2.38.1


