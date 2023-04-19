Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901B6E7D6F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:50:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp98L-0004a6-KJ; Wed, 19 Apr 2023 10:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pp98J-0004Zt-BU
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:50:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pp98F-0000JY-AQ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:50:06 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q1kFH2NrVz67ZDL;
 Wed, 19 Apr 2023 22:48:51 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Apr
 2023 15:49:58 +0100
Date: Wed, 19 Apr 2023 15:49:57 +0100
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 <linuxarm@huawei.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders
 unless overridden
Message-ID: <20230419154957.000030be@huawei.com>
In-Reply-To: <20230419145754.000001ef@Huawei.com>
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <20230419145754.000001ef@Huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Apr 2023 14:57:54 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Tue, 11 Apr 2023 11:26:16 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>=20
> > On Wed, 8 Mar 2023 at 01:14, Michael S. Tsirkin <mst@redhat.com> wrote:=
 =20
> > >
> > > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >
> > > The CXL r3.0 specification allows for there to be no HDM decoders on =
CXL
> > > Host Bridges if they have only a single root port. Instead, all acces=
ses
> > > directed to the host bridge (as specified in CXL Fixed Memory Windows)
> > > are assumed to be routed to the single root port.   =20
> >=20
> > Hi; in issue https://gitlab.com/qemu-project/qemu/-/issues/1586
> > it's been pointed out that this commit causes an assertion
> > failure during 'make check' if you configure with
> > --enable-qom-cast-debug. You can repro by doing that and running:
> >=20
> >  qemu-system-i386 -display none -machine q35,cxl=3Don -device pxb-cxl,b=
us=3Dpcie.0
> >=20
> > Here's a backtrace:
> >=20
> > Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> > __pthread_kill_implementation (no_tid=3D0, signo=3D6,
> > threadid=3D140737217810816) at ./nptl/pthread_kill.c:44
> > 44      ./nptl/pthread_kill.c: No such file or directory.
> > (gdb) bt
> > #0  __pthread_kill_implementation (no_tid=3D0, signo=3D6,
> > threadid=3D140737217810816) at ./nptl/pthread_kill.c:44
> > #1  __pthread_kill_internal (signo=3D6, threadid=3D140737217810816) at
> > ./nptl/pthread_kill.c:78
> > #2  __GI___pthread_kill (threadid=3D140737217810816,
> > signo=3Dsigno@entry=3D6) at ./nptl/pthread_kill.c:89
> > #3  0x00007ffff4b1c476 in __GI_raise (sig=3Dsig@entry=3D6) at
> > ../sysdeps/posix/raise.c:26
> > #4  0x00007ffff4b027f3 in __GI_abort () at ./stdlib/abort.c:79
> > #5  0x0000555555cecfab in object_dynamic_cast_assert
> >     (obj=3Dobj@entry=3D0x555557a70b60, typename=3D0x555555f80406 "pxb",
> > file=3D0x555555f80357 "../../hw/pci-bridge/pci_expander_bridge.c",
> > line=3Dline@entry=3D55, func=3D0x555555f8040a "PXB_DEV") at
> > ../../qom/object.c:890
> > #6  0x00005555559c7bbd in PXB_DEV (obj=3D0x555557a70b60) at
> > ../../hw/pci-bridge/pci_expander_bridge.c:54
> > #7  pxb_cxl_dev_reset (dev=3D0x555557a70b60) at
> > ../../hw/pci-bridge/pci_expander_bridge.c:314
> > #8  0x00005555559bd624 in pci_qdev_realize (qdev=3D0x555557a70b60,
> > errp=3D0x7fffffffdd28) at ../../hw/pci/pci.c:2098
> > #9  0x0000555555ce8ada in device_set_realized (obj=3D<optimised out>,
> > value=3Dtrue, errp=3D0x7fffffffdea8) at ../../hw/core/qdev.c:510
> > #10 0x0000555555cf0219 in property_set_bool
> >      (obj=3Dobj@entry=3D0x555557a70b60, v=3Dv@entry=3D0x555557a727b0,
> > name=3Dname@entry=3D0x55555601db04 "realized", opaque=3D0x55555687b780,
> > errp=3Derrp@entry=3D0x7fffffffdea8) at ../../qom/object.c:2285
> > #11 0x0000555555cee4e5 in object_property_set
> >      (obj=3Dobj@entry=3D0x555557a70b60, name=3Dname@entry=3D0x55555601d=
b04
> > "realized", v=3D0x555557a727b0, errp=3Derrp@entry=3D0x7fffffffdea8) at
> > ../../qom/object.c:1420
> > #12 0x0000555555cf23cd in object_property_set_qobject
> >     (obj=3Dobj@entry=3D0x555557a70b60, name=3Dname@entry=3D0x55555601db=
04
> > "realized", value=3D<optimised out>, errp=3Derrp@entry=3D0x7fffffffdea8=
) at
> > ../../qom/qom-qobject.c:28
> > #13 0x0000555555cee93b in object_property_set_bool
> > (obj=3D0x555557a70b60, name=3D0x55555601db04 "realized", value=3D<optim=
ised =20
> > out>, errp=3D0x7fffffffdea8)   =20
> >     at ../../qom/object.c:1489
> > #14 0x0000555555a6ae42 in qdev_device_add_from_qdict
> > (opts=3D0x555557a6fb40, from_json=3Dfalse, errp=3D0x7fffffffdea8,
> > errp@entry=3D0x555556765830 <error_fatal>)
> >     at ../../softmmu/qdev-monitor.c:714
> > #15 0x0000555555a6b202 in qdev_device_add
> > (opts=3Dopts@entry=3D0x5555568776f0, errp=3Derrp@entry=3D0x555556765830
> > <error_fatal>) at ../../softmmu/qdev-monitor.c:733
> > #16 0x0000555555a7367f in device_init_func (opaque=3Dopaque@entry=3D0x0,
> > opts=3D0x3cd16a, opts@entry=3D0x5555568776f0, errp=3D0x6,
> > errp@entry=3D0x555556765830 <error_fatal>)
> >     at ../../softmmu/vl.c:1140
> > #17 0x0000555555e78331 in qemu_opts_foreach
> >     (list=3D<optimised out>, func=3D0x555555a73670 <device_init_func>,
> > opaque=3Dopaque@entry=3D0x0, errp=3D0x555556765830 <error_fatal>) at
> > ../../util/qemu-option.c:1135
> > #18 0x0000555555a6dd61 in qemu_create_cli_devices () at ../../softmmu/v=
l.c:2542
> > #19 qmp_x_exit_preconfig (errp=3D<optimised out>) at ../../softmmu/vl.c=
:2610
> > #20 0x0000555555a7177b in qemu_init (argc=3D<optimised out>,
> > argv=3D<optimised out>) at ../../softmmu/vl.c:3612
> > #21 0x000055555587b656 in main (argc=3D3985770, argv=3D0x3cd16a) at
> > ../../softmmu/main.c:47
> >=20
> > The problem is here:
> >  =20
> > > -static void pxb_dev_reset(DeviceState *dev)
> > > +static void pxb_cxl_dev_reset(DeviceState *dev)   =20
> >=20
> > This function is called from  pxb_cxl_dev_realize(),
> > which is the realize function for TYPE_PXB_CXL_DEVICE.
> > That type's parent is TYPE_PCI_DEVICE.
> >  =20
> > >  {
> > >      CXLHost *cxl =3D PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
> > >      CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > > +    PCIHostState *hb =3D PCI_HOST_BRIDGE(cxl);
> > >      uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
> > >      uint32_t *write_msk =3D cxl_cstate->crb.cache_mem_regs_write_mas=
k;
> > > +    int dsp_count =3D 0;
> > >
> > >      cxl_component_register_init_common(reg_state, write_msk, CXL2_RO=
OT_PORT);
> > > -    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_C=
OUNT, 8);
> > > +    /*
> > > +     * The CXL specification allows for host bridges with no HDM dec=
oders
> > > +     * if they only have a single root port.
> > > +     */
> > > +    if (!PXB_DEV(dev)->hdm_for_passthrough) {   =20
> >=20
> > However, here we try to cast the device pointer to PXB_DEV.
> > That is not permitted because dev is not of type TYPE_PXB_DEVICE
> > (either directly or as a parent class). So if you have the QOM
> > debugging enabled then the attempt to cast causes an assertion
> > failure.
> >  =20
> > > +        dsp_count =3D pcie_count_ds_ports(hb->bus);
> > > +    }
> > > +    /* Initial reset will have 0 dsp so wait until > 0 */
> > > +    if (dsp_count =3D=3D 1) {
> > > +        cxl->passthrough =3D true;
> > > +        /* Set Capability ID in header to NONE */
> > > +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0=
);
> > > +    } else {
> > > +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARG=
ET_COUNT,
> > > +                         8);
> > > +    }
> > >  }   =20
> >=20
> > What was the intention here with the type hierarchy?
> > Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
> > or should the cxl-related functions not be trying to treat
> > it as a PXB device ? =20
>=20
> I can't immediately recall why, but PXB_DEV and PXB_CXL_DEV use the
> same struct PXBDev so here switching to PXB_CXL_DEV(dev)->hdm_for_passthr=
ough
> looks to be the minimum fix.
>=20
> I'll dig into why / if there is a good reason for why PXB_CXL_DEV doesn't
> simply inherit from PXB_DEV then use runtime type checking in the few pla=
ces it
> will matter.

Ah. Looks to be cut and paste from what TYPE_PXB_PCIE_DEV was doing.=20
We probably never considered if that was a good path to take or not.
Not clear why they can't both just inherit from TYPE_PXB_DEV.
At least superficially it seems to work + is cleaner.

Following only lightly tested... May eat babies etc.

=46rom 995226fcdfe196e010c5a3850bfca2f97a384307 Mon Sep 17 00:00:00 2001
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Date: Wed, 19 Apr 2023 15:41:44 +0100
Subject: [PATCH] hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from
 PXB_DEVICE

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/cxl.c                       |  9 +++---
 hw/cxl/cxl-host.c                   |  2 +-
 hw/pci-bridge/pci_expander_bridge.c | 50 +++++++++--------------------
 include/hw/cxl/cxl.h                |  4 +--
 include/hw/pci/pci_bridge.h         | 26 +++++++++++----
 5 files changed, 43 insertions(+), 48 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 17dc0bdc9c..ad8faef48b 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -87,9 +87,10 @@ void build_cxl_dsm_method(Aml *dev)
     aml_append(dev, method);
 }
=20
-static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
+static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
 {
-    SysBusDevice *sbd =3D SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
+    PXBDev *pxb =3D PXB_DEV(cxl);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(cxl->cxl_host_bridge);
     struct MemoryRegion *mr =3D sbd->mmio[0].memory;
=20
     /* Type */
@@ -102,7 +103,7 @@ static void cedt_build_chbs(GArray *table_data, PXBDev =
*cxl)
     build_append_int_noprefix(table_data, 32, 2);
=20
     /* UID - currently equal to bus number */
-    build_append_int_noprefix(table_data, cxl->bus_nr, 4);
+    build_append_int_noprefix(table_data, pxb->bus_nr, 4);
=20
     /* Version */
     build_append_int_noprefix(table_data, 1, 4);
@@ -169,7 +170,7 @@ static void cedt_build_cfmws(GArray *table_data, CXLSta=
te *cxls)
         /* Host Bridge List (list of UIDs - currently bus_nr) */
         for (i =3D 0; i < fw->num_targets; i++) {
             g_assert(fw->target_hbs[i]);
-            build_append_int_noprefix(table_data, fw->target_hbs[i]->bus_n=
r, 4);
+            build_append_int_noprefix(table_data, PXB_DEV(fw->target_hbs[i=
])->bus_nr, 4);
         }
     }
 }
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index d75f673e6d..d6d510803f 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -167,7 +167,7 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow =
*fw, hwaddr addr)
     addr +=3D fw->base;
=20
     rb_index =3D (addr / cxl_decode_ig(fw->enc_int_gran)) % fw->num_target=
s;
-    hb =3D PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl.cxl_host_bridge);
+    hb =3D PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl_host_bridge);
     if (!hb || !hb->bus || !pci_bus_is_cxl(hb->bus)) {
         return NULL;
     }
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expand=
er_bridge.c
index ead33f0c05..2af942dc10 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -50,25 +50,10 @@ struct PXBBus {
     char bus_path[8];
 };
=20
-#define TYPE_PXB_DEVICE "pxb"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
-                         TYPE_PXB_DEVICE)
-
 #define TYPE_PXB_PCIE_DEVICE "pxb-pcie"
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
=20
-static PXBDev *convert_to_pxb(PCIDevice *dev)
-{
-    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
-    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
-        return PXB_CXL_DEV(dev);
-    }
-
-    return pci_bus_is_express(pci_get_bus(dev))
-        ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
-}
-
 static GList *pxb_dev_list;
=20
 #define TYPE_PXB_HOST "pxb-host"
@@ -89,14 +74,14 @@ bool cxl_get_hb_passthrough(PCIHostState *hb)
=20
 static int pxb_bus_num(PCIBus *bus)
 {
-    PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
+    PXBDev *pxb =3D PXB_DEV(bus->parent_dev);
=20
     return pxb->bus_nr;
 }
=20
 static uint16_t pxb_bus_numa_node(PCIBus *bus)
 {
-    PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
+    PXBDev *pxb =3D PXB_DEV(bus->parent_dev);
=20
     return pxb->numa_node;
 }
@@ -154,7 +139,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevi=
ce *dev)
=20
     pxb_host =3D PCI_HOST_BRIDGE(dev);
     pxb_bus =3D pxb_host->bus;
-    pxb_dev =3D convert_to_pxb(pxb_bus->parent_dev);
+    pxb_dev =3D PXB_DEV(pxb_bus->parent_dev);
     position =3D g_list_index(pxb_dev_list, pxb_dev);
     assert(position >=3D 0);
=20
@@ -212,8 +197,8 @@ static void pxb_cxl_realize(DeviceState *dev, Error **e=
rrp)
  */
 void pxb_cxl_hook_up_registers(CXLState *cxl_state, PCIBus *bus, Error **e=
rrp)
 {
-    PXBDev *pxb =3D  PXB_CXL_DEV(pci_bridge_get_device(bus));
-    CXLHost *cxl =3D pxb->cxl.cxl_host_bridge;
+    PXBCXLDev *pxb =3D  PXB_CXL_DEV(pci_bridge_get_device(bus));
+    CXLHost *cxl =3D pxb->cxl_host_bridge;
     CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
     struct MemoryRegion *mr =3D &cxl_cstate->crb.component_registers;
     hwaddr offset;
@@ -299,7 +284,7 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
=20
 static void pxb_cxl_dev_reset(DeviceState *dev)
 {
-    CXLHost *cxl =3D PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
+    CXLHost *cxl =3D PXB_CXL_DEV(dev)->cxl_host_bridge;
     CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
     PCIHostState *hb =3D PCI_HOST_BRIDGE(cxl);
     uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
@@ -311,7 +296,7 @@ static void pxb_cxl_dev_reset(DeviceState *dev)
      * The CXL specification allows for host bridges with no HDM decoders
      * if they only have a single root port.
      */
-    if (!PXB_DEV(dev)->hdm_for_passthrough) {
+    if (!PXB_CXL_DEV(dev)->hdm_for_passthrough) {
         dsp_count =3D pcie_count_ds_ports(hb->bus);
     }
     /* Initial reset will have 0 dsp so wait until > 0 */
@@ -337,7 +322,7 @@ static gint pxb_compare(gconstpointer a, gconstpointer =
b)
 static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
                                    Error **errp)
 {
-    PXBDev *pxb =3D convert_to_pxb(dev);
+    PXBDev *pxb =3D PXB_DEV(dev);
     DeviceState *ds, *bds =3D NULL;
     PCIBus *bus;
     const char *dev_name =3D NULL;
@@ -365,7 +350,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum=
 BusType type,
     } else if (type =3D=3D CXL) {
         bus =3D pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL=
_BUS);
         bus->flags |=3D PCI_BUS_CXL;
-        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge =3D PXB_CXL_HOST(ds);
+        PXB_CXL_DEV(dev)->cxl_host_bridge =3D PXB_CXL_HOST(ds);
     } else {
         bus =3D pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_P=
XB_BUS);
         bds =3D qdev_new("pci-bridge");
@@ -418,7 +403,7 @@ static void pxb_dev_realize(PCIDevice *dev, Error **err=
p)
=20
 static void pxb_dev_exitfn(PCIDevice *pci_dev)
 {
-    PXBDev *pxb =3D convert_to_pxb(pci_dev);
+    PXBDev *pxb =3D PXB_DEV(pci_dev);
=20
     pxb_dev_list =3D g_list_remove(pxb_dev_list, pxb);
 }
@@ -481,15 +466,14 @@ static void pxb_pcie_dev_class_init(ObjectClass *klas=
s, void *data)
     k->class_id =3D PCI_CLASS_BRIDGE_HOST;
=20
     dc->desc =3D "PCI Express Expander Bridge";
-    device_class_set_props(dc, pxb_dev_properties);
     dc->hotpluggable =3D false;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
=20
 static const TypeInfo pxb_pcie_dev_info =3D {
     .name          =3D TYPE_PXB_PCIE_DEVICE,
-    .parent        =3D TYPE_PCI_DEVICE,
-    .instance_size =3D sizeof(PXBDev),
+    .parent        =3D TYPE_PXB_DEVICE,
+    .instance_size =3D sizeof(PXBPCIEDev),
     .class_init    =3D pxb_pcie_dev_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -510,11 +494,7 @@ static void pxb_cxl_dev_realize(PCIDevice *dev, Error =
**errp)
 }
=20
 static Property pxb_cxl_dev_properties[] =3D {
-    /* Note: 0 is not a legal PXB bus number. */
-    DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
-    DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNE=
D),
-    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
-    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBDev, hdm_for_passthrough, f=
alse),
+    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBCXLDev, hdm_for_passthrough=
, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -541,8 +521,8 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, =
void *data)
=20
 static const TypeInfo pxb_cxl_dev_info =3D {
     .name          =3D TYPE_PXB_CXL_DEVICE,
-    .parent        =3D TYPE_PCI_DEVICE,
-    .instance_size =3D sizeof(PXBDev),
+    .parent        =3D TYPE_PXB_PCIE_DEVICE,
+    .instance_size =3D sizeof(PXBCXLDev),
     .class_init    =3D pxb_cxl_dev_class_init,
     .interfaces =3D
         (InterfaceInfo[]){
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 97c1bc2c8a..028e78a40d 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -26,12 +26,12 @@
=20
 #define CXL_WINDOW_MAX 10
=20
-typedef struct PXBDev PXBDev;
+typedef struct PXBCXLDev PXBCXLDev;
=20
 typedef struct CXLFixedWindow {
     uint64_t size;
     char **targets;
-    PXBDev *target_hbs[8];
+    PXBCXLDev *target_hbs[8];
     uint8_t num_targets;
     uint8_t enc_int_ways;
     uint8_t enc_int_gran;
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 0aac8e9db0..57f66da5bd 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -85,7 +85,7 @@ struct PCIBridge {
 #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
 typedef struct CXLHost CXLHost;
=20
-struct PXBDev {
+typedef struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -93,14 +93,28 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
+} PXBDev;
+
+typedef struct PXBPCIEDev {
+    /*< private >*/
+    PXBDev parent_obj;
+} PXBPCIEDev;
+
+#define TYPE_PXB_DEVICE "pxb"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
+                         TYPE_PXB_DEVICE)
+
+typedef struct PXBCXLDev {
+    /*< private >*/
+    PXBPCIEDev parent_obj;
+    /*< public >*/
+
     bool hdm_for_passthrough;
-    struct cxl_dev {
-        CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
-    } cxl;
-};
+    CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
+} PXBCXLDev;
=20
 #define TYPE_PXB_CXL_DEVICE "pxb-cxl"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+DECLARE_INSTANCE_CHECKER(PXBCXLDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
=20
 int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
--=20
2.37.2


>=20
> Jonathan
>=20
> >=20
> > thanks
> > -- PMM =20
>=20
>=20
>=20


