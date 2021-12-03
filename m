Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD2467932
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:13:28 +0100 (CET)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9JW-0002Go-P4
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mt9HP-00018Q-4c; Fri, 03 Dec 2021 09:11:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mt9HK-0001jb-9h; Fri, 03 Dec 2021 09:11:13 -0500
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J5F8D59N0z67b2S;
 Fri,  3 Dec 2021 22:10:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 3 Dec 2021 15:11:00 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 14:10:59 +0000
Date: Fri, 3 Dec 2021 14:10:58 +0000
To: Gavin Shan <gshan@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <david@redhat.com>,
 <eric.auger@redhat.com>, <drjones@redhat.com>, <imammedo@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <shan.gavin@gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/virt: Support for virtio-mem-pci
Message-ID: <20211203141058.00006079@Huawei.com>
In-Reply-To: <20211203033522.27580-1-gshan@redhat.com>
References: <20211203033522.27580-1-gshan@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml711-chm.china.huawei.com (10.201.108.62) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri,  3 Dec 2021 11:35:20 +0800
Gavin Shan <gshan@redhat.com> wrote:

> This series supports virtio-mem-pci device, by simply following the
> implementation on x86. The exception is the block size is 512MB on
> ARM64 instead of 128MB on x86, compatible with the memory section
> size in linux guest.
> 
> The work was done by David Hildenbrand and then Jonathan Cameron. I'm
> taking the patch and putting more efforts, which is all about testing
> to me at current stage.

Hi Gavin,

Thanks for taking this forwards.  What you have here looks good to me, but
I've not looked at this for a while, so I'll go with whatever David and
others say :)

Jonathan

> 
> Testing
> =======
> The upstream linux kernel (v5.16.rc3) is used on host/guest during
> the testing. The guest kernel includes changes to enable virtio-mem
> driver, which is simply to enable CONFIG_VIRTIO_MEM on ARM64.
> 
> Mutiple combinations like page sizes on host/guest, memory backend
> device etc are covered in the testing. Besides, migration is also
> tested. The following command lines are used for VM or virtio-mem-pci
> device hot-add. It's notable that virtio-mem-pci device hot-remove
> isn't supported, similar to what we have on x86. 
> 
>   host.pgsize  guest.pgsize  backend    hot-add  hot-remove  migration
>   ---------------------------------------------------------------------
>    4KB         4KB           normal     ok       ok          ok
>                              THP        ok       ok          ok
>                              hugeTLB    ok       ok          ok
>    4KB         64KB          normal     ok       ok          ok
>                              THP        ok       ok          ok
>                              hugeTLB    ok       ok          ok
>   64KB         4KB           normal     ok       ok          ok
>                              THP        ok       ok          ok
>                              hugeTLB    ok       ok          ok
>   64KB         64KB          normal     ok       ok          ok
>                              THP        ok       ok          ok
>                              hugeTLB    ok       ok          ok
> 
> The command lines are used for VM. When hugeTLBfs is used, all memory
> backend objects are popuated on /dev/hugepages-2048kB or
> /dev/hugepages-524288kB, depending on the host page sizes.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                       \
>   -accel kvm -machine virt,gic-version=host                                     \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1                                  \
>   -m 1024M,slots=16,maxmem=64G                                                  \
>   -object memory-backend-ram,id=mem0,size=512M                                  \
>   -object memory-backend-ram,id=mem1,size=512M                                  \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                                      \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                                      \
>      :
>   -kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image                 \
>   -initrd /home/gavin/sandbox/images/rootfs.cpio.xz                             \
>   -append earlycon=pl011,mmio,0x9000000                                         \
>   -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                         \
>   -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                         \
>   -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                         \
>   -object memory-backend-ram,id=vmem0,size=512M                                 \
>   -device virtio-mem-pci,id=vm0,bus=pcie.1,memdev=vmem0,node=0,requested-size=0 \
>   -object memory-backend-ram,id=vmem1,size=512M                                 \
>   -device virtio-mem-pci,id=vm1,bus=pcie.2,memdev=vmem1,node=1,requested-size=0 
> 
> Command lines used for memory hot-add and hot-remove:
> 
>   (qemu) qom-set vm1 requested-size 512M
>   (qemu) qom-set vm1 requested-size 0
>   (qemu) qom-set vm1 requested-size 512M
> 
> Command lines used for virtio-mem-pci device hot-add:
> 
>   (qemu) object_add memory-backend-ram,id=hp-mem1,size=512M
>   (qemu) device_add virtio-mem-pci,id=hp-vm1,bus=pcie.3,memdev=hp-mem1,node=1
>   (qemu) qom-set hp-vm1 requested-size 512M
>   (qemu) qom-set hp-vm1 requested-size 0
>   (qemu) qom-set hp-vm1 requested-size 512M
> 
> Changelog
> =========
> v2:
>   * Include David/Jonathan as co-developers in the commit log           (David)
>   * Decrease VIRTIO_MEM_USABLE_EXTENT to 512MB on ARM64 in PATCH[1/2]   (David)
>   * PATCH[2/2] is added to correct the THP sizes on ARM64               (David)
> 
> Gavin Shan (2):
>   hw/arm/virt: Support for virtio-mem-pci
>   virtio-mem: Correct default THP size for ARM64
> 
>  hw/arm/Kconfig         |  1 +
>  hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
>  hw/virtio/virtio-mem.c | 36 ++++++++++++++--------
>  3 files changed, 91 insertions(+), 14 deletions(-)
> 


