Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2463FA9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 05:38:15 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl3Qs-0001bE-Ko
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 23:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <longpeng2@huawei.com>) id 1hl3PW-0000iY-Pt
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1hl3PV-0007Hz-AR
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:36:50 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46632 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1hl3PQ-0006ys-Ne
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:36:48 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 43C9343DFCA9A42BABFC;
 Wed, 10 Jul 2019 11:36:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.246.209) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 10 Jul 2019 11:36:18 +0800
To: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
References: <785B5B0623C08241B2D0E6E7D8FA6B181E0A8FFF@DGGEMM506-MBX.china.huawei.com>
 <20190708094750.GE2746@work-vm>
 <fb1d9412-d017-3a74-012b-2bcd88271160@redhat.com>
From: "Longpeng (Mike)" <longpeng2@huawei.com>
Message-ID: <83ba270d-5302-3ffe-2663-8adc36e9f079@huawei.com>
Date: Wed, 10 Jul 2019 11:36:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <fb1d9412-d017-3a74-012b-2bcd88271160@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.177.246.209]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [BUG] VM abort after migration
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=E5=9C=A8 2019/7/10 11:25, Jason Wang =E5=86=99=E9=81=93:
>=20
> On 2019/7/8 =E4=B8=8B=E5=8D=885:47, Dr. David Alan Gilbert wrote:
>> * longpeng (longpeng2@huawei.com) wrote:
>>> Hi guys,
>>>
>>> We found a qemu core in our testing environment, the assertion
>>> 'assert(bus->irq_count[i] =3D=3D 0)' in pcibus_reset() was triggered =
and
>>> the bus->irq_count[i] is '-1'.
>>>
>>> Through analysis, it was happened after VM migration and we think
>>> it was caused by the following sequence:
>>>
>>> *Migration Source*
>>> 1. save bus pci.0 state, including irq_count[x] ( =3D0 , old )
>>> 2. save E1000:
>>> =C2=A0=C2=A0=C2=A0 e1000_pre_save
>>> =C2=A0=C2=A0=C2=A0=C2=A0 e1000_mit_timer
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_interrupt_cause
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_irq --> update pci_dev->=
irq_state to 1 and
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update bus->irq_count[x] to 1 ( n=
ew )
>>> =C2=A0=C2=A0=C2=A0=C2=A0 the irq_state sent to dest.
>>>
>>> *Migration Dest*
>>> 1. Receive the irq_count[x] of pci.0 is 0 , but the irq_state of e100=
0 is 1.
>>> 2. If the e1000 need change irqline , it would call to pci_irq_handle=
r(),
>>> =C2=A0=C2=A0 the irq_state maybe change to 0 and bus->irq_count[x] wi=
ll become
>>> =C2=A0=C2=A0 -1 in this situation.
>>> 3. do VM reboot then the assertion will be triggered.
>>>
>>> We also found some guys faced the similar problem:
>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2016-11/msg02525.ht=
ml
>>> [2] https://bugs.launchpad.net/qemu/+bug/1702621
>>>
>>> Is there some patches to fix this problem ?
>> I don't remember any.
>>
>>> Can we save pcibus state after all the pci devs are saved ?
>> Does this problem only happen with e1000? I think so.
>> If it's only e1000 I think we should fix it - I think once the VM is
>> stopped for doing the device migration it shouldn't be raising
>> interrupts.
>=20
>=20
> I wonder maybe we can simply fix this by no setting ICS on pre_save() b=
ut
> scheduling mit timer unconditionally in post_load().
>
I also think this is a bug of e1000 because we find more cores with the s=
ame
frame thease days.

I'm not familiar with e1000 so hope someone could fix it, thanks. :)

> Thanks
>=20
>=20
>>
>> Dave
>>
>>> Thanks,
>>> Longpeng(Mike)
>> --=20
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
> .
>=20

--=20
Regards,
Longpeng(Mike)


