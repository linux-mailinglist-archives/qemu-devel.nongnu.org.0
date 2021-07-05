Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5D3BC188
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:17:12 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RHT-0004Ey-S1
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1Q-0001Na-Gg
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1L-0003g3-SW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q17so2256207wrv.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BdD6jxidGfMEq7c7dSE3OTNZydmwQIYhRWbOc8EIzE=;
 b=SWmwTdj6aghSlHeZni5phdv2bCA0450eCRCI3uzDJNwxBpU+kfhFmc8MXrppjwG957
 2BhqEckkZ2Lqqo/gQDa+c6mCnSKBvz3gAoQi1HR0hgf1ylnubTP42HPQ7bf71+ddi4Cq
 Xfxx11nnO8BtXebklr2n5dAtMmIbePYblZO02Wjvsv2eph2yqYYztBZS9BldWIa1sY3V
 gtq8YRNrF6VT68R3Y1cK9YAJkWvz1/QsG7RcvR4wgDaO8M7t1EkxQP03lrGIkhMyDLRw
 dgMbdopyLRgHh0e5ZnD1JiZSB7bTutrKiOJtlhRq06BH3onKKNKZ8ghiRBoGc2xo+Doe
 c66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4BdD6jxidGfMEq7c7dSE3OTNZydmwQIYhRWbOc8EIzE=;
 b=rjBXPZcyG27fZBelEJZ6T6Wpp1p6JStMWeetUzCAjgnkGpY5Tr6LmWIb1HQiIw7iox
 FKnkY0IZq9eRQxhR46S9L7NYhUu6njHBsyChPpwSD1HcViTmvTd6Yw5F+D8Cf1fuotjB
 lhUMkr62GgSO7gDCbWtlstKkvCXa56anqOxa3bSUTnFXWBeGDBYfyeL73aa9+HdF9YX4
 X7LSfC9wAjvV+GUI+5Mxbi1lO37sXSAzn+pE/mDmRweE3UsyWhNyGMP3Nx7qHySfZgSA
 bWH67QCCY4OmScL0HHWBkssNQ0Rw19lOF54vde/oyNM4EhQBCCGL/25QduRNwiDLzdWU
 ti8w==
X-Gm-Message-State: AOAM530Yzii7fJYCIGBcRiCXSAE6+e9rTG+vGvGe9liP7u3ZjWebRy4Y
 qv2AHDdI+g8ZG089flkqJpNqDIcexu8=
X-Google-Smtp-Source: ABdhPJx9My16x+VbSLmnYuq9E9h8gGFPlEXiAajzL35EpFdwctp72bhtAXjqZVLik426r52/U+mtOw==
X-Received: by 2002:adf:d203:: with SMTP id j3mr16632893wrh.292.1625500830138; 
 Mon, 05 Jul 2021 09:00:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] configure: convert compiler tests to meson, part 3
Date: Mon,  5 Jul 2021 18:00:15 +0200
Message-Id: <20210705160018.241397-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
 configure   | 87 -----------------------------------------------------
 meson.build | 10 ++++++
 2 files changed, 10 insertions(+), 87 deletions(-)

diff --git a/configure b/configure
index 78f4a351d9..cf7f71fe40 100755
--- a/configure
+++ b/configure
@@ -4293,20 +4293,6 @@ if test "$fortify_source" != "no"; then
   fi
 fi
 
-###############################################
-# Check if copy_file_range is provided by glibc
-have_copy_file_range=no
-cat > $TMPC << EOF
-#include <unistd.h>
-int main(void) {
-  copy_file_range(0, NULL, 0, NULL, 0, 0);
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_copy_file_range=yes
-fi
-
 ##########################################
 # check if struct fsxattr is available via linux/fs.h
 
@@ -4353,19 +4339,6 @@ else
     membarrier=no
 fi
 
-##########################################
-# check if rtnetlink.h exists and is useful
-have_rtnetlink=no
-cat > $TMPC << EOF
-#include <linux/rtnetlink.h>
-int main(void) {
-  return IFLA_PROTO_DOWN;
-}
-EOF
-if compile_prog "" "" ; then
-    have_rtnetlink=yes
-fi
-
 ##########################################
 # check for usable AF_VSOCK environment
 have_af_vsock=no
@@ -4419,49 +4392,6 @@ then
 fi
 
 
-#################################################
-# check for sysmacros.h
-
-have_sysmacros=no
-cat > $TMPC << EOF
-#include <sys/sysmacros.h>
-int main(void) {
-    return makedev(0, 0);
-}
-EOF
-if compile_prog "" "" ; then
-    have_sysmacros=yes
-fi
-
-##########################################
-# check for utmpx.h, it is missing e.g. on OpenBSD
-
-have_utmpx=no
-cat > $TMPC << EOF
-#include <utmpx.h>
-struct utmpx user_info;
-int main(void) {
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_utmpx=yes
-fi
-
-##########################################
-# check for getrandom()
-
-have_getrandom=no
-cat > $TMPC << EOF
-#include <sys/random.h>
-int main(void) {
-    return getrandom(0, 0, GRND_NONBLOCK);
-}
-EOF
-if compile_prog "" "" ; then
-    have_getrandom=yes
-fi
-
 ##########################################
 # checks for sanitizers
 
@@ -4944,9 +4874,6 @@ echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 if test "$have_fsxattr" = "yes" ; then
     echo "HAVE_FSXATTR=y" >> $config_host_mak
 fi
-if test "$have_copy_file_range" = "yes" ; then
-    echo "HAVE_COPY_FILE_RANGE=y" >> $config_host_mak
-fi
 if test "$xen" = "enabled" ; then
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
@@ -5182,10 +5109,6 @@ if test "$pvrdma" = "yes" ; then
   echo "CONFIG_PVRDMA=y" >> $config_host_mak
 fi
 
-if test "$have_rtnetlink" = "yes" ; then
-  echo "CONFIG_RTNETLINK=y" >> $config_host_mak
-fi
-
 if test "$replication" = "yes" ; then
   echo "CONFIG_REPLICATION=y" >> $config_host_mak
 fi
@@ -5194,16 +5117,6 @@ if test "$have_af_vsock" = "yes" ; then
   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
 fi
 
-if test "$have_sysmacros" = "yes" ; then
-  echo "CONFIG_SYSMACROS=y" >> $config_host_mak
-fi
-
-if test "$have_utmpx" = "yes" ; then
-  echo "HAVE_UTMPX=y" >> $config_host_mak
-fi
-if test "$have_getrandom" = "yes" ; then
-  echo "CONFIG_GETRANDOM=y" >> $config_host_mak
-fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 4314b9b4c5..5fec46bb65 100644
--- a/meson.build
+++ b/meson.build
@@ -1280,6 +1280,7 @@ config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_functio
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
 config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
+config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
@@ -1297,12 +1298,21 @@ config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
 config_host_data.set('CONFIG_FIEMAP',
                      cc.has_header('linux/fiemap.h') and
                      cc.has_header_symbol('linux/fs.h', 'FS_IOC_FIEMAP'))
+config_host_data.set('CONFIG_GETRANDOM',
+                     cc.has_function('getrandom') and
+                     cc.has_header_symbol('sys/random.h', 'GRND_NONBLOCK'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
                                                      #include <sys/types.h>'''))
 config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
                      cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
+config_host_data.set('CONFIG_RTNETLINK',
+                     cc.has_header_symbol('linux/rtnetlink.h', 'IFLA_PROTO_DOWN'))
+config_host_data.set('CONFIG_SYSMACROS',
+                     cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
+config_host_data.set('HAVE_UTMPX',
+                     cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.31.1



