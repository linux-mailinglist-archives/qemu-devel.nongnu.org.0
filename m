Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F4613689
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU3j-0002VF-UF; Mon, 31 Oct 2022 08:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU2V-0000tE-43
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:37:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU2S-0005Wh-Dj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:37:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f140so10586239pfa.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ck0/ejCCV3Y/CdpBq+7+EezAjskw6ud40SZ8iH1h2dc=;
 b=KCu+3CAbDLte+RrY1/hli+xUL9z1Mz8KlwSKmOxkoDwUAQ90MB7QjtXa5h3EJnyNdh
 Hfrd4vmPA+aHmQtIFjh5YD+NvOiICO7vE1bVWNpuEe9jdS9U8HKwANp/52nnt1MozA/7
 IosWBVt+FAwBntFp1v7N6oEfyT4MYeWO80LY4BgqepooLLYqLCuaaV0TkdaYgxIN5UQu
 uodWbaEAWSFDlSskhL6WaR69kvhvn5Dg5y4yxLbD8iL/YTPBlscgurIrorgSM/ta4JbV
 YgIud7Dxm/6YijQSanbtjctt9LBqUE5i16gJZhL/0vhlCDGLLEZfYZn5VjaQwXTo18KG
 u/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ck0/ejCCV3Y/CdpBq+7+EezAjskw6ud40SZ8iH1h2dc=;
 b=Bg6Uper4joZUqN84BNXaGTkKFF+/0CJlrytmsauxNXTRXWAQY/fnD3l+WULO+s18vX
 XNdSMfM4Baa1078sAIyGDIDgKaADyK5EHZohuPp6X/UqNxU3Qw7xwQj1URgyJY2Hm15W
 XyLu+BJ6SU0XMfEUMk9iyH6vqMrABMpWJXEA9X0wTphhKYlJysAqZJiYkr49DvUMvSBZ
 5OATwP5jdwgc/oB2fm7OHWoUdo4TtplbipvfwnSSz6aA2nUJH2FuLEwY17zWLvTMf9H6
 5WbUlWs3qwyhvv/voZjx6PPRQJmj9okk4dQqkZ3aYLihH1vc+rodHS3zOPvA2bgVPGhF
 f4Xw==
X-Gm-Message-State: ACrzQf3aNkSd1iy0iZUPVevZeqyWk0PVZ1p5fRZH0jUo6G5gz8AfXmd2
 51c4Zg2SriydwwCqLDFOifcLOw==
X-Google-Smtp-Source: AMsMyM50aXYGxoMG4gnlnXSXu7WQHxKCBzNqnY8sjeYEKZ5UpKBCqsAedlVXnvl2yf1YyKQTmiyuYg==
X-Received: by 2002:a63:6f8a:0:b0:439:36bc:89f9 with SMTP id
 k132-20020a636f8a000000b0043936bc89f9mr12276042pgc.100.1667219830105; 
 Mon, 31 Oct 2022 05:37:10 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa78e9b000000b0056a7486da77sm4670774pfr.13.2022.10.31.05.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:37:09 -0700 (PDT)
Message-ID: <6eff2573-9181-19b8-0a22-65daf8e1e7d6@daynix.com>
Date: Mon, 31 Oct 2022 21:37:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
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
 <8bcd5f5a-7b9a-6359-a63d-3f72e44f7d43@daynix.com>
 <20221028132339.014ffee0.alex.williamson@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20221028132339.014ffee0.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/29 4:23, Alex Williamson wrote:
> On Sat, 29 Oct 2022 01:12:11 +0900
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> 
>> On 2022/10/28 23:16, Alex Williamson wrote:
>>> On Fri, 28 Oct 2022 21:26:13 +0900
>>> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>    
>>>> vfio_add_std_cap() is designed to ensure that capabilities do not
>>>> overlap, but it failed to do so for MSI and MSI-X capabilities.
>>>>
>>>> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
>>>> other overlapping capabilities.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    hw/vfio/pci.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
>>>>    hw/vfio/pci.h |  3 +++
>>>>    2 files changed, 56 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 939dcc3d4a..36c8f3dc85 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>>>>        }
>>>>    }
>>>>    
>>>> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>>>> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>>>    {
>>>>        uint16_t ctrl;
>>>> -    bool msi_64bit, msi_maskbit;
>>>> -    int ret, entries;
>>>> -    Error *err = NULL;
>>>> +    uint8_t pos;
>>>> +
>>>> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
>>>> +    if (!pos) {
>>>> +        return;
>>>> +    }
>>>>    
>>>>        if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
>>>>                  vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>>>>            error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
>>>> -        return -errno;
>>>> +        return;
>>>>        }
>>>> -    ctrl = le16_to_cpu(ctrl);
>>>> +    vdev->msi_pos = pos;
>>>> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
>>>>    
>>>> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
>>>> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
>>>> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>>>> +    vdev->msi_cap_size = 0xa;
>>>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
>>>> +        vdev->msi_cap_size += 0xa;
>>>> +    }
>>>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
>>>> +        vdev->msi_cap_size += 0x4;
>>>> +    }
>>>> +}
>>>> +
>>>> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>>>> +{
>>>> +    bool msi_64bit, msi_maskbit;
>>>> +    int ret, entries;
>>>> +    Error *err = NULL;
>>>> +
>>>> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
>>>> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
>>>> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>>>>    
>>>>        trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>>>>    
>>>> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>>>>            error_propagate_prepend(errp, err, "msi_init failed: ");
>>>>            return ret;
>>>>        }
>>>> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
>>>>    
>>>>        return 0;
>>>>    }
>>>> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>>>        pba = le32_to_cpu(pba);
>>>>    
>>>>        msix = g_malloc0(sizeof(*msix));
>>>> +    msix->pos = pos;
>>>>        msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
>>>>        msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
>>>>        msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
>>>> @@ -2025,6 +2044,24 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>>>>            }
>>>>        }
>>>>    
>>>> +    if (cap_id != PCI_CAP_ID_MSI &&
>>>> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
>>>> +        warn_report(VFIO_MSG_PREFIX
>>>> +                    "A capability overlaps with MSI, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
>>>> +                    vdev->vbasedev.name, cap_id, pos,
>>>> +                    vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
>>>> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
>>>> +        warn_report(VFIO_MSG_PREFIX
>>>> +                    "A capability overlaps with MSI-X, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
>>>> +                    vdev->vbasedev.name, cap_id, pos,
>>>> +                    vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
>>>> +        return 0;
>>>> +    }
>>>
>>> Capabilities are not a single byte, the fact that it doesn't start
>>> within the MSI or MSI-X capability is not a sufficient test.  We're
>>> also choosing to prioritize MSI and MSI-X capabilities by protecting
>>> that range rather than the existing behavior where we'd drop those
>>> capabilities if they overlap with another capability that has already
>>> been placed.  There are merits to both approaches, but I don't see any
>>> justification here to change the current behavior.
>>>
>>> Isn't the most similar behavior to existing to pass the available size
>>> to vfio_msi[x]_setup() and return an errno if the size would be
>>> exceeded?  Something like below (untested, and requires exporting
>>> msi_cap_sizeof()).  Thanks,
>>
>> It only tests the beginning of the capability currently being added
>> because its end is determined by vfio_std_cap_max_size() so that the
>> overlap does not happen.
>>
>> A comment in vfio_add_std_cap() says:
>>   >     /*
>>   >      * If it becomes important to configure capabilities to their actual
>>   >      * size, use this as the default when it's something we don't
>> recognize.
>>   >      * Since QEMU doesn't actually handle many of the config accesses,
>>   >      * exact size doesn't seem worthwhile.
>>   >      */
>>
>> My understanding of the problem is that while clipping is performed when
>> overlapping two capabilities other than MSI and MSI-X according to the
>> comment, the clipping does not happen when one of the overlapping
>> capability is MSI or MSI-X.
>>
>> According to that, the correct way to fix is to perform clipping also in
>> such a case. As QEMU actually handles the config acccesses for MSI and
>> MSI-X, MSI and MSI-X are always priotized over the other capabilities.
> 
> Here's a scenario, a vendor ships a device with an MSI capability where
> the MSI control register reports per vector masking, but the packing of
> the capabilities is such that the next capability doesn't allow for the
> mask and pending bits registers.  Currently, depending on the order we
> add them, pci_add_capability() will fail for either the MSI capability
> or the encroaching capability.  This failure will propagate back to
> vfio_realize and we'll fail to instantiate the device.  To make this
> scenario even a bit more pathological, let's assume the encroaching
> capability is MSI-X.
> 
> As proposed here, we'd drop the MSI-X capability because it's starting
> position lies within our expectation of the extent of the MSI
> capability, and we'd allow the device to initialize with only MSI.
> Was that intentional?  Was that a good choice?  What if the driver
> only supports MSI-X?  We've subtly, perhaps unintentionally, changed
> the policy based on some notion of prioritizing certain capabilities
> over others.
> 
> The intent of vfio_std_cap_max_size() is not to intentionally
> clip ranges, it's only meant to simplify defining the extent of a
> capability to be bounded by the nearest capability after it in config
> space.
> 
> Currently we rely on a combination of our own range management and the
> overlap detection in pci_add_capability() to generate a device
> instantiation failure.  If it's deemed worthwhile to remove the latter,
> and that is the extent of the focus of this series, let's not go
> dabbling into defining new priority schemes for capabilities and
> defining certain overlap scenarios as arbitrarily continue'able.
> Thanks,
> 
> Alex
> 

You are right. I missed the part that vfio_std_cap_max_size() is not 
intended to clip ranges. That invalidates reasoning to continue when 
MSI/MSI-X capability overlaps with another.

I have sent v6 to make the cases error. Thanks for reviewing and 
pointing this out.

Regards,
Akihiko Odaki

