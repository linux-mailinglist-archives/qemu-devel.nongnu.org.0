Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C43DA364
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:53:56 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Xv-00089G-U8
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95V7-0003UX-MA
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95V5-0001XH-RF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+HU0V9i58oM9KPh6nN6C/jT6DAD+3RxlNKXhTT9tKM=;
 b=HoFQZ5WaiQnWU6pHDNGHf3R12F16uEWQ6mzcDUhC7aisA3BnrORQ4WDuM6ox39/PYTOqtZ
 F/X+Ta1U2LHf6/oifeihtIkSlN9AO4a+lHjOuXr5sXEXMiPn+gWoz61gilEIWlIIY+n3TE
 sPDtkPQrIv63zeMSLSa6f3EPss/Rk7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116--Q8tB9MnOVaFysX1b4qMBQ-1; Thu, 29 Jul 2021 08:50:57 -0400
X-MC-Unique: -Q8tB9MnOVaFysX1b4qMBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CFA11084F5D;
 Thu, 29 Jul 2021 12:50:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 317835C1D1;
 Thu, 29 Jul 2021 12:50:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9350518003AA; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] usb-host: wire up timer for windows
Date: Thu, 29 Jul 2021 14:50:38 +0200
Message-Id: <20210729125044.3531457-2-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On windows we can't wait on file descriptors.
Poll libusb using a timer instead.

Fixes long-standing FIXME.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/431
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210623085249.1151901-2-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index c0f314462aaf..00f6fbb29b39 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -254,6 +254,29 @@ static void usb_host_del_fd(int fd, void *user_data)
     qemu_set_fd_handler(fd, NULL, NULL, NULL);
 }
 
+#else
+
+static QEMUTimer *poll_timer;
+static uint32_t request_count;
+
+static void usb_host_timer_kick(void)
+{
+    int64_t delay_ns;
+
+    delay_ns = request_count
+        ? (NANOSECONDS_PER_SECOND / 100)  /* 10 ms interval with active req */
+        : (NANOSECONDS_PER_SECOND);       /* 1 sec interval otherwise */
+    timer_mod(poll_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + delay_ns);
+}
+
+static void usb_host_timer(void *opaque)
+{
+    struct timeval tv = { 0, 0 };
+
+    libusb_handle_events_timeout(ctx, &tv);
+    usb_host_timer_kick();
+}
+
 #endif /* !CONFIG_WIN32 */
 
 static int usb_host_init(void)
@@ -276,7 +299,8 @@ static int usb_host_init(void)
     libusb_set_debug(ctx, loglevel);
 #endif
 #ifdef CONFIG_WIN32
-    /* FIXME: add support for Windows. */
+    poll_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, usb_host_timer, NULL);
+    usb_host_timer_kick();
 #else
     libusb_set_pollfd_notifiers(ctx, usb_host_add_fd,
                                 usb_host_del_fd,
@@ -364,11 +388,18 @@ static USBHostRequest *usb_host_req_alloc(USBHostDevice *s, USBPacket *p,
         r->buffer = g_malloc(bufsize);
     }
     QTAILQ_INSERT_TAIL(&s->requests, r, next);
+#ifdef CONFIG_WIN32
+    request_count++;
+    usb_host_timer_kick();
+#endif
     return r;
 }
 
 static void usb_host_req_free(USBHostRequest *r)
 {
+#ifdef CONFIG_WIN32
+    request_count--;
+#endif
     QTAILQ_REMOVE(&r->host->requests, r, next);
     libusb_free_transfer(r->xfer);
     g_free(r->buffer);
-- 
2.31.1


