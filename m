Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92D49B638
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:29:40 +0100 (CET)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMpH-00037N-Qj
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCLE8-0002tL-Rz
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCLE2-0008E7-GH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643114825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1hzIX/SgfcMlUjpvokQqT5klqoE54ufxZFDHPQf4pI=;
 b=HdYqkcUha6/OpCqzOR08KbntE38/AoN9v85zdWO9EeTEbxbkFi6UdX/67e4e8rog7XpeRK
 PJzTdfZMNvL4La8LkRQzH81JrIiCxCHVT8M7uIiHFp+ifrZ//tBKRzyHP6O1C/rd4elzIW
 kmXzaJblhbjFrhnpX1kwOA+LGb/qSt4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-bFd8Ne7sNOubv0vCND6QVg-1; Tue, 25 Jan 2022 07:47:04 -0500
X-MC-Unique: bFd8Ne7sNOubv0vCND6QVg-1
Received: by mail-ej1-f72.google.com with SMTP id
 q3-20020a17090676c300b006a9453c33b0so3461892ejn.13
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 04:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UmL9Ec0Z4pI/Ubi520mSy1+EWiptQo1wmSOzh/0Mx4g=;
 b=D6IK8rJneZ64+GYzCWG3HMJdiXiTNSA2EKuPzN50+uce8srO5Vrp5wwnOXxdLy6KGW
 DrGVILp2V5ajnvVHhMypGzyNJ+ar/YVGPDzxEGYj5o+zmDe1wyMcJ1oL8zYX0h/WhfXL
 Pnx0Jy28dCpgKil1WMOVIjmfww/nl+jKD8GgDKP186RoB1nnr2NyCnbhoGTm8E6F1ZGv
 35odjjtwxfyYC71/80UNaRlIWxgZnaZlke//yVJ6rZL8EgckVrPlM/dYOC8Xn91G0D3e
 FRrF8vfi1Lhw4KtBMC2Gb1HxvBXvPc8Z/nMJsXL3wj2zvCkC4j0mzhKIdDZZ77N5RSna
 U5fg==
X-Gm-Message-State: AOAM5334spnmQX09G2i6JR+NUw05QalHaqOXHw/zm30jmUlt3QWRHtzB
 EKCHOWpH5rP8Zr6d//rcnDX1lPc6vv7SMbulpcrVQmnSlM40yOBbRoG6sL2NBFQ/wBF5ugXNSCG
 HqS0pNi1w+LvNEEY=
X-Received: by 2002:a05:6402:1057:: with SMTP id
 e23mr20448546edu.140.1643114821254; 
 Tue, 25 Jan 2022 04:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKjfIfta8ftCZJ2RGUwl88pYSwWOyUdCjSJ9Z7UCwkYga5X4uRYs9/D7gE0w26U7ga2LG0LA==
X-Received: by 2002:a05:6402:1057:: with SMTP id
 e23mr20448512edu.140.1643114820589; 
 Tue, 25 Jan 2022 04:47:00 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id ku10sm6081196ejc.67.2022.01.25.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 04:47:00 -0800 (PST)
Date: Tue, 25 Jan 2022 13:46:58 +0100
From: Andrew Jones <drjones@redhat.com>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Subject: Re: [PATCH] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20220125124658.yf6we6n4l6unducl@gator>
References: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
 <20220125102603.3ssiffsqcyt7tlwr@gator>
 <853b0152-8996-1097-1f01-d3ede7a2b0ca@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <853b0152-8996-1097-1f01-d3ede7a2b0ca@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, linuxarm@huawei.com,
 chenxiang via <qemu-devel@nongnu.org>, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 07:46:43PM +0800, chenxiang (M) wrote:
> Hi Andrew,
>=20
>=20
> =E5=9C=A8 2022/1/25 18:26, Andrew Jones =E5=86=99=E9=81=93:
> > On Tue, Jan 25, 2022 at 05:15:34PM +0800, chenxiang via wrote:
> > > From: Xiang Chen <chenxiang66@hisilicon.com>
> > >=20
> > > Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table =
(HMAT)"),
> > > HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt m=
achine.
> > Hi Xiang,
> >=20
> > What QEMU commands lines have you tested with which Linux guest kernels=
?
>=20
> I tested it with following commands with guest kernel 5.16-rc1, and the b=
oot
> log of guest kernel is as attached:

Thanks. Please consider adding HMAT tests, see tests/qtest/numa-test.c and
tests/qtest/bios-tables-test.c, for the virt machine type to this series.
Otherwise,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

>=20
> ./qemu-system-aarch64 -m 4G,slots=3D4,maxmem=3D8g \
> -object memory-backend-ram,size=3D2G,id=3Dm0 \
> -object memory-backend-ram,size=3D2G,id=3Dm1 \
> -numa node,cpus=3D0-3,nodeid=3D0,memdev=3Dm0 \
> -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \
> -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dacc=
ess-latency,latency=3D5
> \
> -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dacc=
ess-bandwidth,bandwidth=3D200M
> \
> -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dacc=
ess-latency,latency=3D10
> \
> -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dacc=
ess-bandwidth,bandwidth=3D100M
> \
> -numa hmat-cache,node-id=3D0,size=3D16K,level=3D1,associativity=3Ddirect,=
policy=3Dwrite-back,line=3D8
> \
> -numa hmat-cache,node-id=3D1,size=3D16K,level=3D1,associativity=3Ddirect,=
policy=3Dwrite-back,line=3D8
> \
> -smp 4 \
> -no-reboot \
> -nographic \
> -cpu host \
> -machine virt,accel=3Dkvm,gic-version=3D3,hmat=3Don \
> -bios /home/cx/QEMU_EFI.fd \
> -monitor unix:/home/cx/opt/qmp-test,server,nowait \
> -kernel /home/cx/Image  \
> -device virtio-blk-pci,drive=3Ddrive0,id=3Dvirtblk0,num-queues=3D4  \
> -drive file=3D/home/cx/opt/boot.img,if=3Dnone,id=3Ddrive0 \
> -append "rdinit=3Dinit console=3DttyAMA0 root=3D/dev/vda rootfstype=3Dext=
4 rw "
>=20
>=20
> >=20
> > Thanks,
> > drew
> >=20
> > > Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> > > ---
> > >   hw/arm/Kconfig           | 1 +
> > >   hw/arm/virt-acpi-build.c | 7 +++++++
> > >   2 files changed, 8 insertions(+)
> > >=20
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 2e0049196d..a3c6099829 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -29,6 +29,7 @@ config ARM_VIRT
> > >       select ACPI_APEI
> > >       select ACPI_VIOT
> > >       select VIRTIO_MEM_SUPPORTED
> > > +    select ACPI_HMAT
> > >   config CHEETAH
> > >       bool
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 449fab0080..f19b55e486 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -42,6 +42,7 @@
> > >   #include "hw/acpi/memory_hotplug.h"
> > >   #include "hw/acpi/generic_event_device.h"
> > >   #include "hw/acpi/tpm.h"
> > > +#include "hw/acpi/hmat.h"
> > >   #include "hw/pci/pcie_host.h"
> > >   #include "hw/pci/pci.h"
> > >   #include "hw/pci/pci_bus.h"
> > > @@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, Acpi=
BuildTables *tables)
> > >               build_slit(tables_blob, tables->linker, ms, vms->oem_id=
,
> > >                          vms->oem_table_id);
> > >           }
> > > +
> > > +        if (ms->numa_state->hmat_enabled) {
> > > +            acpi_add_table(table_offsets, tables_blob);
> > > +            build_hmat(tables_blob, tables->linker, ms->numa_state,
> > > +                       vms->oem_id, vms->oem_table_id);
> > > +        }
> > >       }
> > >       if (ms->nvdimms_state->is_enabled) {
> > > --=20
> > > 2.33.0
> > >=20
> > >=20
> > .
> >=20
>=20

> [root@centos build]# ./qemu-system-aarch64 -m 4G,slots=3D4,maxmem=3D8g -o=
bject memory-backend-ram,size=3D2G,id=3Dm0 -object memory-backend-ram,size=
=3D2G,id=3Dm1 -numa node,cpus=3D0-3,nodeid=3D0,memdev=3Dm0 -numa node,nodei=
d=3D1,memdev=3Dm1,initiator=3D0 -numa hmat-lb,initiator=3D0,target=3D0,hier=
archy=3Dmemory,data-type=3Daccess-latency,latency=3D5 -numa hmat-lb,initiat=
or=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Daccess-bandwidth,bandwidth=
=3D200M -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D10 -numa hmat-lb,initiator=3D0,target=3D1,hiera=
rchy=3Dmemory,data-type=3Daccess-bandwidth,bandwidth=3D100M -numa hmat-cach=
e,node-id=3D0,size=3D16K,level=3D1,associativity=3Ddirect,policy=3Dwrite-ba=
ck,line=3D8 -numa hmat-cache,node-id=3D1,size=3D16K,level=3D1,associativity=
=3Ddirect,policy=3Dwrite-back,line=3D8 -smp 4 -no-reboot -nographic -cpu ho=
st -machine virt,accel=3Dkvm,gic-version=3D3,hmat=3Don -bios /home/cx/QEMU_=
EFI.fd -monitor unix:/home/cx/opt/qmp-test,server,nowait -kernel /home/cx/I=
mage  -device virtio-blk-pci,drive=3Ddrive0,id=3Dvirtblk0,num-queues=3D4  -=
drive file=3D/home/cx/opt/boot.img,if=3Dnone,id=3Ddrive0 -append "rdinit=3D=
init console=3DttyAMA0 root=3D/dev/vda rootfstype=3Dext4 rw "
> WARNING: Image format was not specified for '/home/cx/opt/boot.img' and p=
robing guessed raw.
>          Automatically detecting the format is dangerous for raw images, =
write operations on block 0 will be restricted.
>          Specify the 'raw' format explicitly to remove the restrictions.
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable
> EFI stub: Generating empty DTB
> EFI stub: Exiting boot services...
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x481fd010]
> [    0.000000] Linux version 5.16.0-rc1-15060-g07d132dd883a (chenxiang@pl=
inth) (aarch64-linux-gnu-gcc (Linaro GCC 7.3-2018.05-rc1) 7.3.1 20180425 [l=
inaro-7.3-2018.05-rc1 revision 38aec9a676236eaa42ca03ccb3a6c1dd0182c29f], G=
NU ld (Linaro_Binutils-2018.05-rc1) 2.28.2.20170706) #313 SMP PREEMPT Mon J=
an 24 18:25:06 HKT 2022
> [    0.000000] efi: EFI v2.70 by EDK II
> [    0.000000] efi: SMBIOS 3.0=3D0xbf8e0000 MEMATTR=3D0xbc900018 ACPI 2.0=
=3D0xbc270000 MEMRESERVE=3D0xbc503f18
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000BC270000 000024 (v02 BOCHS )
> [    0.000000] ACPI: XSDT 0x00000000BC260000 000074 (v01 BOCHS  BXPC     =
00000001      01000013)
> [    0.000000] ACPI: FACP 0x00000000BC210000 00010C (v05 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x00000000BC220000 001A56 (v02 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x00000000BC200000 000198 (v03 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: PPTT 0x00000000BC1F0000 000088 (v02 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: GTDT 0x00000000BC1E0000 000060 (v02 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: MCFG 0x00000000BC1D0000 00003C (v01 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: SPCR 0x00000000BC1C0000 000050 (v02 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DBG2 0x00000000BC1B0000 000057 (v00 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: SRAT 0x00000000BC1A0000 0000F0 (v03 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HMAT 0x00000000BC190000 000118 (v02 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: IORT 0x00000000BC180000 000080 (v03 BOCHS  BXPC     =
00000001 BXPC 00000001)
> [    0.000000] ACPI: SPCR: console: pl011,mmio,0x9000000,9600
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x40000000-0xbfffffff]
> [    0.000000] ACPI: SRAT: Node 1 PXM 1 [mem 0xc0000000-0x13fffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0xbfffdb80-0xbfffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x13f7f9b80-0x13f7fbfff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bc27ffff]
> [    0.000000]   node   0: [mem 0x00000000bc280000-0x00000000bc4fffff]
> [    0.000000]   node   0: [mem 0x00000000bc500000-0x00000000bf7dffff]
> [    0.000000]   node   0: [mem 0x00000000bf7e0000-0x00000000bf86ffff]
> [    0.000000]   node   0: [mem 0x00000000bf870000-0x00000000bf87ffff]
> [    0.000000]   node   0: [mem 0x00000000bf880000-0x00000000bf99ffff]
> [    0.000000]   node   0: [mem 0x00000000bf9a0000-0x00000000bfffffff]
> [    0.000000]   node   1: [mem 0x00000000c0000000-0x000000013fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bff=
fffff]
> [    0.000000] Initmem setup node 1 [mem 0x00000000c0000000-0x000000013ff=
fffff]
> [    0.000000] cma: Reserved 32 MiB at 0x00000000fe000000
> [    0.000000] psci: probing for conduit method from ACPI.
> [    0.000000] psci: PSCIv1.0 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] smccc: KVM: hypervisor services detected (0x00000000 0x000=
00000 0x00000000 0x00000003)
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x0 -> Node 0
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1 -> Node 0
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x2 -> Node 0
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x3 -> Node 0
> [    0.000000] percpu: Embedded 20 pages/cpu s41304 r8192 d32424 u81920
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] CPU features: detected: Hardware dirty bit management
> [    0.000000] CPU features: detected: Spectre-v4
> [    0.000000] CPU features: kernel page table isolation forced ON by KAS=
LR
> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
> [    0.000000] Fallback order for Node 0: 0 1
> [    0.000000] Fallback order for Node 1: 1 0
> [    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 103=
2192
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line: rdinit=3Dinit console=3DttyAMA0 root=
=3D/dev/vda rootfstype=3Dext4 rw
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] software IO TLB: mapped [mem 0x00000000fa000000-0x00000000=
fe000000] (64MB)
> [    0.000000] Memory: 3981968K/4194304K available (15232K kernel code, 3=
194K rwdata, 8500K rodata, 6400K init, 510K bss, 179568K reserved, 32768K c=
ma-reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4,=
 Nodes=3D2
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu:     RCU event tracing is enabled.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu=
_ids=3D4.
> [    0.000000]  Trampoline variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D4
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: 256 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] GICv3: Distributor has no Range Selector support
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GICv3: 16 PPIs implemented
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000080a=
0000
> [    0.000000] ITS [mem 0x08080000-0x0809ffff]
> [    0.000000] ITS@0x0000000008080000: allocated 8192 Devices @40040000 (=
indirect, esz 8, psz 64K, shr 1)
> [    0.000000] ITS@0x0000000008080000: allocated 8192 Interrupt Collectio=
ns @40050000 (flat, esz 8, psz 64K, shr 1)
> [    0.000000] GICv3: using LPI property table @0x0000000040060000
> [    0.000000] GICv3: CPU0: using allocated LPI pending table @0x00000000=
40070000
> [    0.000000] random: get_random_bytes called from start_kernel+0x484/0x=
674 with crng_init=3D0
> [    0.000000] arch_timer: cp15 timer(s) running at 100.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff max=
_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
> [    0.000000] sched_clock: 57 bits at 100MHz, resolution 10ns, wraps eve=
ry 4398046511100ns
> [    0.000024] arm-pv: using stolen time PV
> [    0.000055] Console: colour dummy device 80x25
> [    0.000078] mempolicy: Enabling automatic NUMA balancing. Configure wi=
th numa_balancing=3D or the kernel.numa_balancing sysctl
> [    0.000089] ACPI: Core revision 20210930
> [    0.000131] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 200.00 BogoMIPS (lpj=3D400000)
> [    0.000134] pid_max: default: 32768 minimum: 301
> [    0.000156] LSM: Security Framework initializing
> [    0.002056] Dentry cache hash table entries: 524288 (order: 10, 419430=
4 bytes, vmalloc)
> [    0.002296] Inode-cache hash table entries: 262144 (order: 9, 2097152 =
bytes, vmalloc)
> [    0.002312] Mount-cache hash table entries: 8192 (order: 4, 65536 byte=
s, vmalloc)
> [    0.002322] Mountpoint-cache hash table entries: 8192 (order: 4, 65536=
 bytes, vmalloc)
> [    0.003387] rcu: Hierarchical SRCU implementation.
> [    0.003430] Platform MSI: ITS@0x8080000 domain created
> [    0.003434] PCI/MSI: ITS@0x8080000 domain created
> [    0.003438] fsl-mc MSI: ITS@0x8080000 domain created
> [    0.003449] Remapping and enabling EFI services.
> [    0.003637] smp: Bringing up secondary CPUs ...
> [    0.035208] Detected VIPT I-cache on CPU1
> [    0.035225] GICv3: CPU1: found redistributor 1 region 0:0x00000000080c=
0000
> [    0.035284] GICv3: CPU1: using allocated LPI pending table @0x00000000=
40080000
> [    0.035323] CPU1: Booted secondary processor 0x0000000001 [0x481fd010]
> [    0.066972] Detected VIPT I-cache on CPU2
> [    0.066989] GICv3: CPU2: found redistributor 2 region 0:0x00000000080e=
0000
> [    0.067043] GICv3: CPU2: using allocated LPI pending table @0x00000000=
40090000
> [    0.067080] CPU2: Booted secondary processor 0x0000000002 [0x481fd010]
> [    0.098706] Detected VIPT I-cache on CPU3
> [    0.098722] GICv3: CPU3: found redistributor 3 region 0:0x000000000810=
0000
> [    0.098773] GICv3: CPU3: using allocated LPI pending table @0x00000000=
400a0000
> [    0.098807] CPU3: Booted secondary processor 0x0000000003 [0x481fd010]
> [    0.098879] smp: Brought up 2 nodes, 4 CPUs
> [    0.098888] SMP: Total of 4 processors activated.
> [    0.098891] CPU features: detected: Common not Private translations
> [    0.098892] CPU features: detected: CRC32 instructions
> [    0.098894] CPU features: detected: LSE atomic instructions
> [    0.098895] CPU features: detected: Privileged Access Never
> [    0.098897] CPU features: detected: RAS Extension Support
> [    0.131862] CPU: All CPU(s) started at EL1
> [    0.131889] alternatives: patching kernel code
> [    0.133273] devtmpfs: initialized
> [    0.134173] KASLR disabled due to lack of seed
> [    0.134215] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
> [    0.134225] futex hash table entries: 1024 (order: 4, 65536 bytes, vma=
lloc)
> [    0.134396] pinctrl core: initialized pinctrl subsystem
> [    0.134596] SMBIOS 3.0.0 present.
> [    0.134600] DMI: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
> [    0.135441] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.136531] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic alloc=
ations
> [    0.136641] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
> [    0.136754] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
> [    0.136766] audit: initializing netlink subsys (disabled)
> [    0.136831] audit: type=3D2000 audit(0.136:1): state=3Dinitialized aud=
it_enabled=3D0 res=3D1
> [    0.137049] thermal_sys: Registered thermal governor 'step_wise'
> [    0.137053] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.137077] cpuidle: using governor menu
> [    0.137129] hw-breakpoint: found 6 breakpoint and 4 watchpoint registe=
rs.
> [    0.137205] ASID allocator initialised with 32768 entries
> [    0.137340] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.137426] Serial: AMBA PL011 UART driver
> [    0.139272] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pag=
es
> [    0.139277] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pag=
es
> [    0.139279] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pag=
es
> [    0.139281] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pag=
es
> [    0.139682] ACPI: Added _OSI(Module Device)
> [    0.139685] ACPI: Added _OSI(Processor Device)
> [    0.139687] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.139688] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.139690] ACPI: Added _OSI(Linux-Dell-Video)
> [    0.139692] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    0.139694] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    0.140449] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.140848] ACPI: Interpreter enabled
> [    0.140850] ACPI: Using GIC for interrupt routing
> [    0.140859] ACPI: MCFG table detected, 1 entries
> [    0.143497] ARMH0011:00: ttyAMA0 at MMIO 0x9000000 (irq =3D 12, base_b=
aud =3D 0) is a SBSA
> [    0.243277] printk: console [ttyAMA0] enabled
> [    0.245190] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.245828] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI HPX-Type3]
> [    0.246773] acpi PNP0A08:00: _OSC: platform does not support [LTR]
> [    0.247480] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability=
]
> [    0.248326] acpi PNP0A08:00: ECAM area [mem 0x4010000000-0x401fffffff]=
 reserved by PNP0C02:00
> [    0.249188] acpi PNP0A08:00: ECAM at [mem 0x4010000000-0x401fffffff] f=
or [bus 00-ff]
> [    0.249954] ACPI: Remapped I/O 0x000000003eff0000 to [io  0x0000-0xfff=
f window]
> [    0.250725] PCI host bridge to bus 0000:00
> [    0.251138] pci_bus 0000:00: Unknown NUMA node; performance will be re=
duced
> [    0.251879] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efef=
fff window]
> [    0.252612] pci_bus 0000:00: root bus resource [io  0x0000-0xffff wind=
ow]
> [    0.253287] pci_bus 0000:00: root bus resource [mem 0x8000000000-0xfff=
fffffff window]
> [    0.254065] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.254647] pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000
> [    0.255471] pci 0000:00:01.0: [1af4:1000] type 00 class 0x020000
> [    0.256152] pci 0000:00:01.0: reg 0x10: [io  0x0080-0x009f]
> [    0.256716] pci 0000:00:01.0: reg 0x14: [mem 0x10041000-0x10041fff]
> [    0.257381] pci 0000:00:01.0: reg 0x20: [mem 0x8000000000-0x8000003fff=
 64bit pref]
> [    0.258129] pci 0000:00:01.0: reg 0x30: [mem 0xfffc0000-0xffffffff pre=
f]
> [    0.259035] pci 0000:00:02.0: [1af4:1001] type 00 class 0x010000
> [    0.259669] pci 0000:00:02.0: reg 0x10: [io  0x0000-0x007f]
> [    0.260259] pci 0000:00:02.0: reg 0x14: [mem 0x10040000-0x10040fff]
> [    0.260922] pci 0000:00:02.0: reg 0x20: [mem 0x8000004000-0x8000007fff=
 64bit pref]
> [    0.261945] pci 0000:00:01.0: BAR 6: assigned [mem 0x10000000-0x1003ff=
ff pref]
> [    0.262650] pci 0000:00:01.0: BAR 4: assigned [mem 0x8000000000-0x8000=
003fff 64bit pref]
> [    0.263486] pci 0000:00:02.0: BAR 4: assigned [mem 0x8000004000-0x8000=
007fff 64bit pref]
> [    0.264337] pci 0000:00:01.0: BAR 1: assigned [mem 0x10040000-0x10040f=
ff]
> [    0.265025] pci 0000:00:02.0: BAR 1: assigned [mem 0x10041000-0x10041f=
ff]
> [    0.265700] pci 0000:00:02.0: BAR 0: assigned [io  0x1000-0x107f]
> [    0.266313] pci 0000:00:01.0: BAR 0: assigned [io  0x1080-0x109f]
> [    0.266916] pci_bus 0000:00: resource 4 [mem 0x10000000-0x3efeffff win=
dow]
> [    0.267596] pci_bus 0000:00: resource 5 [io  0x0000-0xffff window]
> [    0.268214] pci_bus 0000:00: resource 6 [mem 0x8000000000-0xffffffffff=
 window]
> [    0.269002] ACPI: PCI: Interrupt link GSI0 configured for IRQ 35
> [    0.269610] ACPI: PCI: Interrupt link GSI1 configured for IRQ 36
> [    0.270215] ACPI: PCI: Interrupt link GSI2 configured for IRQ 37
> [    0.270816] ACPI: PCI: Interrupt link GSI3 configured for IRQ 38
> [    0.271960] iommu: Default domain type: Translated
> [    0.272452] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.273127] vgaarb: loaded
> [    0.273466] SCSI subsystem initialized
> [    0.273926] ACPI: bus type USB registered
> [    0.274352] usbcore: registered new interface driver usbfs
> [    0.274902] usbcore: registered new interface driver hub
> [    0.275439] usbcore: registered new device driver usb
> [    0.276053] pps_core: LinuxPPS API ver. 1 registered
> [    0.276555] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.277519] PTP clock support registered
> [    0.277939] EDAC MC: Ver: 3.0.0
> [    0.278432] Registered efivars operations
> [    0.279090] FPGA manager framework
> [    0.279462] Advanced Linux Sound Architecture Driver Initialized.
> [    0.280312] clocksource: Switched to clocksource arch_sys_counter
> [    0.280962] VFS: Disk quotas dquot_6.6.0
> [    0.281364] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    0.282169] pnp: PnP ACPI init
> [    0.282572] system 00:00: [mem 0x4010000000-0x401fffffff window] could=
 not be reserved
> [    0.283496] pnp: PnP ACPI: found 1 devices
> [    0.286221] NET: Registered PF_INET protocol family
> [    0.287496] IP idents hash table entries: 65536 (order: 7, 524288 byte=
s, vmalloc)
> [    0.288927] tcp_listen_portaddr_hash hash table entries: 2048 (order: =
3, 32768 bytes, vmalloc)
> [    0.289868] TCP established hash table entries: 32768 (order: 6, 26214=
4 bytes, vmalloc)
> [    0.290730] TCP bind hash table entries: 32768 (order: 7, 524288 bytes=
, vmalloc)
> [    0.291539] TCP: Hash tables configured (established 32768 bind 32768)
> [    0.292234] UDP hash table entries: 2048 (order: 4, 65536 bytes, vmall=
oc)
> [    0.292983] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, =
vmalloc)
> [    0.293758] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.294465] RPC: Registered named UNIX socket transport module.
> [    0.295073] RPC: Registered udp transport module.
> [    0.295551] RPC: Registered tcp transport module.
> [    0.296028] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.296741] PCI: CLS 0 bytes, default 64
> [    0.297549] hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 13 c=
ounters available
> [    0.298395] kvm [1]: HYP mode not available
> [    0.299029] Initialise system trusted keyrings
> [    0.299611] workingset: timestamp_bits=3D42 max_order=3D20 bucket_orde=
r=3D0
> [    0.301366] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.302116] NFS: Registering the id_resolver key type
> [    0.302628] Key type id_resolver registered
> [    0.303042] Key type id_legacy registered
> [    0.303452] nfs4filelayout_init: NFSv4 File Layout Driver Registering.=
..
> [    0.304124] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regi=
stering...
> [    0.304947] 9p: Installing v9fs 9p2000 file system support
> [    0.318134] Key type asymmetric registered
> [    0.318559] Asymmetric key parser 'x509' registered
> [    0.319074] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 245)
> [    0.319813] io scheduler mq-deadline registered
> [    0.320261] io scheduler kyber registered
> [    0.322502] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0C:00/input/input0
> [    0.323409] ACPI: button: Power Button [PWRB]
> [    0.324032] acpi/hmat: HMAT: Memory Flags:0001 Processor Domain:0 Memo=
ry Domain:0
> [    0.324842] acpi/hmat: HMAT: Memory Flags:0001 Processor Domain:0 Memo=
ry Domain:1
> [    0.325594] acpi/hmat: HMAT: Locality: Flags:00 Type:Access Latency In=
itiator Domains:1 Target Domains:2 Base:1000
> [    0.326632] acpi/hmat:   Initiator-Target[0-0]:5 nsec
> [    0.327138] acpi/hmat:   Initiator-Target[0-1]:10 nsec
> [    0.327654] acpi/hmat: HMAT: Locality: Flags:00 Type:Access Bandwidth =
Initiator Domains:1 Target Domains:2 Base:4
> [    0.328723] acpi/hmat:   Initiator-Target[0-0]:200 MB/s
> [    0.329250] acpi/hmat:   Initiator-Target[0-1]:100 MB/s
> [    0.329775] acpi/hmat: HMAT: Cache: Domain:0 Size:16384 Attrs:00081111=
 SMBIOS Handles:0
> [    0.330571] acpi/hmat: HMAT: Cache: Domain:1 Size:16384 Attrs:00081111=
 SMBIOS Handles:0
> [    0.331465] EINJ: EINJ table not found.
> [    0.353784] ACPI: \_SB_.PCI0.GSI1: Enabled at IRQ 36
> [    0.354302] virtio-pci 0000:00:01.0: enabling device (0000 -> 0003)
> [    0.356628] ACPI: \_SB_.PCI0.GSI2: Enabled at IRQ 37
> [    0.357144] virtio-pci 0000:00:02.0: enabling device (0000 -> 0003)
> [    0.360324] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.361517] SuperH (H)SCI(F) driver initialized
> [    0.362039] msm_serial: driver initialized
> [    0.363963] loop: module loaded
> [    0.366347] virtio_blk virtio1: [vda] 2048000 512-byte logical blocks =
(1.05 GB/1000 MiB)
> [    0.373081] megasas: 07.719.03.00-rc1
> [    0.373787] SPI driver mtd_dataflash has no spi_device_id for atmel,at=
45
> [    0.374469] SPI driver mtd_dataflash has no spi_device_id for atmel,da=
taflash
> [    0.375632] libphy: Fixed MDIO Bus: probed
> [    0.376408] tun: Universal TUN/TAP device driver, 1.6
> [    0.379161] thunder_xcv, ver 1.0
> [    0.379528] thunder_bgx, ver 1.0
> [    0.379867] nicpf, ver 1.0
> [    0.380419] hclge is initializing
> [    0.380781] hns3: Hisilicon Ethernet Network Driver for Hip08 Family -=
 version
> [    0.381501] hns3: Copyright (c) 2017 Huawei Corporation.
> [    0.382051] e1000: Intel(R) PRO/1000 Network Driver
> [    0.382543] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    0.383138] e1000e: Intel(R) PRO/1000 Network Driver
> [    0.383645] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    0.384267] igb: Intel(R) Gigabit Ethernet Network Driver
> [    0.384868] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    0.385440] igbvf: Intel(R) Gigabit Virtual Function Network Driver
> [    0.386078] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> [    0.386759] sky2: driver version 1.30
> [    0.387334] VFIO - User Level meta-driver version: 0.3
> [    0.388264] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    0.389022] ehci-pci: EHCI PCI platform driver
> [    0.389511] ehci-platform: EHCI generic platform driver
> [    0.390083] ehci-orion: EHCI orion driver
> [    0.390511] ehci-exynos: EHCI Exynos driver
> [    0.390961] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    0.391594] ohci-pci: OHCI PCI platform driver
> [    0.392077] ohci-platform: OHCI generic platform driver
> [    0.392666] ohci-exynos: OHCI Exynos driver
> [    0.393184] usbcore: registered new interface driver usb-storage
> [    0.394317] rtc-efi rtc-efi.0: registered as rtc0
> [    0.394835] rtc-efi rtc-efi.0: setting system clock to 2022-01-25T09:0=
1:04 UTC (1643101264)
> [    0.395799] i2c_dev: i2c /dev entries driver
> [    0.397242] sdhci: Secure Digital Host Controller Interface driver
> [    0.397886] sdhci: Copyright(c) Pierre Ossman
> [    0.398415] SPI driver mmc_spi has no spi_device_id for mmc-spi-slot
> [    0.399114] Synopsys Designware Multimedia Card Interface Driver
> [    0.399873] sdhci-pltfm: SDHCI platform and OF driver helper
> [    0.400743] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.401925] pstore: Registered efi as persistent store backend
> [    0.402887] usbcore: registered new interface driver usbhid
> [    0.403462] usbhid: USB HID core driver
> [    0.404875] NET: Registered PF_PACKET protocol family
> [    0.405654] 9pnet: Installing 9P2000 support
> [    0.406107] Key type dns_resolver registered
> [    0.406633] Loading compiled-in X.509 certificates
> [    0.407366] pstore: Using crash dump compression: deflate
> [    0.409759] ALSA device list:
> [    0.410077]   No soundcards found.
> [    0.411868] EXT4-fs (vda): mounted filesystem with ordered data mode. =
Opts: (null). Quota mode: none.
> [    0.412879] VFS: Mounted root (ext4 filesystem) on device 254:0.
> [    0.413619] devtmpfs: mounted
> [    0.414915] Freeing unused kernel memory: 6400K
> [    0.428450] Run /sbin/init as init process
> Starting rcS...
> ++ Mounting filesystem


