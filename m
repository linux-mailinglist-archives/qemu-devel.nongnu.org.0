Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1424383ED
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 16:28:15 +0200 (CEST)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meI0M-0000uy-Jl
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 10:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1meHz5-0008Vx-8E
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 10:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1meHz1-000268-BJ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 10:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634999208;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6yLvsXAbI0/ftOl1pzhDKM6gJc8hltwe2gtLKJ73Uk=;
 b=F9T0dfPilFdzc1ZTGU7ND4jskKhAALBqV2MYZ3zhG1/HUAxlB4jWm9kv2rn29XD599tHZY
 YtONSeEIPGioshW74OUrX9BnOO2F2At9IHG8WW52HxbWrk9QZ1MRq8cb5YB+zFep+T5qvB
 4dsW0yGzuldIYD4dl1Kxf9dQAZWVp/o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-wY9gbYneOzOgU6VxT4GxlA-1; Sat, 23 Oct 2021 10:26:44 -0400
X-MC-Unique: wY9gbYneOzOgU6VxT4GxlA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so2259662wmj.9
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 07:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=h6yLvsXAbI0/ftOl1pzhDKM6gJc8hltwe2gtLKJ73Uk=;
 b=geziLvX6zhV4q1YVdtutfx3l1PxsjpamhZJYal+0nyEJO/7g31QGuA5jhu1Wbid8J8
 hHN0txonPxKQ3NR4K5pLZbcTpyPQSlpNIw13GpZBUTjdsB3WBsI9z67t1BAm10vYYMBq
 WarmZuNOaQpPSt6BK5nyZc0QJSPyoe0FjY0TJMC+vbUtTu5wrvRoUaSMN4VchQD3z8zo
 DzkMOQJRfdEiKKTy2LnumHcjZR+8YioE2JGm8m2oKoflpKIrA0EHnOb96Sm4DRizMFsC
 J4AqULgOdaS3Thjc7FtEYjLtSVQXQOC8dDieb5fGBhombDvYtXbRQ+naE4szcuwggQaC
 OP0Q==
X-Gm-Message-State: AOAM533AD9wqq5wXuCF/ZGd2wrySOUvGk+HOB9cCJSwU8Yf3gRBZSs+K
 RG5/cxLTLUk+B1k6yIXoiRfTCnlDwNkHE/qS+3hrFh8eS+Djs3HHdTVQ/sOsadKxcCN6CsENsAB
 x42Z7pzLg9SyOuNA=
X-Received: by 2002:a5d:6502:: with SMTP id x2mr6111459wru.121.1634999203701; 
 Sat, 23 Oct 2021 07:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2qXS/IYLpqi7ugdF+rzvrw4DyScVswRJQ9FpG/vnZ0XJTGhk+4DOVOA55MWOAvtebmXbZyQ==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr6111424wru.121.1634999203460; 
 Sat, 23 Oct 2021 07:26:43 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v185sm14278161wme.35.2021.10.23.07.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 07:26:42 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping
 in live migration
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-2-jiangkunkun@huawei.com>
 <571dc3ee-8b2a-fcef-b617-1ba85a3d442a@redhat.com>
 <248f1b98-07a7-619c-b5ef-0c1e8508fea9@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d64e6e23-e698-82b5-6236-cb81983f9c92@redhat.com>
Date: Sat, 23 Oct 2021 16:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <248f1b98-07a7-619c-b5ef-0c1e8508fea9@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.781, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 10/22/21 12:01 PM, Kunkun Jiang wrote:
> Hi Eric,
>
> On 2021/10/22 0:15, Eric Auger wrote:
>> Hi Kunkun,
>>
>> On 9/14/21 3:53 AM, Kunkun Jiang wrote:
>>> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
>>> vfio_pci_write_config to improve IO performance.
>> s/to vfio_pci_write_config/ in vfio_pci_write_config()
> Thank you for your review. I will correct it in v3.
>>> The MemoryRegions of destination VM will not be expanded
>>> successful in live migration, because their addresses have
>> s/will not be expanded successful in live migration/are not expanded
>> anymore after live migration (?) Is that the correct symptom?
> You are right. They are not expanded anymore after live migration,
> not expanded unsuccessfully. I used the wrong words.
>>> been updated in vmstate_load_state (vfio_pci_load_config).
>>>
>>> So iterate BARs in vfio_pci_write_config and try to update
>>> sub-page BARs.
>>>
>>> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI
>>> devices)
>> is it an actual fix or an optimization?
> I recently realized that this is actually an optimization.
>
> The VF driver in VM use the assembly language instructions,
> which can operate two registers simultaneously, like stp, ldp.
> These instructions would result in non-ISV data abort, which
> cannot be handled well at the moment.
>
> If the driver doesn't use such instructions,  not expanding
> only affects performance.
>
> I will add these to the commit message in the next version.
>>> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
>>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>> ---
>>>   hw/vfio/pci.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index e1ea1d8a23..43c7e93153 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice
>>> *vbasedev, QEMUFile *f)
>>>   {
>>>       VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice,
>>> vbasedev);
>>>       PCIDevice *pdev = &vdev->pdev;
>>> -    int ret;
>>> +    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
>>> +    int bar, ret;
>>> +
>>> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>>> +        old_addr[bar] = pdev->io_regions[bar].addr;
>>> +    }
>> what are those values before the vmstate_load_state ie. can't you do the
> Are you referring to pdev->io_regions[bar].addr ? All of the bars addr is
> PCI_BAR_UNMAPPED (~(pcibus_t)0) before the vmstate_load_state.
OK that was my assumption. What I meant is in that case you always have

old_addr[bar] != pdev->io_regions[bar].addr, right? In the positive this check is not needed and you don't need old_addr at all.
In the original code this was needed since one wanted to call 
vfio_sub_page_bar_update_mapping() only for the bar base address that were changed during the 
vfio_pci_write_config.

Thanks

Eric

>> vfio_sub_page_bar_update_mapping() unconditionnaly on old_addr[bar] !=
>> pdev->io_regions[bar].addr
> The size of Bar is a power of 2. The Bar, whose size is greater than host
> page size, doesn't need to be expanded.
>
> Can you explain more? May be I misunderstood you.
>
> Thanks,
> Kunkun Jiang
>>>         ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
>>>       if (ret) {
>>> @@ -2463,6 +2468,14 @@ static int vfio_pci_load_config(VFIODevice
>>> *vbasedev, QEMUFile *f)
>>>       vfio_pci_write_config(pdev, PCI_COMMAND,
>>>                             pci_get_word(pdev->config +
>>> PCI_COMMAND), 2);
>>>   +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>>> +        if (old_addr[bar] != pdev->io_regions[bar].addr &&
>>> +            vdev->bars[bar].region.size > 0 &&
>>> +            vdev->bars[bar].region.size < qemu_real_host_page_size) {
>>> +            vfio_sub_page_bar_update_mapping(pdev, bar);
>>> +        }
>>> +    }
>>> +
>>>       if (msi_enabled(pdev)) {
>>>           vfio_msi_enable(vdev);
>>>       } else if (msix_enabled(pdev)) {
>> Thanks
>>
>> Eric
>>
>> .
>


