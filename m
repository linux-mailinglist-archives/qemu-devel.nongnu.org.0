Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF113C72A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:16:47 +0100 (CET)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkPW-0006vt-3U
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJn-0007JM-W8
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJm-0007xw-NX
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48934
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJm-0007xa-JV
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4soJN4twqCsyiZf2IKg4Jq2p25zl6bq/jZfw+9W8Pvs=;
 b=dCwRyB/vLrA88fz/a7PF5Vzypdvqjsde0BQx63qE2T6QVbWI30049ZOEKswe/3HCmW+2U/
 LG8ILv9UCankiPxkeKyHeKO7YnbtYoHtSHABsFm5X6gal5jQNUCPX3bYY9Yt7VswNoUVku
 wy6+6ik8zR25CvsjhK1HjctCjapCHrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-gAbeYznaO9SMa2KIQhLpyw-1; Wed, 15 Jan 2020 10:10:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6A410832CC;
 Wed, 15 Jan 2020 15:10:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A3628988;
 Wed, 15 Jan 2020 15:10:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/86] arm:aspeed: actually check RAM size
Date: Wed, 15 Jan 2020 16:06:23 +0100
Message-Id: <1579100861-73692-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: gAbeYznaO9SMa2KIQhLpyw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

It's supposed that SOC will check if "-m" provided
RAM size is valid by setting "ram-size" property and
then board would read back valid (possibly corrected
value) to map RAM MemoryReging with valid size.
Well it isn't doing so, since check is called only
indirectly from
  aspeed_sdmc_reset()->asc->compute_conf()
or much later when guest writes to configuration
register.

So depending on "-m" value QEMU end-ups with a warning
and an invalid MemoryRegion size allocated and mapped.
(examples:
 -M ast2500-evb -m 1M
    0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000800fffff (prio 0, ram): ram
      0000000080100000-00000000bfffffff (prio 0, i/o): max_ram
 -M ast2500-evb -m 3G
    0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
      0000000080000000-000000013fffffff (prio 0, ram): ram
      [DETECTED OVERFLOW!] 0000000140000000-00000000bfffffff (prio 0, i/o):=
 max_ram
)
On top of that sdmc falls back and reports to guest
"default" size, it thinks machine should have.

I don't know how hardware is supposed to work so
I've kept it as is.
But as for CLI side machine should honor whatever
user configured or error out to make user fix CLI.

This patch makes ram-size check actually work and
changes behavior from a warning later on during
machine reset to error_fatal at the moment SOC is
realized so user will have to fix RAM size on CLI
to start machine.

It also gets out of the way mutable ram-size logic,
so we could consolidate RAM allocation logic around
pre-allocated hostmem backend (supplied by user or
auto created by generic machine code depending on
supplied -m/mem-path/mem-prealloc options.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 hw/arm/aspeed.c       | 9 +--------
 hw/misc/aspeed_sdmc.c | 5 +++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc06af4..525c547 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -213,14 +213,7 @@ static void aspeed_machine_init(MachineState *machine)
                                 "hw-prot-key", &error_abort);
     }
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
-                             &error_abort);
-
-    /*
-     * Allocate RAM after the memory controller has checked the size
-     * was valid. If not, a default value is used.
-     */
-    ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "ram-size",
-                                        &error_abort);
+                             &error_fatal);
=20
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size)=
;
     memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 3fc80f0..b398e36 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -165,6 +165,11 @@ static void aspeed_sdmc_realize(DeviceState *dev, Erro=
r **errp)
     AspeedSDMCState *s =3D ASPEED_SDMC(dev);
     AspeedSDMCClass *asc =3D ASPEED_SDMC_GET_CLASS(s);
=20
+    if (!g_hash_table_contains(asc->ram2feat,
+                               GINT_TO_POINTER(s->ram_size >> 20))) {
+        error_setg(errp, "Invalid RAM size 0x%" PRIx64, s->ram_size);
+        return;
+    }
     s->max_ram_size =3D asc->max_ram_size;
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
--=20
2.7.4


