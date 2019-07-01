Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904271148F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6Ul-0006sz-NH
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:51:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM6GO-0002BK-V8
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM6GM-00015X-W1
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:36:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hM6GK-0000hs-5G
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:36:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 924963007C26;
	Thu,  2 May 2019 07:35:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 891588271B;
	Thu,  2 May 2019 07:35:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9A84417536; Thu,  2 May 2019 09:35:43 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 09:35:40 +0200
Message-Id: <20190502073543.4391-5-kraxel@redhat.com>
In-Reply-To: <20190502073543.4391-1-kraxel@redhat.com>
References: <20190502073543.4391-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 02 May 2019 07:35:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/7] usb/xhci: avoid trigger assertion if guest
 write wrong epid
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Longpeng <longpeng2@huawei.com>, Gonglei <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

we found the following core in our environment:
0  0x00007fc6b06c2237 in raise ()
1  0x00007fc6b06c3928 in abort ()
2  0x00007fc6b06bb056 in __assert_fail_base ()
3  0x00007fc6b06bb102 in __assert_fail ()
4  0x0000000000702e36 in xhci_kick_ep (...)
5  0x000000000047897a in memory_region_write_accessor (...)
6  0x000000000047767f in access_with_adjusted_size (...)
7  0x000000000047944d in memory_region_dispatch_write (...)
(mr=3Dmr@entry=3D0x7fc6a0138df0, addr=3Daddr@entry=3D156, data=3D16488924=
16,
size=3Dsize@entry=3D4, attrs=3Dattrs@entry=3D...)
8  0x000000000042df17 in address_space_write_continue (...)
10 0x000000000043084d in address_space_rw (...)
11 0x000000000047451b in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x1ab11b0)
12 0x000000000045dcf5 in qemu_kvm_cpu_thread_fn (arg=3D0x1ab11b0)
13 0x0000000000870631 in qemu_thread_start (args=3Dargs@entry=3D0x1acfb50=
)
14 0x00000000008959a7 in thread_entry_for_hotfix (pthread_cb=3D<optimized=
 out>)
15 0x00007fc6b0a60dd5 in start_thread ()
16 0x00007fc6b078a59d in clone ()

(gdb) f 5
5  0x000000000047897a in memory_region_write_accessor (...)
529	    mr->ops->write(mr->opaque, addr, tmp, size);
(gdb) p /x tmp
$9 =3D 0x62481a00 <-- last byte 0x00 is @epid

xhci_doorbell_write() already check the upper bound of @slotid an @epid,
it also need to check the lower bound.

Cc: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 1556605301-44112-1-git-send-email-longpeng2@huawei.com

[ kraxel: fixed typo in subject line ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ec28bee31963..d8472b4fea7f 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3137,7 +3137,7 @@ static void xhci_doorbell_write(void *ptr, hwaddr r=
eg,
         streamid =3D (val >> 16) & 0xffff;
         if (reg > xhci->numslots) {
             DPRINTF("xhci: bad doorbell %d\n", (int)reg);
-        } else if (epid > 31) {
+        } else if (epid =3D=3D 0 || epid > 31) {
             DPRINTF("xhci: bad doorbell %d write: 0x%x\n",
                     (int)reg, (uint32_t)val);
         } else {
--=20
2.18.1


