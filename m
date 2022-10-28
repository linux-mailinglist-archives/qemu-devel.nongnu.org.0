Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FC61172F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:14:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRyM-0004Nw-Nj; Fri, 28 Oct 2022 12:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooRyJ-0004J8-GY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:12:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooRyE-00067L-GO
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:12:37 -0400
Received: by mail-pg1-x529.google.com with SMTP id q71so5216056pgq.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2RIdcJzer00cgHlbL0m4DdXs3YXDj0W5/BUWRHsy36g=;
 b=LfhcdxOkJtRys+iGApcilB4W0DOdjimWfWIwmdj+px9/BE1dye2YFC+OzZRP6yVCJg
 NIyKOrtfvQeFT0qLP1reV0XN9j33r0UsV+THPfhMSjRzBEXYjswHnKG3SRNVTjwmJrCS
 kobWIwRvZK+GxpcgqD4R9qIemAXvuCSSoBoRQ4kcUeUgoRVQdyNGoG389dHU/7yVy6vy
 ETrGYov45Lja+11j+qvuxibQGko68c1Am/ZQWkJoZXAg1QxNARn7AMSXrUw4/PHYFUKv
 lWCDvRR3iNYdgkPoqke1hWo21pupWGn4eBAO9MwyIcSygxm1JyVA6qMyHKTulGQO1tEK
 oyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2RIdcJzer00cgHlbL0m4DdXs3YXDj0W5/BUWRHsy36g=;
 b=WElbfVpdq9ncUkuyRgpQHCoBqkhkvCgyz6eKKDkIr0LR3KL9ysmHveBjbZfN4f8YaP
 CVunuQUCjkrVv/Sp7RCMdLdU8sgdKy25lUJnq77k8gP2JnsQvGTqDdce8UfBtWsj56FB
 hO01pEj0lJTtDOkry1Id9zG4NTAmZLRnDRifnj9pgYMIlqv1o/tSXP/sOKJ9OKkTXUpS
 zmLFaVhKGRyE5pMLMxnNCfunhB6RrxT6C7GUXXf7RGMzAESm//RQEzRYFmHkvdsfLsGT
 tuGZtHzOpBhpWpCv6zTTC44cfs8+ArN6LuSgIN3Ht6qOxf3F75+GEoDidkk1DFoz1Yg0
 rvUQ==
X-Gm-Message-State: ACrzQf33j75rvzXExHog6F4goerlovk5mLGmc7zBVH05uKKRfJHfFJ/p
 6YdoTt5FSfzlQ8RYj2XOmFsAQQ==
X-Google-Smtp-Source: AMsMyM7dl3yaCmHtSJ62rO8uHQdM7v91dQGpUOnkiQuvF8XUx4AaH507O3lV1Ejt7Tg+up9jUwiWFw==
X-Received: by 2002:a63:1a60:0:b0:43c:9bcd:6c37 with SMTP id
 a32-20020a631a60000000b0043c9bcd6c37mr221376pgm.125.1666973538333; 
 Fri, 28 Oct 2022 09:12:18 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1709029a0800b00186a2dd3ffdsm3272599plp.15.2022.10.28.09.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 09:12:17 -0700 (PDT)
Message-ID: <8bcd5f5a-7b9a-6359-a63d-3f72e44f7d43@daynix.com>
Date: Sat, 29 Oct 2022 01:12:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
 <20221028122629.3269-2-akihiko.odaki@daynix.com>
 <20221028081627.50c9bf61.alex.williamson@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20221028081627.50c9bf61.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/28 23:16, Alex Williamson wrote:
> On Fri, 28 Oct 2022 21:26:13 +0900
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> 
>> vfio_add_std_cap() is designed to ensure that capabilities do not
>> overlap, but it failed to do so for MSI and MSI-X capabilities.
>>
>> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
>> other overlapping capabilities.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/vfio/pci.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
>>   hw/vfio/pci.h |  3 +++
>>   2 files changed, 56 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 939dcc3d4a..36c8f3dc85 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>>       }
>>   }
>>   
>> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>   {
>>       uint16_t ctrl;
>> -    bool msi_64bit, msi_maskbit;
>> -    int ret, entries;
>> -    Error *err = NULL;
>> +    uint8_t pos;
>> +
>> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
>> +    if (!pos) {
>> +        return;
>> +    }
>>   
>>       if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
>>                 vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>>           error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
>> -        return -errno;
>> +        return;
>>       }
>> -    ctrl = le16_to_cpu(ctrl);
>> +    vdev->msi_pos = pos;
>> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
>>   
>> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
>> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
>> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>> +    vdev->msi_cap_size = 0xa;
>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
>> +        vdev->msi_cap_size += 0xa;
>> +    }
>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
>> +        vdev->msi_cap_size += 0x4;
>> +    }
>> +}
>> +
>> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>> +{
>> +    bool msi_64bit, msi_maskbit;
>> +    int ret, entries;
>> +    Error *err = NULL;
>> +
>> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
>> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
>> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>>   
>>       trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>>   
>> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>>           error_propagate_prepend(errp, err, "msi_init failed: ");
>>           return ret;
>>       }
>> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
>>   
>>       return 0;
>>   }
>> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>       pba = le32_to_cpu(pba);
>>   
>>       msix = g_malloc0(sizeof(*msix));
>> +    msix->pos = pos;
>>       msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
>>       msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
>>       msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
>> @@ -2025,6 +2044,24 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>>           }
>>       }
>>   
>> +    if (cap_id != PCI_CAP_ID_MSI &&
>> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
>> +        warn_report(VFIO_MSG_PREFIX
>> +                    "A capability overlaps with MSI, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
>> +                    vdev->vbasedev.name, cap_id, pos,
>> +                    vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
>> +        return 0;
>> +    }
>> +
>> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
>> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
>> +        warn_report(VFIO_MSG_PREFIX
>> +                    "A capability overlaps with MSI-X, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
>> +                    vdev->vbasedev.name, cap_id, pos,
>> +                    vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
>> +        return 0;
>> +    }
> 
> Capabilities are not a single byte, the fact that it doesn't start
> within the MSI or MSI-X capability is not a sufficient test.  We're
> also choosing to prioritize MSI and MSI-X capabilities by protecting
> that range rather than the existing behavior where we'd drop those
> capabilities if they overlap with another capability that has already
> been placed.  There are merits to both approaches, but I don't see any
> justification here to change the current behavior.
> 
> Isn't the most similar behavior to existing to pass the available size
> to vfio_msi[x]_setup() and return an errno if the size would be
> exceeded?  Something like below (untested, and requires exporting
> msi_cap_sizeof()).  Thanks,

It only tests the beginning of the capability currently being added 
because its end is determined by vfio_std_cap_max_size() so that the 
overlap does not happen.

A comment in vfio_add_std_cap() says:
 >     /*
 >      * If it becomes important to configure capabilities to their actual
 >      * size, use this as the default when it's something we don't 
recognize.
 >      * Since QEMU doesn't actually handle many of the config accesses,
 >      * exact size doesn't seem worthwhile.
 >      */

My understanding of the problem is that while clipping is performed when 
overlapping two capabilities other than MSI and MSI-X according to the 
comment, the clipping does not happen when one of the overlapping 
capability is MSI or MSI-X.

According to that, the correct way to fix is to perform clipping also in 
such a case. As QEMU actually handles the config acccesses for MSI and 
MSI-X, MSI and MSI-X are always priotized over the other capabilities.

Regards,
Akihiko Odaki

> 
> Alex
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a9e..485f9bc5102d 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1278,11 +1278,13 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>       }
>   }
>   
> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos,
> +                          uint8_t size, Error **errp)
>   {
>       uint16_t ctrl;
>       bool msi_64bit, msi_maskbit;
>       int ret, entries;
> +    uint8_t msi_cap_size;
>       Error *err = NULL;
>   
>       if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
> @@ -1295,6 +1297,10 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>       msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
>       msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
>       entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
> +    msi_cap_size = msi_cap_sizeof(ctrl);
> +
> +    if (msi_cap_size > size)
> +	    return -ENOSPC;
>   
>       trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>   
> @@ -1306,7 +1312,7 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>           error_propagate_prepend(errp, err, "msi_init failed: ");
>           return ret;
>       }
> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
> +    vdev->msi_cap_size = msi_cap_size;
>   
>       return 0;
>   }
> @@ -1570,11 +1576,15 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>       vfio_pci_relocate_msix(vdev, errp);
>   }
>   
> -static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos,
> +                           uint8_t size, Error **errp)
>   {
>       int ret;
>       Error *err = NULL;
>   
> +    if (MSIX_CAP_LENGTH > size)
> +	    return -ENOSPC;
> +
>       vdev->msix->pending = g_new0(unsigned long,
>                                    BITS_TO_LONGS(vdev->msix->entries));
>       ret = msix_init(&vdev->pdev, vdev->msix->entries,
> @@ -2033,14 +2043,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>   
>       switch (cap_id) {
>       case PCI_CAP_ID_MSI:
> -        ret = vfio_msi_setup(vdev, pos, errp);
> +        ret = vfio_msi_setup(vdev, pos, size, errp);
>           break;
>       case PCI_CAP_ID_EXP:
>           vfio_check_pcie_flr(vdev, pos);
>           ret = vfio_setup_pcie_cap(vdev, pos, size, errp);
>           break;
>       case PCI_CAP_ID_MSIX:
> -        ret = vfio_msix_setup(vdev, pos, errp);
> +        ret = vfio_msix_setup(vdev, pos, size, errp);
>           break;
>       case PCI_CAP_ID_PM:
>           vfio_check_pm_reset(vdev, pos);
> 

