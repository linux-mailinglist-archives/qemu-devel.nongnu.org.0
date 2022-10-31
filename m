Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ACE613693
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU4t-0007Y8-Hw; Mon, 31 Oct 2022 08:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU4p-00078t-RW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:39:39 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU4n-0006Li-H4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:39:39 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so15804996pji.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y78+Ekch7keM8llYX9QtCqWp5w7Z7Q2XQS5jAe96i1Q=;
 b=S9Fsg3MnthGap1YZzA1+ZVmi+aAc5DFDGiKzE5mEEYnn0cP+nrwqjEcW9JsFcBKrt6
 8W0xxyrq5MekFsiuflbaj5kN81BAPlQ5Np0Eru6vLdyXB+4TQ2NGeB7ZPUngVOjfRimY
 95fLkKgAkxlsD2JDv8cUWJDThDaNb7C2wq+PNPaEYl5JSpvoWCscfLihLaf94HdEEARg
 BxySYQ0rWxqtkU+ZFegX1JcS6lz92siWQqIupyllnr2Of79Zi8kOMM5pcWfjJkIcLI94
 LKiqBCYy/qFSf9SNgv8LJLBqDgoBB75oU082IggRiFziX3ZTJT5Ha55o2dvadtzEU8Qw
 vVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y78+Ekch7keM8llYX9QtCqWp5w7Z7Q2XQS5jAe96i1Q=;
 b=7MG8SMTBG1bNZTBCj5YsBQKcUM5rOX3k4ihQP5jpjKzvnr5Si6p8S0x7vJH6m5CN0c
 H6wYAK3yfusEOiFLAegr6D8YeaitmpueAebUKB6ZPgFYN9CFr/mJGVDzhSotcWM5Tn7y
 JVAcJhmUCMEu8cE6zgNoYP5EjrkHBp3IlHR9wWpNmom71Q5AAgV21jOL8dYyaKD2E9+f
 ovASXPkVpcivzWr5Ge9Mi8ya/Crwdme64eWwmHaO4B9/I525/K1fuJb7OfFNK6H+4c9r
 UP0r4WsCFCtPVdOh9Kcs5GflOIM6G6n6YWr+XEnKWZ9nN0wDj4YzOp2BKxg67v5TRCkM
 zu8w==
X-Gm-Message-State: ACrzQf3uEHMvC8jQ2QgkJtbKzJkXEBymTgdynifUyZC6HqqWN1lUNotF
 9YfVN+qxyMQsKDBtkWDrnw/ang==
X-Google-Smtp-Source: AMsMyM6+FidC9ncB7A2HYIPWxVC4SznXEQwjElibB5uRUX9xvjNk0520lWhSTmUzEoGM0yIqkoCtNA==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id
 t10-20020a170902b20a00b001786f5bf903mr14411897plr.39.1667219976028; 
 Mon, 31 Oct 2022 05:39:36 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a17090a054100b00212d4c50647sm4044681pjf.36.2022.10.31.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:39:35 -0700 (PDT)
Message-ID: <7d0dbb38-a8fd-2ae8-47ac-1e5d98ef77fc@daynix.com>
Date: Mon, 31 Oct 2022 21:39:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
 <20221028122629.3269-3-akihiko.odaki@daynix.com>
 <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org



On 2022/10/29 7:35, Philippe Mathieu-Daudé wrote:
> On 28/10/22 14:26, Akihiko Odaki wrote:
>> pci_add_capability appears most PCI devices. Its error handling required
>> lots of code, and led to inconsistent behaviors such as:
>> - passing error_abort
>> - passing error_fatal
>> - asserting the returned value
>> - propagating the error to the caller
>> - skipping the rest of the function
>> - just ignoring
>>
>> The code generating errors in pci_add_capability had a comment which
>> says:
>>> Verify that capabilities don't overlap.  Note: device assignment
>>> depends on this check to verify that the device is not broken.
>>> Should never trigger for emulated devices, but it's helpful for
>>> debugging these.
>>
>> Indeed vfio has some code that passes capability offsets and sizes from
>> a physical device, but it explicitly pays attention so that the
>> capabilities never overlap. Therefore, we can always assert that
>> capabilities never overlap when pci_add_capability is called, resolving
>> these inconsistencies.
>>
>> Such an implementation of pci_add_capability will not have errp
>> parameter. However, there are so many callers of pci_add_capability
>> that it does not make sense to amend all of them at once to match
>> with the new signature. Instead, this change will allow callers of
>> pci_add_capability to omit errp as the first step.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/pci/pci.c         |  8 ++++----
>>   include/hw/pci/pci.h | 13 ++++++++++---
>>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index b54b6ef88f..51fd106f16 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -2,6 +2,7 @@
>>   #define QEMU_PCI_H
>>   #include "exec/memory.h"
>> +#include "qapi/error.h"
>>   #include "sysemu/dma.h"
>>   /* PCI includes legacy ISA access.  */
>> @@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, 
>> MemoryRegion *mem,
>>   void pci_unregister_vga(PCIDevice *pci_dev);
>>   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>> -int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>> -                       uint8_t offset, uint8_t size,
>> -                       Error **errp);
>> +int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
>> +                              uint8_t offset, uint8_t size,
>> +                              Error **errp);
>> +
>> +#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
>> +    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
>> +
>> +#define pci_add_capability(...) \
>> +    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
> Do we really need PCI_ADD_CAPABILITY_VA?
> 
>    #define pci_add_capability(...) \
>         pci_add_capability_legacy(__VA_ARGS__, &error_abort)
> 

When errp is specified by the caller, the last argument, &error_abort 
becomes extra and the compiler complains about that. 
PCI_ADD_CAPABILITY_VA is a temporary dirty hack to ignore the extra 
argument.

Regards,
Akihiko Odaki

