Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599FF663265
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 22:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEzQX-00010y-QB; Mon, 09 Jan 2023 16:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pEzQV-00010h-IQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:11:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pEzQU-0001tM-3a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673298685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWszbajlfIon8UOzUFX48i8ucc+I9ZIG2M+goJXMKdY=;
 b=hS09QMAAyH6DYVGHD3XscBLV5f6MiNK1EsgYEKx674obsYYDTQkOR3YSxZwRFqc0Ri6g7C
 POz+JexxWpShV0b4IlPXEF1PkYguAo6C50StOV16JRhz5C+kYp9KCafB/v++pW4IOCtBYX
 Q1ZFVZMQkKiSrYXh3zKli4ERUdlQvNc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-1xDsStdqOIqsKA_Z1lFQAw-1; Mon, 09 Jan 2023 16:11:24 -0500
X-MC-Unique: 1xDsStdqOIqsKA_Z1lFQAw-1
Received: by mail-vs1-f72.google.com with SMTP id
 s62-20020a675e41000000b003cefb1730d9so1273441vsb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 13:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jWszbajlfIon8UOzUFX48i8ucc+I9ZIG2M+goJXMKdY=;
 b=E47GUz9z4CJjZr4hbgTYOpHrsyy8b5msEBt6/rRG2RjnVlaAoTatXmgNJ01SwhyiKS
 Pur9XZ+QvOKOxfkjTXz2g9wqBD+QH/dyiu1a+BmderSoTALWrk4DMHDtPvdE7b86WCgW
 YSHfFUpF1OXPKWyd+wTYf8DY4IcMcwgO/rpiDpWNl8WuBpDf05BirSgv5ectVeE/2VRM
 2sTApQ4SqhcFuLpERrpOnIhW7Qmc+yjv31btrVs/B0K+FDCf1t7KR/BVujnlRVsy+K70
 VN+kFQ62qgdYBZBC3RhukTcvW0w3nln6XQ6HuCJWLc00hh2xv+VWbWzcHKu5yIt9Ebs5
 YyqQ==
X-Gm-Message-State: AFqh2kpmnCJ/QauSJrZRZT+7ZHu/t999Qz8nN6G6GqoGPyml616+AmaE
 ECVjoPDScB/c6lDsF4VxiEFEeRKMlx4SjhRhFrVjFd8GEL5Em+Q2o+SUSaZh7km9znpv+8N/ktj
 eliDd+F1tVpAjPAU=
X-Received: by 2002:a05:6102:116a:b0:3c6:fca5:b8f7 with SMTP id
 k10-20020a056102116a00b003c6fca5b8f7mr24515316vsg.7.1673298683773; 
 Mon, 09 Jan 2023 13:11:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCheZ7Ja5CWH334atVYHJb2z1sc7zRdyzCmVnGbl+A0ZAAKvNDIz98G0+IeE/G7WlQFMrDag==
X-Received: by 2002:a05:6102:116a:b0:3c6:fca5:b8f7 with SMTP id
 k10-20020a056102116a00b003c6fca5b8f7mr24515297vsg.7.1673298683511; 
 Mon, 09 Jan 2023 13:11:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 dm42-20020a05620a1d6a00b00705bac8891esm2139842qkb.40.2023.01.09.13.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 13:11:22 -0800 (PST)
Message-ID: <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
Date: Mon, 9 Jan 2023 22:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Content-Language: en-US
From: Eric Auger <eauger@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu list <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
In-Reply-To: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi,

On 1/9/23 14:24, Eric Auger wrote:
> Hi,
> 
> we have a trouble with virtio-iommu and protected assigned devices
> downstream to a pcie-to-pci bridge. In that use case we observe the
> assigned devices are not put to any group. This is true on both x86 and
> aarch64. This use case works with intel-iommu.
> 
> *** Guest PCI topology is:
> lspci -tv
> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM
> Controller
>            +-01.0  Device 1234:1111
>            +-02.0-[01-02]----00.0-[02]----01.0  Broadcom Inc. and
> subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller
>            +-02.1-[03]--
>            +-02.2-[04]----00.0  Red Hat, Inc. Virtio block device
>            +-0a.0  Red Hat, Inc. Device 1057
>            +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
>            +-1f.2  Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port
> SATA Controller [AHCI mode]
>            \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
> 
> 
> All the assigned devices are aliased and they get devfn=0x0.
> see qemu pci_device_iommu_address_space in hw/pci.c
> 
> Initially I see the following traces
> pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
> pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
> call iommu_fn with bus=0x55f556dde180 and devfn=0
> virtio_iommu_init_iommu_mr init virtio-iommu-memory-region-0-0
> 
> Note the bus is 0 at this time and devfn that is used in the
> virtio-iommu is 0. So an associated IOMMU MR is created with this bus at
> devfn=0 slot. This is before bus actual numbering.
> 
> However later on, I see virtio_iommu_probe() and virtio_iommu_attach()
> getting called with ep_id=520
> because in the qemu virtio-iommu device, virtio_iommu_mr(pe_id) fails to
> find the iommu_mr and returns -ENOENT
> 
> On guest side I see that
> acpi_iommu_configure_id/iommu_probe_device() fails
> (__iommu_probe_device) and also __iommu_attach_device would also fail
> anyway.
> 
> I guess those get called before actual bus number recomputation?
> 
> on aarch64 I eventually see the "good" MR beeing created, ie. featuring
> the right bus number:
> qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
> BDF=0x208 bus=2 devfn=0x8
> qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
> BDF=0x208 bus=2 devfn=0x8 call iommu_fn with bus=0xaaaaef12c450 and devfn=0
> 
> But this does not happen on x86.
> 
> Jean, do you have any idea about how to fix that? Do you think we have a
> trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> like virtio probe and attach commands are called too early, before the
> bus is actually correctly numbered.

So after further investigations looks this is not a problem of bus
number, which is good at the time of the virtio cmd calls but rather a
problem related to the devfn (0 was used when creating the IOMMU MR)
whereas the virtio-iommu cmds looks for the non aliased devfn. With that
fixed, the probe and attach at least succeeds. The device still does not
work for me but I will continue my investigations and send a tentative fix.

Thanks

Eric
> 
> Thanks
> 
> Eric
> 
> 
> 
> 
> 
> 
> 


