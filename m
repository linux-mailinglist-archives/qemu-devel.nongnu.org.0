Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32F42DFA2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:49:18 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3uv-0003LV-Ek
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cN-0003uM-0A
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cI-0000mo-MN
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:04 -0400
Received: by mail-ed1-x533.google.com with SMTP id r18so26592126edv.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8A1fFUBoVK/iFegjzGxtIdAetdjErL7XP7hSIXdyZCA=;
 b=qqtnP8SnOzR3g62DRV8r3a41BUQJM+KV8egIijGyn5TcvVEDIHDARrqfNR4NSuO7Vn
 7tseOpopAVY4huTQQjx2agJAh7fo27COz6Whu/yk6zsJziMhe2rPKG/dEwzjiF6wiDP4
 R/Pj3y4sIqbnXHUL783w3T5r9ojzp/j4uDGJeCfwQx58KSy2k6yvVM7anUuc/NR+arl4
 pg+yDgIc6mopk6aPdPMoKKiGaG6fP57p6G3306BUGwf7yS1UED3KwpwqC5dDtuolr0/S
 HbXuWvHT4mb/XvM9af4bqE/xOAJJEpSng7F6P3cYWeBsi9alIGry8fwU+PhSZN6g6Mx0
 cMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8A1fFUBoVK/iFegjzGxtIdAetdjErL7XP7hSIXdyZCA=;
 b=ZQSSBNim/x6NrVvry/ezbPPnJ27TvpvS70N5boaPxePzIfPVTb8WyWAUkb+z6cV3vi
 8Lq1LQWDUx04BA0v2aMhAaIzwcY9vv99vdWmWNIGAnNbh4OLDX0L1olHqgFaXMQalhzS
 jTGbhMbR+p9JLtMyEEckf/74AJv8Fsxe3vfsxD/aMqllpCp6Yga4WWLtZMh8HzqveMT2
 HKasmmOvetqKRdSx05oN+Aqw9WcdOqTKVE51aRTpK+xoEwKao6GJaqcUj2HJuGXq+YyA
 /Wkgn7qN1wXv6dPY+EjkwhVyTRAFDp0SDn3uvyF1VUEAnijqeItrXLewC0dvubD9Yvr7
 /PTg==
X-Gm-Message-State: AOAM533B8MS2MVQgwPUC6tBbHuBJLDX4LCG6z3okMVLQMQYj2KOQTG+E
 UJgfyETqJrB/BsO5Z2St4qUM2jE9AYc=
X-Google-Smtp-Source: ABdhPJx3l9/mwEbwIKyafes1YaT9V24XcdZnowvvgQSpRHm0OcHTEDHkS+uSKD1f8MQ+tX7ksTx2pg==
X-Received: by 2002:a50:fc17:: with SMTP id i23mr9632396edr.213.1634228999723; 
 Thu, 14 Oct 2021 09:29:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] configure, meson: move more compiler checks to Meson
Date: Thu, 14 Oct 2021 18:29:33 +0200
Message-Id: <20211014162938.430211-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure        | 91 ------------------------------------------------
 meson.build      | 44 +++++++++++++++++++++++
 util/meson.build |  4 ++-
 3 files changed, 47 insertions(+), 92 deletions(-)

diff --git a/configure b/configure
index 9b59dce2f8..7c58c7c28d 100755
--- a/configure
+++ b/configure
@@ -3110,19 +3110,6 @@ elif test "$tpm" = "yes"; then
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
 
@@ -3564,42 +3551,6 @@ EOF
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
@@ -3673,33 +3624,6 @@ else
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
@@ -4175,9 +4099,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$iovec" = "yes" ; then
-  echo "CONFIG_IOVEC=y" >> $config_host_mak
-fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
@@ -4247,14 +4168,6 @@ if test "$cmpxchg128" = "yes" ; then
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
@@ -4282,10 +4195,6 @@ if test "$replication" = "yes" ; then
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
index 6bf43e6d30..6b7487b725 100644
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



