Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2368212342
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 14:24:39 +0200 (CEST)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqyGd-0003yp-1b
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyDJ-0000BJ-Mh
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51231
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyDI-0000dK-3e
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593692471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=2lksNVHVDfn+JRUysyPNuTS6EqEm1HR/0tS62Mk0Giw=;
 b=dvndFnoDJ64fVq3pKOaYCkwkGe2eNkSbqUOX4JA6gq0SEmjMN4MQAeg3S+bBQjM9VXnsn8
 lGF3XKy3QSKVPMiOUdOQCTsySmMHEO/NH3KJC7QylE+vwm2lR38my2bEsvYSIhJNOm5mEI
 jPbNNGXiJ4zMd9g3+qOw0Wyj+f1n4hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-2UxAlRjYMT66HxTXbv1FAg-1; Thu, 02 Jul 2020 08:21:07 -0400
X-MC-Unique: 2UxAlRjYMT66HxTXbv1FAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C0980DAF0
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 12:20:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB9DB7789F;
 Thu,  2 Jul 2020 12:20:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D29231E93; Thu,  2 Jul 2020 14:20:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] ccid: build smartcard as module
Date: Thu,  2 Jul 2020 14:20:43 +0200
Message-Id: <20200702122048.27798-6-kraxel@redhat.com>
In-Reply-To: <20200702122048.27798-1-kraxel@redhat.com>
References: <20200702122048.27798-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drops libcacard.so dependency from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200624131045.14512-6-kraxel@redhat.com
---
 Makefile.objs        | 1 +
 util/module.c        | 2 ++
 hw/Makefile.objs     | 1 +
 hw/usb/Makefile.objs | 4 +++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile.objs b/Makefile.objs
index 98383972eef3..3d45492d8b46 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -59,6 +59,7 @@ common-obj-y += migration/
 common-obj-y += audio/
 common-obj-m += audio/
 common-obj-y += hw/
+common-obj-m += hw/
 
 common-obj-y += replay/
 
diff --git a/util/module.c b/util/module.c
index ee560a4b4269..89da9a3cce05 100644
--- a/util/module.c
+++ b/util/module.c
@@ -261,6 +261,8 @@ static struct {
     const char *prefix;
     const char *module;
 } const qom_modules[] = {
+    { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
+    { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
 };
 
 static bool module_loaded_qom_all;
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 4cbe5e4e57d6..af8fd9a510ed 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -43,4 +43,5 @@ devices-dirs-y += smbios/
 endif
 
 common-obj-y += $(devices-dirs-y)
+common-obj-m += usb/
 obj-y += $(devices-dirs-y)
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index fa5c3fa1b877..3c5b3d4fadd3 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -29,11 +29,13 @@ common-obj-$(CONFIG_USB_NETWORK)      += dev-network.o
 
 ifeq ($(CONFIG_USB_SMARTCARD),y)
 common-obj-y                          += dev-smartcard-reader.o
-common-obj-$(CONFIG_SMARTCARD)        += smartcard.mo
+ifeq ($(CONFIG_SMARTCARD),y)
+common-obj-m                          += smartcard.mo
 smartcard.mo-objs := ccid-card-passthru.o ccid-card-emulated.o
 smartcard.mo-cflags := $(SMARTCARD_CFLAGS)
 smartcard.mo-libs := $(SMARTCARD_LIBS)
 endif
+endif
 
 ifeq ($(CONFIG_POSIX),y)
 common-obj-$(CONFIG_USB_STORAGE_MTP)  += dev-mtp.o
-- 
2.18.4


