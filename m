Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDF207522
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 16:01:46 +0200 (CEST)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo5yD-0001FK-6C
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo5iT-0006OY-MU
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 09:45:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55761
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo5iR-0001Tv-A3
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 09:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593006326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=XcWgkR0rNOiq/Q7jbJaQqJ7LVW7vTFFdIQUvsHc6FHM=;
 b=H4EEUBZ/hVOazmWculBKwinL+fvNMjHRtm1XthDBVukbruNA6Z2xO5asC22lQz+b3kFFUS
 rtlFEgh5HzHiMcUrtz6pvCQg/+f1EmrxPQR2m5SRMhZivFD9lzWOLjw6BeKxR8CBhdxk05
 /IZCkuAx2QuciB5Vv8s2Hl4kebsw6NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-omce2f8fNimABCvElVXwyA-1; Wed, 24 Jun 2020 09:45:20 -0400
X-MC-Unique: omce2f8fNimABCvElVXwyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D4B80B733;
 Wed, 24 Jun 2020 13:45:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A84771660;
 Wed, 24 Jun 2020 13:45:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61E0D16E16; Wed, 24 Jun 2020 15:45:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: fix usb-host build on windows.
Date: Wed, 24 Jun 2020 15:45:10 +0200
Message-Id: <20200624134510.9381-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems the new API is not available on windows.
Update #ifdefs accordingly.

Fixes: 9f815e83e983 ("usb: add hostdevice property to usb-host")
Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index ad7ed8fb0c67..c474551d8456 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -907,7 +907,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
             goto fail;
         }
     } else {
-#if LIBUSB_API_VERSION >= 0x01000107
+#if LIBUSB_API_VERSION >= 0x01000107 && !defined(CONFIG_WIN32)
         trace_usb_host_open_hostfd(hostfd);
 
         rc = libusb_wrap_sys_device(ctx, hostfd, &s->dh);
@@ -1107,7 +1107,7 @@ static void usb_host_realize(USBDevice *udev, Error **errp)
     QTAILQ_INIT(&s->isorings);
     s->hostfd = -1;
 
-#if LIBUSB_API_VERSION >= 0x01000107
+#if LIBUSB_API_VERSION >= 0x01000107 && !defined(CONFIG_WIN32)
     if (s->hostdevice) {
         int fd;
         s->needs_autoscan = false;
-- 
2.18.4


