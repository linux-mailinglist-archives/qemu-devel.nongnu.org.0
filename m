Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C82C6BDF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:16:08 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijDz-0006Js-JM
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiidr-0003aL-Fp
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:38:49 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:54263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiido-0001rd-7d
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:38:47 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MS3rB-1kcMjC3YnT-00TV1n for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020
 19:38:41 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: usb: fix break on older kernel headers that miss
 USBDEVFS_GET_SPEED
Date: Fri, 27 Nov 2020 19:38:40 +0100
Message-Id: <20201127183840.10315-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:54ACOQ6+jNtqKQrqmy3lSB38xRAQbb7bfjj0QsUhI1Q6L9gLtvZ
 S9M9DfxwcoH0CxQVRROjs5UvFFGfVuwx3GvOKD1Vs2TOWpp0EwqmsTnZqXe13rtS+VGDZVZ
 BeGGCeqtIdGPS9DgBXzDBXdbVNwkVaGUQq1qjqDVJwq/0wmbOUpgaouen4ZYFv/JcTUCKs1
 sFaquGB1TvVdtW45TOmcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WAfCgQOdSDo=:ofkqPrxxN6VGxMMC8sIiOV
 9QmlDg9AOFjxHcWrKTJ2Ux25EIz2xEBtWWP8fDBBLneQSo4T2HP9wwEixJk3dR5E+OK4w4ium
 dlRyFNezGG7GDy5FK7hTjK/tF+RATODzEBrV6QKzahjtHwTYnT7HVjhustOe1v/1pmramUBtv
 mcVuhxqaPCS+0vySFU8dfS9JAug4plv3C/lCjo/qEUJfBXE8K4/6SE9QpPq2ntZFbKigQN4Ie
 37hsrGnmJ24R1UtSRxYXOs+BePBJQN332H4QXaU73Ncu9Uj81dvIHSMFmJqsdP3Lsv2gi9O94
 R7cF46tj8FYCjDy2wQmBZXyUy8kKhwIQWTqGUosUzWlKzhkraahajoTejTN0Ku9qfdvPp+wa4
 4TYhIftSs0AnBlI3rViUseyEZZNDcWACs/BFAK0itrxm+CaVm0KchL5PqRQce
Received-SPF: none client-ip=212.227.17.24; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Older kernel headers lack the USBDEVFS_GET_SPEED ioctl. Qemu can easily
work without it, but the api version check isn't sufficient. Instead
time consuming bisection, for finding the really correct version, just
change the ifdef to look for the symbol, instead of api version.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 hw/usb/host-libusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d10..c894a4b148 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -941,7 +941,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_host_ep_update(s);
 
     libusb_speed = libusb_get_device_speed(dev);
-#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
+#ifdef USBDEVFS_GET_SPEED
     if (hostfd && libusb_speed == 0) {
         /*
          * Workaround libusb bug: libusb_get_device_speed() does not
-- 
2.11.0


