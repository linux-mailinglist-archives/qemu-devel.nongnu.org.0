Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E7A09E3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 20:46:35 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i32xl-0007QU-NW
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 14:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i32si-0002Ve-Cr
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i32sg-0003p2-DX
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i32sf-0003oK-O7
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0920418C426F;
 Wed, 28 Aug 2019 18:41:17 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E13860BEC;
 Wed, 28 Aug 2019 18:41:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2019 15:40:26 -0300
Message-Id: <20190828184026.5840-13-ehabkost@redhat.com>
In-Reply-To: <20190828184026.5840-1-ehabkost@redhat.com>
References: <20190828184026.5840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 28 Aug 2019 18:41:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 12/12] i386/vmmouse: Properly reset state
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

nb_queue was not zeroed so that we no longer delivered events if a
previous guest left the device in an overflow state.

The state of absolute does not matter as the next vmmouse_update_handler
call will align it again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Message-Id: <f056c7e5-fa74-469c-87f8-0f0925301b2d@web.de>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/i386/vmmouse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 012ab90396..41ad91ad53 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -258,6 +258,7 @@ static void vmmouse_reset(DeviceState *d)
     VMMouseState *s =3D VMMOUSE(d);
=20
     s->queue_size =3D VMMOUSE_QUEUE_SIZE;
+    s->nb_queue =3D 0;
=20
     vmmouse_disable(s);
 }
--=20
2.21.0


