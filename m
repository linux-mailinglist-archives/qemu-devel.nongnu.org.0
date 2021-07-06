Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C93BCA43
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:42:50 +0200 (CEST)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iXR-0003kC-5K
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu8-0001aJ-4n
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu2-0002T3-G0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id n9so8028241wrs.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wsCVXQaLB1KXZv6TQRlcL157BoPpd+++508LQhtC4LY=;
 b=EHJORUMotC5D2pkf0OZsuz5N0XzyzKK+56WiznP6girG7qzbH1UpzfGguxP/lhYC2T
 W8wtmnJqnJFDWsIOdEkAi8KEChCA/ixHdrXQ0n5Nj/6zG0LnMUiSqmf4g+LLFIOuwd4k
 dCXFEETbK5kCx4mUi8kAJT9Gn3sMo6xXTpOm7CrgRsiW2LDTN5Q8JwUHBkjL101NfNRI
 R18kqJgdblSaG05vq5xc1rFhp4j9iGxh1TdIgBg4PHe/qr0MocHUoq+RDNxBgxTnoxf5
 N5iuC6mvuTOntlQxz27P4owNgfLNdAKgSlIQMVtY2sF8YdwhewAQlqeNmDXl87jcpyUV
 GTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wsCVXQaLB1KXZv6TQRlcL157BoPpd+++508LQhtC4LY=;
 b=OIf/bdRUSGmxBURf6Iod60C66DhqJ+/3z8upvVWj66xuQ6XGPhOdT0uqhLn4siACoA
 HDNT1GcGeJuhglv5afcHnevmhxXlEAhVQpVj9S/psf+CxbG81cp9ib4LI4zYoUjkOQ4u
 oWBBhMhjyJhiMbt0gv/rl+Szms8k15bJ0vmeSGNUBxCs8pmKm1RmnBleGT9C9Astdfe2
 VASlldoBSmsX1L+52cKMZiP5wdBRi611U3b9IRxjx3PF/95XlYX/mMq/nufasjpMOu9z
 grvhvS8Bw9ZbLCRdsu45z59O13GnCELjM7tCOHvG8AMxe1Fg+zEsgPQ+Pbg/KlCJada5
 COkA==
X-Gm-Message-State: AOAM532fk3zVCbGNOJ72PSBvyqzI6VHYpZPGCI3fCV71IZ6Jrcn242Uv
 mKiyqlm5UA6TwU8T7/K4G0vCaSubTKY=
X-Google-Smtp-Source: ABdhPJymioGfEP2wHXiDBVE1NI+CK6LSqQ85OjrXINWfvqTqUaiSEAzwfTImIIneQ+UZ55NLbNWHhg==
X-Received: by 2002:adf:a404:: with SMTP id d4mr20921240wra.156.1625565725170; 
 Tue, 06 Jul 2021 03:02:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/40] configure: convert compiler tests to meson, part 6
Date: Tue,  6 Jul 2021 12:01:33 +0200
Message-Id: <20210706100141.303960-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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



