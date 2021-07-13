Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B471F3C6CD2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:04:02 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EKf-0006y3-PB
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3EJe-0005jH-V8
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3EJd-0006Et-9a
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626166976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KV/u/xYe93ggwgOlC/OZEAldJpQyGnKOqR0qnlVTl1k=;
 b=GwuikPIC1YGBsz49ilxd/sv0sYCzeqTuk92aDIaE9FXjLaYUzN5iciN40jwuv5oejJmuiA
 RBFyjXPCTgQog+tOYItEFYDXDeY377PguyxBt3N0bj0DrM9ZOxjonIfcGiOzTX843/TXbs
 vIjaBv977ZfN5bJypz2EeWTB7Kg+Xak=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-heTmIcp0ObK9DABmaOVstA-1; Tue, 13 Jul 2021 05:02:55 -0400
X-MC-Unique: heTmIcp0ObK9DABmaOVstA-1
Received: by mail-pl1-f199.google.com with SMTP id
 p8-20020a1709028a88b029011c6ee150f3so7395502plo.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 02:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KV/u/xYe93ggwgOlC/OZEAldJpQyGnKOqR0qnlVTl1k=;
 b=Wk+t8/Zy8ectkFZtcMyVWQ8WMnbHVIs3OQwJ9gq4fSxH8XZqPwZAGmcSIGwGpPU/m9
 ch1Ubid0dEsyWIpyrXvBxI9bAq7z3LcChd2jMNor+XjPsmsCbCxaOF4vU7qAlWpA5ggq
 4QNxz5z+a0eo686e/gwDJ2LIP4YDJNKw8q6n3YbWJIM23bDC22A/bqWa1EM30AiAXWrU
 3UDHyDQKM5T1neSevVKGJkt3GkdpGpAAMrOi95lvUwNBJPo9Fa69gCGHVCx+RnqhGJUd
 we3IVAuL08zhAfaj2PwSjXJuNmzVjgK3MJsh7Xqw+BJn3Fpwd0bm3OTmpVZhdgfYx3/J
 2Q1g==
X-Gm-Message-State: AOAM530U4q7lpM6lyM9TqQa0ZYxOq4WVyKhXHYvJJrhg1rqtXucAdx5z
 tDqCqXCpjW9W+zwUewFABFhvxBbnWvMzpJady3L+yMAyvAVUWB0TSGGwTSMve1XVj7xCPLXywB+
 E26mlCfBRJnot7mc=
X-Received: by 2002:a17:903:2284:b029:12b:329:651e with SMTP id
 b4-20020a1709032284b029012b0329651emr2955398plh.44.1626166974589; 
 Tue, 13 Jul 2021 02:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrzV5WW6eFyxp3CL7DIRzkzA2tEtnk8FWRc8aZDTgVwGE5KTv+1o/lxnsk61JQDVLpzd19Eg==
X-Received: by 2002:a17:903:2284:b029:12b:329:651e with SMTP id
 b4-20020a1709032284b029012b0329651emr2955379plh.44.1626166974230; 
 Tue, 13 Jul 2021 02:02:54 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o34sm21247741pgm.6.2021.07.13.02.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 02:02:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
Date: Tue, 13 Jul 2021 17:02:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/13 下午4:36, Bin Meng 写道:
> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/13 上午7:06, Bin Meng 写道:
>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>>
>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>>> the manual and real hardware.
>>>>>>
>>>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>>
>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>> ---
>>>>>>
>>>>>> (no changes since v1)
>>>>>>
>>>>>>     hw/net/e1000.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>>>> index 4f75b44cfc..20cbba6411 100644
>>>>>> --- a/hw/net/e1000.c
>>>>>> +++ b/hw/net/e1000.c
>>>>>> @@ -29,6 +29,7 @@
>>>>>>     #include "hw/pci/pci.h"
>>>>>>     #include "hw/qdev-properties.h"
>>>>>>     #include "migration/vmstate.h"
>>>>>> +#include "net/eth.h"
>>>>>>     #include "net/net.h"
>>>>>>     #include "net/checksum.h"
>>>>>>     #include "sysemu/sysemu.h"
>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>>>         [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>>>                     E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>>>                     E1000_MANC_RMCP_EN,
>>>>>> +    [VET]     = ETH_P_VLAN,
>>>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>>>
>>>>> (See e1000_properties[])
>>>>>
>>>> No we don't need to since it does not break migration.
>>> Ping?
>>
>> I admit migration "works" but it doesn't mean it's not broken. It
>> changes the guest visible default value of VET register, so it may break
>> things silently for the guest.
>>
>> For old machine types, we should stick the value to the one without this
>> fix.
> Could you please propose a solution on how to handle such a scenario
> in a generic way in QEMU? (+Peter)


Well, I think I've suggested you to have a look at how things is done in 
for handling such compatibility in e1000_properties.


>
> The POR reset value is wrong in QEMU and has carried forward the wrong
> value for years, and correcting it to its right value needs to do
> what?


We should stick to the wrong behavior for old machine types.

That's all.


>
> Regards,
> Bin
>


