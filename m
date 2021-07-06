Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F973BCA39
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:37:46 +0200 (CEST)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iSX-00020F-0g
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu1-0001GX-QA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htz-0002P6-Hl
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id t6so15432010wrm.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BdD6jxidGfMEq7c7dSE3OTNZydmwQIYhRWbOc8EIzE=;
 b=CRKxEkg1/l24mqSjwfoyTQGE1d6p4qf8IkG3gEHJDVEsPMW6VXrz2HWs/qHng7JQyG
 +pIObi5zjBV/dsh8iGPyhPntUKaLWQFaMJF5TY8WGw+aGQt8kdtlfrS7NfFYZ2JGDhB1
 sTn0R/SIXuixzBLgTXD1Jm151ubJaOQHpCA9NGdqfIEctiyWHe67tPyA/9g+K7lfRQJB
 XgWnSh0XpxxzR77ak1XfM4FUGhCdPhpXgJ4Q4qXPN7Zmn/H0RNsgizM7tyuKMpbeQU0m
 UjPEEvqIRgcsA1hFi5npPfCZBdsmtjPQ49L7hD+4p1xgwqjEyjjqgDqCSFesYl3XY9o6
 dU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4BdD6jxidGfMEq7c7dSE3OTNZydmwQIYhRWbOc8EIzE=;
 b=F/0SwSQ62uEpa3D9HlDDvVcqHMuBXTu4vzslD0qFIZrjRDyOqeKfqc0qt9VD7fQzMY
 1ZPP0nrqJ1uMyga1mz5laLNolZiPlPb48tT4T/KsNceH+P3NJlzLZHbFGB3QwFUZe/Mx
 2FEmZthYyef28lYMeeq8GI6jFf3ZeO+qQE0pzB2nIVcp7NEvuE/SMJjBA6zWdLDbgMxK
 CRvg9WuLlf0TqPVzJIXyJwjIXx5FO/eHM3tbDm1H6a2LO+0o5AMnlEYbbfhJGXJ30k0H
 vSOlg+p/BhXqleQJReb7SZ1je3KwCl+NHXzDawBCXdjscekiatYC7ZzXSV5j1sJmWgYz
 ITDw==
X-Gm-Message-State: AOAM530WKBT55KFxdDT6p4w4xikwEhUHqxYyShhp84dZy22ZUpH9Hpsu
 1ATsO2jQ1AbvkxVU5oiurH7xlqqdCYg=
X-Google-Smtp-Source: ABdhPJw+JLiXrI+9IEFznLCDypByNtANiRLsi6FHviIlLBXgGks/WeFP4bwdqBY2t+CNUvXGfX4cyw==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr10407570wrt.113.1625565721761; 
 Tue, 06 Jul 2021 03:02:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/40] configure: convert compiler tests to meson, part 3
Date: Tue,  6 Jul 2021 12:01:30 +0200
Message-Id: <20210706100141.303960-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
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



