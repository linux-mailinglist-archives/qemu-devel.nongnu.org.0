Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33E3715FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:31:53 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYfw-0006O2-C7
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdb-0005En-RJ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdZ-0000Zc-0O
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620048564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIQWoOj7e0dsIa7hkFCElsSBHzeF9k3Da95taQOwAFU=;
 b=RWRgEs+yvehCFaNEEgEt13WRee/bo5sdZ7OGjAWd5sddDAfZbK8GNjPTKLP03cpThGtx4r
 JcB/jJYe4XtgO0VY/at6mXpse4/cpZbm7DI5Ov0zrr4Dwyhk9HkzAIUNEw6qob3Wl21t5/
 2P4c8+ic0mKmTd9bFl3/c9wJtDDmrAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-aewLHL65POCH3yrH2J855g-1; Mon, 03 May 2021 09:29:22 -0400
X-MC-Unique: aewLHL65POCH3yrH2J855g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CFA31008060;
 Mon,  3 May 2021 13:29:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27AB9100F49F;
 Mon,  3 May 2021 13:29:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9DCA61CEC735; Mon,  3 May 2021 15:29:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] usb/hid: avoid dynamic stack allocation
Date: Mon,  3 May 2021 15:29:11 +0200
Message-Id: <20210503132915.2335822-2-kraxel@redhat.com>
In-Reply-To: <20210503132915.2335822-1-kraxel@redhat.com>
References: <20210503132915.2335822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com, philmd@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.30.2


