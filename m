Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579713BC182
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:14:47 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RF8-0008DK-CN
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1S-0001Or-29
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1Q-0003gp-85
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so22672312wri.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wsCVXQaLB1KXZv6TQRlcL157BoPpd+++508LQhtC4LY=;
 b=F9MGNorVKhwh2pOebQRu9oj3YUKTyLyFNYPFJhHmrTKXrEGij8UB/dW3SoqyQrrFj6
 aYpHoILWJUlipIsCrDgbyAqLN6rkNLjsXd8wMKA2F1V5R5CVw8XgS+CeD5jMb98Dxt0x
 wJRoVeUlUwTU2GwCWdwvJY4BiAh/3wsxtScPymJkNmBpWQ33QNR8YqvaGzQnkrZx5gxZ
 dw6d49UMiCyotlZMnNHOzwLct2oMqAxMiatOknTrB2wKm4rbhP5jORCz1S56bCXJ3R4F
 BijVM4y6vkWeWUfjG1QOMsiaq66UEkPUChpcrjockCNLg6aluoQRTMYJtczBGU/DYBqn
 8Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wsCVXQaLB1KXZv6TQRlcL157BoPpd+++508LQhtC4LY=;
 b=WXeTzFPxd1vMeGRTi5CQMSXbMawtckgpln/+LS9MnUeDXfT9uAETC11VV5+icSpSLQ
 QkAwSvhiMKNGDF48v6YWVfQcAA/WUAJ2mbNlxQTFXVOP26zD+2MBEQb9QxjMMZ270bXt
 CdcBHjnhPcvui3++faKn7z6ldVDI5tiyR8YmraB9OAd9WzcX5I4/GoBi824vpefFYVJY
 rkIJu3aoAyBwfW1Pi8rrGpb3bvWRO1Din8XExgsBifKyom9G5uka1q0FUEY7TGegwlmD
 SVKhvftBgJfH9sCbpuAvmhpLIV5ybGV/MBc3z9uVGSagJ8t03A/DnjZL4O0VASQcCT1c
 4QfQ==
X-Gm-Message-State: AOAM533kI7l0Q9hJ2K6Wg1g7T8BRpGw4hXEzJA8AAT9S7DbRGTSXvmjn
 K4fVfS4edR+I9M1kOn/eTLzINMNag9I=
X-Google-Smtp-Source: ABdhPJy9M3nvhDGoF5TRglJGhmL777hTo63TO6mR7JM2dVyfkDyhAL9o/jVNhXMcen1W4s8Dot7EKQ==
X-Received: by 2002:a5d:4c50:: with SMTP id n16mr16598298wrt.249.1625500832156; 
 Mon, 05 Jul 2021 09:00:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] configure: convert compiler tests to meson, part 6
Date: Mon,  5 Jul 2021 18:00:18 +0200
Message-Id: <20210705160018.241397-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 75 -----------------------------------------------------
 meson.build | 11 ++++++++
 2 files changed, 11 insertions(+), 75 deletions(-)

diff --git a/configure b/configure
index 1cac47399d..0e487ae091 100755
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
 
@@ -4761,18 +4702,6 @@ if test "$crypto_afalg" = "yes" ; then
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
@@ -4781,10 +4710,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
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
index 12162264db..1651496800 100644
--- a/meson.build
+++ b/meson.build
@@ -1260,6 +1260,8 @@ config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
+config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
+config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
@@ -1292,6 +1294,8 @@ config_host_data.set('CONFIG_BYTESWAP_H',
                      cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
+config_host_data.set('CONFIG_HAS_ENVIRON',
+                     cc.has_header_symbol('unistd.h', 'environ', prefix: gnu_source_prefix))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
@@ -1350,6 +1354,13 @@ config_host_data.set('CONFIG_MADVISE', cc.compiles(gnu_source_prefix + '''
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


