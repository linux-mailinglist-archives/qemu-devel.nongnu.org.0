Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C02D90B3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 22:07:11 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koYaE-0003hi-Eo
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 16:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1koYYb-0003Fi-K5
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:05:29 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1koYYZ-0004Pm-Q7
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:05:29 -0500
Received: by mail-wr1-x441.google.com with SMTP id r7so14455535wrc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dt9tpwHGI6vDGyq01id6XHB91Tc95t3+MPIang5Y0Qc=;
 b=exajnh9hmclrVq02iN1oPGJSgM7u2CavzgRMGS6ofWfyQ3DQNniNBAaHtDNT0RBPLr
 FKXRqH32PsGvKbPuI5IRwpWDg+vp4DSh4x9xargRPbAg49aGOvr1cyHkSnuUAxwufnC3
 r8+iuFAkJiQIh4k+4UoHfmkvQV+csSYmWysqSdtZVTPI1U6JUNd3fCgBzr+HJvicjGJN
 F0OEC2Kbp270MdW2V+ew3WJkFTnJKWy+DytLJ8NqYTlrim6S5Gtyw0S1VlRMOUNilIZS
 glCElxLnQ2N0R05NRo39kFCnTcRGHhSEDo8exqe+yfSnekZ7AWMGGj6eeImq7eKU0cqt
 euJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dt9tpwHGI6vDGyq01id6XHB91Tc95t3+MPIang5Y0Qc=;
 b=r08yaJLU0kNb/1QZ2U3W/GBZD/lkIjTDnPp+GBRmt35/qR+oFgJkp5/v3juGgNiQnH
 gUnWigYBDi2XoNzDqk5TFn5d0kH24LfeqeKh+Gsz5o7eydX16p96pXB/+YS/XsJTwIXP
 te26q/o7Y8nawi5x9EwhJ+AYfOAvmnYuJPbS9Hx0waIIAMYGBQJb3niV+S88GmJuvH/E
 GFele71+pQ8ZAk3tL/XHW/wnXUBoMp6i4eGFnVJpAIyVpeGQQyaZxfbuZAwuaYJBPyQY
 IBvFtk3f6OQ36/8Jx2SVrdZ7ttBQmclWSmFVYRLIFa/28AzOgiJVU56Wt2GcK44WnrkT
 G0iA==
X-Gm-Message-State: AOAM532+4clt9hMCWh4oNeTcicXuM1jD2qzBEZrmI1TMRsREqy3tTJC3
 Vqo4qtv2EYSIkqRnkhuviEuJVnfYgwpi7Q==
X-Google-Smtp-Source: ABdhPJxMIuoRJNKmIee+V/ka0UIyptNj+fJ+cydjo7F1sECfW4FWb75K9wrFcFBb5ZkwSn3fNUj4rw==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr25657182wra.252.1607893524427; 
 Sun, 13 Dec 2020 13:05:24 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id x25sm26323367wmc.3.2020.12.13.13.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 13:05:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/usb/host-libusb.c: fix build with kernel < 5.0
Date: Sun, 13 Dec 2020 22:04:55 +0100
Message-Id: <20201213210455.299668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x441.google.com
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

However, the assumtion that distros with old kernels also have old
libusb is just wrong so also add a check for defined(USBDEVFS_GET_SPEED)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 hw/usb/host-libusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d10..0343300d3e 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -941,7 +941,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_host_ep_update(s);
 
     libusb_speed = libusb_get_device_speed(dev);
-#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
+#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX) && defined(USBDEVFS_GET_SPEED)
     if (hostfd && libusb_speed == 0) {
         /*
          * Workaround libusb bug: libusb_get_device_speed() does not
-- 
2.29.2


