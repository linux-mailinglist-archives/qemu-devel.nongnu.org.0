Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD539F536
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:38:18 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa3l-00037n-0F
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpO-0006vI-9V
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpM-000863-AU
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id h3so1588995wmq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ClO7x48cr2DFTHPVK0wr5xSRbkke9BhKLq2zxz5bjw=;
 b=kkO3I1ORCUmr7AnUa1kWKU/+E67NYe9xb36g7memGLXuQ1QtljDa/AO6IELJRf8jDJ
 uUe7ZTeEVpAz9yOVyPx4Xcz+Zmeiieksf1rbrg11g2PtNXSiZPRb8EAeEe2FpIUb0qPN
 f+azJh6/FW4pCN0ZUOO6b5rRgj2ieQ41moOUHbQK318/QuPXLFiknT3+9g5YMMyDrrow
 mEVJRRJdGAWjb8zqj8MlNqKrPK+rbZvhlzmU56uydKTKXYiYxALGBZiMjvh4jzRfSvJv
 KmcofcnbxWcfX7L1YY3310xClTEVgKK+4GkASZcagKjY5HtP1oGVls870n7kEKPL6faR
 CG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9ClO7x48cr2DFTHPVK0wr5xSRbkke9BhKLq2zxz5bjw=;
 b=IK3HKbxc28uf83xiL0nbb1oBjhxp0AcP4d78YvtnE+v3Y25ul7Yo+ji1gubpc+l6u5
 4vI+YsLRGbmx+SU12vuojTtK7MLgiJFYjil/SYRQ3yEolE5rqpEvzUgUx4t8R/ghxzzY
 bCAwgyXhogRngEmbsHqmqpDP0TixJZB0NmauelIWV8efd+tttmRjRgphzeYcg4ncioXt
 5QUA9Z5c2G2hyzHAMPbwM0e0dJ+IkgzUD4zbK/b7D/wVP0RjVe8nwHnBNF35/+SwhXTo
 neJGvnWCqv5IyzXQJxBlmn3EjGkUpbm7maBDdDfy51MPnSt7JA5hhFkBh9FPJaBq3H13
 xCgA==
X-Gm-Message-State: AOAM530/y0n3VsYi3DtL+yz8T36oUppfxZffK9VAaDEIUGYez9dHjQyL
 lHNXI3ckiYC9aQss2fpghdiKCh5x6R02SA==
X-Google-Smtp-Source: ABdhPJxjTw1IgoMrIz+WspuHOw8zcfG+A1Dr6byIHUVbzjgzEzK9s2/Qlux2f3BzUD6TtZ61GnVsEQ==
X-Received: by 2002:a05:600c:1c1b:: with SMTP id
 j27mr21965467wms.133.1623151402701; 
 Tue, 08 Jun 2021 04:23:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/26] configure: convert compiler tests to meson, part 3
Date: Tue,  8 Jun 2021 13:22:57 +0200
Message-Id: <20210608112301.402434-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
 configure   | 87 -----------------------------------------------------
 meson.build | 10 ++++++
 2 files changed, 10 insertions(+), 87 deletions(-)

diff --git a/configure b/configure
index 7f7f548b1a..3e94ec0bd2 100755
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
@@ -4419,20 +4392,6 @@ then
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
 ##########################################
 # check for _Static_assert()
 
@@ -4447,35 +4406,6 @@ if compile_prog "" "" ; then
     have_static_assert=yes
 fi
 
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
 
@@ -4958,9 +4888,6 @@ echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 if test "$have_fsxattr" = "yes" ; then
     echo "HAVE_FSXATTR=y" >> $config_host_mak
 fi
-if test "$have_copy_file_range" = "yes" ; then
-    echo "HAVE_COPY_FILE_RANGE=y" >> $config_host_mak
-fi
 if test "$xen" = "enabled" ; then
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
@@ -5193,10 +5120,6 @@ if test "$pvrdma" = "yes" ; then
   echo "CONFIG_PVRDMA=y" >> $config_host_mak
 fi
 
-if test "$have_rtnetlink" = "yes" ; then
-  echo "CONFIG_RTNETLINK=y" >> $config_host_mak
-fi
-
 if test "$replication" = "yes" ; then
   echo "CONFIG_REPLICATION=y" >> $config_host_mak
 fi
@@ -5205,20 +5128,10 @@ if test "$have_af_vsock" = "yes" ; then
   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
 fi
 
-if test "$have_sysmacros" = "yes" ; then
-  echo "CONFIG_SYSMACROS=y" >> $config_host_mak
-fi
-
 if test "$have_static_assert" = "yes" ; then
   echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
 fi
 
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
index 5e63a21bc1..0b9dac5546 100644
--- a/meson.build
+++ b/meson.build
@@ -1283,6 +1283,7 @@ config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_functio
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
 config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
+config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
@@ -1299,14 +1300,23 @@ config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
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
 config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim', prefix: '#include <sys/stat.h>'))
+config_host_data.set('HAVE_UTMPX',
+                     cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
-- 
2.31.1



