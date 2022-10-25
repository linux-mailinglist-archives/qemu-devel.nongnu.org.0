Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FB60D1AB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:34:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMs1-0005F9-3e; Tue, 25 Oct 2022 12:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMrv-0004tW-G6
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMrt-0000Sz-Jr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715612;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wiVfPp4pDYomPrYKS2Rs6UTbuURSGyuv5ZIhQtf4W3c=;
 b=GO643/0AKvvgfuX5lMOIR0jubjGM9HWwiXDKgn+xR9Bnl0LHsRVeZPCJtizJ6fvUsshvga
 0GUdG+ABuOVy2p7+tK8goiUDuJC7B1GRXt5/8V2TLk8jDEFhAM3FrhJe62zZ8Jh1P9L5dM
 RmYeHQOLoR2cDCmcPHyzgpJfRAKWbPo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-0bfgteI-OGCv7IQ3ueF6Pg-1; Tue, 25 Oct 2022 12:33:31 -0400
X-MC-Unique: 0bfgteI-OGCv7IQ3ueF6Pg-1
Received: by mail-qk1-f200.google.com with SMTP id
 az32-20020a05620a172000b006ee8ae138a7so11868827qkb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiVfPp4pDYomPrYKS2Rs6UTbuURSGyuv5ZIhQtf4W3c=;
 b=JQ2SGwoieQGQ4KvcGbSfF/tbOoEKaCk44NNg5he4+yAvoL0pVuOu7Ui6HOPXvBTzV5
 MghBEhTS4ulkZ7ImkXZr1SgoWeTxQIAEkqS2gzEq88jKwSet2jHTjBnonl0UN8NyNs+i
 SQ17snESMdcRM1sFgOw+vxRQMK+j9rq7NAIGkejdMGV/ivrTXKxubibH7PYtNI8Zgf0x
 jzwg28+Wnvee2UBwyxavRuPnxcLBluLY4c5l4r2dHFDR+oHE0P9Z9Gmfu3QG/JM5Zmyd
 p71Gv/xT+istfC0+ullhcT7F7SOFbvg49ZBGuHNgqjBDeVqQjsbGBz3zVfdmUBxGPCVD
 sStw==
X-Gm-Message-State: ACrzQf1zBp1VkgMQ1pY0uuBlxh2AEmVnelzLkwQ3ys89x6NTUM2hCyjG
 7N/0UztpRTL3LNXgPX9lfrDuzS3qIkznjKjWH+9D7IvGxyX1lahoxZwmH5tm3EzGa7UTEcBL6XW
 6k63PFFkVVvI7C20=
X-Received: by 2002:a05:622a:3cb:b0:39c:eb23:9b49 with SMTP id
 k11-20020a05622a03cb00b0039ceb239b49mr32395078qtx.286.1666715610663; 
 Tue, 25 Oct 2022 09:33:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7yQ9UBjcANKxPIifHdGeas2d55DRliML4uIF/slReBA5JVI+UVIqSkouSz7OLvKtF0oxjKCg==
X-Received: by 2002:a05:622a:3cb:b0:39c:eb23:9b49 with SMTP id
 k11-20020a05622a03cb00b0039ceb239b49mr32395058qtx.286.1666715610411; 
 Tue, 25 Oct 2022 09:33:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a37f911000000b006f87d28ea3asm434633qkj.54.2022.10.25.09.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 09:33:29 -0700 (PDT)
Message-ID: <31c876a3-895e-2f7a-e1d1-2e3f50f04e60@redhat.com>
Date: Tue, 25 Oct 2022 18:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 6/7] hw/arm/virt: Add 'compact-highmem' property
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-7-gshan@redhat.com> <877d0ofb4w.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <877d0ofb4w.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/25/22 12:30, Cornelia Huck wrote:
> On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:
>
>> After the improvement to high memory region address assignment is
>> applied, the memory layout can be changed, introducing possible
>> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
>> is disabled or enabled when the optimization is applied or not, with
>> the following configuration. The configuration is only achievable by
>> modifying the source code until more properties are added to allow
>> users selectively disable those high memory regions.
>>
>>   pa_bits              = 40;
>>   vms->highmem_redists = false;
>>   vms->highmem_ecam    = false;
>>   vms->highmem_mmio    = true;
>>
>>   # qemu-system-aarch64 -accel kvm -cpu host    \
>>     -machine virt-7.2,compact-highmem={on, off} \
>>     -m 4G,maxmem=511G -monitor stdio
>>
>>   Region             compact-highmem=off         compact-highmem=on
>>   ----------------------------------------------------------------
>>   MEM                [1GB         512GB]        [1GB         512GB]
>>   HIGH_GIC_REDISTS2  [512GB       512GB+64MB]   [disabled]
>>   HIGH_PCIE_ECAM     [512GB+256MB 512GB+512MB]  [disabled]
>>   HIGH_PCIE_MMIO     [disabled]                 [512GB       1TB]
>>
>> In order to keep backwords compatibility, we need to disable the
>> optimization on machine, which is virt-7.1 or ealier than it. It
>> means the optimization is enabled by default from virt-7.2. Besides,
>> 'compact-highmem' property is added so that the optimization can be
>> explicitly enabled or disabled on all machine types by users.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>  docs/system/arm/virt.rst |  4 ++++
>>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h    |  1 +
>>  3 files changed, 37 insertions(+)
>>
> (...)
>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 4896f600b4..11b5685432 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -174,6 +174,12 @@ static const MemMapEntry base_memmap[] = {
>>   * Note the extended_memmap is sized so that it eventually also includes the
>>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>>   * index of base_memmap).
>> + *
>> + * The memory map for these Highmem IO Regions can be in legacy or compact
>> + * layout, depending on 'compact-highmem' property. With legacy layout, the
>> + * PA space for one specific region is always reserved, even the region has
> s/even/even if/

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>
>> + * been disabled or doesn't fit into the PA space. However, the PA space for
>> + * the region won't be reserved in these circumstances with compact layout.
>>   */
>>  static MemMapEntry extended_memmap[] = {
>>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */


