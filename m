Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AD403C6C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:22:19 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzP0-0004GF-Jj
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mNzNp-0002Pv-DU; Wed, 08 Sep 2021 11:21:05 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mNzNj-0008G9-6c; Wed, 08 Sep 2021 11:21:03 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 3D68E2E0C61;
 Wed,  8 Sep 2021 18:20:52 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 5CpjCn7CuC-KpumnI4D; Wed, 08 Sep 2021 18:20:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1631114452; bh=f7cWSbgFdFm7pYHgirr354lyqv6Jtp4XaH/uV3Jm3G8=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=RvHz5G/mGhgupEB3orugYeKre7tmXzhlC2hv9PaGquesImSpJCeSqNXSsuylMo/gR
 vfQRuUqY76y6a7FIPzKZTvUXiWP9GEVM6ugIpVt76JX55IgqTwzLIyCQATcfVWueYi
 Fq+OOtRe2ZamP3TYlFPXatM0o3vUSyBnOSeVhfFU=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8001::1:33])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YGifdGi7nN-KoxKhG6T; Wed, 08 Sep 2021 18:20:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v1 2/4] virtio: increase virtuqueue size for virtio-scsi
 and virtio-blk
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
 <20200129140702.5411-3-dplotnikov@virtuozzo.com>
 <20200130145840.GH180311@stefanha-x1.localdomain>
 <92f392e9-eb05-5c85-4d50-208110720a22@virtuozzo.com>
 <20200205111905.GE58062@stefanha-x1.localdomain>
 <683b80a8-0d40-7f14-e3f4-628d2b38037f@virtuozzo.com>
 <20210908131716.e6de722iibgn3y7y@steredhat>
 <20210908132203.vajs22vocelhlwwt@steredhat>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <3b35a660-c577-42b6-d977-7b43c29452a6@yandex-team.ru>
Date: Wed, 8 Sep 2021 18:20:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908132203.vajs22vocelhlwwt@steredhat>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.922,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 08.09.2021 16:22, Stefano Garzarella wrote:
> Message bounced, I use new Denis's email address.
>
> On Wed, Sep 08, 2021 at 03:17:16PM +0200, Stefano Garzarella wrote:
>> Hi Denis,
>> I just found this discussion since we still have the following line 
>> in hw/core/machine.c:
>>    { "vhost-blk-device", "seg_max_adjust", "off"}
>>
>> IIUC it was a typo, and I think we should fix it since in the future 
>> we can have `vhost-blk-device`.
>>
>> So, I think we have 2 options:
>> 1. remove that line since for now is useless
>> 2. replace with "vhost-scsi"
>>
>> I'm not sure which is the best, what do you suggest?
>>
>> Thanks,
>> Stefano

Hi Stefano

I prefer to just remove the line without replacing. This will keep 
things exactly like it is now.

Replacing with "vhost-scsi" will affect seg_max (limit to 126) on newly 
created VMs with machine types using "hw_compat_4_2" and older.

Now, because of the typo (error), their seg-max is queue-size dependent. 
I'm not sure, if replacing the line may cause any problems, for example 
on migration: source (queue-size 256, seg max 254) -> destination 
(queue-size 256, seg max 126). But it will definitely introduce two 
different behaviors for VMs with "hw_compat_4_2" and older. So, I'd 
choose the lesser of two evils and keep the things like it's now.

Thanks!

Denis

>>
>> On Fri, Feb 07, 2020 at 11:48:05AM +0300, Denis Plotnikov wrote:
>>> On 05.02.2020 14:19, Stefan Hajnoczi wrote:
>>>> On Tue, Feb 04, 2020 at 12:59:04PM +0300, Denis Plotnikov wrote:
>>>>> On 30.01.2020 17:58, Stefan Hajnoczi wrote:
>>>>>> On Wed, Jan 29, 2020 at 05:07:00PM +0300, Denis Plotnikov wrote:
>>>>>>> The goal is to reduce the amount of requests issued by a guest on
>>>>>>> 1M reads/writes. This rises the performance up to 4% on that 
>>>>>>> kind of
>>>>>>> disk access pattern.
>>>>>>>
>>>>>>> The maximum chunk size to be used for the guest disk accessing is
>>>>>>> limited with seg_max parameter, which represents the max amount of
>>>>>>> pices in the scatter-geather list in one guest disk request.
>>>>>>>
>>>>>>> Since seg_max is virqueue_size dependent, increasing the virtqueue
>>>>>>> size increases seg_max, which, in turn, increases the maximum size
>>>>>>> of data to be read/write from guest disk.
>>>>>>>
>>>>>>> More details in the original problem statment:
>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03721.html
>>>>>>>
>>>>>>> Suggested-by: Denis V. Lunev <den@openvz.org>
>>>>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>>>> ---
>>>>>>>  hw/core/machine.c          | 3 +++
>>>>>>>  include/hw/virtio/virtio.h | 2 +-
>>>>>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>> index 3e288bfceb..8bc401d8b7 100644
>>>>>>> --- a/hw/core/machine.c
>>>>>>> +++ b/hw/core/machine.c
>>>>>>> @@ -28,6 +28,9 @@
>>>>>>>  #include "hw/mem/nvdimm.h"
>>>>>>>  GlobalProperty hw_compat_4_2[] = {
>>>>>>> +    { "virtio-blk-device", "queue-size", "128"},
>>>>>>> +    { "virtio-scsi-device", "virtqueue_size", "128"},
>>>>>>> +    { "vhost-blk-device", "virtqueue_size", "128"},
>>>>>> vhost-blk-device?!  Who has this?  It's not in qemu.git so please 
>>>>>> omit
>>>>>> this line. ;-)
>>>>> So in this case the line:
>>>>>
>>>>> { "vhost-blk-device", "seg_max_adjust", "off"},
>>>>>
>>>>> introduced by my patch:
>>>>>
>>>>> commit 1bf8a989a566b2ba41c197004ec2a02562a766a4
>>>>> Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>> Date:   Fri Dec 20 17:09:04 2019 +0300
>>>>>
>>>>>     virtio: make seg_max virtqueue size dependent
>>>>>
>>>>> is also wrong. It should be:
>>>>>
>>>>> { "vhost-scsi-device", "seg_max_adjust", "off"},
>>>>>
>>>>> Am I right?
>>>> It's just called "vhost-scsi":
>>>>
>>>> include/hw/virtio/vhost-scsi.h:#define TYPE_VHOST_SCSI "vhost-scsi"
>>>>
>>>>>> On the other hand, do you want to do this for the vhost-user-blk,
>>>>>> vhost-user-scsi, and vhost-scsi devices that exist in qemu.git?  
>>>>>> Those
>>>>>> devices would benefit from better performance too.
>>> After thinking about that for a while, I think we shouldn't extend 
>>> queue sizes for vhost-user-blk, vhost-user-scsi and vhost-scsi.
>>> This is because increasing the queue sizes seems to be just useless 
>>> for them: the all thing is about increasing the queue sizes for 
>>> increasing seg_max (it limits the max block query size from the 
>>> guest). For virtio-blk-device and virtio-scsi-device it makes sense, 
>>> since they have seg-max-adjust property which, if true, sets seg_max 
>>> to virtqueue_size-2. vhost-scsi also have this property but it seems 
>>> the property just doesn't affect anything (remove it?).
>>> Also vhost-user-blk, vhost-user-scsi and vhost-scsi don't do any 
>>> seg_max settings. If I understand correctly, their backends are ment 
>>> to be responsible for doing that.
>>> So, what about changing the queue sizes just for virtio-blk-device 
>>> and virtio-scsi-device?
>>>
>>> Denis
>>>
>>>>> It seems to be so. We also have the test checking those settings:
>>>>> tests/acceptance/virtio_seg_max_adjust.py
>>>>> For now it checks virtio-scsi-pci and virtio-blk-pci.
>>>>> I'm going to extend it for the virtqueue size checking.
>>>>> If I change vhost-user-blk, vhost-user-scsi and vhost-scsi it's worth
>>>>> to check those devices too. But I don't know how to form a command 
>>>>> line
>>>>> for that 3 devices since they should involve some third party 
>>>>> components as
>>>>> backends (kernel modules, DPDK, etc.) and they seems to be not 
>>>>> available in
>>>>> the
>>>>> qemu git.
>>>>> Is there any way to do it with some qit.qemu available stubs or 
>>>>> something
>>>>> else?
>>>>> If so, could you please point out the proper way to do it?
>>>> qemu.git has contrib/vhost-user-blk/ and contrib/vhost-user-scsi/ if
>>>> you need to test those vhost-user devices without external 
>>>> dependencies.
>>>>
>>>> Stefan
>>>
>>>
>

