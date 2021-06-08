Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F839F583
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:47:05 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaCG-0008Ml-Eq
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpR-00071Z-GG
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:32 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpP-000891-Fz
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso1687776wmg.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7c89X6ceGQ+YzSczkt0fKuFnS8XDOBKW4YUy0HKiJgM=;
 b=jYnbr8ZgCSri3wZ1IEqXqK8W8C/RlQ7VKm4oUCrTjA/FYQ7ogS7F0jwFGEK3jTL392
 i9ljrQWl2quweC0fOMKVuejIzDPga2uvdQTwbe9vKlFquOzgQvILNmd5DHAmWRQnjWFN
 LCPhbweRrNlJ5DzLDhPHK2jQPtCpKbLyDmv8+Fi91UEJp78tLDPNEXA8cUosPs38rdwF
 Mddsg4TbSQ7LJLqO/apAkPyOhi1gg3LOL3rNNIC0cdh/A9/CJLFc9iH4hW3okj6XuAP1
 RVTqoRdZ8mKGpdfM5/bROpvyBvs5bfokA4bpcbOxgn8VPPz+sLC8mzhymg7InXFhTHWq
 Xf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7c89X6ceGQ+YzSczkt0fKuFnS8XDOBKW4YUy0HKiJgM=;
 b=CAF2tWSPb0ZDUDC5KUKXnMd4SY9fPoRLBx6XuvOH43yFsgbClABVfePc7H06V6Gn5J
 a3PkE+rp9lE4FOEtqmyssrNLYKgz4jwH+lVCw9yWkEU0ktmw6QjQAtZxodsbziu04bT3
 Z1m2d82O84CaArI6bV2s+6h2/PHRecQq0RYpSkk5+5TzTFVXZk12EMJ7Gh2St8d7xQmh
 qQsu3fyPME6VO/4/1jqAuW3yEXfb568362sIEsn4JaF6+S8PIk5ieX0UOYQZOZyY+44u
 5NjEQRRCK6w9s071vYIq58PAp9EZIgAGlzaiZu9K/y3d3CBlQVEZaGMLTp90OFNwEv0F
 6fzw==
X-Gm-Message-State: AOAM531mpDeSgHBSinAkqo7XIPfmJAFyPHMx+wTzBXIzZj7ro9dcatOa
 pWHF/6GdmgQPmnt9ruZZp6T3UWfXoknrcg==
X-Google-Smtp-Source: ABdhPJxdlLZVAamZr7g1wMo8KTZP/oTZV3yusxSxtO9CUO1IJpFWIr/dUTgSIfUbTj52fhZQnFsXSQ==
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr20477930wmk.136.1623151406354; 
 Tue, 08 Jun 2021 04:23:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] configure: convert compiler tests to meson, part 6
Date: Tue,  8 Jun 2021 13:23:01 +0200
Message-Id: <20210608112301.402434-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 configure   | 75 -----------------------------------------------------
 meson.build | 11 ++++++++
 2 files changed, 11 insertions(+), 75 deletions(-)

diff --git a/configure b/configure
index 527a308470..271d5b0060 100755
--- a/configure
+++ b/configure
@@ -3763,65 +3763,6 @@ else # "$safe_stack" = ""
 fi
 fi
 
-##########################################
-# check if we have open_by_handle_at
-
-open_by_handle_at=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-#if !defined(AT_EMPTY_PATH)
-# error missing definition
-#else
-int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
-#endif
-EOF
-if compile_prog "" "" ; then
-    open_by_handle_at=yes
-fi
-
-########################################
-# check if we have linux/magic.h
-
-linux_magic_h=no
-cat > $TMPC << EOF
-#include <linux/magic.h>
-int main(void) {
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    linux_magic_h=yes
-fi
-
-########################################
-# check if we have valgrind/valgrind.h
-
-valgrind_h=no
-cat > $TMPC << EOF
-#include <valgrind/valgrind.h>
-int main(void) {
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    valgrind_h=yes
-fi
-
-########################################
-# check if environ is declared
-
-has_environ=no
-cat > $TMPC << EOF
-#include <unistd.h>
-int main(void) {
-    environ = 0;
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    has_environ=yes
-fi
-
 ########################################
 # check if cpuid.h is usable.
 
@@ -4758,18 +4699,6 @@ if test "$crypto_afalg" = "yes" ; then
   echo "CONFIG_AF_ALG=y" >> $config_host_mak
 fi
 
-if test "$open_by_handle_at" = "yes" ; then
-  echo "CONFIG_OPEN_BY_HANDLE=y" >> $config_host_mak
-fi
-
-if test "$linux_magic_h" = "yes" ; then
-  echo "CONFIG_LINUX_MAGIC_H=y" >> $config_host_mak
-fi
-
-if test "$valgrind_h" = "yes" ; then
-  echo "CONFIG_VALGRIND_H=y" >> $config_host_mak
-fi
-
 if test "$have_asan_iface_fiber" = "yes" ; then
     echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
 fi
@@ -4778,10 +4707,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
-if test "$has_environ" = "yes" ; then
-  echo "CONFIG_HAS_ENVIRON=y" >> $config_host_mak
-fi
-
 if test "$cpuid_h" = "yes" ; then
   echo "CONFIG_CPUID_H=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 78fa30adbb..e6ccca2d5c 100644
--- a/meson.build
+++ b/meson.build
@@ -1264,6 +1264,8 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
+config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
+config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
@@ -1294,6 +1296,8 @@ config_host_data.set('CONFIG_BYTESWAP_H',
                      cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
+config_host_data.set('CONFIG_HAS_ENVIRON',
+                     cc.has_header_symbol('unistd.h', 'environ', prefix: gnu_source_prefix))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
@@ -1346,6 +1350,13 @@ config_host_data.set('CONFIG_MADVISE', cc.compiles('''
 config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + '''
   #include <sys/mman.h>
   int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
+config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.compiles(gnu_source_prefix + '''
+  #include <fcntl.h>
+  #if !defined(AT_EMPTY_PATH)
+  # error missing definition
+  #else
+  int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
+  #endif'''))
 config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
   #include <unistd.h>
   #include <fcntl.h>
-- 
2.31.1


