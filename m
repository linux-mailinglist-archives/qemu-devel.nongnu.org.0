Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D868113C741
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:19:18 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkRx-0001UY-5V
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJo-0007Jr-Aq
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJn-0007yU-6t
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27361
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJn-0007yF-49
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9ndBPeKwsE+jjFBT4lAnMcG/cunJ5HpO3N73YwCRs8=;
 b=EbjnPKHL+t+Jh6xCIj85e/IZknV8Bgxaof6zOwKpSJaGXCkxFLCX8SzW52GtNyaxCeKxRU
 5uAtEUonFw/wGrBmre4KmwIzJdDo6h1QSE/Gyve4iQZ8rC85o/1CEaKjuw4iN3YYvapi8m
 flM5PW8y4yqErs7eydylnH3hs8CbV6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-9xRopltIOq2K0AHsATBuYA-1; Wed, 15 Jan 2020 10:10:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E331FB74830;
 Wed, 15 Jan 2020 15:10:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE9E28DFA;
 Wed, 15 Jan 2020 15:10:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/86] hw:aspeed: drop warning and bogus ram_size fixup
Date: Wed, 15 Jan 2020 16:06:24 +0100
Message-Id: <1579100861-73692-10-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 9xRopltIOq2K0AHsATBuYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was useless to try fixup ram_size and print warning
on guest access to config register to begin with.

Now previous patch made sure that SDMC can not be realized
with invalid RAM size, so there is no case where warning
and not used ram_size fixup could be triggered.

So remove now dead code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 hw/misc/aspeed_sdmc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index b398e36..942b27a 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -219,17 +219,8 @@ static int aspeed_get_ram_feat(AspeedSDMCState *s)
 {
     AspeedSDMCClass *asc =3D ASPEED_SDMC_GET_CLASS(s);
     int ram_mb =3D s->ram_size >> 20;
-    gpointer val;
+    gpointer val =3D g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ra=
m_mb));
=20
-    if (g_hash_table_contains(asc->ram2feat, GINT_TO_POINTER(ram_mb))) {
-        val =3D g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ram_mb)=
);
-        return GPOINTER_TO_INT(val);
-    }
-
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default %dM",
-                 s->ram_size, asc->fallback_ram_size);
-    s->ram_size =3D asc->fallback_ram_size << 20;
-    val =3D g_hash_table_lookup(asc->ram2feat, &asc->fallback_ram_size);
     return GPOINTER_TO_INT(val);
 }
=20
--=20
2.7.4


