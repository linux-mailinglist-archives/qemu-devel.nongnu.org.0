Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A035B672738
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDL7-0007wD-6L; Wed, 18 Jan 2023 13:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDKl-0007om-L0
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDKg-0005Ff-KT
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674067122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TclhBrlNIitIxlOi1Mwtg0IBC1E8jf5U8vH4QeeXPzg=;
 b=c/jRAqnQCe4MqPmeErNyTT04fNp9uIgSh1weUHWnZU0hc6GtxzONgeDYTxlUktDfiIZ5rN
 TMz3zhNmsECH9xldQJs5seSJZgjVinNMkKZoPkM0VoHfJQMMkwbo1fePkBVdRlKSyf1Tnk
 Vd16W6GuFyaUUl5OZcRGQtv45RZZsbY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-UQTvd-9EMHifuaH9jRFXGQ-1; Wed, 18 Jan 2023 13:38:40 -0500
X-MC-Unique: UQTvd-9EMHifuaH9jRFXGQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 m125-20020a672683000000b003af413a8263so9218899vsm.17
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TclhBrlNIitIxlOi1Mwtg0IBC1E8jf5U8vH4QeeXPzg=;
 b=xftOn8ZMikf40tNag7IdNvRjGQpnw+zcWHKksfvGAtoT+xCOisP84N4BwCYtJhkq8S
 2hqqPwkyFT4LBJE7xoFzMuIj6PqXAARHgy+/03prvxMRVTWviYtTT6O0Tn2r06Bs3osX
 MjpqUgS6siOK5Fj6TTsXYNZvxl/Y1c3Ml98kan1XyrgbzC4TMfUUz4GmF5cXoUAL5AxP
 emLQhilKOx+f74PQLzcSdD7eZs1NPYU1Z1yc6ltdaxPVAQj8rcjqMzXM1J4Ib31IbKUC
 koZFOSD3luuKFyrfhVlEGc6mhI241ULxdIwZW1R81kLYDZvtViTO3CUjrOTOjFBN1Zqa
 kr5A==
X-Gm-Message-State: AFqh2kp0hHDGFXq5C5smAxXInbR0zcWeBtVXL7YR8iOhR35GS4JafVLI
 ZN9YfE8x7NVjiWcRa5d6HgAllB7/LCdSAAHpgd8x0ihjHuNTB+pyAvtILVTEe7DMpTvyn0qGR4B
 K9cTFZHYPBGvNauc=
X-Received: by 2002:a1f:3183:0:b0:3dd:f5bd:bd83 with SMTP id
 x125-20020a1f3183000000b003ddf5bdbd83mr4758161vkx.2.1674067120193; 
 Wed, 18 Jan 2023 10:38:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsz9xtDDxZHuD45JGA6s3pQ24KrJk1ocULDEt/k6bBDEvRtRGwKlQ+IQtZOnJLlrC+tZ3Cxhw==
X-Received: by 2002:a1f:3183:0:b0:3dd:f5bd:bd83 with SMTP id
 x125-20020a1f3183000000b003ddf5bdbd83mr4758139vkx.2.1674067119814; 
 Wed, 18 Jan 2023 10:38:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a05620a2a5600b0070638ad5986sm9280416qkp.85.2023.01.18.10.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 10:38:38 -0800 (PST)
Message-ID: <5bc1a23d-b7cf-f42e-0d19-ba491ea70908@redhat.com>
Date: Wed, 18 Jan 2023 19:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
 <CACGkMEttPQddPbu7ddLuU-HoED=ELMtyv7BE=nioZ0uOaXF3+Q@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CACGkMEttPQddPbu7ddLuU-HoED=ELMtyv7BE=nioZ0uOaXF3+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Jason,

On 1/11/23 08:14, Jason Wang wrote:
> On Tue, Jan 10, 2023 at 5:11 AM Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/9/23 14:24, Eric Auger wrote:
>>> Hi,
>>>
>>> we have a trouble with virtio-iommu and protected assigned devices
>>> downstream to a pcie-to-pci bridge. In that use case we observe the
>>> assigned devices are not put to any group. This is true on both x86 and
>>> aarch64. This use case works with intel-iommu.
>>>
>>> *** Guest PCI topology is:
>>> lspci -tv
>>> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM
>>> Controller
>>>            +-01.0  Device 1234:1111
>>>            +-02.0-[01-02]----00.0-[02]----01.0  Broadcom Inc. and
>>> subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller
>>>            +-02.1-[03]--
>>>            +-02.2-[04]----00.0  Red Hat, Inc. Virtio block device
>>>            +-0a.0  Red Hat, Inc. Device 1057
>>>            +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
>>>            +-1f.2  Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port
>>> SATA Controller [AHCI mode]
>>>            \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
>>>
>>>
>>> All the assigned devices are aliased and they get devfn=0x0.
>>> see qemu pci_device_iommu_address_space in hw/pci.c
>>>
>>> Initially I see the following traces
>>> pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
>>> pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
>>> call iommu_fn with bus=0x55f556dde180 and devfn=0
>>> virtio_iommu_init_iommu_mr init virtio-iommu-memory-region-0-0
>>>
>>> Note the bus is 0 at this time and devfn that is used in the
>>> virtio-iommu is 0. So an associated IOMMU MR is created with this bus at
>>> devfn=0 slot. This is before bus actual numbering.
>>>
>>> However later on, I see virtio_iommu_probe() and virtio_iommu_attach()
>>> getting called with ep_id=520
>>> because in the qemu virtio-iommu device, virtio_iommu_mr(pe_id) fails to
>>> find the iommu_mr and returns -ENOENT
>>>
>>> On guest side I see that
>>> acpi_iommu_configure_id/iommu_probe_device() fails
>>> (__iommu_probe_device) and also __iommu_attach_device would also fail
>>> anyway.
>>>
>>> I guess those get called before actual bus number recomputation?
>>>
>>> on aarch64 I eventually see the "good" MR beeing created, ie. featuring
>>> the right bus number:
>>> qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
>>> BDF=0x208 bus=2 devfn=0x8
>>> qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
>>> BDF=0x208 bus=2 devfn=0x8 call iommu_fn with bus=0xaaaaef12c450 and devfn=0
>>>
>>> But this does not happen on x86.
>>>
>>> Jean, do you have any idea about how to fix that? Do you think we have a
>>> trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
>>> like virtio probe and attach commands are called too early, before the
>>> bus is actually correctly numbered.
>>
>> So after further investigations looks this is not a problem of bus
>> number, which is good at the time of the virtio cmd calls but rather a
>> problem related to the devfn (0 was used when creating the IOMMU MR)
>> whereas the virtio-iommu cmds looks for the non aliased devfn. With that
>> fixed, the probe and attach at least succeeds. The device still does not
>> work for me but I will continue my investigations and send a tentative fix.
> 
> Haven't thought this deeply, just one thing in my mind and in case
> that may help:
Sorry for the delay, I did not see the follow-ups on this thread :-(,
> 
> intel-iommu doesn't use bus no as the key for hashing address spaces
> since it could be configured by the guest:
> 
> /*
>  * Note that we use pointer to PCIBus as the key, so hashing/shifting
>  * based on the pointer value is intended. Note that we deal with
>  * collisions through vtd_as_equal().
>  */
> static guint vtd_as_hash(gconstpointer v)
> {
>     const struct vtd_as_key *key = v;
>     guint value = (guint)(uintptr_t)key->bus;
> 
>     return (guint)(value << 8 | key->devfn);
> }
I think we have something similar on virtio-iommu. We use the old
flavour "as_by_busptr" whose key is the PCIBus pointer. This was
basically copied from the intel-iommu and then you replaced it with
da8d439c8048 ("intel-iommu: drop VTDBus")

Thanks

Eric
> 
> Thanks
> 
>>
>> Thanks
>>
>> Eric
>>>
>>> Thanks
>>>
>>> Eric
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>
> 


