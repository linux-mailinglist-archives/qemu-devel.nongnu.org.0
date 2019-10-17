Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27BDB0E4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:17:05 +0200 (CEST)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7WR-00030n-Jv
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iL6ej-0002G6-1P
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iL6ei-0006Nm-0b
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33054)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iL6eh-0006N9-QX; Thu, 17 Oct 2019 10:21:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F33942D6A04;
 Thu, 17 Oct 2019 14:21:30 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAD8719C77;
 Thu, 17 Oct 2019 14:21:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org
Subject: [PATCH] hw/s390x: Emit a warning if user tried to enable USB
Date: Thu, 17 Oct 2019 16:21:23 +0200
Message-Id: <20191017142123.1236-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 17 Oct 2019 14:21:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no USB on s390x, so running qemu-system-s390x with
"-machine ...,usb=on" is certainly wrong. Emit a warning to make
the users aware of their misconfiguration.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 After a year or two, we could finally turn this into a hard error,
 but I think we should give the users some time to fix their command
 lines first, so I'm initially only emitting a warning here.

 hw/s390x/s390-virtio-ccw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d3edeef0ad..af8c4c0daf 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -243,6 +243,10 @@ static void ccw_init(MachineState *machine)
     VirtualCssBus *css_bus;
     DeviceState *dev;
 
+    if (machine->usb) {
+        warn_report("This machine does not support USB");
+    }
+
     s390_sclp_init();
     /* init memory + setup max page size. Required for the CPU model */
     s390_memory_init(machine->ram_size);
-- 
2.18.1


