Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311DF634DBF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 03:21:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxfN4-00071t-K1; Tue, 22 Nov 2022 21:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oxfN1-00071b-J9
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 21:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oxfMu-0002Uu-Df
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 21:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669170006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VFI4kxANs+RanTvn2oe88wzgSWDnZB3E8bBWRI/NVFo=;
 b=gAZBD8rqIkc9TFZQ+Ks5RI3LuEXuBa7LH5wRZHlM8DCbuTrUsOaDQk/TW57QM2FblpN29h
 mXt/w5gmCjbe+s2TgQGCJYaOkSKGW/cpnQnvNk67YT2bo5HWTjkYWsFHL8t47DXU9gX1d3
 NXml0SeQkVGww81kqPKIRvFNtLDiI0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-VRHD8ZXfOWCI99XCkxMvqQ-1; Tue, 22 Nov 2022 21:18:46 -0500
X-MC-Unique: VRHD8ZXfOWCI99XCkxMvqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A56D8833A06;
 Wed, 23 Nov 2022 02:18:45 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.16.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F814140EBF3;
 Wed, 23 Nov 2022 02:18:45 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Cc: jmaloy@redhat.com, jasowang@redhat.com, philmd@linaro.com,
 stefanha@redhat.com
Subject: [PATCH] hw/usb: add configuration flags for emulated and passthru usb
 smartcard
Date: Tue, 22 Nov 2022 21:18:42 -0500
Message-Id: <20221123021842.1588898-1-jmaloy@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

We add two new configuration flags, USB_SMARTCARD_PASSTHRU and
USB_SMARTCARD_EMULATED in order to improve configurability
of these two functionalities.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
---
 hw/usb/Kconfig     | 12 ++++++++++++
 hw/usb/meson.build |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index ce4f433976..50a82badd6 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -108,6 +108,18 @@ config USB_SMARTCARD
     bool
     default y
     depends on USB
+    select USB_SMARTCARD_PASSTHRU
+    select USB_SMARTCARD_EMULATED
+
+config USB_SMARTCARD_PASSTHRU
+    bool
+    default y
+    depends on USB
+
+config USB_SMARTCARD_EMULATED
+    bool
+    default y
+    depends on USB
 
 config USB_STORAGE_MTP
     bool
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 793df42e21..353006fb6c 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -51,8 +51,8 @@ softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: files('dev-smartcard-reade
 
 if cacard.found()
   usbsmartcard_ss = ss.source_set()
-  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD',
-                      if_true: [cacard, files('ccid-card-emulated.c', 'ccid-card-passthru.c')])
+  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_EMULATED', if_true: [cacard, files('ccid-card-emulated.c')])
+  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_PASSTHRU', if_true: [cacard, files('ccid-card-passthru.c')])
   hw_usb_modules += {'smartcard': usbsmartcard_ss}
 endif
 
-- 
2.35.3


