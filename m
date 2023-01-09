Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05754662734
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEs9K-00081f-0N; Mon, 09 Jan 2023 08:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pEs8n-0007zK-Vu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pEs8l-0006R8-B7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673270673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5QseVhw36DLyG46FI4iqZzHWHTrQIjKtchuxWLjDASg=;
 b=XDukr8AkC0NWsSDn9Jc1EvWWfaORIyEYSxkx5oGIfaYMfQ6hjRnAWF8lOXqpnYKxeSxOal
 EGpjvL/wTCuwzx3r16UTzDkRuZCRC5oqv97shG64iqQGmx9zSUHRWfytivRMnxAUSlLo5c
 /0YhvztPQdBihTpKtWw5b5gwqLM9shk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-bcY5Xq6MOR-xtXcNaKjnEA-1; Mon, 09 Jan 2023 08:24:32 -0500
X-MC-Unique: bcY5Xq6MOR-xtXcNaKjnEA-1
Received: by mail-qk1-f197.google.com with SMTP id
 m9-20020a05620a290900b0070596994c7eso6456790qkp.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:subject:to:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5QseVhw36DLyG46FI4iqZzHWHTrQIjKtchuxWLjDASg=;
 b=K0knycrSbiND7zZV3YEk7+Kb1X60CpishLhJaPUqB29MxiXFbMi9c6CUM3FdzZxnlV
 1+jAeouwpBkF0W7WJ14sdkitRlptZ07YIeyhSKtExXh0DSzOihXEk88SfyXYAuXjuZgV
 42cKlukooGioFp/YLAQmNkOAmfjk9Z0pJK48ynIg+TvcFc6di3QWDNVHGfxyZSsm5PQh
 hkMtaiU1ZMF/Oj+/TYJBxcs8jzonsS550TfRd7GMyPnZB0MxBeoqzTy62vr0xc2Vgir6
 Wi5wvfJfCoMgE3dCfJFD2cekSkjhfOdwtZNiz9P2IaOh3paisJnLLvQmHUxnpHqDKO6T
 ZNEw==
X-Gm-Message-State: AFqh2kq376mAZk9rk1WVFoc4Zkmj1WjaoVsso8Zmj8ZBaxQvqhrh71XW
 /wHnMJTpc84cGvB+TciQfZmV0g9Y3nhiG6PjCNnCCBplzHxBtBjcIF7n6493wpGFIaygCJeud6Z
 6V3rjiVhLIfnXIWE=
X-Received: by 2002:ac8:75d4:0:b0:3a8:1edf:e8f5 with SMTP id
 z20-20020ac875d4000000b003a81edfe8f5mr86390456qtq.50.1673270671714; 
 Mon, 09 Jan 2023 05:24:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMV2pCGkO8vDH1E9YItQJqpEJxO3AGiVHXKQxq1JbDO5WJeLZ15QEF88zSkWQwAf6wLtF1lA==
X-Received: by 2002:ac8:75d4:0:b0:3a8:1edf:e8f5 with SMTP id
 z20-20020ac875d4000000b003a81edfe8f5mr86390438qtq.50.1673270671464; 
 Mon, 09 Jan 2023 05:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c11-20020ac853cb000000b00397b1c60780sm4523502qtq.61.2023.01.09.05.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:24:29 -0800 (PST)
Message-ID: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
Date: Mon, 9 Jan 2023 14:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
From: Eric Auger <eauger@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu list <qemu-devel@nongnu.org>
Subject: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

we have a trouble with virtio-iommu and protected assigned devices
downstream to a pcie-to-pci bridge. In that use case we observe the
assigned devices are not put to any group. This is true on both x86 and
aarch64. This use case works with intel-iommu.

*** Guest PCI topology is:
lspci -tv
-[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM
Controller
           +-01.0  Device 1234:1111
           +-02.0-[01-02]----00.0-[02]----01.0  Broadcom Inc. and
subsidiaries BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller
           +-02.1-[03]--
           +-02.2-[04]----00.0  Red Hat, Inc. Virtio block device
           +-0a.0  Red Hat, Inc. Device 1057
           +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
           +-1f.2  Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port
SATA Controller [AHCI mode]
           \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller


All the assigned devices are aliased and they get devfn=0x0.
see qemu pci_device_iommu_address_space in hw/pci.c

Initially I see the following traces
pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
pci_device_iommu_address_space name=vfio-pci BDF=0x8 bus=0 devfn=0x8
call iommu_fn with bus=0x55f556dde180 and devfn=0
virtio_iommu_init_iommu_mr init virtio-iommu-memory-region-0-0

Note the bus is 0 at this time and devfn that is used in the
virtio-iommu is 0. So an associated IOMMU MR is created with this bus at
devfn=0 slot. This is before bus actual numbering.

However later on, I see virtio_iommu_probe() and virtio_iommu_attach()
getting called with ep_id=520
because in the qemu virtio-iommu device, virtio_iommu_mr(pe_id) fails to
find the iommu_mr and returns -ENOENT

On guest side I see that
acpi_iommu_configure_id/iommu_probe_device() fails
(__iommu_probe_device) and also __iommu_attach_device would also fail
anyway.

I guess those get called before actual bus number recomputation?

on aarch64 I eventually see the "good" MR beeing created, ie. featuring
the right bus number:
qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
BDF=0x208 bus=2 devfn=0x8
qemu-system-aarch64: pci_device_iommu_address_space name=vfio-pci
BDF=0x208 bus=2 devfn=0x8 call iommu_fn with bus=0xaaaaef12c450 and devfn=0

But this does not happen on x86.

Jean, do you have any idea about how to fix that? Do you think we have a
trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
like virtio probe and attach commands are called too early, before the
bus is actually correctly numbered.

Thanks

Eric








