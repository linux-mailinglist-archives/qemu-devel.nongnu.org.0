Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066867588C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItKG-0001vv-Gk; Fri, 20 Jan 2023 10:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pItKE-0001vP-CB
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:29:06 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pItKC-0001Dp-A1
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:29:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso4597254wmn.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 07:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vc2h4d2j76Us/5UJzIxBvrgchUIGd5Zbdq9uJuvWakU=;
 b=R8ilpVptik/+uYDJCmyKQmUA8t4GQgfbZd42itJ151hZnlVE7W0oF7vqoa9BH/8iow
 zrlEDkkL2AneESQr0R1O+GNsHFWSyulUDRRcZPzQsqvRCEWGEDQTCWgF7uxGC7vqqp2v
 xCn1UrdRcBPEILq4HFU3LaPqfpdUN9gmMg69z3uOu7Iu7TXNbOEFhGdaLi8Plly6lP9u
 RkqvbW0tWjzOg/ILlicHfg+b+pX+GypNiDuU0AzyBygS9Pv43h2sCzgJ+tglh+hlvKWz
 X7xlx8tn1iWaDepdfmFgS787U+thHBrv44I7JfZhhUxNGPibNopG0bZaOu+Hu6CKrqyg
 l+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vc2h4d2j76Us/5UJzIxBvrgchUIGd5Zbdq9uJuvWakU=;
 b=dUoTAwCfTvk33iGoe2po2ErmjR+KPDkBg3YerZUW4OFSCZ3DfT9VEJfJ0BzvR+HsRU
 hVyyzLslPxjXjOnEuwuOTdWgn+odfcr1XaDnd+XcEF/SL4B+ko9BElW81Ehz68CQG0Ca
 xdhBToRfHlLY9+copxEWPSsKo+uTgRLum4r9j5JbSBjq52SXmIydCgu2s5unAAAhbuMo
 LYlPb3hzTXugeebobAKVAPYek979fmXGQ99diYcNJbEoCfaD23L5V4vEzysD8YYq15ie
 jl99jFABzV341rgeNz/McAIvlD9qLSHBkMY8s5+7snIXcRFkv0vEx5pvjcCnAWrrLR4B
 aO8Q==
X-Gm-Message-State: AFqh2krcM0xiF04yqnD0Dkazy5SlS4cExaqdqrKtxhY6RQzXKPmCIahm
 rN/Y3aNygR3qVCvwUI4PAFt4Tw==
X-Google-Smtp-Source: AMrXdXt7BZjnT7/281FX316j6nGzbSaepoU9fiCHvn8GjZ6Dx9+LwkRf3LIkcFNNKyWoKu594FZfMw==
X-Received: by 2002:a05:600c:1d85:b0:3db:1bc5:bbe7 with SMTP id
 p5-20020a05600c1d8500b003db1bc5bbe7mr8227426wms.0.1674228541031; 
 Fri, 20 Jan 2023 07:29:01 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a05600c00d900b003daf672a616sm2516505wmm.22.2023.01.20.07.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:29:00 -0800 (PST)
Date: Fri, 20 Jan 2023 15:28:56 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, mst@redhat.com,
 robin.murphy@arm.com
Subject: Re: [RFC] virtio-iommu: Take into account possible aliasing in
 virtio_iommu_mr()
Message-ID: <Y8qzOKm6kvhGWG1T@myrica>
References: <20230116124709.793084-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
In-Reply-To: <20230116124709.793084-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Eric,

On Mon, Jan 16, 2023 at 07:47:09AM -0500, Eric Auger wrote:
[...]
> once we attempt to plug such devices downstream to the pcie-to-pci
> bridge, those devices are put in a singleton group. The pcie-to-pci
> bridge disappears from the radar (not attached to any group), and the
> pcie root port the pcie-to-pci bridge is plugged onto is put in a
> separate singleton group. So the topology is wrong and definitively
> different from the one observed with the intel iommu.
> 
> I suspect some other issue in the viot/pci probing on guest kernel
> side. I would appreciate on that kernel part.
> 
> qemu command excerpt:
> for x86_64:
> 
> -device ioh3420,bus=pcie.0,chassis=1,id=pcie.1,addr=0x2.0x0
> -device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
> -netdev tap,id=mynet0,ifname=tap0,script=qemu-ifup,downscript=qemu-ifdown
> -device e1000,netdev=mynet0,bus=pcie_pci_bridge1
> 
> guest pci topology:
> 
> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
>            +-01.0  Device 1234:1111
>            +-02.0-[01-02]----00.0-[02]----00.0  Intel Corporation 82540EM Gigabit Ethernet Controller
> 
> wrong guest topology:
> /sys/kernel/iommu_groups/2/devices/0000:00:02.0 (pcie root port)
> /sys/kernel/iommu_groups/1/devices/0000:02:00.0 (E1000)
> no group for 0000:01:00:0 (the pcie-to-pci bridge)

This highlights several problems in the kernel:


(1) The pcie-to-pci bridge doesn't get an IOMMU group. That's a bug in the
VIOT driver, where we use the wrong struct device when dealing with PCI
aliases. I'll send a fix.


(2) e1000 gets a different group than the pcie-to-pci bridge, and than
other devices on that bus. This wrongly enables assigning aliased devices
to different VMs.

It's not specific to virtio-iommu, I can get the same result with SMMUv3,
both DT and ACPI:

qemu-system-aarch64 -M virt,gic-version=3,its=on,iommu=smmuv3 -cpu max -m 4G -smp 8 -kernel Image -initrd initrd -append console=ttyAMA0 -nographic \
	-device pcie-root-port,chassis=1,id=pcie.1,bus=pcie.0 \
	-device pcie-pci-bridge,id=pcie.2,bus=pcie.1 \
	-device e1000,netdev=net0,bus=pcie.2,addr=1.0 -netdev user,id=net0 \
	-device e1000,netdev=net1,bus=pcie.2,addr=2.0 -netdev user,id=net1

I think the logic in pci_device_group() expects the devices to be probed
in a specific top-down order, so that when we get to a device, all its
parents already have a group. Starting with arbitrary devices would
require walking down and across the tree to find aliases which is too
complex.

As you noted Intel IOMMU doesn't have this problem, because probing
happens in the expected order. The driver loads at the right time and
bus_iommu_probe() ends up calling pci_device_group() in the right order.
For virtio-iommu and SMMU, the drivers are subject to probe deferral, and
devices drivers are bound kinda randomly by the driver core. In that case
it's acpi/of_iommu_configure() that calls pci_device_group().

I'm not sure what the best approach is to fix this. It seems wrong to rely
on previous driver probes in pci_device_group() at all, because even if
you probe in the right order, you could build a kernel without the PCIe
port driver and the aliased endpoints will still be put in different
groups. Maybe pci_device_group(), when creating a new group, should
immediately assign that group to all parents that alias the device?
Or maybe we can reuse the RID alias infrastructure used by quirks.


(3) with the SMMU, additional devices on the PCI bus can't get an IOMMU
group:

[    2.019587] e1000 0000:02:01.0: Adding to iommu group 0
[    2.389750] e1000 0000:02:02.0: stream 512 already in tree

Due to cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device
structure"), the SMMUv3 driver doesn't support RID aliasing anymore.
The structure needs to be extended with multiple devices per SID, in which
case the fault handler will choose an arbitrary device associated to the
faulting SID.


(4) When everything else works, on Arm ACPI the PCIe root port is put in a
separate group due to ACS being enabled, but on other platforms (including
Arm DT), the root port is in the same group. I haven't looked into that.


> with intel iommu we get the following topology:
> /sys/kernel/iommu_groups/2/devices/0000:02:00.0
> /sys/kernel/iommu_groups/2/devices/0000:01:00.0
> /sys/kernel/iommu_groups/2/devices/0000:00:02.0
> 
> on aarch64 we get the same using those devices:
> -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1,addr=0x2.0x0
> -device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
> -netdev tap,id=mynet0,ifname=tap0,script=qemu-ifup,downscript=qemu-ifdown
> -device e1000,netdev=mynet0,bus=pcie_pci_bridge1
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/virtio-iommu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 23c470977e..58c367b744 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -178,6 +178,21 @@ static IOMMUMemoryRegion *virtio_iommu_mr(VirtIOIOMMU *s, uint32_t sid)
>          dev = iommu_pci_bus->pbdev[devfn];
>          if (dev) {
>              return &dev->iommu_mr;
> +        } else { /* check possible aliasing */
> +            PCIBus *pbus = iommu_pci_bus->bus;
> +
> +            if (!pci_bus_is_express(pbus)) {
> +                PCIDevice *parent = pbus->parent_dev;
> +
> +                if (pci_is_express(parent) &&
> +                    pcie_cap_get_type(parent) == PCI_EXP_TYPE_PCI_BRIDGE) {
> +                    devfn = PCI_DEVFN(0, 0);
> +                    dev = iommu_pci_bus->pbdev[devfn];
> +                    if (dev) {
> +                        return &dev->iommu_mr;
> +                    }
> +                }
> +            }

Yes, I think that makes sense. Maybe the comment should refer to
pci_device_iommu_address_space(), which explains what is happening. Since
this exactly mirrors what that function does, do we also need the case
where the parent is not PCIe?  In that case the bus is the parent and
devfn is that of the bridge

Thanks,
Jean

