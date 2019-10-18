Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FCDC3A7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLQ7E-00038i-Gd
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iLPuP-00069W-Ke
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iLPuO-0001bU-7G
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:55:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iLPuN-0001ai-Mj
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:55:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E82008A1C80;
 Fri, 18 Oct 2019 10:54:58 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D11B5D71C;
 Fri, 18 Oct 2019 10:54:46 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 11/15] hw/intc/apic: reject pic ints if isa_pic == NULL
Date: Fri, 18 Oct 2019 12:53:11 +0200
Message-Id: <20191018105315.27511-12-slp@redhat.com>
In-Reply-To: <20191018105315.27511-1-slp@redhat.com>
References: <20191018105315.27511-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 18 Oct 2019 10:54:59 +0000 (UTC)
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
Cc: berrange@redhat.com, ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>,
 mst@redhat.com, lersek@redhat.com, groug@kaod.org, marcandre.lureau@gmail.com,
 kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
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


