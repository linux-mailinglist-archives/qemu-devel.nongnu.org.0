Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20432B2EAD
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 17:54:05 +0100 (CET)
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdyoO-0001PX-NA
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 11:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymN-0008VC-F4
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymL-0000TI-S9
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605372717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=hKevCePf+YmCkBj6lSBZPWzUNkMXUtphyqhCqYAO7Hc=;
 b=DaJ6UhvB9ebbW6HFXq3kOS+pBnXIb9i5mspK3maY9Hi8voDLIatySTk7RNAGMyZ+UPQFJK
 ZX+PqZiMU+nNEy8Me+w8KXlm7wcZTNAmLgcnxKszXJV2Mc0agSOR1hPZezqciC3HpRkxgu
 bzV6cjaKky6c0vfeWbpvkD4JgepIdik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-QouY9uCQOZ-6ZkHcD9fDdw-1; Sat, 14 Nov 2020 11:51:53 -0500
X-MC-Unique: QouY9uCQOZ-6ZkHcD9fDdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17A9D804006;
 Sat, 14 Nov 2020 16:51:52 +0000 (UTC)
Received: from thuth.com (ovpn-112-86.ams2.redhat.com [10.36.112.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C63A5F7D8;
 Sat, 14 Nov 2020 16:51:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and use it
 in tpm_ioctl.h
Date: Sat, 14 Nov 2020 17:51:36 +0100
Message-Id: <20201114165137.15379-4-thuth@redhat.com>
In-Reply-To: <20201114165137.15379-1-thuth@redhat.com>
References: <20201114165137.15379-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 11:51:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
Add a proper check for this header to our configure scripts, and
make sure to include the header in tpm_ioctl.h to fix a build failure
on Solaris and Haiku.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 backends/tpm/tpm_ioctl.h |  4 ++++
 configure                | 11 ++++++++++-
 nbd/nbd-internal.h       |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
index f5f5c553a9..bd6c12cb86 100644
--- a/backends/tpm/tpm_ioctl.h
+++ b/backends/tpm/tpm_ioctl.h
@@ -12,6 +12,10 @@
 #include <sys/uio.h>
 #include <sys/ioctl.h>
 
+#ifdef HAVE_SYS_IOCCOM_H
+#include <sys/ioccom.h>
+#endif
+
 /*
  * Every response from a command involving a TPM command execution must hold
  * the ptm_res as the first element.
diff --git a/configure b/configure
index c0acda164d..764e903748 100755
--- a/configure
+++ b/configure
@@ -3123,6 +3123,13 @@ if check_include "sys/signal.h" ; then
   have_sys_signal_h=yes
 fi
 
+#########################################
+# sys/ioccom.h check
+have_sys_ioccom_h=no
+if check_include "sys/ioccom.h" ; then
+  have_sys_ioccom_h=yes
+fi
+
 ##########################################
 # VTE probe
 
@@ -6214,7 +6221,9 @@ fi
 if test "$have_sys_signal_h" = "yes" ; then
     echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
 fi
-
+if test "$have_sys_ioccom_h" = "yes" ; then
+    echo "HAVE_SYS_IOCCOM_H=y" >> $config_host_mak
+fi
 # Work around a system header bug with some kernel/XFS header
 # versions where they both try to define 'struct fsxattr':
 # xfs headers will not try to redefine structs from linux headers
diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 60629ef160..1b2141ab4b 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -19,7 +19,7 @@
 #ifndef _WIN32
 #include <sys/ioctl.h>
 #endif
-#if defined(__sun__) || defined(__HAIKU__)
+#ifdef HAVE_SYS_IOCCOM_H
 #include <sys/ioccom.h>
 #endif
 
-- 
2.18.4


