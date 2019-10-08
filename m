Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF6CFBFB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:08:14 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHq9s-0005C1-KF
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iHq05-0004uU-OL
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iHq03-0005Uq-QH
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:58:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33432)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iHq01-0005TI-RS
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:58:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8A2228771B;
 Tue,  8 Oct 2019 13:58:00 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E856C600CE;
 Tue,  8 Oct 2019 13:57:52 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/12] hw/intc/apic: reject pic ints if isa_pic == NULL
Date: Tue,  8 Oct 2019 15:55:34 +0200
Message-Id: <20191008135537.197867-9-slp@redhat.com>
In-Reply-To: <20191008135537.197867-1-slp@redhat.com>
References: <20191008135537.197867-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 08 Oct 2019 13:58:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In apic_accept_pic_intr(), reject PIC interruptions if a i8259 PIC has
not been instantiated (isa_pic =3D=3D NULL).

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/intc/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index bce89911dc..2a74f7b4bf 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -610,7 +610,7 @@ int apic_accept_pic_intr(DeviceState *dev)
=20
     if ((s->apicbase & MSR_IA32_APICBASE_ENABLE) =3D=3D 0 ||
         (lvt0 & APIC_LVT_MASKED) =3D=3D 0)
-        return 1;
+        return isa_pic !=3D NULL;
=20
     return 0;
 }
--=20
2.21.0


