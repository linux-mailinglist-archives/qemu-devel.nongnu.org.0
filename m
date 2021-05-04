Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A193727AE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:59:11 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqta-0005lg-BX
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoV-0008Dp-6T
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoS-0005e0-7j
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620118431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MG8+HLYcLD6OQYXdck3O/eW9YnIf4YN4tJ6E6N4FxpQ=;
 b=KcwpPyLArIMNmi6O6vbnGnSrBZ3SK6CrtI6i0GJ4jY10jlHh/lnH63Cmt+KbxoSr+HkORa
 W+wU+TaT0a+rBsSYxIR/aAE8+XaRc1AYteJ3HanKC1B3fQgd7RsRVDnm3f7Io3lA2ahwJw
 fU9fkCH5T52mJj1PX+xLU0rjhUsAbZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-k6QwwBC0MwG1pblNM3HZtw-1; Tue, 04 May 2021 04:53:50 -0400
X-MC-Unique: k6QwwBC0MwG1pblNM3HZtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8859F801B12
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:53:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 403DC1A866;
 Tue,  4 May 2021 08:53:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B1564180062B; Tue,  4 May 2021 10:53:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] usb/hid: avoid dynamic stack allocation
Date: Tue,  4 May 2021 10:53:13 +0200
Message-Id: <20210504085317.207369-4-kraxel@redhat.com>
In-Reply-To: <20210504085317.207369-1-kraxel@redhat.com>
References: <20210504085317.207369-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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


