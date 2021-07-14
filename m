Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FA3C7C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 05:12:19 +0200 (CEST)
Received: from localhost ([::1]:59226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3VJq-000412-3z
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 23:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3VIP-0003JF-Vg
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3VIM-00058E-61
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 23:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626232245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiselnT1Slm/P0PWSxeu5KQZiOoUCpe5laiEtn1DLtY=;
 b=TrHmTdWlkIlaLkkTcmXISM8utWB/BaKXwrFahYMRhZPad9+DZkPYdfsmsQZbSY7qS2QfBk
 cgEhDX2Ce/3+9DgOWn5P0nOZQcXkfK5RSh2KQhgrEFKFnWNyCYIQFokDHT0HrbdoES2auO
 xv6S2uPycAFrjOBddaYmOKTD69L6fdU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-NKaKAYS3NLCI1RJW-9vX_w-1; Tue, 13 Jul 2021 23:10:36 -0400
X-MC-Unique: NKaKAYS3NLCI1RJW-9vX_w-1
Received: by mail-pf1-f199.google.com with SMTP id
 a18-20020a056a000c92b02903282ac9a232so587485pfv.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 20:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yiselnT1Slm/P0PWSxeu5KQZiOoUCpe5laiEtn1DLtY=;
 b=K6sO2Kq8D5hh3RGrejkGjTDacDGe1KCj66naL4MbJZuL3/8IOxcdQcKW7Vev3O/lmN
 bh4caYWLkFLbe0apJctDToI6gyhkriDJJamjc/clOigp1R13A65NPf7CluMlZmfN0KDq
 9x+7ydecWshJsaj8K54yJQQEW1Ki/G8jwa6iHs2JGWnBGWWKEg1aPb7VxfuA9H6i09sS
 KSFMPr0pyq/ySKtauLdfiyI9+AZX381B3NYZnprYFvdpgUyyNFh0RbDsn4/JZ9vNmb1W
 rmhG+ZyiVSs7XAbOWagn4+txh0XERqygUZdFAs/tA6QlAKIDFfoq8/RzUT4oIbhMIO7G
 Y5BQ==
X-Gm-Message-State: AOAM533/AnIqCmyHakzvAF0Z8T0A09r2H5lqAGv5YZm1KRIaFOaCeirm
 VdeKTzlcAAsHO3HE0p+zTX3kgbUZP+SLu4AoGwt/3MCybTXdv5eoBdeX/spIXEK1EqhSj/fk4zh
 4XQmhYvR+Ph56u3g=
X-Received: by 2002:a63:1308:: with SMTP id i8mr7328979pgl.19.1626232235870;
 Tue, 13 Jul 2021 20:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Sz2lZVSm8JUmZB26rsc3PRn59Ngi3f+amG8WbZJk1qSD/v4FRpyUt/NTgKx03qP2Txoo4A==
X-Received: by 2002:a63:1308:: with SMTP id i8mr7328951pgl.19.1626232235553;
 Tue, 13 Jul 2021 20:10:35 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c141sm593769pfc.13.2021.07.13.20.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 20:10:34 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
 <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
Date: Wed, 14 Jul 2021 11:10:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/13 下午5:11, Bin Meng 写道:
> On Tue, Jul 13, 2021 at 5:02 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/13 下午4:36, Bin Meng 写道:
>>> On Tue, Jul 13, 2021 at 3:03 PM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/7/13 上午7:06, Bin Meng 写道:
>>>>> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>>>>
>>>>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>>>>> the manual and real hardware.
>>>>>>>>
>>>>>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>>>>
>>>>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> (no changes since v1)
>>>>>>>>
>>>>>>>>      hw/net/e1000.c | 2 ++
>>>>>>>>      1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>>>>>> index 4f75b44cfc..20cbba6411 100644
>>>>>>>> --- a/hw/net/e1000.c
>>>>>>>> +++ b/hw/net/e1000.c
>>>>>>>> @@ -29,6 +29,7 @@
>>>>>>>>      #include "hw/pci/pci.h"
>>>>>>>>      #include "hw/qdev-properties.h"
>>>>>>>>      #include "migration/vmstate.h"
>>>>>>>> +#include "net/eth.h"
>>>>>>>>      #include "net/net.h"
>>>>>>>>      #include "net/checksum.h"
>>>>>>>>      #include "sysemu/sysemu.h"
>>>>>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>>>>>          [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>>>>>                      E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>>>>>                      E1000_MANC_RMCP_EN,
>>>>>>>> +    [VET]     = ETH_P_VLAN,
>>>>>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>>>>>
>>>>>>> (See e1000_properties[])
>>>>>>>
>>>>>> No we don't need to since it does not break migration.
>>>>> Ping?
>>>> I admit migration "works" but it doesn't mean it's not broken. It
>>>> changes the guest visible default value of VET register, so it may break
>>>> things silently for the guest.
>>>>
>>>> For old machine types, we should stick the value to the one without this
>>>> fix.
>>> Could you please propose a solution on how to handle such a scenario
>>> in a generic way in QEMU? (+Peter)
>>
>> Well, I think I've suggested you to have a look at how things is done in
>> for handling such compatibility in e1000_properties.
>>
>>
>>> The POR reset value is wrong in QEMU and has carried forward the wrong
>>> value for years, and correcting it to its right value needs to do
>>> what?
>>
>> We should stick to the wrong behavior for old machine types.
>>
>> That's all.
> So that means the following SD patch is also wrong (+Philippe) which
> changes the default value of capability register.
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210623185921.24113-1-joannekoong@gmail.com/


It should compat capareg for the old value for old machine types.


>
> Can we get some agreement among maintainers?


It's not about the agreement but about to have a stable ABI. I don't 
know the case for sd but e1000 is used in various  and we work hard to 
unbreak the migration compatibility among downstream versions. Git log 
on e1000.c will tell you more.

Thanks


>
> Regards,
> Bin
>


