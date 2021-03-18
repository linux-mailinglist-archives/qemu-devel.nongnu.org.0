Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA1340A34
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:29:33 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvWe-0001H3-9z
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvT8-0006QD-Jo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvT2-0005Sh-V7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616084746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PPeudzRxkxuBfNVwDVpqomuDX/UXExx/+/094+bguQ=;
 b=VMrJ2g1vDGmJlpPEynt0yzYmRKst/Dp9vrfDlFR30al9bh9QQ9HbT7r6DQbT5kyvqAjY1C
 OWFX2IoLsJM/S2GXTm3JXIMZd+k3Fx8IP56Diybz/vgkI2PPc74+nIWUiJyNjhEdfmH7Ku
 JKKXzzn4rNBoAS+ygfDJTEE226jMDLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-DBmDO5xcOiuSAd_2gjm1vA-1; Thu, 18 Mar 2021 12:25:44 -0400
X-MC-Unique: DBmDO5xcOiuSAd_2gjm1vA-1
Received: by mail-wm1-f71.google.com with SMTP id r18so12011801wmq.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6PPeudzRxkxuBfNVwDVpqomuDX/UXExx/+/094+bguQ=;
 b=rBMFe+OAJvk7D8gHnvJl+mVxhzaRmCdzKZRYl2cQnuDItnRe9EVKa2nMVLogOuvThR
 9qyb5jPG91Pok0Rt4JcMncXq8OG5nBfLikEG8zcFXIOjqyPIpWKcVHBF5fWrltjUVrK5
 YtsSUkYPWDd8PMy2qtjNwWpwqEQ6dBldCqTQ7MUsQEOKDsSnHFgzRPzm+XehCCY6GdCO
 CXl0lHnuODJbKnGYt1oEKMnlvlPndZMCCuZcSZGIp9EM7HbT9wVxuVRNVI8M8kKJ/7b/
 LAU2j57d+VvBHX6lJlyFv4iDzn3HOyJCQ1dwaS/UbOqjiL+7yh8T9Pc/gXT4bijfaohy
 8O4g==
X-Gm-Message-State: AOAM531P2V0fb/LbokqUNqIKd/cM7jFwfgZVlkczoenaQSs1nTBDeeHo
 rolQvv2h9PydurIAUb/wZmH8Oo1DRjZqE3e+8IHJzBTvi6DcoLf1fuJFhMF6P8prGiWW8rgs+jL
 vTTTUxfyRAFlPSEQ=
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr127990wrn.200.1616084742915;
 Thu, 18 Mar 2021 09:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtWDFvquiicYtLLo1JuUf6Ksj+QPGpqqicCa6rdp/HvaO2SmwCfrLi5JMloUlTc20ePMirbw==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr127964wrn.200.1616084742648;
 Thu, 18 Mar 2021 09:25:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m10sm2779092wmh.13.2021.03.18.09.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:25:42 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
 <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
 <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0b3cedb8-f40a-18fd-5030-a596afb9298d@redhat.com>
Date: Thu, 18 Mar 2021 17:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 4:56 PM, Laurent Vivier wrote:
> Le 18/03/2021 à 16:51, Laurent Vivier a écrit :
>> Le 18/03/2021 à 16:36, Philippe Mathieu-Daudé a écrit :
>>> On 3/18/21 11:06 AM, Laurent Vivier wrote:
>>>> Le 18/03/2021 à 11:02, Philippe Mathieu-Daudé a écrit :
>>>>> On 3/18/21 10:52 AM, Laurent Vivier wrote:
>>>>>> Le 18/03/2021 à 10:19, Philippe Mathieu-Daudé a écrit :
>>>>>>> Hi Laurent,
>>>>>>>
>>>>>>> +Paolo / Thomas
>>>>>>>
>>>>>>> On 3/15/21 9:42 PM, Laurent Vivier wrote:
>>>>>>>> The machine is based on Goldfish interfaces defined by Google
>>>>>>>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>>>>>>>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>>>>>>>
>>>>>>>> The machine is created with 128 virtio-mmio bus, and they can
>>>>>>>> be used to use serial console, GPU, disk, NIC, HID, ...
>>>>>>>>
>>>>>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>>> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
>>>>>>>> ---
>>>>>>>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>>>>>>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>>>>>>>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>>>>>>>>  MAINTAINERS                                   |  13 +
>>>>>>>>  hw/m68k/Kconfig                               |   9 +
>>>>>>>>  hw/m68k/meson.build                           |   1 +
>>>>>>>>  6 files changed, 355 insertions(+)
>>>>>>>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>>>>>>>  create mode 100644 hw/m68k/virt.c
>>>>>>>
>>>>>>>> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
>>>>>>>> index 60d7bcfb8f2b..f839f8a03064 100644
>>>>>>>> --- a/hw/m68k/Kconfig
>>>>>>>> +++ b/hw/m68k/Kconfig
>>>>>>>> @@ -23,3 +23,12 @@ config Q800
>>>>>>>>      select ESP
>>>>>>>>      select DP8393X
>>>>>>>>      select OR_IRQ
>>>>>>>> +
>>>>>>>> +config M68K_VIRT
>>>>>>>> +    bool
>>>>>>>> +    select M68K_IRQC
>>>>>>>> +    select VIRT_CTRL
>>>>>>>> +    select GOLDFISH_PIC
>>>>>>>> +    select GOLDFISH_TTY
>>>>>>>> +    select GOLDFISH_RTC
>>>>>>>> +    select VIRTIO_MMIO
>>>>>>>
>>>>>>> I had this error on gitlab:
>>>>>>>
>>>>>>> (qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
>>>>>>> 'virtio-blk-pci' is not a valid device model name
>>>>>>> job: check-system-fedora
>>>>>>> https://gitlab.com/philmd/qemu/-/jobs/1106469724
>>>>>>>
>>>>>>> I bisected locally to this commit.
>>>>>>>
>>>>>>> check-system-fedora uses build-system-fedora:
>>>>>>>
>>>>>>> build-system-fedora:
>>>>>>>     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
>>>>>>>              --enable-fdt=system --enable-slirp=system
>>>>>>>              --enable-capstone=system
>>>>>>>
>>>>>>> I'm confused because the machine provides a VIRTIO bus
>>>>>>> via MMIO:
>>>>>>>
>>>>>>> config VIRTIO_MMIO
>>>>>>>     bool
>>>>>>>     select VIRTIO
>>>>>>>
>>>>>>> I remember I tested your machine with virtio-blk-device.
>>>>>>>
>>>>>>> config VIRTIO_BLK
>>>>>>>     bool
>>>>>>>     default y
>>>>>>>     depends on VIRTIO
>>>>>>>
>>>>>>> Ah, this is virtio-blk-pci, which has:
>>>>>>>
>>>>>>> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
>>>>>>> files('virtio-blk-pci.c'))
>>>>>>> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>>>>>>>
>>>>>>> And VIRTIO_PCI isn't selected...
>>>>>>
>>>>>> This machine doesn't have virtio-pci, but only virtio-mmio buses.
>>>>>
>>>>> Yes. I meant "VIRTIO_PCI isn't selected, which is the correct config
>>>>> for this machine". So the problem isn't the m68k-virt machine addition,
>>>>> but it shows another problem elsewhere.
>>>>>
>>>>>>> Are the tests incorrect then?
>>>>>>>
>>>>>>> libqos isn't restricted to PCI:
>>>>>>>
>>>>>>> tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
>>>>>>> tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
>>>>>>> tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
>>>>>>> "virtio-blk")) {
>>>>>>> tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
>>>>>>> in virtio-blk-device\n", interface);
>>>>>>> tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
>>>>>>> tests/qtest/libqos/virtio-blk.c:111:
>>>>>>> qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
>>>>>>> tests/qtest/libqos/virtio-blk.c:112:
>>>>>>> qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
>>>>>>> tests/qtest/libqos/virtio-blk.c:113:
>>>>>>> qos_node_produces("virtio-blk-device", "virtio-blk");
>>>>>>>
>>>>>>> But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
>>>>>>> use a generic virtio-blk-device instead, hoping it get plugged correctly
>>>>>>> to the virtio bus...
>>>>>>
>>>>>> Yes, it's how the machine work: it has 128 virtio-mmio buses and virtio-devices are plugged directly
>>>>>> in the first free ones.
>>>>>>
>>>>>> I think the fix would be to disable the virtio-blk-pci test for the machines without PCI bus.
>>>>>>
>>>>>> Why is it executed for now?
>>>>>
>>>>> This is probably the problem root cause.
>>>>>
>>>>> Possible fix:
>>>>>
>>>>> -->8 --
>>>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>>>>> index 66ee9fbf450..d7f3fad51c1 100644
>>>>> --- a/tests/qtest/meson.build
>>>>> +++ b/tests/qtest/meson.build
>>>>> @@ -217,13 +217,17 @@
>>>>>    'emc141x-test.c',
>>>>>    'usb-hcd-ohci-test.c',
>>>>>    'virtio-test.c',
>>>>> -  'virtio-blk-test.c',
>>>>> -  'virtio-net-test.c',
>>>>> -  'virtio-rng-test.c',
>>>>> -  'virtio-scsi-test.c',
>>>>>    'virtio-serial-test.c',
>>>>>    'vmxnet3-test.c',
>>>>>  )
>>>>> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
>>>>> +  qos_test_ss.add(
>>>>> +    'virtio-blk-test.c',
>>>>> +    'virtio-net-test.c',
>>>>> +    'virtio-rng-test.c',
>>>>> +    'virtio-scsi-test.c',
>>>>> +  )
>>>>> +endif
>>>>>  if have_virtfs
>>>>>    qos_test_ss.add(files('virtio-9p-test.c'))
>>>>>  endif
>>>>> ---
>>>>>
>>>>> I'll test that locally but not on Gitlab.
>>>
>>> This approach doesn't work for the iotests.
>>>
>>>> This also removes the virtio-devices test, I think we should keep the files, but in the files to
>>>> disable the PCI part when it is not available.
>>> I don't understand how the virtio devices are created, it seems there
>>> is an alias to generic virtio hw that map to the arch virtio bus.
>>>
>>> I was not obvious to understand why start the virt machine with
>>> "-device virtio-blk" returns "'virtio-blk-pci' is not a valid device
>>> model name" at first, then I figured out the qdev_alias_table array.
>>>
>>> Maybe you need to complete it for your arch? I've been using that:
>>>
>>> -- >8 --
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index 8dc656becca..b326bd76c2a 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -65,8 +65,10 @@ static const QDevAlias qdev_alias_table[] = {
>>>      { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
>>>      { "virtio-balloon-pci", "virtio-balloon",
>>>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>>> +    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_M68K },
>>>      { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
>>> -    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>>> +    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL
>>> +                                      & ~(QEMU_ARCH_S390X |
>>> QEMU_ARCH_M68K) },
>>>      { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
>>>      { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>>>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
>>> @@ -84,8 +86,10 @@ static const QDevAlias qdev_alias_table[] = {
>>>      { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>>>      { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
>>>      { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>>> +    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_M68K },
>>>      { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
>>> -    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL &
>>> ~QEMU_ARCH_S390X },
>>> +    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL
>>> +                                            & ~(QEMU_ARCH_S390X |
>>> QEMU_ARCH_M68K)},
>>>      { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
>>>      { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL &
>>> ~QEMU_ARCH_S390X },
>>>      { }
>>> ---
>>>
>>> But this looks ugly, I don't think it should work that way (because
>>> a machine could provide virtio buses over multiple transport, mmio
>>> and pci...).
>>
>> IMHO, this looks like the solution.
>>
>> The alias is to define the prefered way, on PCI it's the -pci one otherwise it is the -device one.
> 
> See:
> 
> commit 5f629d943cb0b11c37a891cf4f40a9166aee6f53
> Author: Alexander Graf <agraf@csgraf.de>
> Date:   Fri May 18 02:36:26 2012 +0200
> 
>     s390x: fix s390 virtio aliases
> 
>     Some of the virtio devices have the same frontend name, but actually
>     implement different devices behind the scenes through aliases.
> 
>     The indicator which device type to use is the architecture. On s390, we
>     want s390 virtio devices. On everything else, we want PCI devices.
> 
>     Reflect this in the alias selection code. This way we fix commands like
>     -device virtio-blk on s390x which with this patch applied select the
>     correct virtio-blk-s390 device rather than virtio-blk-pci.
> 
>     Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>     Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>     Signed-off-by: Alexander Graf <agraf@suse.de>

So now than MMIO is available, we hit the "everything else" limit :)

The other function I had to modify is in tests/qemu-iotests/iotests.py:

  def get_virtio_scsi_device():
      if qemu_default_machine == 's390-ccw-virtio':
          return 'virtio-scsi-ccw'
      return 'virtio-scsi-pci'

But Max said there is no interest in testing the block devices here
(here = archs providing virtio via MMIO such ARM/m68k).


