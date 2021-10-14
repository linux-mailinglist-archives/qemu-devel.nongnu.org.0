Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE342DF51
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:41:52 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3nj-0003f1-Ln
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cF-0003q0-Sv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cB-0000gf-Dc
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id r18so26590896edv.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRGcDab/7KtkOV2wgwRktDP6rJietk9FxZXpo7LUmyw=;
 b=UDdQQAacKdRJKCoenb8CsxE2xuWk86oTuRDwVoV4C2i5moQ1lYionSBoWUpHEQDoaY
 M06SafZrjK2KIZQRpGGNaz3NoSvIXnl7LEslTkMrG5Y9ONtoTy3YrbvrUTNf0MAXh7ss
 mq8O01oxhpJwGVW+qZQVlRvBXz1GfBL+P4CpdtGF9ImX3ZFR+IjYTofapST1k/YMWE9B
 nra2ddznDjzPU2KVXEENWPm6uuXCO+ZSqvfsMRvfcJ1mV0+flCadlCyFgl/wEYZEzICY
 qEuJuz0Q5OrzijNM2sRR6EWFfCyB1OiqFa9M5YfcdXLfObq9lQND7dvyFGfmTA1VCdkN
 qywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cRGcDab/7KtkOV2wgwRktDP6rJietk9FxZXpo7LUmyw=;
 b=cwvOApC9plebMMc++ORYaXcrx9Qld7YE4tJSfe4ojmxDPBmjWlsLU4kMpMoGJtifAu
 IBIMIpVMpfXss6smZNEO2Khupb0tZawZEWuDGFuNc1LLtUcigNM28WhQJvrroRrX2Htp
 G0bj+i+ibufpMb0BKhO0ars1fDTgCfWiddSZUS385jtEYjNEG4uoZkC+LdwrFxc+YmOF
 MPOINhTOZ0z+6QEjlTETEe5eSgWf6OAy3h1AVSGDk3R7FY6wa9e9AAAZ7/VRf5FolGdr
 Ny3PfvNthgZGMWrB+YU3iEAfADTtaxjIuvS1R1ma3qaLQrl2b29UFa/Lq6j5S0npWUri
 wfkg==
X-Gm-Message-State: AOAM5317DVdMb/R6UNIbu2PgTJvESarCK5WTP1tfFgwRL/n4RXM8ZZ+d
 sdFhHnI36nE4gJSNRa73dvraBA5QdAY=
X-Google-Smtp-Source: ABdhPJzDAFTWSiKIrK1lga63DZpDBOxlgbtBBSjJaP6O8BwDgObMYNE5wE2fi+TQrs1DfL2/f1Igcw==
X-Received: by 2002:a17:906:1bb1:: with SMTP id
 r17mr4800155ejg.533.1634228993322; 
 Thu, 14 Oct 2021 09:29:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] configure, meson: move pthread_setname_np checks to Meson
Date: Thu, 14 Oct 2021 18:29:27 +0200
Message-Id: <20211014162938.430211-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the pthreads check dead in configure, so remove it
as well.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-9-pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                | 78 ----------------------------------------
 meson.build              | 23 ++++++++++++
 util/qemu-thread-posix.c |  5 ++-
 3 files changed, 25 insertions(+), 81 deletions(-)

diff --git a/configure b/configure
index e78f58978f..c7e95e59cc 100755
--- a/configure
+++ b/configure
@@ -3148,71 +3148,6 @@ if test "$modules" = yes; then
     fi
 fi
 
-##########################################
-# pthread probe
-PTHREADLIBS_LIST="-pthread -lpthread -lpthreadGC2"
-
-pthread=no
-cat > $TMPC << EOF
-#include <pthread.h>
-static void *f(void *p) { return NULL; }
-int main(void) {
-  pthread_t thread;
-  pthread_create(&thread, 0, f, 0);
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  pthread=yes
-else
-  for pthread_lib in $PTHREADLIBS_LIST; do
-    if compile_prog "" "$pthread_lib" ; then
-      pthread=yes
-      break
-    fi
-  done
-fi
-
-if test "$mingw32" != yes && test "$pthread" = no; then
-  error_exit "pthread check failed" \
-      "Make sure to have the pthread libs and headers installed."
-fi
-
-# check for pthread_setname_np with thread id
-pthread_setname_np_w_tid=no
-cat > $TMPC << EOF
-#include <pthread.h>
-
-static void *f(void *p) { return NULL; }
-int main(void)
-{
-    pthread_t thread;
-    pthread_create(&thread, 0, f, 0);
-    pthread_setname_np(thread, "QEMU");
-    return 0;
-}
-EOF
-if compile_prog "" "$pthread_lib" ; then
-  pthread_setname_np_w_tid=yes
-fi
-
-# check for pthread_setname_np without thread id
-pthread_setname_np_wo_tid=no
-cat > $TMPC << EOF
-#include <pthread.h>
-
-static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
-int main(void)
-{
-    pthread_t thread;
-    pthread_create(&thread, 0, f, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "$pthread_lib" ; then
-  pthread_setname_np_wo_tid=yes
-fi
-
 ##########################################
 # libssh probe
 if test "$libssh" != "no" ; then
@@ -4498,19 +4433,6 @@ if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
 
-# Hold two types of flag:
-#   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
-#                                     a thread we have a handle to
-#   CONFIG_PTHREAD_SETNAME_NP_W_TID - A way of doing it on a particular
-#                                     platform
-if test "$pthread_setname_np_w_tid" = "yes" ; then
-  echo "CONFIG_THREAD_SETNAME_BYTHREAD=y" >> $config_host_mak
-  echo "CONFIG_PTHREAD_SETNAME_NP_W_TID=y" >> $config_host_mak
-elif test "$pthread_setname_np_wo_tid" = "yes" ; then
-  echo "CONFIG_THREAD_SETNAME_BYTHREAD=y" >> $config_host_mak
-  echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=y" >> $config_host_mak
-fi
-
 if test "$bochs" = "yes" ; then
   echo "CONFIG_BOCHS=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index e8e728bf72..26fc4e5792 100644
--- a/meson.build
+++ b/meson.build
@@ -1584,6 +1584,29 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   #include <stddef.h>
   int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
+
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
+  #include <pthread.h>
+
+  static void *f(void *p) { return NULL; }
+  int main(void)
+  {
+    pthread_t thread;
+    pthread_create(&thread, 0, f, 0);
+    pthread_setname_np(thread, "QEMU");
+    return 0;
+  }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links('''
+  #include <pthread.h>
+
+  static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
+  int main(void)
+  {
+    pthread_t thread;
+    pthread_create(&thread, 0, f, 0);
+    return 0;
+  }''', dependencies: threads))
+
 config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
   #include <sys/signalfd.h>
   #include <stddef.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 6c5004220d..e1225b63bd 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -23,7 +23,8 @@ void qemu_thread_naming(bool enable)
 {
     name_threads = enable;
 
-#ifndef CONFIG_THREAD_SETNAME_BYTHREAD
+#if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
+    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
     /* This is a debugging option, not fatal */
     if (enable) {
         fprintf(stderr, "qemu: thread naming not supported on this host\n");
@@ -522,7 +523,6 @@ static void *qemu_thread_start(void *args)
     void *arg = qemu_thread_args->arg;
     void *r;
 
-#ifdef CONFIG_THREAD_SETNAME_BYTHREAD
     /* Attempt to set the threads name; note that this is for debug, so
      * we're not going to fail if we can't set it.
      */
@@ -533,7 +533,6 @@ static void *qemu_thread_start(void *args)
         pthread_setname_np(qemu_thread_args->name);
 # endif
     }
-#endif
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
     g_free(qemu_thread_args->name);
     g_free(qemu_thread_args);
-- 
2.31.1



