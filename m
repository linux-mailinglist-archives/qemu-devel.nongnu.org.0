Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662ED40352A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:19:11 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrrS-0003kE-El
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNrox-0000tW-Pd
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNrov-0005hj-Jk
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631085392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbJO5IEe+xQ4o2hyduhVSdtU4KYDyRNeaf2n3UHUb4k=;
 b=WJE6S6dv5sCQoh/0Sd0kbD9Vd3wODjbSMpUBup5PE5aE4RUxkluK9ecSkxf1m6T1h+yJwm
 FP1h4vhSSqxHSbkWBWuIfdVyVvwPLhJ7/F9wlZdzgz/7boRSeOh2NuwG3+mnDqZkJqkpsG
 bN4BU89/Mg3jHQAQi8bRXnOy6/zuJz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Yckh4cvFOr-tQSP9DLQzKw-1; Wed, 08 Sep 2021 03:16:31 -0400
X-MC-Unique: Yckh4cvFOr-tQSP9DLQzKw-1
Received: by mail-wm1-f71.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so502799wmj.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nbJO5IEe+xQ4o2hyduhVSdtU4KYDyRNeaf2n3UHUb4k=;
 b=mxX6zwkKvsACzPrzBdVFDOe3Qfxg5F71RN10AoW8L2R27mFFHg+R4rPChkGB9fZBh0
 5qiucJfc328NPQhYJT44KRxz7lax+ojzYmZi3aaYRnW8B9f/BUpe9jMeREMkz84gA+1b
 uBjni+UE0UFBmBXnaKKeANThS8jN6AGrvUhd14/MPvdo+0kOBqfhbGFmNmkED/WNWqSl
 M1wGHIYRKlnrHjPZ7OTqYF3zfxGUQz0CVXNotxWIi1F58Dk9Yp0Jc81nwwj6fb7TuZu6
 ov3Z2PTF7+Z8xbFuooNxvkz6Xnz8kBcCzYTSOa70iVilrQ7NCNpPjDKNvFrm396J2d4h
 9ksQ==
X-Gm-Message-State: AOAM532cAn+9n8ALXYPmMeS3hxFreoZufsJ57Zw/lMRRHPH47vsg16hQ
 iKiVgdiWdDuLpzJeIMeMtIUGRR0OosR5FoFGwRW8C0hArBNQL2j5rl5DA6EP/prhAHwwyEfP01T
 Cs1AMie63IceEG84=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2181599wrr.376.1631085390018; 
 Wed, 08 Sep 2021 00:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPKtJXLjpkkYJc6hfE/GBP0ZcfENgsVgOUyZszAz9xpVvta2M+XQswK/zCwzROecZ4lKdbxg==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2181580wrr.376.1631085389806; 
 Wed, 08 Sep 2021 00:16:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c3sm1259790wrd.34.2021.09.08.00.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:16:29 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/arm/virt: Honor highmem setting when computing
 highest_gpa
To: Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <maz@kernel.org>
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-3-maz@kernel.org>
 <CAFEAcA9=SJd52ZEQb0gyW+2q9md4KMnLy8YsME-Mkd-AbvV41Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <8a927165-e45d-07c9-a6d6-b32303195523@redhat.com>
Date: Wed, 8 Sep 2021 09:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=SJd52ZEQb0gyW+2q9md4KMnLy8YsME-Mkd-AbvV41Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Andrew Jones <drjones@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi
On 9/7/21 2:58 PM, Peter Maydell wrote:
> On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
>> Even when the VM is configured with highmem=off, the highest_gpa
>> field includes devices that are above the 4GiB limit, which is
>> what highmem=off is supposed to enforce. This leads to failures
>> in virt_kvm_type() on systems that have a crippled IPA range,
>> as the reported IPA space is larger than what it should be.
>>
>> Instead, honor the user-specified limit to only use the devices
>> at the lowest end of the spectrum.
>>
>> Note that this doesn't affect memory, which is still allowed to
>> go beyond 4GiB with highmem=on configurations.
>>
>> Cc: Andrew Jones <drjones@redhat.com>
>> Cc: Eric Auger <eric.auger@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  hw/arm/virt.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 81eda46b0b..bc189e30b8 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1598,7 +1598,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>  static void virt_set_memmap(VirtMachineState *vms)
>>  {
>>      MachineState *ms = MACHINE(vms);
>> -    hwaddr base, device_memory_base, device_memory_size;
>> +    hwaddr base, device_memory_base, device_memory_size, ceiling;
>>      int i;
>>
>>      vms->memmap = extended_memmap;
>> @@ -1625,7 +1625,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>>      device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>>
>>      /* Base address of the high IO region */
>> -    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
>> +    ceiling = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
>>      if (base < device_memory_base) {
>>          error_report("maxmem/slots too huge");
>>          exit(EXIT_FAILURE);
>> @@ -1642,7 +1642,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>>          vms->memmap[i].size = size;
>>          base += size;
>>      }
>> -    vms->highest_gpa = base - 1;
>> +    if (vms->highmem) {
>> +           /* If we have highmem, move the IPA limit to the top */
>> +           ceiling = base;
>> +    }
>> +    vms->highest_gpa = ceiling - 1;
> This doesn't look right to me. If highmem is false and the
> high IO region would be above the 4GB mark then we should not
> create the high IO region at all, surely? This code looks like
> it goes ahead and puts the high IO region above 4GB and then
> lies in the highest_gpa value about what the highest used GPA is.
>
> -- PMM
>
Doesn't the problem come from "if maxram_size is < 255GiB we keep the
legacy memory map" and set base = vms->memmap[VIRT_MEM].base +
LEGACY_RAMLIMIT_BYTES; leading to IO regions allocated above?
Instead shouldn't we condition this to highmem=on only then?

But by the way do we need to added extended_memmap IO regions at all if
highmem=off?
I am not wrong the VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO only are
used if highmem=on. In create_pcie(), base_mmio_high/size_mmio_high are
used if vms->highmem and we have ecam_id =
VIRT_ECAM_ID(vms->highmem_ecam); with vms->highmem_ecam &= vms->highmem
&& (!firmware_loaded || aarch64);

So if I do not miss anything maybe we could skip the allocation of the
extended_memmap IO regions if highmem=off?

And doesn't it look reasonable to limit the number of vcpus if highmem=off?

Thanks

Eric


