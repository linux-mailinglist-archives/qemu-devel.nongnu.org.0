Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD0373C0C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:11:45 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHJY-0008Bn-O0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leHFQ-00034a-R6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leHFO-0000Yd-IN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620220046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MG8+HLYcLD6OQYXdck3O/eW9YnIf4YN4tJ6E6N4FxpQ=;
 b=Pm5+/y5KWtLm3+Yd05d/3dKfxrG2T6PDC/tBn4OHtk4wRKf1G5zbDpHQYc+RXgHFj4cNMp
 lXg+qTmUSZ8jJg+g8Aqn1aTk6vYj3GwzxmufH6m6kMUDMpe7rFUGIhq28woTVZ9qKY5hQ+
 oaaSZKEHym3dE/1CgiORwc7NGnF8oSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-SI7E-ga8MOeS8X10gmi9Lg-1; Wed, 05 May 2021 09:07:24 -0400
X-MC-Unique: SI7E-ga8MOeS8X10gmi9Lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 708926D4E0
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 13:07:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3776E60875;
 Wed,  5 May 2021 13:07:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 963CD18007A2; Wed,  5 May 2021 15:07:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] usb/hid: avoid dynamic stack allocation
Date: Wed,  5 May 2021 15:07:13 +0200
Message-Id: <20210505130716.1128420-4-kraxel@redhat.com>
In-Reply-To: <20210505130716.1128420-1-kraxel@redhat.com>
References: <20210505130716.1128420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210503132915.2335822-2-kraxel@redhat.com>
---
 hw/usb/dev-hid.c   | 2 +-
 hw/usb/dev-wacom.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index fc39bab79f94..1c7ae97c3033 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -656,7 +656,7 @@ static void usb_hid_handle_data(USBDevice *dev, USBPacket *p)
 {
     USBHIDState *us = USB_HID(dev);
     HIDState *hs = &us->hid;
-    uint8_t buf[p->iov.size];
+    g_autofree uint8_t *buf = g_malloc(p->iov.size);
     int len = 0;
 
     switch (p->pid) {
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index b59504863509..ed687bc9f1eb 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -301,7 +301,7 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
 static void usb_wacom_handle_data(USBDevice *dev, USBPacket *p)
 {
     USBWacomState *s = (USBWacomState *) dev;
-    uint8_t buf[p->iov.size];
+    g_autofree uint8_t *buf = g_malloc(p->iov.size);
     int len = 0;
 
     switch (p->pid) {
-- 
2.31.1


