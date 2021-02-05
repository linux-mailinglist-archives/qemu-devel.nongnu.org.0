Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E7310614
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:54:35 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vwo-0003cm-4j
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7vvX-00034b-VN; Fri, 05 Feb 2021 02:53:15 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7vvW-0001Kz-A0; Fri, 05 Feb 2021 02:53:15 -0500
Received: by mail-ej1-x636.google.com with SMTP id bl23so10353743ejb.5;
 Thu, 04 Feb 2021 23:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2835+SKHHf5Iz8B+uH9R87NPksi41azEg9ZS0ZxqobQ=;
 b=pp9Fhkp3QI/7YJfurpZp7jsw3/t9bnjsKzvrXvJ8VodilL07NIQdHysH9c7ZmwPHSs
 aDwporMsBVmMuj/782sEsXvLMlnK4/gNWqE2AhOP5p2bsIulrW26VSR8a400eIRo6eKS
 /N4pKjgvd8Ruh4/+SOck7unz2aj73EMdL8z1YTGQ0pGiAUGJJ7BmL5/ERm0FMTaKSqEC
 cebklPbSHKJtLP2Et0oQbDLhQaIAkEHY1IlMAUN1frsHaBIMWqVZRLgNLgOU+LCxSn7A
 bRE2fwOjgy18NI8udDdzWWMfo9wNkqzSB2zr+efCbX3ubHgj56A2mn5v3/qTxV4za7Xm
 /u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2835+SKHHf5Iz8B+uH9R87NPksi41azEg9ZS0ZxqobQ=;
 b=D+cYWKv6igSV70/0cwTNm47MRnUjCFCRv8REY1EPmuaGvDojCiZMrqsEaXZtbqyURF
 el4jlMSFgb5Y5D7+UeczMlL7Q3/g6KZhE/G/5E2KDOrgqrtMRiH9JCo3+dEzOfQQ37pW
 Jw6n96RGuLmYnUFBemhyc5bGD624nywQ5TK1JsPw5/3cKYZQEKiNW92JCfISYV4mm28C
 LjPdiUsxQCcW8BZk0vjG3uxHWWgjubZ7VVSCjR856AltmPvtVgAgkwZ/MJlQuI63AhzU
 zqenBB8HdCrsPEXQnVgHrNwv65RnZ6trYHuWnghE2gzVU6Q3l+9GzHasmM0RhGrsLG9B
 6Phw==
X-Gm-Message-State: AOAM530ZvOVdHfD8M1TpsjCGPqDQT0po1Cu4B9mvvdj55brsklRWh/lw
 mKJ4CXQcxjuhy/DdBRrlhlaQHEchpcA=
X-Google-Smtp-Source: ABdhPJx77/qUPXom1+xuZc6Y3Wa/eais+wgRWl8A+Tq9yiezjxygCE5E9KLgp8YGu+7Rd0zomEx8gw==
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr2912468eja.172.1612511591974; 
 Thu, 04 Feb 2021 23:53:11 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id g2sm3511071ejk.108.2021.02.04.23.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 23:53:11 -0800 (PST)
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: schspa <schspa@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
Date: Fri, 5 Feb 2021 08:53:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Kevin Zhao <kevin.zhao@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:04 AM, schspa wrote:
> On Thu, 2021-02-04 at 09:19 +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Please Cc the maintainers when posting your patch:
>>
>> ./scripts/get_maintainer.pl -f hw/arm/xlnx-versal-virt.c
>> Alistair Francis <alistair@alistair23.me> (maintainer:Xilinx ZynqMP
>> and...)
>> "Edgar E. Iglesias" <edgar.iglesias@gmail.com> (maintainer:Xilinx
>> ZynqMP
>> and...)
>> Peter Maydell <peter.maydell@linaro.org> (maintainer:Xilinx ZynqMP
>> and...)
>> qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
>>
> 
> Thanks for reminding, I will pay attention next time
> 
>> On 2/4/21 7:58 AM, schspa wrote:
>>>
>>> At the moment the following QEMU command line triggers an assertion
>>> failure On xlnx-versal SOC:
>>>   qemu-system-aarch64 \
>>>       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
>>>       -fsdev local,id=shareid,path=${HOME}/work,security_model=none
>>> \
>>>       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
>>>       -fsdev
>>> local,id=shareid1,path=${HOME}/Music,security_model=none \
>>>       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
>>>
>>>   qemu-system-aarch64: ../migration/savevm.c:860:
>>>   vmstate_register_with_alias_id:
>>>   Assertion `!se->compat || se->instance_id == 0' failed.
>>>
>>> This problem was fixed on arm virt platform in patch
>>>  
>>>  
>>> https://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg01119.html
>>
>> Please use instead "in commit f58b39d2d5b ("virtio-mmio: format
>> transport base address in BusClass.get_dev_path")".
>>
> 
> Thanks, I will upload a new patch to fix it if there is no need to do
> further change for the next question.
> 
>>> It works perfectly on arm virt platform. but there is still there
>>> on
>>> xlnx-versal SOC.
>>>
>>> The main difference between arm virt and xlnx-versal is they use
>>> different way to create virtio-mmio qdev. on arm virt, it calls
>>> sysbus_create_simple("virtio-mmio", base, pic[irq]); which will
>>> call
>>> sysbus_mmio_map internally and assign base address to subsys device
>>> mmio correctly. but xlnx-versal's implements won't do this.
>>>
>>> However, xlnx-versal can't switch to sysbus_create_simple() to
>>> create
>>> virtio-mmio device. It's because xlnx-versal's cpu use
>>> VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
>>> system_memory. sysbus_create_simple will add virtio to
>>> system_memory,
>>> which can't be accessed by cpu.
>>>
>>> We can solve this by simply assign mmio[0].addr directly. makes
>>> virtio_mmio_bus_get_dev_path to produce correct unique device path.
>>>
>>> Signed-off-by: schspa <schspa@gmail.com>
>>> ---
>>>  hw/arm/xlnx-versal-virt.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
>>> index 8482cd6196..87b92ec6c3 100644
>>> --- a/hw/arm/xlnx-versal-virt.c
>>> +++ b/hw/arm/xlnx-versal-virt.c
>>> @@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt
>>> *s)
>>>          object_property_add_child(OBJECT(&s->soc), name,
>>> OBJECT(dev));
>>>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev),
>>> &error_fatal);
>>>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
>>> +        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;
>>
>> The proper API call is:
>>
>>            sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>
> 
> Can't to call this API, because this api will map virtio device memory
> region to system_map. and it can't be add to &s->soc.mr_ps again. I'm
> willing to change it to proper api but can't find a proper one.

Indeed, you found a design issue IMO:

Versal creates the "mr-ps-switch" to be explicitly different from
the main sysbus memory. TYPE_VIRTIO_MMIO is a SYSBUS device, thus
can not be created without being plugged on sysbus.
We want TYPE_VIRTIO_MMIO to be TYPE_USER_CREATABLE so we can create
it on the command line (like your usage). TYPE_SYSBUS allows such
automatic plug it on the main bus, but also maps to main memory.

Not sure where to go from here, Cc'ing Peter/Markus/Eduardo.

> 
>>>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>>>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
>>>          g_free(name);
>>>
>>
> 

