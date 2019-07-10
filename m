Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259161F0F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkTC5-0003rf-GS
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 08:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hkTAM-0002nK-DX
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 08:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hkTAL-0000o1-Hs
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 08:54:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hkTAL-0000ng-CY; Mon, 08 Jul 2019 08:54:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A37583086220;
 Mon,  8 Jul 2019 12:54:44 +0000 (UTC)
Received: from localhost (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE2157984;
 Mon,  8 Jul 2019 12:54:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <rth@twiddle.net>, David Hildenbrand <david@redhat.com>
Date: Mon,  8 Jul 2019 14:54:32 +0200
Message-Id: <20190708125433.16927-2-cohuck@redhat.com>
In-Reply-To: <20190708125433.16927-1-cohuck@redhat.com>
References: <20190708125433.16927-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 08 Jul 2019 12:54:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 1/2] s390x/pci: add some fallthrough
 annotations
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the comment, the bits are supposed to accumulate.

Reported-by: Stefan Weil <sw@weilnetz.de>
Fixes: 5d1abf234462 ("s390x/pci: enforce zPCI state checking")
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 61f30b8e55d2..00235148bed7 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -1209,8 +1209,10 @@ int stpcifc_service_call(S390CPU *cpu, uint8_t r1,=
 uint64_t fiba, uint8_t ar,
      * FH Enabled bit is set to one in states of ENABLED, BLOCKED or ERR=
OR. */
     case ZPCI_FS_ERROR:
         fib.fc |=3D 0x20;
+        /* fallthrough */
     case ZPCI_FS_BLOCKED:
         fib.fc |=3D 0x40;
+        /* fallthrough */
     case ZPCI_FS_ENABLED:
         fib.fc |=3D 0x80;
         if (pbdev->iommu->enabled) {
--=20
2.20.1


