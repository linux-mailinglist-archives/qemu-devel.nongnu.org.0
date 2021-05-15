Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B16381A2C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:34:57 +0200 (CEST)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyBk-0006w0-Ex
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyAq-0005MV-9b
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyAm-0003Oi-Qf
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HExlbbHG10VeD39n4hcyJEWmi2MGQ7+rnFM8g9Gx3Uc=;
 b=h8975rDAwuJ2Z70muOfcd6X1l/IihIroVaczjCSrchn7UaY4TxgQei+u3jUmxkpgGJzz8W
 MQN3u6zrDBLsVbOVPLbnAheMd+gN3DPdZy6cDOk0CbZga/9sBrnuSjaYnk2rZSGKoBAvwj
 eF2hPGfWtOrHiZo+KdU3bdFiT97jdr4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-q2_c82-3MvuYaRRQSXvuIA-1; Sat, 15 May 2021 13:33:53 -0400
X-MC-Unique: q2_c82-3MvuYaRRQSXvuIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f8-20020a1c1f080000b0290169855914dfso1656716wmf.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HExlbbHG10VeD39n4hcyJEWmi2MGQ7+rnFM8g9Gx3Uc=;
 b=aj0t+RHW7393uzWYiICjKNh6PDrXYgROGQjQoS6P/JWqXU50DhDCvt6OdGfERcSc9Y
 r1jxhbVQQUOuqoE6d+o342ibOO9Gn27tl9QGhk5cquCGsQs+z17Cmai8M+0zzqDN2EqB
 pbUyPgU4nMuv3DK69VvNUPcwN+pL8aQOrilfss5G8msdRySEj7Sbgl1un3BtQrsnfYHq
 hKJAHjpSCDdTVSsHld75UKMaM9s5tl+P/9hcfoV5AfVcvcLkA5AEawlB1EDkQzVmGqRl
 Y6x/yUTvFdrY7d2QFqI2oR+pZw1P0D4rTslz2Bw51PEePFgGaALYz4MJnDoglvj80szo
 3rmA==
X-Gm-Message-State: AOAM533XEo+gJrlSVsxAAbYjDT3MjcEirQvSLPVjl2ktC19l0VZ5piRH
 H8dAsfHVY91n6QsEDngCVgDimdbI4lEA2sM3q3SlLfrmZR05zk/NQiFp+fGriqmCp7IgVXrJbfT
 qgmEo0f1sXhS4bDg=
X-Received: by 2002:adf:fc46:: with SMTP id e6mr64736421wrs.169.1621100031847; 
 Sat, 15 May 2021 10:33:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC7unQaMsq9ZXpcS/h48j9bg4NgKfagnvhXdXynS+GuNdqjMON0I1bWO4vBsYT3Zqm2vKn8w==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr64736399wrs.169.1621100031588; 
 Sat, 15 May 2021 10:33:51 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c22sm8422287wmb.10.2021.05.15.10.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:33:51 -0700 (PDT)
Subject: Re: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-2-philmd@redhat.com>
 <CAEUhbmW0h+kvTyrDjum8pVmm9sjn9mkTf-bLRRJqf-ocs1mgqg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25881435-7f61-1b3d-f25c-33fc07d4ed71@redhat.com>
Date: Sat, 15 May 2021 19:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW0h+kvTyrDjum8pVmm9sjn9mkTf-bLRRJqf-ocs1mgqg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 5:02 AM, Bin Meng wrote:
> On Fri, May 14, 2021 at 12:53 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Per the kconfig.rst:
>>
>>   A device should be listed [...] ``imply`` if (depending on
>>   the QEMU command line) the board may or  may not be started
>>   without it.
>>
>> This is the case with the NVDIMM device (it is certainly possible
>> to start a machine without NVDIMM) , so use the 'imply' weak
>> reverse dependency to select the symbol.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  default-configs/devices/ppc64-softmmu.mak | 1 -
>>  hw/arm/Kconfig                            | 1 +
>>  hw/i386/Kconfig                           | 1 +
>>  hw/mem/Kconfig                            | 2 --
>>  hw/ppc/Kconfig                            | 1 +
>>  5 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
>> index ae0841fa3a1..cca52665d90 100644
>> --- a/default-configs/devices/ppc64-softmmu.mak
>> +++ b/default-configs/devices/ppc64-softmmu.mak
>> @@ -8,4 +8,3 @@ CONFIG_POWERNV=y
>>
>>  # For pSeries
>>  CONFIG_PSERIES=y
>> -CONFIG_NVDIMM=y
> 
> I think only removing this one makes sense. I fail to see any
> difference of other changes in this patch.

See below "depends on (PC || PSERIES || ARM_VIRT)"

> 
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index b887f6a5b17..67723d9ea6a 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -6,6 +6,7 @@ config ARM_VIRT
>>      imply VFIO_PLATFORM
>>      imply VFIO_XGMAC
>>      imply TPM_TIS_SYSBUS
>> +    imply NVDIMM
>>      select ARM_GIC
>>      select ACPI
>>      select ARM_SMMUV3
>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>> index 7f91f30877f..66838fa397b 100644
>> --- a/hw/i386/Kconfig
>> +++ b/hw/i386/Kconfig
>> @@ -23,6 +23,7 @@ config PC
>>      imply TPM_TIS_ISA
>>      imply VGA_PCI
>>      imply VIRTIO_VGA
>> +    imply NVDIMM
>>      select FDC
>>      select I8259
>>      select I8254
>> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
>> index a0ef2cf648e..8b19fdc49f1 100644
>> --- a/hw/mem/Kconfig
>> +++ b/hw/mem/Kconfig
>> @@ -7,6 +7,4 @@ config MEM_DEVICE
>>
>>  config NVDIMM
>>      bool
>> -    default y
>> -    depends on (PC || PSERIES || ARM_VIRT)
>>      select MEM_DEVICE
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index e51e0e5e5ac..66e0b15d9ef 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -3,6 +3,7 @@ config PSERIES
>>      imply PCI_DEVICES
>>      imply TEST_DEVICES
>>      imply VIRTIO_VGA
>> +    imply NVDIMM
>>      select DIMM
>>      select PCI
>>      select SPAPR_VSCSI
> 
> Regards,
> Bin
> 


