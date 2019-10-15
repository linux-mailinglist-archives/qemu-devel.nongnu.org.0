Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52597D750E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 13:33:55 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKL5O-0008S4-9z
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 07:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iKKxF-0001VQ-KU
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iKKxD-0004ie-J4
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:25:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iKKxD-0004gA-DD
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:25:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DC27C054C52;
 Tue, 15 Oct 2019 11:25:25 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD6F1001DE4;
 Tue, 15 Oct 2019 11:25:13 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 11/15] hw/intc/apic: reject pic ints if isa_pic == NULL
Date: Tue, 15 Oct 2019 13:23:42 +0200
Message-Id: <20191015112346.45554-12-slp@redhat.com>
In-Reply-To: <20191015112346.45554-1-slp@redhat.com>
References: <20191015112346.45554-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 15 Oct 2019 11:25:25 +0000 (UTC)
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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


