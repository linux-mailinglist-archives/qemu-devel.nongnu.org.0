Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BCB42A3AD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:54:58 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGN0-0006fe-0J
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFim-0000tj-9k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:24 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFij-0007Zr-CW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g8so79736759edt.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fuusyPU1muAnX8OHmMRKHrFEYQim3jxp9adT/chl64=;
 b=FeiutYi1ey45hYJjnH2QasLbvdKo55TfllCro+QR31uCd31h9IdVR5GWbH67D5+0mD
 Lqc8Le5MKSI1fbZXGr54f9oPx0kpmLkiLmI6yeAyCmY5QdIOrEm4fMuMNXgM8rrkaHaU
 jGbTJMU3upJO1wFZVRJj2j1TF1ViexJ5RLZ2bsVYzIfUXt0b/HrtNk9nIuDrhyFFNyQI
 MhriPz8r4NM/si8/ucYBN4tOU5ZTpAM6aoUToG98KJdX8G1eeBnFhV6qaqAbulsGss6Y
 13uRHkIBb6qoR+GhFgjY6/2ntb8IifjxPCvO62QApQcCdsXcaD4+05MqYBXpGIU8RF3Z
 uNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1fuusyPU1muAnX8OHmMRKHrFEYQim3jxp9adT/chl64=;
 b=5u05lFns/v4l9F/VeY1c7cjgL0dfdTKvgSFNets4NQ/3JZWJNGJI363XLsv/Pm3z3r
 ZfnFBgYYgxiCsz/DzcmT/rOEAILt0yJ+8MYREgoGlAGTQujwE/KPoyrB5PXuluFOWpfX
 L+LHKoZqwcou8slFlqtD1Dg/R4+99jt+z4ao7gVJlZYTuQrJaZk6XdDDzv/7BU1hTL13
 84XP9KzsB61brOdNvgdLPc3zW3xRHFpfxT9Ia8w4k4UiqlmMzKa9wjUZcZFKO17jk93Z
 bz5Z0yPIXeXlwMRbZQkcKz70qMwYvGzedJXhrOEH1VCM6XxLdlcDYZl7nwdN+C7PSDvU
 OBaQ==
X-Gm-Message-State: AOAM531ASLBeKUuGJPeBQVDxbTFmtAh7QJ62FmtkwNgvvH7u6YUxB2D9
 /jiVT30TQxN1J5dDuk4qgqxLBILNs8E=
X-Google-Smtp-Source: ABdhPJyk7i0iOQJ7FZwMfHcNyTtG04XxzifgTDsRB3yX4ijmXCGp0xYLNHn68kYllLxoUIwu+hTgZw==
X-Received: by 2002:a17:906:70c5:: with SMTP id
 g5mr34043238ejk.63.1634037200067; 
 Tue, 12 Oct 2021 04:13:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] configure, meson: move more compiler checks to Meson
Date: Tue, 12 Oct 2021 13:12:58 +0200
Message-Id: <20211012111302.246627-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure        | 91 ------------------------------------------------
 meson.build      | 44 +++++++++++++++++++++++
 util/meson.build |  4 ++-
 3 files changed, 47 insertions(+), 92 deletions(-)

diff --git a/configure b/configure
index 2091844ad6..33d330dcc9 100755
--- a/configure
+++ b/configure
@@ -3108,19 +3108,6 @@ elif test "$tpm" = "yes"; then
   fi
 fi
 
-##########################################
-# iovec probe
-cat > $TMPC <<EOF
-#include <sys/types.h>
-#include <sys/uio.h>
-#include <unistd.h>
-int main(void) { return sizeof(struct iovec); }
-EOF
-iovec=no
-if compile_prog "" "" ; then
-  iovec=yes
-fi
-
 ##########################################
 # fdt probe
 
@@ -3562,42 +3549,6 @@ EOF
   fi
 fi
 
-#########################################
-# See if 64-bit atomic operations are supported.
-# Note that without __atomic builtins, we can only
-# assume atomic loads/stores max at pointer size.
-
-cat > $TMPC << EOF
-#include <stdint.h>
-int main(void)
-{
-  uint64_t x = 0, y = 0;
-  y = __atomic_load_n(&x, __ATOMIC_RELAXED);
-  __atomic_store_n(&x, y, __ATOMIC_RELAXED);
-  __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
-  __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
-  __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  atomic64=yes
-fi
-
-########################################
-# check if getauxval is available.
-
-getauxval=no
-cat > $TMPC << EOF
-#include <sys/auxv.h>
-int main(void) {
-  return getauxval(AT_HWCAP) == 0;
-}
-EOF
-if compile_prog "" "" ; then
-    getauxval=yes
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -3671,33 +3622,6 @@ else
     membarrier=no
 fi
 
-##########################################
-# check for usable AF_VSOCK environment
-have_af_vsock=no
-cat > $TMPC << EOF
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#if !defined(AF_VSOCK)
-# error missing AF_VSOCK flag
-#endif
-#include <linux/vm_sockets.h>
-int main(void) {
-    int sock, ret;
-    struct sockaddr_vm svm;
-    socklen_t len = sizeof(svm);
-    sock = socket(AF_VSOCK, SOCK_STREAM, 0);
-    ret = getpeername(sock, (struct sockaddr *)&svm, &len);
-    if ((ret == -1) && (errno == ENOTCONN)) {
-        return 0;
-    }
-    return -1;
-}
-EOF
-if compile_prog "" "" ; then
-    have_af_vsock=yes
-fi
-
 ##########################################
 # check for usable AF_ALG environment
 have_afalg=no
@@ -4173,9 +4097,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$iovec" = "yes" ; then
-  echo "CONFIG_IOVEC=y" >> $config_host_mak
-fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
@@ -4245,14 +4166,6 @@ if test "$cmpxchg128" = "yes" ; then
   echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
 fi
 
-if test "$atomic64" = "yes" ; then
-  echo "CONFIG_ATOMIC64=y" >> $config_host_mak
-fi
-
-if test "$getauxval" = "yes" ; then
-  echo "CONFIG_GETAUXVAL=y" >> $config_host_mak
-fi
-
 if test "$libssh" = "yes" ; then
   echo "CONFIG_LIBSSH=y" >> $config_host_mak
   echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
@@ -4280,10 +4193,6 @@ if test "$replication" = "yes" ; then
   echo "CONFIG_REPLICATION=y" >> $config_host_mak
 fi
 
-if test "$have_af_vsock" = "yes" ; then
-  echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
-fi
-
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index bf1b372a4a..ca7b9d60af 100644
--- a/meson.build
+++ b/meson.build
@@ -1550,6 +1550,8 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
+config_host_data.set('CONFIG_IOVEC',
+                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
@@ -1697,6 +1699,48 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links('''
+  #include <stdint.h>
+  int main(void)
+  {
+    uint64_t x = 0, y = 0;
+    y = __atomic_load_n(&x, __ATOMIC_RELAXED);
+    __atomic_store_n(&x, y, __ATOMIC_RELAXED);
+    __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
+    __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
+    __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
+    return 0;
+  }'''))
+
+config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
+  #include <sys/auxv.h>
+  int main(void) {
+    return getauxval(AT_HWCAP) == 0;
+  }'''))
+
+config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
+  #include <errno.h>
+  #include <sys/types.h>
+  #include <sys/socket.h>
+  #if !defined(AF_VSOCK)
+  # error missing AF_VSOCK flag
+  #endif
+  #include <linux/vm_sockets.h>
+  int main(void) {
+    int sock, ret;
+    struct sockaddr_vm svm;
+    socklen_t len = sizeof(svm);
+    sock = socket(AF_VSOCK, SOCK_STREAM, 0);
+    ret = getpeername(sock, (struct sockaddr *)&svm, &len);
+    if ((ret == -1) && (errno == ENOTCONN)) {
+        return 0;
+    }
+    return -1;
+  }'''))
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
diff --git a/util/meson.build b/util/meson.build
index 779f413c86..05b593055a 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,5 +1,7 @@
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
-util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
+if not config_host_data.get('CONFIG_ATOMIC64')
+  util_ss.add(files('atomic64.c'))
+endif
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
 if config_host_data.get('CONFIG_EPOLL_CREATE1')
-- 
2.31.1



