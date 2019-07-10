Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BF63FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 05:37:45 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl3QN-0000i0-9M
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 23:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44079)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hl3Nw-00006N-Cc
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hl3No-0005Qe-NC
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hl3Ni-0005Jk-Fg
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:35:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 276A67FDE5;
 Wed, 10 Jul 2019 03:25:12 +0000 (UTC)
Received: from [10.72.12.176] (ovpn-12-176.pek2.redhat.com [10.72.12.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B15675F9C8;
 Wed, 10 Jul 2019 03:25:09 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 longpeng <longpeng2@huawei.com>
References: <785B5B0623C08241B2D0E6E7D8FA6B181E0A8FFF@DGGEMM506-MBX.china.huawei.com>
 <20190708094750.GE2746@work-vm>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fb1d9412-d017-3a74-012b-2bcd88271160@redhat.com>
Date: Wed, 10 Jul 2019 11:25:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708094750.GE2746@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 10 Jul 2019 03:25:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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


On 2019/7/8 =E4=B8=8B=E5=8D=885:47, Dr. David Alan Gilbert wrote:
> * longpeng (longpeng2@huawei.com) wrote:
>> Hi guys,
>>
>> We found a qemu core in our testing environment, the assertion
>> 'assert(bus->irq_count[i] =3D=3D 0)' in pcibus_reset() was triggered a=
nd
>> the bus->irq_count[i] is '-1'.
>>
>> Through analysis, it was happened after VM migration and we think
>> it was caused by the following sequence:
>>
>> *Migration Source*
>> 1. save bus pci.0 state, including irq_count[x] ( =3D0 , old )
>> 2. save E1000:
>>     e1000_pre_save
>>      e1000_mit_timer
>>       set_interrupt_cause
>>        pci_set_irq --> update pci_dev->irq_state to 1 and
>>                    update bus->irq_count[x] to 1 ( new )
>>      the irq_state sent to dest.
>>
>> *Migration Dest*
>> 1. Receive the irq_count[x] of pci.0 is 0 , but the irq_state of e1000=
 is 1.
>> 2. If the e1000 need change irqline , it would call to pci_irq_handler=
(),
>>    the irq_state maybe change to 0 and bus->irq_count[x] will become
>>    -1 in this situation.
>> 3. do VM reboot then the assertion will be triggered.
>>
>> We also found some guys faced the similar problem:
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2016-11/msg02525.htm=
l
>> [2] https://bugs.launchpad.net/qemu/+bug/1702621
>>
>> Is there some patches to fix this problem ?
> I don't remember any.
>
>> Can we save pcibus state after all the pci devs are saved ?
> Does this problem only happen with e1000? I think so.
> If it's only e1000 I think we should fix it - I think once the VM is
> stopped for doing the device migration it shouldn't be raising
> interrupts.


I wonder maybe we can simply fix this by no setting ICS on pre_save()=20
but scheduling mit timer unconditionally in post_load().

Thanks


>
> Dave
>
>> Thanks,
>> Longpeng(Mike)
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

