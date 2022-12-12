Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FB64AA01
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4r19-0004r0-JI; Mon, 12 Dec 2022 17:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1p4r17-0004oo-Pa
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1p4r16-0002qk-81
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670883079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTYNft3QGkHBYWgup2Ht8dKeHkl/oqDyPlUAz/PrA8k=;
 b=bG5oJR7uMfeUyKSRWHbgMEsFKCuUemzx5SKplMEfxcV8tetmoIdA3eQr8N8Z8bxcss432j
 twSC/Vt5Mn4VEEmnKL8/LwjAC3rMLE32bVzG9xOZuE2NuVKn1HYG1Vjnl2sCMsWUtE6DHe
 HlfsuzLkfJpbE/TAnnT0bbEMp3h473g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-Rg9ZFrXROHStmsvNA0eGXg-1; Mon, 12 Dec 2022 17:11:18 -0500
X-MC-Unique: Rg9ZFrXROHStmsvNA0eGXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF3DB101A52A;
 Mon, 12 Dec 2022 22:11:17 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.8.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 833FA492B00;
 Mon, 12 Dec 2022 22:11:17 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, pbonzini@redhat.com, jmaloy@redhat.com,
 jasowang@redhat.com, philmd@linaro.com, stefanha@redhat.com
Subject: [PATCH v3 2/2] hw/usb: add configuration flag for Common Access Card
 library code
Date: Mon, 12 Dec 2022 17:09:49 -0500
Message-Id: <20221212220949.1278269-3-jmaloy@redhat.com>
In-Reply-To: <20221212220949.1278269-1-jmaloy@redhat.com>
References: <20221212220949.1278269-1-jmaloy@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We add a new configuration flag, LIBCACARD, indicating availability of the
libcacard code for building. This way, we can eliminate the explicit test
for cacard.found() when configuring USB_SMARTCARD_EMULATED/USB_SMARTCARD_PASSTHRU
in hw/usb/meson.build.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
---
 Kconfig.host       |  3 +++
 hw/usb/Kconfig     |  2 ++
 hw/usb/meson.build | 11 ++++-------
 meson.build        |  1 +
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Kconfig.host b/Kconfig.host
index d763d89269..d7fd4a2203 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -39,6 +39,9 @@ config MULTIPROCESS_ALLOWED
     bool
     imply MULTIPROCESS
 
+config LIBCACARD
+    bool
+
 config FUZZ
     bool
     select SPARSE_MEM
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 6b29e91593..5c3da7c34d 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -113,12 +113,14 @@ config USB_SMARTCARD_PASSTHRU
     bool
     default y
     depends on USB
+    depends on LIBCACARD
     select USB_SMARTCARD
 
 config USB_SMARTCARD_EMULATED
     bool
     default y
     depends on USB
+    depends on LIBCACARD
     select USB_SMARTCARD
 
 config USB_STORAGE_MTP
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 353006fb6c..499be1122c 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -48,13 +48,10 @@ softmmu_ss.add(when: ['CONFIG_POSIX', 'CONFIG_USB_STORAGE_MTP'], if_true: files(
 
 # smartcard
 softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: files('dev-smartcard-reader.c'))
-
-if cacard.found()
-  usbsmartcard_ss = ss.source_set()
-  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_EMULATED', if_true: [cacard, files('ccid-card-emulated.c')])
-  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_PASSTHRU', if_true: [cacard, files('ccid-card-passthru.c')])
-  hw_usb_modules += {'smartcard': usbsmartcard_ss}
-endif
+usbsmartcard_ss = ss.source_set()
+usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_EMULATED', if_true: [cacard, files('ccid-card-emulated.c')])
+usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_PASSTHRU', if_true: [cacard, files('ccid-card-passthru.c')])
+hw_usb_modules += {'smartcard': usbsmartcard_ss}
 
 # U2F
 softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: files('u2f.c'))
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..10e9b77ec1 100644
--- a/meson.build
+++ b/meson.build
@@ -2493,6 +2493,7 @@ have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   (get_option('fuzzing') ? ['CONFIG_FUZZ=y'] : []) + \
   (have_tpm ? ['CONFIG_TPM=y'] : []) + \
+  (cacard.found() ? ['CONFIG_LIBCACARD=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
-- 
2.35.3


