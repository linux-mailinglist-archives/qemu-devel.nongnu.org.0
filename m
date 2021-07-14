Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FBE3C806F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 10:41:51 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3aSk-0002yG-JF
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 04:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3aRU-0002Av-LV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3aRR-000815-KJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626252027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRLTy1j/gm7MO/M93m+4NvEXbKGiuUj0F9E5IvfWgVo=;
 b=Q1kawxtpYM9SoSnTugi+TxDok7D3qqFoCq+docUOcs9uccnH8jhHvrkamkmtbLrigdgt+n
 0JaEk/O5qlR3jIgH5j2CyrwROxJ57OtX0NAogqD/IVRYjcKMDEwGKmiIZC05D6kUI/mK5A
 QcejrTNfJBnkssraSYIbtqqrN6WVd6c=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-0Cw-i5WIMj-zDsb4SfAkAA-1; Wed, 14 Jul 2021 04:40:24 -0400
X-MC-Unique: 0Cw-i5WIMj-zDsb4SfAkAA-1
Received: by mail-pj1-f70.google.com with SMTP id
 z5-20020a17090a7b85b0290173d3902d78so1054034pjc.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 01:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kRLTy1j/gm7MO/M93m+4NvEXbKGiuUj0F9E5IvfWgVo=;
 b=EygkqpLWJLEGYEX/oifJ0aF7yro99p2STdIUYr/AemCCcsBKbw8UzKANMbnlrRiaUT
 awuGOudNWZ4sM2zDmITMd3mw9yuvfpQWTsweF3Q4FdkeKHTrctbMWbN0fqVJA3Zti8dP
 rE+w8jkTYZyrM9WZyBtsWfiy73EXtxBe/zMQNreHKw5Fk+Kkc//zrGbx+Oy4QKkKI03e
 TJ/Gi+EqiSpIM9sca/VlsB1bsmWSvmDPLHd+v6Z6+F2r6PM8As22qGtW6VjhQXtvZluX
 FEhGaNAmNW8Uq2WmsoTVIxXjbhgWMgGALuCadOPa8L8tR9Oh6B7Hydzin7hXiXe3KaeV
 doRg==
X-Gm-Message-State: AOAM5322PkZ0kEJWPk9G1aYFYiHsIlMnuUTO6VueUPFxV7TIyg+RYLdJ
 Lmq9m3hDwep3JgJqM0kYfgQERIPwt8pDNBC5KcrGOKzdRe/8QdtReKCh6ObZoHGRBGRYU+10kUx
 NV3CpeJrhBbwYJpU=
X-Received: by 2002:a05:6a00:2ac:b029:331:690d:7f26 with SMTP id
 q12-20020a056a0002acb0290331690d7f26mr1424082pfs.78.1626252023762; 
 Wed, 14 Jul 2021 01:40:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9MncxzB4HU0I7c2hSISWSQZSAGvO/NNquMpBOEtOCDqTg5f8hKrxhsvSD3biiOAe5qY4EAA==
X-Received: by 2002:a05:6a00:2ac:b029:331:690d:7f26 with SMTP id
 q12-20020a056a0002acb0290331690d7f26mr1424065pfs.78.1626252023443; 
 Wed, 14 Jul 2021 01:40:23 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 10sm1809721pfh.174.2021.07.14.01.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 01:40:22 -0700 (PDT)
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <70e86495-9f83-ee4f-d9fc-091ccbfed71a@redhat.com>
Date: Wed, 14 Jul 2021 16:40:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmViB8kx1OyxCY3dCNccdb7-5exABsk9x32qfapaqFOV0g@mail.gmail.com>
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


在 2021/7/14 下午2:04, Bin Meng 写道:
> On Wed, Jul 14, 2021 at 12:53 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/14 上午11:42, Bin Meng 写道:
>>> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/7/13 下午5:11, Bin Meng 写道:
>>>>> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/7/13 下午4:36, Bin Meng 写道:
>>>>>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>> 在 2021/7/13 上午7:06, Bin Meng 写道:
>>>>>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>>>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>>>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>>>>
>>>>>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>>>>>>>>> the manual and real hardware.
>>>>>>>>>>>>
>>>>>>>>>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>>>>>>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>>>>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>>>>>>>>
>>>>>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>
>>>>>>>>>>>> (no changes since v1)
>>>>>>>>>>>>
>>>>>>>>>>>>        hw/net/e1000.c | 2 ++
>>>>>>>>>>>>        1 file changed, 2 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>>>>>>>>>> index 4f75b44cfc..20cbba6411 100644
>>>>>>>>>>>> --- a/hw/net/e1000.c
>>>>>>>>>>>> +++ b/hw/net/e1000.c
>>>>>>>>>>>> @@ -29,6 +29,7 @@
>>>>>>>>>>>>        #include "hw/pci/pci.h"
>>>>>>>>>>>>        #include "hw/qdev-properties.h"
>>>>>>>>>>>>        #include "migration/vmstate.h"
>>>>>>>>>>>> +#include "net/eth.h"
>>>>>>>>>>>>        #include "net/net.h"
>>>>>>>>>>>>        #include "net/checksum.h"
>>>>>>>>>>>>        #include "sysemu/sysemu.h"
>>>>>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>>>>>>>>>            [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>>>>>>>>>                        E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>>>>>>>>>                        E1000_MANC_RMCP_EN,
>>>>>>>>>>>> +    [VET]     = ETH_P_VLAN,
>>>>>>>>>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>>>>>>>>>
>>>>>>>>>>> (See e1000_properties[])
>>>>>>>>>>>
>>>>>>>>>> No we don't need to since it does not break migration.
>>>>>>>>> Ping?
>>>>>>>> I admit migration "works" but it doesn't mean it's not broken. It
>>>>>>>> changes the guest visible default value of VET register, so it may break
>>>>>>>> things silently for the guest.
>>>>>>>>
>>>>>>>> For old machine types, we should stick the value to the one without this
>>>>>>>> fix.
>>>>>>> Could you please propose a solution on how to handle such a scenario
>>>>>>> in a generic way in QEMU? (+Peter)
>>>>>> Well, I think I've suggested you to have a look at how things is done in
>>>>>> for handling such compatibility in e1000_properties.
>>>>>>
>>>>>>
>>>>>>> The POR reset value is wrong in QEMU and has carried forward the wrong
>>>>>>> value for years, and correcting it to its right value needs to do
>>>>>>> what?
>>>>>> We should stick to the wrong behavior for old machine types.
>>>>>>
>>>>>> That's all.
>>>>> So that means the following SD patch is also wrong (+Philippe) which
>>>>> changes the default value of capability register.
>>>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.24113-1-joannekoong@gmail.com/
>>>> It should compat capareg for the old value for old machine types.
>>> Yeah, it's already a property for the SD controller model but someone
>>> views it as a bug because the model implements 64-bit but not
>>> reporting it in the capability register.
>>>
>>>>> Can we get some agreement among maintainers?
>>>> It's not about the agreement but about to have a stable ABI. I don't
>>>> know the case for sd but e1000 is used in various  and we work hard to
>>>> unbreak the migration compatibility among downstream versions. Git log
>>>> on e1000.c will tell you more.
>>> Agreement or stable ABI, whatever we call, but we should be in some consistency.
>>>
>>> IMHO maintainers should reach an agreement to some extent on how
>>> compatibility should be achieved. I just found silly to add a property
>>> to fix a real bug in the model, and we preserve the bug all over
>>> releases.
>>
>> That's the price for the stable ABI. See one of my recent fix -
>> d83f46d189 virtio-pci: compat page aligned ATS. It keeps the "buggy"
>> behavior to unbreak the migration.
>>
> But this series does not break the migration, as we discussed in the
> previous thread.


It actually did,

(qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
     0 device: 20 cmask: ff wmask: 0 w1cmask:0

Since the register is RO.


>
>>> I can find plenty of examples in the current QEMU tree that were
>>> accepted that changed the bugous register behavior, but it was not
>>> asked to add new properties to keep the bugos behavior.
>>>
>>> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logic")
>>
>> I guess it's simply because fsl_etsec is not used in any
>> distributions/production environments or the maintainer may just not
>> notice things like this.
>>
>> But for e1000(e), we should stick to a stable ABI for consistency.
>> Otherwise it would be very tricky to fix them after we saw real issues.
>> We had learnt a lot during the past decade.
>>
> Okay, do we have such a kind of widely used device model list? And we
> should document such a process that we should keep compatibility on
> these devices as well.


I can only say for networking devices:

- e1000(e)
- rtl8139
- virtio-net


>
> Regarding this VET register, do you know what guest relies on the POR
> value which is zero?


I don't know.


> Zero is not a valid ethernet VLAN type. I don't
> think changing this will break any guests.


You might be right here, but it would be late if we find it breaks any one.

If it's not a lot of work, I tend to bother with compat stuffs for this.

Thanks


> The commit message says
> Linux e1000(e) driver just rewrites this register by itself. Given
> that's probably the most commonly used OS, it's not strange this bug
> gets unnoticed for years.
>
> Regards,
> Bin
>


