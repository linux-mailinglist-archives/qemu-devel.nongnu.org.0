Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF453C815E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:19:39 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3b3K-0005Ig-Fy
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3b1O-0002c2-Ta
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3b1M-00082H-Hz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626254255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4aELIGNNAEn+d4isC5e39mcbEl3jAs0CYIPYbVhTjo=;
 b=X6Dl1ELDL/erFbhX3xiZQoRMIGWL+3O5tXtvejE/4EHxIcRQVKdjIihMgrtSinQUJvlPIM
 BrLy3+tOKbWAgwQ3z02jvzfzPa/0ichr0n7otAu/TY0LDuBs9XTA6AgIQ7wdTy7X7il7pP
 DOQ0e4ql+c/XrhGytEEkls+HVIRWK0Y=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-lkTtfMQ9Nsm7JJxGwAUO3w-1; Wed, 14 Jul 2021 05:17:34 -0400
X-MC-Unique: lkTtfMQ9Nsm7JJxGwAUO3w-1
Received: by mail-pj1-f69.google.com with SMTP id
 n8-20020a17090a2bc8b02901738be23a47so1109114pje.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f4aELIGNNAEn+d4isC5e39mcbEl3jAs0CYIPYbVhTjo=;
 b=koNnebOwZjKbLbN3Lgn4QEjoUd2y1Oq6T8CZJat17EIrvTsk+lfUdqWOibOyJkzzR0
 ZFqc922Popny7rkrDldqI7h6/l20v1UWbE/s2WeOeB7Isbmr8Y5zu1/IBL9VBamkn1a8
 APRoqqpxm/Dg9RSPrcVbIoX3+BDiYwH6uBnlbiAVM6hG/A1j1XeKkAoxX69TsRZ3BL+2
 sO2rJ1j1sNrklrlcnLypTw01Igj/idJC9EdHI7BIhzReEJGPEXfAmXDYbgzCFI0NtmEB
 9m6JEDudwrMWir0uoWN9mIWbpFsUQDhZ1nuabs2jfdXOJj4gpR5KshEenu65uRUPAJBO
 Y3gA==
X-Gm-Message-State: AOAM532eF4OvmTewENDqU1AIgo5Y/ap+v47EJh+sRLYQkyUx5xysvrdz
 uuHbQfIK0Iytq7cfaJ92IJb3T96rag7Fz3g4Xz0YFMfz2LVW+MT34I/ruzda9lCxioWUdj6D6NS
 AmXebGG8s7JoPfAw=
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr2829268pjg.202.1626254253030; 
 Wed, 14 Jul 2021 02:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWfZRoUWevN0iN1Ogn3Ux7DW8gGTeXTcZwHgkewVf/mzyDH6hrxmPDAaG7IaELJtE1loX2ow==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr2829248pjg.202.1626254252689; 
 Wed, 14 Jul 2021 02:17:32 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f5sm1969634pfn.134.2021.07.14.02.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:17:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
 <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
 <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
 <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
 <854f526c-8ee0-a910-e0f9-08cf09ad3213@redhat.com>
 <CAEUhbmViB8kx1OyxCY3dCNccdb7-5exABsk9x32qfapaqFOV0g@mail.gmail.com>
 <70e86495-9f83-ee4f-d9fc-091ccbfed71a@redhat.com>
 <CAEUhbmUUwW1t0VgC-P-bQRetE_yeAbs0ULsVJDjc8Ja6yCSg6g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7457cf45-2294-227f-f452-1f322ead3aea@redhat.com>
Date: Wed, 14 Jul 2021 17:17:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUUwW1t0VgC-P-bQRetE_yeAbs0ULsVJDjc8Ja6yCSg6g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christina Wang <christina.wang@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/14 下午5:05, Bin Meng 写道:
> On Wed, Jul 14, 2021 at 4:40 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/14 下午2:04, Bin Meng 写道:
>>> On Wed, Jul 14, 2021 at 12:53 PM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/7/14 上午11:42, Bin Meng 写道:
>>>>> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/7/13 下午5:11, Bin Meng 写道:
>>>>>>> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>> 在 2021/7/13 下午4:36, Bin Meng 写道:
>>>>>>>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>>>> 在 2021/7/13 上午7:06, Bin Meng 写道:
>>>>>>>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>>>>>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>>>>>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>>>>>>>>>>> the manual and real hardware.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>>>>>>>>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>>>>>>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>>>>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> (no changes since v1)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         hw/net/e1000.c | 2 ++
>>>>>>>>>>>>>>         1 file changed, 2 insertions(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>>>>>>>>>>>> index 4f75b44cfc..20cbba6411 100644
>>>>>>>>>>>>>> --- a/hw/net/e1000.c
>>>>>>>>>>>>>> +++ b/hw/net/e1000.c
>>>>>>>>>>>>>> @@ -29,6 +29,7 @@
>>>>>>>>>>>>>>         #include "hw/pci/pci.h"
>>>>>>>>>>>>>>         #include "hw/qdev-properties.h"
>>>>>>>>>>>>>>         #include "migration/vmstate.h"
>>>>>>>>>>>>>> +#include "net/eth.h"
>>>>>>>>>>>>>>         #include "net/net.h"
>>>>>>>>>>>>>>         #include "net/checksum.h"
>>>>>>>>>>>>>>         #include "sysemu/sysemu.h"
>>>>>>>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>>>>>>>>>>>             [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>>>>>>>>>>>                         E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>>>>>>>>>>>                         E1000_MANC_RMCP_EN,
>>>>>>>>>>>>>> +    [VET]     = ETH_P_VLAN,
>>>>>>>>>>>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>>>>>>>>>>>
>>>>>>>>>>>>> (See e1000_properties[])
>>>>>>>>>>>>>
>>>>>>>>>>>> No we don't need to since it does not break migration.
>>>>>>>>>>> Ping?
>>>>>>>>>> I admit migration "works" but it doesn't mean it's not broken. It
>>>>>>>>>> changes the guest visible default value of VET register, so it may break
>>>>>>>>>> things silently for the guest.
>>>>>>>>>>
>>>>>>>>>> For old machine types, we should stick the value to the one without this
>>>>>>>>>> fix.
>>>>>>>>> Could you please propose a solution on how to handle such a scenario
>>>>>>>>> in a generic way in QEMU? (+Peter)
>>>>>>>> Well, I think I've suggested you to have a look at how things is done in
>>>>>>>> for handling such compatibility in e1000_properties.
>>>>>>>>
>>>>>>>>
>>>>>>>>> The POR reset value is wrong in QEMU and has carried forward the wrong
>>>>>>>>> value for years, and correcting it to its right value needs to do
>>>>>>>>> what?
>>>>>>>> We should stick to the wrong behavior for old machine types.
>>>>>>>>
>>>>>>>> That's all.
>>>>>>> So that means the following SD patch is also wrong (+Philippe) which
>>>>>>> changes the default value of capability register.
>>>>>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.24113-1-joannekoong@gmail.com/
>>>>>> It should compat capareg for the old value for old machine types.
>>>>> Yeah, it's already a property for the SD controller model but someone
>>>>> views it as a bug because the model implements 64-bit but not
>>>>> reporting it in the capability register.
>>>>>
>>>>>>> Can we get some agreement among maintainers?
>>>>>> It's not about the agreement but about to have a stable ABI. I don't
>>>>>> know the case for sd but e1000 is used in various  and we work hard to
>>>>>> unbreak the migration compatibility among downstream versions. Git log
>>>>>> on e1000.c will tell you more.
>>>>> Agreement or stable ABI, whatever we call, but we should be in some consistency.
>>>>>
>>>>> IMHO maintainers should reach an agreement to some extent on how
>>>>> compatibility should be achieved. I just found silly to add a property
>>>>> to fix a real bug in the model, and we preserve the bug all over
>>>>> releases.
>>>> That's the price for the stable ABI. See one of my recent fix -
>>>> d83f46d189 virtio-pci: compat page aligned ATS. It keeps the "buggy"
>>>> behavior to unbreak the migration.
>>>>
>>> But this series does not break the migration, as we discussed in the
>>> previous thread.
>>
>> It actually did,
>>
>> (qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
>>       0 device: 20 cmask: ff wmask: 0 w1cmask:0
>>
>> Since the register is RO.
> Did you mean the VET register is read-only?


No, I meant for ATS.


> I don't understand this as
> the manual says it's RW and Linux driver programs it to 0x8100.


So ATS cap is read only so it can be validated by qemu.

VET is RW so qemu can't do similar checks.


>
>>
>>>>> I can find plenty of examples in the current QEMU tree that were
>>>>> accepted that changed the bugous register behavior, but it was not
>>>>> asked to add new properties to keep the bugos behavior.
>>>>>
>>>>> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logic")
>>>> I guess it's simply because fsl_etsec is not used in any
>>>> distributions/production environments or the maintainer may just not
>>>> notice things like this.
>>>>
>>>> But for e1000(e), we should stick to a stable ABI for consistency.
>>>> Otherwise it would be very tricky to fix them after we saw real issues.
>>>> We had learnt a lot during the past decade.
>>>>
>>> Okay, do we have such a kind of widely used device model list? And we
>>> should document such a process that we should keep compatibility on
>>> these devices as well.
>>
>> I can only say for networking devices:
>>
>> - e1000(e)
>> - rtl8139
>> - virtio-net
>>
> Please, at least have these documented as a development process.


See Peter's reply. We should take care of the devices that is involved 
in at least one versioned machine types.

If you wish, you can post a patch to clarify things in the doc.

Thanks


>
>>> Regarding this VET register, do you know what guest relies on the POR
>>> value which is zero?
>>
>> I don't know.
>>
>>
>>> Zero is not a valid ethernet VLAN type. I don't
>>> think changing this will break any guests.
>>
>> You might be right here, but it would be late if we find it breaks any one.
>>
>> If it's not a lot of work, I tend to bother with compat stuffs for this.
>>
> Regards,
> Bin
>


