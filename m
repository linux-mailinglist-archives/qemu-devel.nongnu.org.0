Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B82B5C79
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:02:52 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexp5-0000hQ-AT
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkU-0003W3-7M
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkP-0003W4-JF
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uh9t5ip6sH+jKAgMU4sCMihCzZZ0cwJnHv1Jcq/iOZE=;
 b=UOATS7INfaYnV7zI6Kux9vArZZJnYqNMbVg4MAUTFTz5AA/GpgDnaOURvaRSeNrNEPhVR/
 13McC0Xg5mvGnnPvHdtzrHy5TdG4PIsZHUi6LKOCS0PfiacWQYmeiWjdCVA8YGRr4qifbH
 vK0cR8UuQlLEOTbWd5FzYuS9GJzN3v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-GaY4f9PNN2eisiX2FtWWUw-1; Tue, 17 Nov 2020 04:57:57 -0500
X-MC-Unique: GaY4f9PNN2eisiX2FtWWUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B828030AA;
 Tue, 17 Nov 2020 09:57:56 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA5CF5B4B6;
 Tue, 17 Nov 2020 09:57:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/12] configure: Add a proper check for sys/ioccom.h and use
 it in tpm_ioctl.h
Date: Tue, 17 Nov 2020 10:57:40 +0100
Message-Id: <20201117095748.122371-5-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
Add a proper check for this header to our build system, and make sure
to include the header in tpm_ioctl.h to fix a build failure on Solaris
and Haiku.

Message-Id: <20201115152317.42752-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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
index 132bc49782..30f86ddafb 100644
--- a/meson.build
+++ b/meson.build
@@ -794,6 +794,8 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
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


