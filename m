Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F41A7CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 15:19:23 +0200 (CEST)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOLTG-00027H-7Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOLRZ-0000kc-RK
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOLRV-0002d5-6Y
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:17:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22534
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOLRV-0002co-3C
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586870252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40pZTXqOqR3NJTgFyI0dYQnA/FRNUIpaOb23dKdgdRM=;
 b=AtDW6sxEEyseiNu2qmRqdQB8hCtI8+WXTVbqZdJPjYEMTjyXsPHxtIYAVNT8l2hYka0weI
 cLVTQaNKtJIE1zMQoK4UnjSGHs3ATWTkpCnlVzCcrH4gk5tV4syBZQgL7DdrjrjceX7CcW
 2tllY7ZeU6GF5tkMR58jPpEiPbZZArY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-dfMXLLbEN_GPfh0ehDzsCQ-1; Tue, 14 Apr 2020 09:17:25 -0400
X-MC-Unique: dfMXLLbEN_GPfh0ehDzsCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1DF107ACC9;
 Tue, 14 Apr 2020 13:17:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01AA5D9E2;
 Tue, 14 Apr 2020 13:17:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2637811385C8; Tue, 14 Apr 2020 15:17:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.1 v3 02/24] scripts/coccinelle: Script to simplify
 DeviceClass error propagation
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-3-f4bug@amsat.org>
 <875ze2tfvc.fsf@dusky.pond.sub.org>
 <23ad6d04-1f42-29b8-caa6-6506cf1b7422@redhat.com>
Date: Tue, 14 Apr 2020 15:17:14 +0200
In-Reply-To: <23ad6d04-1f42-29b8-caa6-6506cf1b7422@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 14 Apr 2020 14:30:01
 +0200")
Message-ID: <87k12iqk9x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/14/20 2:24 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>>> When a device uses an Error* with data not modified before realize(),
>>> this call can be moved to init(). Add a Coccinelle patch to find such
>>> uses.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>   ...implify-init-realize-error_propagate.cocci | 69 ++++++++++++++++++=
+
>>>   MAINTAINERS                                   |  1 +
>>>   2 files changed, 70 insertions(+)
>>>   create mode 100644 scripts/coccinelle/simplify-init-realize-error_pro=
pagate.cocci
>>>
>>> diff --git a/scripts/coccinelle/simplify-init-realize-error_propagate.c=
occi b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>>> new file mode 100644
>>> index 0000000000..2e3ec4d98a
>>> --- /dev/null
>>> +++ b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>>> @@ -0,0 +1,69 @@
>>> +// Find error-propagation calls that don't need to be in DeviceClass::=
realize()
>>> +// because they don't use information user can change before calling r=
ealize(),
>>> +// so they can be moved to DeviceClass:initfn() where error propagatio=
n is not
>>> +// needed.
>>> +//
>>> +// Copyright: (C) 2020 Philippe Mathieu-Daud=C3=A9
>>> +// This work is licensed under the terms of the GNU GPLv2 or later.
>>> +//
>>> +// spatch \
>>> +//  --macro-file scripts/cocci-macro-file.h \
>>> +//  --sp-file \
>>> +//    scripts/coccinelle/simplify-init-realize-error_propagate.cocci \
>>> +//  --timeout 60
>>> +//
>>> +// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg6=
92500.html
>>> +
>>> +
>>> +@ match_class_init @
>>> +TypeInfo info;
>>> +identifier class_initfn;
>>> +@@
>>> +    info.class_init =3D class_initfn;
>>> +
>>> +
>>> +@ match_instance_init @
>>> +TypeInfo info;
>>> +identifier instance_initfn;
>>> +@@
>>> +    info.instance_init =3D instance_initfn;
>>> +
>>> +
>>> +@ match_realize @
>>> +identifier match_class_init.class_initfn;
>>> +DeviceClass *dc;
>>> +identifier realizefn;
>>> +@@
>>> +void class_initfn(...)
>>> +{
>>> +    ...
>>> +    dc->realize =3D realizefn;
>>> +    ...
>>> +}
>>
>> I'm afraid this misses realize() methods of DeviceClass subclasses.
>> Consider PCI device "i6300esb" (picked just because it's simple).
>>
>> pci_device_class_init() sets DeviceClass method realize() to
>> pci_qdev_realize().  pci_qdev_realize() does the work common to all PCI
>> devices, and calls PCIDeviceClass method realize() for the work specific
>> to the PCI device at hand.
>>
>> i6300esb_class_init() sets PCIDeviceClass method realize() to
>> i6300esb_realize().
>>
>> Your first rule should match i6300esb_info alright, and thus identify
>> i6300esb_class_init() as a class_init() method.
>>
>> But your third rule can't match i6300esb_class_init()'s
>>
>>      k->realize =3D i6300esb_realize;
>>
>> because @k is a PCIDeviceClass, not a DeviceClass.
>>
>> I think it also misses cases that have a realize(), but no
>> instance_init().
>>
>> Finding only some instances of an anti-pattern can still be useful.  But
>> you should explain the script's limitations then, both in the script and
>> the commit message.
>
> OK.
>
>>
>>> +
>>> +
>>> +@ propagate_in_realize @
>>> +identifier match_realize.realizefn;
>>> +identifier err;
>>> +identifier errp;
>>> +identifier func_with_errp =3D~ "(?!object_property_set_link)";
>>
>> What are you trying to accomplish with this lookahead assertion?
>
> "match all func_with_errp() except object_property_set_link()"?

What's wrong with

    identifier func_with_errp !=3D object_property_set_link

?

[...]


