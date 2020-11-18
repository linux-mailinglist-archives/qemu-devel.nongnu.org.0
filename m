Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F42B82C6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:19:30 +0100 (CET)
Received: from localhost ([::1]:50240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR7B-00073b-AN
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQzA-0007nK-0x
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz5-00014e-8N
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ZtinZ1XoMAywpC6Gi8Q8+uTef3TkD4+NWoz4UH2jjXY=;
 b=CSylU01FxF1yeLwaUOaLOnAamD0H0EdFID2ZvIgvXPYVOB/lzGpV1MJr6au+MIRJ/2mCt3
 B57AqzCBS9MHGpLg3CGrSBRFXm7pdZcBGSbY+DqJdfU62vtUR46gqTejSo1LMcwQD+l7p+
 jf2uozfh5YgBjynwiNwMBihwcjdHp1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-NEpYeDQaND2_z3Ix2pyt-w-1; Wed, 18 Nov 2020 12:11:04 -0500
X-MC-Unique: NEpYeDQaND2_z3Ix2pyt-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2259D8EC1;
 Wed, 18 Nov 2020 17:11:03 +0000 (UTC)
Received: from thuth.com (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCA460BE2;
 Wed, 18 Nov 2020 17:11:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/6] configure / meson: Move check for sys/signal.h to
 meson.build
Date: Wed, 18 Nov 2020 18:10:51 +0100
Message-Id: <20201118171052.308191-6-thuth@redhat.com>
In-Reply-To: <20201118171052.308191-1-thuth@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This check can be done in a much shorter way in meson.build. And while
we're at it, rename the #define to HAVE_SYS_KCOV_H to match the other
HAVE_someheader_H symbols that we already have.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure            | 9 ---------
 linux-user/ioctls.h  | 2 +-
 linux-user/syscall.c | 2 +-
 meson.build          | 1 +
 4 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 871e4bb9fb..8d40a0beb3 100755
--- a/configure
+++ b/configure
@@ -4389,12 +4389,6 @@ if compile_prog "" "" ; then
   syncfs=yes
 fi
 
-# check for kcov support (kernel must be 4.4+, compiled with certain options)
-kcov=no
-if check_include sys/kcov.h ; then
-    kcov=yes
-fi
-
 # check for btrfs filesystem support (kernel must be 3.9+)
 btrfs=no
 if check_include linux/btrfs.h ; then
@@ -6092,9 +6086,6 @@ fi
 if test "$syncfs" = "yes" ; then
   echo "CONFIG_SYNCFS=y" >> $config_host_mak
 fi
-if test "$kcov" = "yes" ; then
-  echo "CONFIG_KCOV=y" >> $config_host_mak
-fi
 if test "$btrfs" = "yes" ; then
   echo "CONFIG_BTRFS=y" >> $config_host_mak
 fi
diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 585874f090..8efb4d38c0 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -715,7 +715,7 @@
   IOCTL_IGNORE(TIOCSTOP)
 #endif
 
-#ifdef CONFIG_KCOV
+#ifdef HAVE_SYS_KCOV_H
   IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
   IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
   IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 27adee908e..063130be04 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -73,7 +73,7 @@
 #ifdef CONFIG_SENDFILE
 #include <sys/sendfile.h>
 #endif
-#ifdef CONFIG_KCOV
+#ifdef HAVE_SYS_KCOV_H
 #include <sys/kcov.h>
 #endif
 
diff --git a/meson.build b/meson.build
index 054e40e9a5..ab9571a354 100644
--- a/meson.build
+++ b/meson.build
@@ -811,6 +811,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
+config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
-- 
2.18.4


