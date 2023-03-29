Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AD6CEF87
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:34:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYkD-0003uX-JE; Wed, 29 Mar 2023 12:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phYkB-0003u5-5Z
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:33:51 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phYk8-0002WR-4p
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:33:50 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5445009c26bso302978637b3.8
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112; t=1680107626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=71s7cSRGldjk5lmQXv8X+J97vldmv6SC15S6+zGmms4=;
 b=B7uSatMa2KPZDO3DJrPTgF/uRcm4Rd6QGsa4f8iQ0tnqv5pZCoTpvX6Lx+wmwKppRq
 1JhGk1J+4+09i2gKYDedQ9FhzR2hFMoNIIWpemzhrH1Uwlj1vY8krCvqBS4q6qAUYBFk
 lerIksHDaMz96auBi9FZeZCPLSexF2IP+dmPnjpmKH4f4ncztyA0mIO3pvOX3W43HISd
 9beewTRizFjFtdv5cuZ1JOFHGp8nS8s3s7tgcT5QNw8UfjXZKnwZHIjw9/D38HWIkThC
 PH9wWFTxiI6+46Gl3472rAf+d3/Opav6icuzdNsRL5vOsWE1njld5ePPKMe7INWtu6LB
 QuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=71s7cSRGldjk5lmQXv8X+J97vldmv6SC15S6+zGmms4=;
 b=rNXRyeHjpAOJCnWEQl7fbLbFCI5vHmvszgugDoXSbxGaQusLXWoZ0K47s+6sPQPnIB
 jtfXa5RDxnwt12qCi/ucAmhyK/afRti2KVIsSwhL42M8XiMGNYdYme+wM507AHEZvgdT
 EYasJLVfDgzUbIkiT9ujoPPCEOetTbRWuN/yypSrybRWBNNwYlfvHQrXoZ7u3+RR1WyC
 fC0nsVnT/Nbl8vT2fd1BAsfyEHqhrXAexrrvK1ZoF0CCw3HdWuOs+zcUevQx0w6WU0v+
 wK9TMCuTQ9522YC/Sdz2oPijCdNFJXZqw+fKmFIZg15WVJ1W7JNCZXH2YcW7UmySR5PC
 4DJg==
X-Gm-Message-State: AAQBX9edUpG2MoKjXTKeX3xRONq4HeNPJfozXwNN3spj7LbWVNL5NaSf
 3lZYzhTkgX2UcK78CUQo/FuG0g==
X-Google-Smtp-Source: AKy350YjLAPXntxcFnC1W7Hu9QhUpkJj+ONb2saNCR0zz7DvFgKlnIIMuJR4M7FfUtt6H9lfj8q7jg==
X-Received: by 2002:a0d:e253:0:b0:541:891f:86f6 with SMTP id
 l80-20020a0de253000000b00541891f86f6mr19018198ywe.19.1680107626336; 
 Wed, 29 Mar 2023 09:33:46 -0700 (PDT)
Received: from [172.16.32.78] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 bc9-20020a05690c000900b00546160d7fa1sm749585ywb.50.2023.03.29.09.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:33:45 -0700 (PDT)
Message-ID: <0ae35be3-794a-deee-1c96-507d5be2306c@landley.net>
Date: Wed, 29 Mar 2023 11:48:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
 <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1136;
 envelope-from=rob@landley.net; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/29/23 11:07, Philippe Mathieu-Daudé wrote:
> On 29/3/23 18:09, Rob Landley wrote:
>> On 3/28/23 12:02, Philippe Mathieu-Daudé wrote:
>>> On 20/3/23 17:58, Nathan Chancellor wrote:
>>>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
>>>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>>>
>>>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>>>> little endian.
>>>>>>
>>>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
>>>>>> endian-swapping.
>>>>>>
>>>>>> This should fix some recent reports about poweroff hang.
>>>>>>
>>>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>>> ---
>>>>>>     hw/pci-host/gt64120.c | 18 ++++++------------
>>>>>>     1 file changed, 6 insertions(+), 12 deletions(-)
>>>>>
>>>>> So this works on little-endian hosts, but fails on
>>>>> big-endian ones :(
>>>>>
>>>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>>>> looping:
>>>>>
>>>>> IN: prom_putchar
>>>>> 0x8010fab8:  lbu	v0,0(v1)
>>>>> 0x8010fabc:  andi	v0,v0,0x20
>>>>> 0x8010fac0:  beqz	v0,0x8010fab8
>>>>> 0x8010fac4:  andi	v0,a0,0xff
>>>>>
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> ...
>>>>>
>>>>
>>>> Is there going to be a new version of this patch or a different solution
>>>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>>>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>>>> a release version.
>>>
>>> I couldn't work a fix, however I ran our (new) tests on merge
>>> commit 3db29dcac2 which is before the offending commit 145e2198d749,
>>> and they fail. So I suppose Malta on big-endian host is badly broken
>>> since quite some time. Thus clearly nobody tests/runs Malta there.
>> 
>> I test/run malta with the mips and mipsel binaries at
>> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/ but I'm still
>> locally applying the first patch I saw to fix this (attached) until upstream
>> sorts itself out.
>> 
>> Works fine for me. Somebody said it was the wrong fix but I don't remember why...
> 
> This is a correct /partial/ fix. With this patch, Malta works on little
> endian hosts. No luck with big-endian hosts, but this was broken
> previous to 3db29dcac2 rework, so apparently not a big deal ¯\_(ツ)_/¯

No, big endian worked for me with that patch?

The build in my $PATH is QEMU emulator version 7.2.50
(v7.2.0-873-g65cc5ccf06-dirty) with that patch, and if you wget
https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz and
./run-emulator.sh in there, the virtual net can wget http://site (the sample
image hasn't got https:// support enabled because I didn't include the build
dependency), and the virtual disk works (if you do "./run-emulator.sh -hda
blah.img" anyway, the test wrapper I mentioned creates a squashfs image for it
to mount)). Without the patch I don't even get a PCI bus. Running "file
/bin/toybox" says MSB, and the mipsel image is the little endian one anyway. I
also test s390x (which is big endian 64 bit), but I don't think this needed a
patch? (Hadn't been broken last I checked?)

I vaguely recall having tested newer qemu, but couldn't say when that was (early
february at the latest, and if so I didn't install it into /usr/bin/local. It
takes a while to build all the targets so I only really do it quarterly, usually
when I'm about to cut a toybox release and want to make sure qemu hasn't broken
anything important while I wasn't looking...)

Rob

