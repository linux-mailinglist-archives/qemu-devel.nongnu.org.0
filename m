Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7D2B35BA
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 16:24:51 +0100 (CET)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keJta-00021D-LX
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 10:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keJsF-0001UQ-17
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:23:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keJsD-0000t9-CX
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605453804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=d/NJLT+Q+8bCXGw1zRU7zs7QQT3nUhfqzSmM0fsNGnA=;
 b=ZloIDRLOfWmP67rtYxxUwjhM/rX9NR5WxWjxVIA9SwUTo633L3lOD90xioiilpHYS/NuqM
 gTbzTUKiheK1BVK2HW+yIASPney5LUC7/bhbj2BWvupwkr5eX6vLiqRUq4vVWS/iUuErm5
 sYtPAQ10QqPYuWBqPfVowR9O3esfySk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-R2i4aqE7N2WIvn8vtqTAWw-1; Sun, 15 Nov 2020 10:23:23 -0500
X-MC-Unique: R2i4aqE7N2WIvn8vtqTAWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD04A107ACF6;
 Sun, 15 Nov 2020 15:23:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F3F5C1D7;
 Sun, 15 Nov 2020 15:23:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] configure: Add a proper check for sys/ioccom.h and use
 it in tpm_ioctl.h
Date: Sun, 15 Nov 2020 16:23:17 +0100
Message-Id: <20201115152317.42752-1-thuth@redhat.com>
In-Reply-To: <20201114165137.15379-4-thuth@redhat.com>
References: <20201114165137.15379-4-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 10:03:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>,
 =?UTF-8?q?=E7=BD=97=E5=8B=87=E5=88=9A?= <luoyonggang@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
Add a proper check for this header to our build system, and make sure
to include the header in tpm_ioctl.h to fix a build failure on Solaris
and Haiku.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Check in meson.build instead of using the configure script

 backends/tpm/tpm_ioctl.h | 4 ++++
 meson.build              | 2 ++
 nbd/nbd-internal.h       | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/meson.build b/meson.build
index 61d883bc07..be85f70e4c 100644
--- a/meson.build
+++ b/meson.build
@@ -789,6 +789,8 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['HOST_DSOSUF', 'CONFIG_IASL']
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


