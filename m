Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54834B8EF
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 19:37:53 +0100 (CET)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQDom-0007TH-8p
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 14:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDmj-0006ZK-5R; Sat, 27 Mar 2021 14:35:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDmf-0005em-7W; Sat, 27 Mar 2021 14:35:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so6503125wmd.4; 
 Sat, 27 Mar 2021 11:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ru0jhyt14E6utYMuqRBXsTsHFKiOoNnfR09tppTg50g=;
 b=NujM4Mh5CU34wony7ClgihefJICr5qqGLx7bfcu2JnOGyVQKGZr+3n1sN4EAxG7zdj
 rd/ZiiyiSOGzy0c5RkqLrgHS4nAOSs2EbexU1TcsIz+mFFOZ4Hpcqh4CTdymYFCdWn+n
 ikde7r9rcg5fZHJCINx9QLKRuZljDF5FzE7mdRA6dNpxu3TDPUe4RvWuumlfysTGjO4/
 9UbO/hMYmL3AsKwWzk0GMrTl4NIJr4AeXbgOOfUkk//5YBAc5/YOky0nnpZ5GfaX7Ecp
 qk9lZBVauOlIV7Ri0h5LE8snS+2FzZYNIXPeqjffX08wBVwPNb0L5kLznMfbpjcKVLWo
 m0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ru0jhyt14E6utYMuqRBXsTsHFKiOoNnfR09tppTg50g=;
 b=jrtaeAT33r+qJ1PGiruPZN7jyu7K2t6/AISO7Ob3kJ4fvJsKxqnBO7qKzePvXvqyr6
 aSGPAnbkDvMTzjJINCvSb6ERoW2C43/99EMsA/oUqeqIwqvrdgw7HTTGg+wF3mRe9FLx
 /k2cQrDwyqnDaPSKNDd3rdQrGiQH4tM/0BCZgKfEFwN0vujhYxDID+H5tV+ooqpNZ0ZQ
 SJvCFX+Q/B/HY+ekWLHwl0xpTmqSxyeIjtp17SdD1OdfYhSTNttS6nVp4XvE1++SHzAw
 QpVLH2DGv+A2OPVPRhA8KKb58jzsAPqbDp2MPqZ0miijV6oA7poIXlYAdX1HvvoNJcMp
 kieg==
X-Gm-Message-State: AOAM533VrV0HcztFx/i6zJXAiQ2wvZjfIfniTDtF/BjL6ji7YBMlnKd5
 Tawa17RRU8xyP73mu6nv3k3tus331UfgIQ==
X-Google-Smtp-Source: ABdhPJxmjfdj8uHJur12swId4BzbjudqlWKbaKSJ9jySsjw7oHy2Bf2dwkQPzD/VqXvhC8e235IeOg==
X-Received: by 2002:a05:600c:b57:: with SMTP id
 k23mr17697847wmr.145.1616870138382; 
 Sat, 27 Mar 2021 11:35:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u8sm19933065wrr.42.2021.03.27.11.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 11:35:37 -0700 (PDT)
Subject: Re: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210327082804.2259480-1-thuth@redhat.com>
 <f9c5e949-1790-31ae-54c7-ccfdc3c16ae9@amsat.org>
 <f20613c8-2a01-68b8-e4da-0387e0f63e1b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <39afc328-73bc-2168-52a7-44914a87a799@amsat.org>
Date: Sat, 27 Mar 2021 19:35:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f20613c8-2a01-68b8-e4da-0387e0f63e1b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/27/21 7:19 PM, Thomas Huth wrote:
> On 27/03/2021 15.54, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 3/27/21 9:28 AM, Thomas Huth wrote:
>>> Many files include hw/sysbus.h without needing it. Remove the
>>> superfluous
>>> include statements.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   hw/arm/cubieboard.c         | 1 -
>>>   hw/arm/orangepi.c           | 1 -
>>>   hw/char/riscv_htif.c        | 1 -
>>>   hw/char/sifive_uart.c       | 1 -
>>>   hw/char/virtio-serial-bus.c | 1 -
>>>   hw/core/generic-loader.c    | 1 -
>>>   hw/core/guest-loader.c      | 1 -
>>>   hw/ide/ahci_internal.h      | 1 -
>>>   hw/input/lasips2.c          | 1 -
>>>   hw/intc/arm_gic_kvm.c       | 1 -
>>>   hw/intc/arm_gicv3.c         | 1 -
>>>   hw/intc/arm_gicv3_kvm.c     | 1 -
>>>   hw/intc/s390_flic_kvm.c     | 1 -
>>>   hw/isa/lpc_ich9.c           | 1 -
>>>   hw/isa/piix4.c              | 1 -
>>>   hw/moxie/moxiesim.c         | 1 -
>>>   hw/nios2/generic_nommu.c    | 1 -
>>>   hw/nubus/nubus-bus.c        | 1 -
>>>   hw/nvram/spapr_nvram.c      | 1 -
>>>   hw/rx/rx-gdbsim.c           | 1 -
>>>   hw/s390x/s390-ccw.c         | 1 -
>>>   hw/s390x/virtio-ccw.c       | 1 -
>>>   hw/timer/mips_gictimer.c    | 1 -
>>>   hw/usb/xen-usb.c            | 1 -
>>>   hw/vfio/ap.c                | 1 -
>>>   hw/vfio/ccw.c               | 1 -
>>>   hw/xen/xen-bus-helper.c     | 1 -
>>>   27 files changed, 27 deletions(-)
>>
>> $ git grep -l '#include "hw/sysbus.h"' hw \
>>    | xargs git grep -L sysbus_ \
>>    | xargs git grep -L 'SysBusDevice\s\+\w'
>>
>> hw/arm/cubieboard.c
>> hw/arm/orangepi.c
>> hw/char/riscv_htif.c
>> hw/char/sifive_uart.c
>> hw/char/virtio-serial-bus.c
>> hw/core/generic-loader.c
>> hw/core/guest-loader.c
>> hw/hyperv/vmbus.c
>> hw/i386/x86-iommu.c
>> hw/ide/ahci_internal.h
>> hw/input/lasips2.c
>> hw/intc/arm_gic_kvm.c
>> hw/intc/arm_gicv3.c
>> hw/intc/arm_gicv3_kvm.c
>> hw/intc/s390_flic_kvm.c
>> hw/isa/lpc_ich9.c
>> hw/isa/piix4.c
>> hw/moxie/moxiesim.c
>> hw/nios2/generic_nommu.c
>> hw/nubus/nubus-bridge.c
>> hw/nubus/nubus-bus.c
>> hw/nvram/spapr_nvram.c
>> hw/ppc/spapr_pci.c
>> hw/riscv/riscv_hart.c
>> hw/rx/rx-gdbsim.c
>> hw/s390x/s390-ccw.c
>> hw/s390x/virtio-ccw.c
>> hw/timer/mips_gictimer.c
>> hw/tricore/tc27x_soc.c
>> hw/usb/xen-usb.c
>> hw/vfio/ap.c
>> hw/vfio/ccw.c
>> hw/xen/xen-bus-helper.c
>>
>> diff with your set:
>>
>> @@ -5,6 +5,8 @@
>>   hw/char/virtio-serial-bus.c
>>   hw/core/generic-loader.c
>>   hw/core/guest-loader.c
>> +hw/hyperv/vmbus.c
>> +hw/i386/x86-iommu.c
>>   hw/ide/ahci_internal.h
>>   hw/input/lasips2.c
>>   hw/intc/arm_gic_kvm.c
>> @@ -15,12 +17,16 @@
>>   hw/isa/piix4.c
>>   hw/moxie/moxiesim.c
>>   hw/nios2/generic_nommu.c
>> +hw/nubus/nubus-bridge.c
>>   hw/nubus/nubus-bus.c
>>   hw/nvram/spapr_nvram.c
>> +hw/ppc/spapr_pci.c
>> +hw/riscv/riscv_hart.c
>>   hw/rx/rx-gdbsim.c
>>   hw/s390x/s390-ccw.c
>>   hw/s390x/virtio-ccw.c
>>   hw/timer/mips_gictimer.c
>> +hw/tricore/tc27x_soc.c
>>   hw/usb/xen-usb.c
>>   hw/vfio/ap.c
>>   hw/vfio/ccw.c
>>
>> 6 more candidates?
> 
> No, since those use TYPE_SYS_BUS_DEVICE and thus require hw/sysbus.h.

Ah indeed, this line matches your patch changes:

$ git grep -l '#include "hw/sysbus.h"' hw \
   | xargs git grep -L sysbus_ \
   | xargs git grep -L 'SysBusDevice\s\+\w' \
   | xargs grep -L SYS_BUS_DEVICE

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

