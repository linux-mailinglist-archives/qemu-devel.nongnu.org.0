Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4ECB9A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 13:59:13 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGMEq-00058w-34
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 07:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iGLpU-0000Se-Vv
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 07:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iGLpT-0000tt-UZ
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 07:33:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iGLpT-0000tl-P4; Fri, 04 Oct 2019 07:32:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D37D98A1CA3;
 Fri,  4 Oct 2019 11:32:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95E9A1001B30;
 Fri,  4 Oct 2019 11:32:51 +0000 (UTC)
Date: Fri, 4 Oct 2019 13:32:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 01/11] hw/acpi/piix4: Convert reset handler to DeviceReset
Message-ID: <20191004133251.1ca7791c@redhat.com>
In-Reply-To: <20190926151733.25349-2-philmd@redhat.com>
References: <20190926151733.25349-1-philmd@redhat.com>
 <20190926151733.25349-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 04 Oct 2019 11:32:59 +0000 (UTC)
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Sep 2019 17:17:23 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Convert the reset handler into a proper Device reset method.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/piix4.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 5742c3df87..4e079b39bd 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -27,7 +27,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/acpi/acpi.h"
> -#include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "qapi/error.h"
> @@ -344,9 +343,9 @@ static const VMStateDescription vmstate_acpi =3D {
>      }
>  };
> =20
> -static void piix4_reset(void *opaque)
> +static void piix4_pm_reset(DeviceState *dev)
>  {
> -    PIIX4PMState *s =3D opaque;
> +    PIIX4PMState *s =3D PIIX4_PM(dev);
>      PCIDevice *d =3D PCI_DEVICE(s);
>      uint8_t *pci_conf =3D d->config;
> =20
> @@ -542,7 +541,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error **=
errp)
> =20
>      s->machine_ready.notify =3D piix4_pm_machine_ready;
>      qemu_add_machine_init_done_notifier(&s->machine_ready);
> -    qemu_register_reset(piix4_reset, s);
> =20
>      piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
>                                     pci_get_bus(dev), s);
> @@ -692,6 +690,7 @@ static void piix4_pm_class_init(ObjectClass *klass, v=
oid *data)
>      k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_3;
>      k->revision =3D 0x03;
>      k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
> +    dc->reset =3D piix4_pm_reset;
>      dc->desc =3D "PM";
>      dc->vmsd =3D &vmstate_acpi;
>      dc->props =3D piix4_pm_properties;


