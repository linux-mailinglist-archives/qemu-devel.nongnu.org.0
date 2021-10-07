Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB04253F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:24:41 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTO4-0006Fd-Jh
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8e-0005Vo-Rz
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8c-0007rQ-Ib
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id r18so22919612edv.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dL/Z9cZ54or34GQZ9XPqAihe4EdFDjaleAhOGMjJew=;
 b=gjYIYXcEeavza/bSerczfA4P7p/ONzdm9l0o9P2P8spKZyMi9LqXbdntU6brB0H9+Y
 nCOe8YKBO2UYTw2O1T1AeYAmtSd75lL8mv43yq1TPHiboNa/01Ts7Wz0UqZiRXXxbK98
 WZgbTYToX2m9bzkdO+xQIfTTmH7y81k5Da5o+s7XgLMgyMScRjt7uzi9I12lvTlnrF70
 3fhT12dXgBRH3WYLWYM2nTsL3kATfV27ZCpHmU7w6jtM+0CllukAVRfzfBWm7lwUKbil
 2PtqPfBjU3h9cC40cjEqyEHcC+J+XTJqdpuKLJof7dnmKnsSCsbZqqpPBA0AhFNBIC7D
 CkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3dL/Z9cZ54or34GQZ9XPqAihe4EdFDjaleAhOGMjJew=;
 b=XyO42kpUfEFyKhkg9H5GH5t43CDpVGFJLI1PHYxtDoeTRr6GgcoY5lmkqNO4YJ1wRM
 iq01vUXhKVmeNwx5Z2AOWPSa9VMbr2T3q9/sM0guBoa/taEoH3n20Qdzq9pEOJiIm2MS
 eCEzSADpwJvnjMJfGvU8XI7BaztKLaYN7VPLmduUrx6/cM0L7hlzMr2LR+h2840B5Nsa
 vpEDwDnKGlGK1hMU/KzYhI+jRYd70kWZuvBpKBBd/1YSY/XQoLFQ8lblfN0csD6p2Sja
 KT2m5erAlK8xuRMUyWj5ulDJEqw6gKzgnjLMKBV3BROlLcID58BqzmkrTewkBd7+BymO
 Jx1g==
X-Gm-Message-State: AOAM531orNVZlCE6uouyuoTfti8eL0gH9/F1JVzbXzGHCPjDUJk10d6w
 L3r2RhcPRxHc51OcthZtDoNxHi1TMWU=
X-Google-Smtp-Source: ABdhPJweChXRyFPkwJvDMEXryoaPPOjOp6d80/SBFuQCzffoatnImMb/d9sF1R3wSR8g4R7fi3TXMQ==
X-Received: by 2002:a17:906:2294:: with SMTP id
 p20mr5869098eja.224.1633612120290; 
 Thu, 07 Oct 2021 06:08:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/24] configure, meson: move more compiler checks to Meson
Date: Thu,  7 Oct 2021 15:08:25 +0200
Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 91 -----------------------------------------------------
 meson.build | 45 ++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 91 deletions(-)

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
index 0721309ed1..f08f364c90 100644
--- a/meson.build
+++ b/meson.build
@@ -1552,6 +1552,8 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
+config_host_data.set('CONFIG_IOVEC',
+                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
@@ -1700,6 +1702,49 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links('''
+  cat > $TMPC << EOF
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
-- 
2.31.1



