Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43374452E38
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:40:30 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmux2-0002Dr-W1
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mmuvZ-00015o-N8
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:38:58 -0500
Received: from [2a00:1450:4864:20::52f] (port=46737
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mmuvX-0002jw-ON
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:38:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y13so10030295edd.13
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S4WcyNcg5hoULtV70DvWKqOAgeFCc06Rzhg1frdIwHA=;
 b=blbBfPaue5A4Cwbg33XrIeCR+dU0QBFqCvPbo+JG0p0Lns0kl1J6WYk0sRcyXEyNxI
 NfluJh+wCCVhFawD9bj/920sKDFlAktFMR+CBGQkWzs+C29fodQIZcAbRtaEl4/GI0qp
 RGOma2RDSeNcl84WD0mvbSAi1oGZ3pgQMZMkp0d78jeHhurHjwzO0E6WpBr9AHv+8+Ur
 6cayTTMS1gxjekDr0t4PcFu+ZXcH1uDNrWgINo3aihj+cOb3kfDGyKxxEaqGLsgfeZyf
 rKqa4VFdW5wI+YGGFX2m5jCRqW+b8v5QMz4WC9uiZJTMZ/goR5gO07zZMGQZJ6PPXe2T
 Rsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S4WcyNcg5hoULtV70DvWKqOAgeFCc06Rzhg1frdIwHA=;
 b=XFebKeEmyX09VDSEX89/Je6/10UnZEwIpxnTLoO0GpVWfDbjjsHVtcRNleEtI4TPhw
 aO+MvYUKUNLiSis9sqK4AZxj5ACUk4EE8QGRVthdZmJKalxelZer+cI+fn8R3ZxnYKPI
 tTUBv1DeSRzDtD51xWL+6fy+oPsvadt9BccipZk+7P7gkjkrKGFYWjNJN7EPrQCnKA/c
 zxiyzXbobbA6EwDjWOhGXdWQd1ba5ZItHr4bTxfRILdtV8dk29KcThh1vlWjALrb8vrn
 cIAWL9Z/qOjPwUu41RNC1z/dYZGrWzTau+mnO8XoUGpzz+IVAviYb7/TVLl3u1W5ei7b
 xRVw==
X-Gm-Message-State: AOAM532DnLa4iw3IcaUAjq4cp8iz4ESDy4cfi7ygv3UrIAvyIZ6egUOC
 6fWxqI11LN/99CayHE+FDGIPu24P6EY=
X-Google-Smtp-Source: ABdhPJxL5WQYXFk07HjU9t+jvkhubC76Ysc4KfKYEQ8Z7qG+wgNILesXYyzbExCGFAtTJfA3Cva30Q==
X-Received: by 2002:a17:907:1b25:: with SMTP id
 mp37mr7782447ejc.140.1637055519850; 
 Tue, 16 Nov 2021 01:38:39 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 gn16sm8111827ejc.67.2021.11.16.01.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:38:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix botched compile check conversions
Date: Tue, 16 Nov 2021 10:38:34 +0100
Message-Id: <20211116093834.76615-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a bunch of incorrect conversions from configure to Meson, which result
in different outcomes with --extra-cflags=-Werror.

pthread_setname_np needs "#define _GNU_SOURCE" on Linux (which I am using
also for the non-Linux check, so that it correctly fails with an error
about having too few parameters).

Fix struct checks to use has_type instead of has_symbol, and "#define
_GNU_SOURCE" too in the case of struct mmsghdr.

Remove an apostrophe that ended up at the end of a #include line.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 2ece4fe088..93a5e50a16 100644
--- a/meson.build
+++ b/meson.build
@@ -1547,8 +1547,6 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
-config_host_data.set('CONFIG_IOVEC',
-                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
@@ -1561,8 +1559,6 @@ config_host_data.set('CONFIG_SYSMACROS',
                      cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
 config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
-config_host_data.set('HAVE_UTMPX',
-                     cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
 
@@ -1574,6 +1570,14 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
 
+# has_type
+config_host_data.set('CONFIG_IOVEC',
+                     cc.has_type('struct iovec',
+                                 prefix: '#include <sys/uio.h>'))
+config_host_data.set('HAVE_UTMPX',
+                     cc.has_type('struct utmpx',
+                                 prefix: '#include <utmpx.h>'))
+
 config_host_data.set('CONFIG_EVENTFD', cc.links('''
   #include <sys/eventfd.h>
   int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
@@ -1615,7 +1619,7 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <stddef.h>
   int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
 
-config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
 
   static void *f(void *p) { return NULL; }
@@ -1626,7 +1630,7 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
     pthread_setname_np(thread, "QEMU");
     return 0;
   }''', dependencies: threads))
-config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links('''
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
 
   static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
@@ -1662,8 +1666,10 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
 
 have_l2tpv3 = false
 if not get_option('l2tpv3').disabled() and have_system
-  have_l2tpv3 = (cc.has_header_symbol('sys/socket.h', 'struct mmsghdr')
-                 and cc.has_header('linux/ip.h'))
+  have_l2tpv3 = cc.has_type('struct mmsghdr',
+    prefix: gnu_source_prefix + '''
+      #include <sys/socket.h>
+      #include <linux/ip.h>''')
 endif
 config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
 
@@ -1689,7 +1695,7 @@ config_host_data.set('CONFIG_NETMAP', have_netmap)
 # xfs headers will not try to redefine structs from linux headers
 # if this macro is set.
 config_host_data.set('HAVE_FSXATTR', cc.links('''
-  #include <linux/fs.h>'
+  #include <linux/fs.h>
   struct fsxattr foo;
   int main(void) {
     return 0;
-- 
2.33.1


