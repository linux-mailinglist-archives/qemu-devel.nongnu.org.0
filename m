Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA21F3781
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 12:01:52 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jib4o-0004gz-N9
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 06:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jib3X-0004Ak-Nr
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 06:00:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jib3V-0006I5-PM
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 06:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkAWgdMWVByFGPwXHNbTlA4LwLnaFu6QD4AS3HXcTb8=;
 b=ZeF41Fh08l5f0uA/tHWW6x5a5qllEBjHKtVNc5VsV2abeR1MRmoS80m0u7dq6+Pj5QbDLj
 MwVNh8lTT5ZRj0uP1sX1LmyGLzYjWlZ1TbolBB8NpqYPRhsUGBSxUkHRiAAg3pwHz6h1nR
 fA8zjKmHf+xhRW4N+uPtk+4t+3kWzZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-7qW8gdOBNmabDRE9XRZK-A-1; Tue, 09 Jun 2020 06:00:26 -0400
X-MC-Unique: 7qW8gdOBNmabDRE9XRZK-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4254B107B807
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 10:00:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0811385;
 Tue,  9 Jun 2020 10:00:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4BCE311386A6; Tue,  9 Jun 2020 12:00:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 12/58] qdev: Convert uses of qdev_set_parent_bus()
 manually
References: <20200529134523.8477-1-armbru@redhat.com>
 <20200529134523.8477-13-armbru@redhat.com>
 <2f9d71a7-1e18-a92c-8351-d59a8a9a4298@redhat.com>
Date: Tue, 09 Jun 2020 12:00:22 +0200
In-Reply-To: <2f9d71a7-1e18-a92c-8351-d59a8a9a4298@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 9 Jun 2020 10:12:43
 +0200")
Message-ID: <87lfkwpnih.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/29/20 3:44 PM, Markus Armbruster wrote:
>> Same transformation as in the previous commit.  Manual, because
>> convincing Coccinelle to transform these cases is somewhere between
>> not worthwhile and infeasible (at least for me).
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/pci-host/prep.c |  3 +--
>>  hw/ppc/pnv.c       |  6 ++----
>>  hw/s390x/sclp.c    | 10 ++++------
>>  3 files changed, 7 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
>> index c821ef889d..42c7e63a60 100644
>> --- a/hw/pci-host/prep.c
>> +++ b/hw/pci-host/prep.c
>> @@ -268,7 +268,7 @@ static void raven_pcihost_realizefn(DeviceState *d, =
Error **errp)
>>      memory_region_add_subregion(address_space_mem, 0xbffffff0, &s->pci_=
intack);
>> =20
>>      /* TODO Remove once realize propagates to child devices. */
>> -    object_property_set_bool(OBJECT(&s->pci_dev), true, "realized", err=
p);
>> +    qdev_realize(DEVICE(&s->pci_dev), BUS(&s->pci_bus), errp);
>>  }
>> =20
>>  static void raven_pcihost_initfn(Object *obj)
>> @@ -308,7 +308,6 @@ static void raven_pcihost_initfn(Object *obj)
>> =20
>>      object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_D=
EVICE);
>>      pci_dev =3D DEVICE(&s->pci_dev);
>> -    qdev_set_parent_bus(pci_dev, BUS(&s->pci_bus));
>>      object_property_set_int(OBJECT(&s->pci_dev), PCI_DEVFN(0, 0), "addr=
",
>>                              NULL);
>>      qdev_prop_set_bit(pci_dev, "multifunction", false);
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 8562af3fe0..e0588285a2 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1212,12 +1212,11 @@ static void pnv_chip_power8_realize(DeviceState =
*dev, Error **errp)
>>          object_property_set_int(OBJECT(phb), i, "index", &error_fatal);
>>          object_property_set_int(OBJECT(phb), chip->chip_id, "chip-id",
>>                                  &error_fatal);
>> -        object_property_set_bool(OBJECT(phb), true, "realized", &local_=
err);
>> +        qdev_realize(DEVICE(phb), NULL, &local_err);
>>          if (local_err) {
>>              error_propagate(errp, local_err);
>>              return;
>>          }
>> -        qdev_set_parent_bus(DEVICE(phb), sysbus_get_default());
>> =20
>>          /* Populate the XSCOM address space. */
>>          pnv_xscom_add_subregion(chip,
>> @@ -1422,12 +1421,11 @@ static void pnv_chip_power9_phb_realize(PnvChip =
*chip, Error **errp)
>>              object_property_set_int(obj, PNV_PHB4_DEVICE_ID, "device-id=
",
>>                                      &error_fatal);
>>              object_property_set_link(obj, OBJECT(stack), "stack", &erro=
r_abort);
>> -            object_property_set_bool(obj, true, "realized", &local_err)=
;
>> +            qdev_realize(DEVICE(obj), NULL, &local_err);
>>              if (local_err) {
>>                  error_propagate(errp, local_err);
>>                  return;
>>              }
>> -            qdev_set_parent_bus(DEVICE(obj), sysbus_get_default());
>> =20
>>              /* Populate the XSCOM address space. */
>>              pnv_xscom_add_subregion(chip,
>> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
>> index 20aca30ac4..40e27a8cb4 100644
>> --- a/hw/s390x/sclp.c
>> +++ b/hw/s390x/sclp.c
>> @@ -333,17 +333,15 @@ static void sclp_realize(DeviceState *dev, Error *=
*errp)
>>      uint64_t hw_limit;
>>      int ret;
>> =20
>> -    object_property_set_bool(OBJECT(sclp->event_facility), true, "reali=
zed",
>> -                             &err);
>> -    if (err) {
>> -        goto out;
>> -    }
>>      /*
>>       * qdev_device_add searches the sysbus for TYPE_SCLP_EVENTS_BUS. As=
 long
>>       * as we can't find a fitting bus via the qom tree, we have to add =
the
>>       * event facility to the sysbus, so e.g. a sclp console can be crea=
ted.
>>       */
>> -    qdev_set_parent_bus(DEVICE(sclp->event_facility), sysbus_get_defaul=
t());
>> +    qdev_realize(DEVICE(sclp->event_facility), NULL, &err);
>
> I agree with the API change, but I find using sysbus_get_default() way
> clearer than using NULL. I'v go the other way around, replace bus=3DNULL
> by an explicit bus=3Dsysbus_get_default() in our codebase.

I agree with you on sysbus_get_default() being clearer than NULL.  I
actually get rid of NULL in this series, but it takes me many more
patches to get there.  Starts at PATCH 45.

Of course, I must not expect reviewers to look three dozen patches
ahead.

> Can be done later, I know... But we can also keep sysbus_get_default()
> in this patch ;)

This patch's purpose is getting rid of separate qdev_set_parent_bus(),
in part to ease the conversion from qdev_realize() to sysbus_realize().

> Whichever you prefer (mine is keeping it):
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!

>
>> +    if (err) {
>> +        goto out;
>> +    }
>> =20
>>      ret =3D s390_set_memory_limit(machine->maxram_size, &hw_limit);
>>      if (ret =3D=3D -E2BIG) {
>>=20


