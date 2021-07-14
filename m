Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D93C7DB4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:55:12 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WvP-0003XL-1A
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3Wtz-0002Lq-PD
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3Wtv-0005Ao-Ob
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626238418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsX/rUfgkB9Uar+ywallTLmUAwN+ZNo5F83cKi5KedU=;
 b=CrIxhbIvFB5M658KG8vSr+J7gqrc7Di3AA4CkcZnkewNbJxU9xDWWTtRxfvzUdr4/EcsFj
 EhDH6ox9xo4AmEAnH2Bdbp4JRjo6YxbjjL8oEOSHUJqSLm3r3GvTI4+p3/Gkx5maZAQRQJ
 FFs9mZ0kJ5fG+PkWQ8u+BErRhbmTeIk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-LPkCqcNBPXOaImJTeoiGIA-1; Wed, 14 Jul 2021 00:53:35 -0400
X-MC-Unique: LPkCqcNBPXOaImJTeoiGIA-1
Received: by mail-pj1-f72.google.com with SMTP id
 gc15-20020a17090b310fb0290173c8985d0dso760121pjb.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 21:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tsX/rUfgkB9Uar+ywallTLmUAwN+ZNo5F83cKi5KedU=;
 b=TU/j4nWPzDpK9xnztPbT7UpEy7UlDXc67xWYffmhocIBFAD/aXdT2eB22SHImBPTE2
 gq2DdGXJKx5GSeS4k+qHmT/pUSN8TVN97kSLsZtP5VWdStaM52ia6vL0YCgnAVeDF7oX
 i+WZsqKxne9yxy+oHybA2e72UOOnx/F3p+5PC7NapWhE4RCqHA7G5rwkGnVqSwbRQUDu
 Mmo2IpScC93a5lrjmrGm4KLX0fQdg6mJwSZbra40+PcJskrI7pdSB8Nc91xqZ1ye5Q/Q
 X16BX2+Ta+ECNeDc3bIngyMP+zqyHg9hgkVPdr9yvFHZKBwaDqAPuOQlcc1CtM6dvtMR
 vsyw==
X-Gm-Message-State: AOAM533tevBIVs6XT08P9sohg4qwpc24p4lNd2Re7th/ffc/j/IZbr8w
 Wf4DI3EvILVNwElSpG7hrrmdQLoKLF7W0PTWaysw0DMmJywXFjKkiQA1MjIShdtovtxHg7h4PSs
 fc2snRuD0hPUix5c=
X-Received: by 2002:a17:90a:d244:: with SMTP id
 o4mr1943389pjw.71.1626238414461; 
 Tue, 13 Jul 2021 21:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd3jqJsAwuMB/Rhl258izppi9Ysd/lN/1I/qWR+RMnN7Nuua2rVr1Xnlsv9rN29BtsIjgdGA==
X-Received: by 2002:a17:90a:d244:: with SMTP id
 o4mr1943363pjw.71.1626238414075; 
 Tue, 13 Jul 2021 21:53:34 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 72sm945613pgd.10.2021.07.13.21.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 21:53:33 -0700 (PDT)
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <854f526c-8ee0-a910-e0f9-08cf09ad3213@redhat.com>
Date: Wed, 14 Jul 2021 12:53:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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


在 2021/7/14 上午11:42, Bin Meng 写道:
> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/13 下午5:11, Bin Meng 写道:
>>> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/7/13 下午4:36, Bin Meng 写道:
>>>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2021/7/13 上午7:06, Bin Meng 写道:
>>>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>>
>>>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>>>>>>> the manual and real hardware.
>>>>>>>>>>
>>>>>>>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>>>>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>>>>>>
>>>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>>>>>> ---
>>>>>>>>>>
>>>>>>>>>> (no changes since v1)
>>>>>>>>>>
>>>>>>>>>>       hw/net/e1000.c | 2 ++
>>>>>>>>>>       1 file changed, 2 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>>>>>>>> index 4f75b44cfc..20cbba6411 100644
>>>>>>>>>> --- a/hw/net/e1000.c
>>>>>>>>>> +++ b/hw/net/e1000.c
>>>>>>>>>> @@ -29,6 +29,7 @@
>>>>>>>>>>       #include "hw/pci/pci.h"
>>>>>>>>>>       #include "hw/qdev-properties.h"
>>>>>>>>>>       #include "migration/vmstate.h"
>>>>>>>>>> +#include "net/eth.h"
>>>>>>>>>>       #include "net/net.h"
>>>>>>>>>>       #include "net/checksum.h"
>>>>>>>>>>       #include "sysemu/sysemu.h"
>>>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>>>>>>>           [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>>>>>>>                       E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>>>>>>>                       E1000_MANC_RMCP_EN,
>>>>>>>>>> +    [VET]     = ETH_P_VLAN,
>>>>>>>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>>>>>>>
>>>>>>>>> (See e1000_properties[])
>>>>>>>>>
>>>>>>>> No we don't need to since it does not break migration.
>>>>>>> Ping?
>>>>>> I admit migration "works" but it doesn't mean it's not broken. It
>>>>>> changes the guest visible default value of VET register, so it may break
>>>>>> things silently for the guest.
>>>>>>
>>>>>> For old machine types, we should stick the value to the one without this
>>>>>> fix.
>>>>> Could you please propose a solution on how to handle such a scenario
>>>>> in a generic way in QEMU? (+Peter)
>>>> Well, I think I've suggested you to have a look at how things is done in
>>>> for handling such compatibility in e1000_properties.
>>>>
>>>>
>>>>> The POR reset value is wrong in QEMU and has carried forward the wrong
>>>>> value for years, and correcting it to its right value needs to do
>>>>> what?
>>>> We should stick to the wrong behavior for old machine types.
>>>>
>>>> That's all.
>>> So that means the following SD patch is also wrong (+Philippe) which
>>> changes the default value of capability register.
>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.24113-1-joannekoong@gmail.com/
>>
>> It should compat capareg for the old value for old machine types.
> Yeah, it's already a property for the SD controller model but someone
> views it as a bug because the model implements 64-bit but not
> reporting it in the capability register.
>
>>
>>> Can we get some agreement among maintainers?
>>
>> It's not about the agreement but about to have a stable ABI. I don't
>> know the case for sd but e1000 is used in various  and we work hard to
>> unbreak the migration compatibility among downstream versions. Git log
>> on e1000.c will tell you more.
> Agreement or stable ABI, whatever we call, but we should be in some consistency.
>
> IMHO maintainers should reach an agreement to some extent on how
> compatibility should be achieved. I just found silly to add a property
> to fix a real bug in the model, and we preserve the bug all over
> releases.


That's the price for the stable ABI. See one of my recent fix - 
d83f46d189 virtio-pci: compat page aligned ATS. It keeps the "buggy" 
behavior to unbreak the migration.


>
> I can find plenty of examples in the current QEMU tree that were
> accepted that changed the bugous register behavior, but it was not
> asked to add new properties to keep the bugos behavior.
>
> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logic")


I guess it's simply because fsl_etsec is not used in any 
distributions/production environments or the maintainer may just not 
notice things like this.

But for e1000(e), we should stick to a stable ABI for consistency. 
Otherwise it would be very tricky to fix them after we saw real issues. 
We had learnt a lot during the past decade.

Thanks


>
> Regards,
> Bin
>


