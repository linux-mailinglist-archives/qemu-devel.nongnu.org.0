Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1E6CEF22
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:19:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYVZ-0008Eo-Nt; Wed, 29 Mar 2023 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phYVX-0008Ed-AV
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:18:43 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phYVV-0008PC-Bu
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:18:43 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5456249756bso302338957b3.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112; t=1680106720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vc0is1gyB7D2agFeJffAUaU6h7uNPkCiOLvXwxv1w6k=;
 b=6NBKDHSq80nlqOr1bXoDXhg09/dG2D8J6HhXWRqaCVxC2xogXbkLEqe9u1R16344ba
 BIsUMFXWzt5g+UARX0sgTUPk0ku4fwHfGUyTSuNCeKnGaYHhdPLHLFURB7qiKJaoY/DP
 KzPLTOLv9XEISf0LDAKcrMpxpglXVW/ijdeCCO7oUccfXbRVkxM+by5oOVvDUoVrJ+k5
 59d8lIE936PRFbtDi93cFbgBa495cKIpZl9a1KMAFCmPzarD9J55JPZrc1EV6GOZWhGV
 JL+nfCAWPbXJScNdbGD3Mvn7gHV+Q/wTFjcZkFHWLRScYMCYP7SYp5+aZfojTihJvrQV
 3Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680106720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vc0is1gyB7D2agFeJffAUaU6h7uNPkCiOLvXwxv1w6k=;
 b=z221mtwmvutIZ5B8XPoQzIvBRfhnT+AM2x25JSga1KVJuWHHjqG1tTc9VKWfG9uEMC
 mLALShQXV7AqLmuNuD8yKFTI2vAjlXzjPJP6hB3msYT0OlQtzwSkgA+kRJh5rxs6Kutt
 XDefxxDSq8aQDlFLJf2U5k3e26q8LfIbpBvYMLBmY9WkVVb6MbXlyKrhGs+BWwpc4n+7
 essN27SAy7gzW/UhTj45IoT4MXhmazlHbBAU8c3Slt1U9Q41F/Yexc12KJng9zEfeAen
 094GoLqxQSS+fI24l6Nqpcs1iP1k/cuSKbeY6EhTAHyt99Ok+Igwm7kLlgVw+8+nTbc2
 r5Jw==
X-Gm-Message-State: AAQBX9cX1B0Vk0V/O5KYcikH4AXG2CQPaWzE2NmfCIgybHEYJNDzpgLl
 gSf1dlK7XJSNLUU8UvhYCATNOw==
X-Google-Smtp-Source: AKy350b2xfgvwc9LHYBSNXF8dCE4m16/Ln4pSkDjNQi2N+2tjfxSkew7E530S1YZ2/4p1kEucVlXkg==
X-Received: by 2002:a81:920c:0:b0:545:56cd:cd7e with SMTP id
 j12-20020a81920c000000b0054556cdcd7emr21733624ywg.10.1680106720257; 
 Wed, 29 Mar 2023 09:18:40 -0700 (PDT)
Received: from [172.16.32.78] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 196-20020a810ecd000000b00545a08184a4sm3048160ywo.52.2023.03.29.09.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:18:39 -0700 (PDT)
Message-ID: <33305231-8619-b533-ab4d-a0f80e2b3490@landley.net>
Date: Wed, 29 Mar 2023 11:33:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <88ab35fc-9226-2ba6-03e4-c8600933dd2a@redhat.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <88ab35fc-9226-2ba6-03e4-c8600933dd2a@redhat.com>
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



On 3/29/23 03:55, Thomas Huth wrote:
> On 28/03/2023 19.02, Philippe Mathieu-Daudé wrote:
>> On 20/3/23 17:58, Nathan Chancellor wrote:
>>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use 
>>>>> PCI_HOST_BRIDGE's
>>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>>
>>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>>> little endian.
>>>>>
>>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to 
>>>>> disable
>>>>> endian-swapping.
>>>>>
>>>>> This should fix some recent reports about poweroff hang.
>>>>>
>>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using 
>>>>> PCI_HOST_BRIDGE MemoryRegionOps")
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>    hw/pci-host/gt64120.c | 18 ++++++------------
>>>>>    1 file changed, 6 insertions(+), 12 deletions(-)
>>>>
>>>> So this works on little-endian hosts, but fails on
>>>> big-endian ones :(
>>>>
>>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>>> looping:
>>>>
>>>> IN: prom_putchar
>>>> 0x8010fab8:  lbu    v0,0(v1)
>>>> 0x8010fabc:  andi    v0,v0,0x20
>>>> 0x8010fac0:  beqz    v0,0x8010fab8
>>>> 0x8010fac4:  andi    v0,a0,0xff
>>>>
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> ...
>>>>
>>>
>>> Is there going to be a new version of this patch or a different solution
>>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>>> a release version.
>> 
>> I couldn't work a fix, however I ran our (new) tests on merge
>> commit 3db29dcac2 which is before the offending commit 145e2198d749,
>> and they fail. So I suppose Malta on big-endian host is badly broken
>> since quite some time. Thus clearly nobody tests/runs Malta there.
>> 
>> Is it worth fixing old bugs nobody hit / reported?
>> Should we stop wasting CI resources testing MIPS on big-endian hosts?
> 
> This rather sounds like a blind spot in our CI ... we still have some big 
> endian s390x machines there, so maybe this just needs a proper test to avoid 
> regressions? Would it be feasible to add a test to 
> tests/qtest/boot-serial-test.c for this, for example?

I have my own automated test infrastructure for the toybox project, which does a
basic automated smoketest against all the support qemu images.

  https://github.com/landley/toybox/blob/master/scripts/test_mkroot.sh

I also have a 300 line bash script that builds and packages all the Linux test
systems from source (it's mkroot.sh in the same directory if you're wondering
how to build a bootable Linux system for a dozen targets in 300 lines of bash,
and it's documented at https://landley.net/toybox/faq.html#mkroot and that links
to prebuilt binaries, and the instructions and scripts to build the cross
compilers I use, and prebuilt binaries for those too...

Anyway, tl;dr I both care and can regression test this easily, but haven't seen
an agreed on "try this patch instead of the other patch" go by? (Might have
missed it?)

Rob

