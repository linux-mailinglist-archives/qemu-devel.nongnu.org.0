Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38454341DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:07:34 +0100 (CET)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNEqe-0005BI-Am
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNEoz-0004Mn-Kq
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNEox-0008OB-7w
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:05:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lNEov-0007Ab-Eq
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 13:05:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 68E792E8054
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 13:05:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Mar 2021 12:56:53 -0000
From: cyrozap <1920013@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyrozap
X-Launchpad-Bug-Reporter: cyrozap (cyrozap)
X-Launchpad-Bug-Modifier: cyrozap (cyrozap)
References: <161607017744.16047.7761702341537087563.malonedeb@gac.canonical.com>
Message-Id: <161615861355.19965.6965990888919450850.malone@wampee.canonical.com>
Subject: [Bug 1920013] Re: Unable to pass-through PCIe devices from a ppc64le
 host to an x86_64 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: f7de30a4aa72e1b9981e0489d371979d5db3ae14
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1920013 <1920013@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've done some more investigating, and have produced a backtrace of the
error:

    #0  0x00003ffff6b63228 in __libc_signal_restore_set (set=3D0x3fffffffce=
c8) at ../sysdeps/unix/sysv/linux/internal-signals.h:84
    #1  0x00003ffff6b63228 in __GI_raise (sig=3D<optimized out>) at ../sysd=
eps/unix/sysv/linux/raise.c:48
    #2  0x00003ffff6b4358c in __GI_abort () at abort.c:79
    #3  0x000000010080d524 in object_dynamic_cast_assert
        (obj=3D0x1016db860, typename=3D0x100bf9980 "qemu:iommu-memory-regio=
n", file=3D0x100bf9940 "/usr/src/qemu/include/exec/memory.h", line=3D<optim=
ized out>, func=3D0x100c08a70 <__func__.21845> "IOMMU_MEMORY_REGION") at ..=
/qom/object.c:883
    #4  0x00000001006b6f84 in IOMMU_MEMORY_REGION (obj=3D<optimized out>) a=
t /usr/src/qemu/include/exec/memory.h:42
    #5  0x00000001006b6f84 in vfio_spapr_create_window (container=3D0x10235=
7380, section=3D0x3fffffffd410, pgsize=3D0x3fffffffd368)
        at ../hw/vfio/spapr.c:149
    #6  0x00000001007a09a0 in vfio_listener_region_add (listener=3D0x102357=
390, section=3D0x3fffffffd410) at ../hw/vfio/common.c:709
    #7  0x00000001006ea6f4 in listener_add_address_space (as=3D<optimized o=
ut>, listener=3D0x102357390) at ../softmmu/memory.c:2729
    #8  0x00000001006ea6f4 in memory_listener_register (listener=3D0x102357=
390, as=3D<optimized out>) at ../softmmu/memory.c:2796
    #9  0x00000001007a36f4 in vfio_connect_container (errp=3D0x3fffffffe818=
, as=3D<optimized out>, group=3D0x102357300)
        at ../hw/vfio/common.c:1886
    #10 0x00000001007a36f4 in vfio_get_group (groupid=3D<optimized out>, as=
=3D<optimized out>, errp=3D0x3fffffffe818)
        at ../hw/vfio/common.c:2003
    #11 0x000000010071a2a8 in vfio_realize (pdev=3D0x102350f80, errp=3D0x3f=
ffffffe818) at ../hw/vfio/pci.c:2834
    #12 0x0000000100488e20 in pci_qdev_realize (qdev=3D0x102350f80, errp=3D=
0x3fffffffe940) at ../hw/pci/pci.c:2113
    #13 0x00000001008063e0 in device_set_realized (obj=3D0x102350f80, value=
=3D<optimized out>, errp=3D0x3fffffffea50) at ../hw/core/qdev.c:761
    #14 0x000000010080afbc in property_set_bool
        (obj=3D0x102350f80, v=3D<optimized out>, name=3D<optimized out>, op=
aque=3D0x1014f1930, errp=3D0x3fffffffea50) at ../qom/object.c:2257
    #15 0x000000010080ee2c in object_property_set (obj=3D0x102350f80, name=
=3D0x100c023a0 "realized", v=3D
        0x102351d30, errp=3D0x101450b30 <error_fatal>) at ../qom/object.c:1=
402
    #16 0x000000010080a55c in object_property_set_qobject
        (obj=3D0x102350f80, name=3D0x100c023a0 "realized", value=3D<optimiz=
ed out>, errp=3D0x101450b30 <error_fatal>) at ../qom/qom-qobject.c:28
    #17 0x000000010080f1b0 in object_property_set_bool
        (obj=3D0x102350f80, name=3D0x100c023a0 "realized", value=3D<optimiz=
ed out>, errp=3D0x101450b30 <error_fatal>) at ../qom/object.c:1472
    #18 0x00000001008042bc in qdev_realize (dev=3D0x102350f80, bus=3D<optim=
ized out>, errp=3D0x101450b30 <error_fatal>)
        at ../hw/core/qdev.c:389
    #19 0x000000010036cfac in qdev_device_add (opts=3D0x1014e9960, errp=3D0=
x101450b30 <error_fatal>)
        at /usr/src/qemu/include/hw/qdev-core.h:17
    #20 0x00000001006d5e68 in device_init_func (opaque=3D<optimized out>, o=
pts=3D<optimized out>, errp=3D<optimized out>)
        at ../softmmu/vl.c:1202
    #21 0x0000000100abe070 in qemu_opts_foreach
        (list=3D<optimized out>, func=3D0x1006d5e40 <device_init_func>, opa=
que=3D0x0, errp=3D0x101450b30 <error_fatal>)
        at ../util/qemu-option.c:1167
    #22 0x00000001006da110 in qemu_create_cli_devices () at ../softmmu/vl.c=
:2494
    #23 0x00000001006da110 in qmp_x_exit_preconfig (errp=3D<optimized out>)=
 at ../softmmu/vl.c:2542
    #24 0x00000001006df87c in qemu_init (argc=3D<optimized out>, argv=3D<op=
timized out>, envp=3D<optimized out>) at ../softmmu/vl.c:3553
    #25 0x000000010031d3c8 in main (argc=3D<optimized out>, argv=3D<optimiz=
ed out>, envp=3D<optimized out>) at ../softmmu/main.c:49

I also took a look at some of the arguments in frame #5 (where the type
check is failing):

    (gdb) f
    #5  vfio_spapr_create_window (container=3D0x102357380, section=3D0x3fff=
ffffd410, pgsize=3D0x3fffffffd368) at ../hw/vfio/spapr.c:149
    149         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section=
->mr);
    (gdb) l
    144     int vfio_spapr_create_window(VFIOContainer *container,
    145                                  MemoryRegionSection *section,
    146                                  hwaddr *pgsize)
    147     {
    148         int ret =3D 0;
    149         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section=
->mr);
    150         uint64_t pagesize =3D memory_region_iommu_get_min_page_size=
(iommu_mr), pgmask;
    151         unsigned entries, bits_total, bits_per_level, max_levels;
    152         struct vfio_iommu_spapr_tce_create create =3D { .argsz =3D =
sizeof(create) };
    153         long rampagesize =3D qemu_minrampagesize();
    (gdb) p *section->mr
    $5 =3D {parent_obj =3D {class =3D 0x101512f90, free =3D 0x0, Python Exc=
eption <class 'gdb.error'> There is no member named keys.: =

    properties =3D 0x101716b60, ref =3D 1, parent =3D 0x1016db800}, romd_mo=
de =3D true, =

      ram =3D true, subpage =3D false, readonly =3D false, nonvolatile =3D =
false, rom_device =3D false, flush_coalesced_mmio =3D false, =

      dirty_log_mask =3D 0 '\000', is_iommu =3D false, ram_block =3D 0x1017=
25c30, owner =3D 0x1016db800, ops =3D 0x101300b00 <unassigned_mem_ops>, =

      opaque =3D 0x0, container =3D 0x0, size =3D 134217728, addr =3D 0, de=
structor =3D 0x1006e0d50 <memory_region_destructor_ram>, =

      align =3D 2097152, terminates =3D true, ram_device =3D false, enabled=
 =3D true, warning_printed =3D false, vga_logging_count =3D 0 '\000', =

      alias =3D 0x0, alias_offset =3D 0, priority =3D 0, subregions =3D {tq=
h_first =3D 0x0, tqh_circ =3D {tql_next =3D 0x0, tql_prev =3D 0x1016db908}}=
, =

      subregions_link =3D {tqe_next =3D 0x0, tqe_circ =3D {tql_next =3D 0x0=
, tql_prev =3D 0x0}}, coalesced =3D {tqh_first =3D 0x0, tqh_circ =3D {
          tql_next =3D 0x0, tql_prev =3D 0x1016db928}}, name =3D 0x101725b1=
0 "pc.ram", ioeventfd_nb =3D 0, ioeventfds =3D 0x0}

So it seems this is failing because the memory region "pc.ram" is not an
IOMMU ("is_iommu =3D false"). I'm not really sure what that means, and I
still don't know how to fix this, but hopefully this information will
help.

If there's any more information I should provide, please let me know.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920013

Title:
  Unable to pass-through PCIe devices from a ppc64le host to an x86_64
  guest

Status in QEMU:
  New

Bug description:
  Attempting to pass through a PCIe device from a ppc64le host to an
  x86_64 guest with QEMU v5.2.0-3031-g571d413b5d (built from git master)
  fails with the following error:

      include/exec/memory.h:43:IOMMU_MEMORY_REGION: Object 0x10438eb00
  is not an instance of type qemu:iommu-memory-region

  To reproduce this issue, simply run the following command on a POWER9
  system:

      qemu-system-x86_64 -machine q35 -device vfio-pci,host=3D$DBSF

  Where $DBSF is a domain:bus:slot.function PCIe device address.

  This also fails with QEMU 3.1.0 (from Debian Buster), so I assume this
  has never worked. Helpfully, the error message it prints seems to
  indicate where the problem is:

      hw/vfio/spapr.c:147:vfio_spapr_create_window: Object 0x164473510
  is not an instance of type qemu:iommu-memory-region

  My kernel (Linux v5.8.0 plus some small unrelated patches) is built
  with the page size set to 4k, so this issue shouldn't be due to a page
  size mismatch. And as I stated earlier, my host arch is ppc64le, so it
  shouldn't be an endianness issue, either.

  I assume this should be possible (in theory) since I've seen reports
  of others getting PCIe passthrough working with aarch64 guests on
  x86_64 hosts, but of course that (passthrough to weird guest arch on
  x86) is somewhat the opposite of what I'm trying to do (passthrough to
  x86 on weird host arch) so I don't know for sure. If it is possible,
  I'm willing to develop a fix myself, but I'm almost completely
  unfamiliar with QEMU's internals so if anyone has any advice on where
  to start I'd greatly appreciate it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920013/+subscriptions

