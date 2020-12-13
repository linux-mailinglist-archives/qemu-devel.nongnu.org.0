Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED62D90CC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 22:45:45 +0100 (CET)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koZBY-0005Mw-4x
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 16:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1koYx3-0008O5-Tf
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:30:48 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1koYwz-0001xM-Ih
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:30:45 -0500
Received: by mail-wm1-x341.google.com with SMTP id q75so13521743wme.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 13:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/CBT9zkyNu84+Mc7HpXUh1k3ATqwRVvBJXNtEPW0VQ=;
 b=VOJbUyiA3kdRHxU80MKVLlqd07S4SSXoJW2//DTx3mYOx95zAO+BSSKnKc+cYsZaEI
 tEUNzv+SDTThRtmgKaRAS2jrf4SzQIqW5aV19SGlIO2fH2VijTwlX8jgVQ82FvEIR1ks
 BHCj692/Fay2QNq7FpG2Mc533CtVuUvFBnCcK3sboGbyFg7ubJep9/jlopTD+7aFhiKj
 CqB6AoNM69Idi/VLvkiDD4IfTx75W6bZ4/E48trulsdQndvVWh4+Kon5tEtq2kLb6Cpk
 nbWMLoUvgnkbKZmj9pObCxwrs79zsHuhkao1LB6pbe1rKoBCMGS1z4zD/Q2kl8hO6RdO
 9NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/CBT9zkyNu84+Mc7HpXUh1k3ATqwRVvBJXNtEPW0VQ=;
 b=sT5bdKAQWC+kXjrWzcsXNsjQQbeWHHbuhVSeCpKAfkPg2bY1O1z4R3vFCJqJEVpPst
 jL5myA+DOw6i8JLrt7eLtjVkVU7IUhwFhzS+q2MBxFhxtcBa+/gksyDa6crMtKdKTAfG
 5w62uUFSX2ZvTMVJTC6o37065ho82MzonSFkQg/D+K2PxL2D5jnEhx+daQxrsRgqJfdM
 mOHcPU2r+G1sD1vTuQFwHsfAOBDkK/5XE6FhWkZRTb5ZR+NQHDuZfSXQbSAYnVnZ7NXN
 lDCpMKC1zQFKoWUmd7lkSrRBev/TbjzIeymuWmX86sSkNgIJ02jD9GivoogJ8IKSb2DF
 JK2A==
X-Gm-Message-State: AOAM532iv+uF9q6c0JV7ugfcHgt0/wzmcvsdcVt1EzxlCtXcKXapwDmb
 PWn2wBWQSUFiTsp1z7NBGPJHsM0nxzj9gQ==
X-Google-Smtp-Source: ABdhPJy6PV/AFvHF875Y5wjCKkZ95YTo9hDA41LNBGbFXmgPvfFLSAgOqgevAAV3tbO7jNXKEX/PDg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr25495756wmc.185.1607895037037; 
 Sun, 13 Dec 2020 13:30:37 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id z13sm30801454wmz.3.2020.12.13.13.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 13:30:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/usb/host-libusb.c: fix build with kernel < 5.0
Date: Sun, 13 Dec 2020 22:30:16 +0100
Message-Id: <20201213213016.457350-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

USBDEVFS_GET_SPEED is used since version 5.2.0 and
https://gitlab.com/qemu-project/qemu/-/commit/202d69a715a4b1824dcd7ec1683d027ed2bae6d3
resulting in the following build failure with kernel < 5.0:

../hw/usb/host-libusb.c: In function 'usb_host_open':
../hw/usb/host-libusb.c:953:32: error: 'USBDEVFS_GET_SPEED' undeclared (first use in this function); did you mean 'USBDEVFS_GETDRIVER'?
         int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
                                ^~~~~~~~~~~~~~~~~~
                                USBDEVFS_GETDRIVER

A tentative was made to fix this build failure with
https://gitlab.com/qemu-project/qemu/-/commit/4969e697c15ac536d5c0700381d5d026ef7f0588

However, the assumption that distros with old kernels also have old
libusb is just wrong so also add a check for defined(USBDEVFS_GET_SPEED)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix error about line being over 90 characters

 hw/usb/host-libusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d10..07ccceb16d 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -941,7 +941,8 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_host_ep_update(s);
 
     libusb_speed = libusb_get_device_speed(dev);
-#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
+#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX) && \
+	defined(USBDEVFS_GET_SPEED)
     if (hostfd && libusb_speed == 0) {
         /*
          * Workaround libusb bug: libusb_get_device_speed() does not
-- 
2.29.2


