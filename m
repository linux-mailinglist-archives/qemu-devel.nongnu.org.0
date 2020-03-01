Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAA174D1D
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 13:09:52 +0100 (CET)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8NPr-0005hr-L4
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 07:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from <n@nirf.de>)
 id 1j8NLq-00051f-RH
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 07:05:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <n@nirf.de>) id 1j8NLp-0003f0-Sz
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 07:05:42 -0500
Received: from photon.nirf.de ([147.135.208.3]:44708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <n@nirf.de>)
 id 1j8NLp-0003e2-LK; Sun, 01 Mar 2020 07:05:41 -0500
Received: from [10.68.247.14] (pc-68-247.ram.rwth-aachen.de [137.226.68.247])
 by photon.nirf.de (Postfix) with ESMTPSA id 8AF7E4342F;
 Sun,  1 Mar 2020 13:05:32 +0100 (CET)
To: qemu-devel@nongnu.org
From: Nick Erdmann <n@nirf.de>
Subject: [PATCH] vhost-vsock: fix error message output
Message-ID: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
Date: Sun, 1 Mar 2020 13:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 147.135.208.3
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

error_setg_errno takes a positive error number, so we should not invert
errno's sign.

Signed-off-by: Nick Erdmann <n@nirf.de>
---
  hw/virtio/vhost-vsock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 66da96583b..9f9093e196 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -325,7 +325,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
      } else {
          vhostfd = open("/dev/vhost-vsock", O_RDWR);
          if (vhostfd < 0) {
-            error_setg_errno(errp, -errno,
+            error_setg_errno(errp, errno,
                               "vhost-vsock: failed to open vhost device");
              return;
          }
--
2.25.1

