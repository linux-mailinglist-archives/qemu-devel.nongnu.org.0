Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953D4253F0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:22:56 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTMN-0001ti-8V
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8e-0005Vl-Gl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Z-0007nL-0u
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: by mail-ed1-x535.google.com with SMTP id r18so22918836edv.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tvj9LX7SxlSUsHCxvULFpWvXGDbOhFLZH7RuuoaYL10=;
 b=LnvWDSvwSYM4hvvCrS/HWU68oqsoLImEQsITx6xlsQZXarcMxf7ryJdS50QtzkRSiQ
 QPqVtNLPMXT6R8J389ZdVzu/f3WZuW6SV5T248Cd7YEnOKQzY1nPF9qLNo/34RsJMBzd
 zEwmpXDddrNthKcH7/iB9n19k77HxDSdfaAIEv4MkEpTmSTzOGpp/4VZd3n1SV2W8yFn
 Y3Gv2zaPjFY4hyqaOPIagEj2aTHJHseFeEepNFkyBtjpvj9AVmgE8xcvJwuUZQK4Sayk
 TZW6TCYREwXbU8YOBubo/SrbZ+aKSlZIG1YaRtps/oIg5ztS+WNIztOTknV3aaKMXHso
 deXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tvj9LX7SxlSUsHCxvULFpWvXGDbOhFLZH7RuuoaYL10=;
 b=iDaeM3TNIRwKN4aMrM79gh6BNEkoATtcthV19bEN2A7GfnlPAWSFZ6w6CG7Pup1CFY
 atSFnazAmcqNXjZbCILYnZRK1tuawYoW72dfg/K/d8ZsdWPiqivXACoU05IRgDMfXrdw
 RBkM7JwPj0L+BfY0Feh4/dInkBtJkDqp6s625J/U1vM/8Ncc8BJmiD7iArnyqortkFGP
 K5QzYlpZwfplR9YYP1Z/BVRF/U5DkLMJYMQSKVFG1YbL4WCZxE7ibLB/8W/NfwevAHbl
 WB/uY4shVbwDftnrsjYiA5GyZG+zfM5z4+nzheKX6qY5s7N+Nrgb1kvfjev/eWbv5UfR
 PeHQ==
X-Gm-Message-State: AOAM532sAAJixKCqzg4KG+Gc380w35DuTehVCDKPjpR4Q9wFcFx1nFML
 gZfV++K4WNaQ1HVqe2onDp1K8Of0kKk=
X-Google-Smtp-Source: ABdhPJzonVw+VvdgWwEZeY+ieVMWnO4Pf4C9+Ru4GDfkWFCl0QnrlD7yhVmikfHZW+d7RrBOKEqM1Q==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr6157397edi.284.1633612116364; 
 Thu, 07 Oct 2021 06:08:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/24] configure,
 meson: move pthread_setname_np checks to Meson
Date: Thu,  7 Oct 2021 15:08:19 +0200
Message-Id: <20211007130829.632254-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the pthreads check dead in configure, so remove it
as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                | 78 ----------------------------------------
 meson.build              | 23 ++++++++++++
 util/qemu-thread-posix.c |  5 ++-
 3 files changed, 25 insertions(+), 81 deletions(-)

diff --git a/configure b/configure
index 52f89b05d6..a1e142d5f8 100755
--- a/configure
+++ b/configure
@@ -3146,71 +3146,6 @@ if test "$modules" = yes; then
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
@@ -4496,19 +4431,6 @@ if test "$debug_mutex" = "yes" ; then
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
index 935a20c198..54b2afdb96 100644
--- a/meson.build
+++ b/meson.build
@@ -1586,6 +1586,29 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
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
   #include <unistd.h>
   #include <sys/syscall.h>
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



