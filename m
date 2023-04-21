Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B16EAA08
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:11:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppa1-00010I-FR; Fri, 21 Apr 2023 08:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppZy-000109-IY
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:09:30 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppZv-0006yV-DK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:09:30 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2tVn1nwWz67CtD;
 Fri, 21 Apr 2023 20:04:33 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 13:09:20 +0100
Date: Fri, 21 Apr 2023 13:09:19 +0100
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Igor
 Mammedov" <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Fan
 Ni" <fan.ni@samsung.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH] hw/pci-bridge: Fix release ordering by embedding
 PCIBridgeWindows within PCIBridge
Message-ID: <20230421130919.00006ab2@Huawei.com>
In-Reply-To: <b797ee27-2182-e391-9f39-dce51db7e07d@linaro.org>
References: <20230420145937.17152-1-Jonathan.Cameron@huawei.com>
 <b797ee27-2182-e391-9f39-dce51db7e07d@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Apr 2023 08:26:43 +0200
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> Hi Jonathan,
>=20
> On 20/4/23 16:59, Jonathan Cameron via wrote:
> > The lifetime of the PCIBridgeWindows instance accessed via the windows =
pointer
> > in struct PCIBridge is managed separately from the PCIBridge itself.
> >=20
> > Triggered by ./qemu-system-x86_64 -M x-remote -display none -monitor st=
dio
> > QEMU monitor: device_add cxl-downstream
> >=20
> > In some error handling paths (such as the above due to attaching a cxl-=
downstream
> > port anything other than a cxl-upstream port) the g_free() of the PCIBr=
idge
> > windows in pci_bridge_region_cleanup() is called before the final call =
of
> > flatview_uref() in address_space_set_flatview() ultimately from
> > drain_call_rcu()
> >=20
> > At one stage this resulted in a crash, currently can still be observed =
using
> > valgrind which records a use after free.
> >=20
> > When present, only one instance is allocated. pci_bridge_update_mapping=
s()
> > can operate directly on an instance rather than creating a new one and
> > swapping it in.  Thus there appears to be no reason to not directly
> > couple the lifetimes of the two structures by embedding the PCIBridgeWi=
ndows
> > within the PCIBridge removing the need for the problematic separate fre=
e.
> >=20
> > Patch is same as was posted deep in the discussion.
> > https://lore.kernel.org/qemu-devel/20230403171232.000020bb@huawei.com/
> >=20
> > Posted as an RFC as only lightly tested and I'm not sure what the reaso=
ning
> > behind the separation of lifetimes originally was. As such perhaps this=
 is
> > not the best route to fixing the issue.
> >=20
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >   hw/pci/pci_bridge.c         | 20 ++++++++------------
> >   include/hw/pci/pci_bridge.h |  3 ++-
> >   2 files changed, 10 insertions(+), 13 deletions(-) =20
>=20
>=20
> > diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> > index 01670e9e65..ac75ec0c1b 100644
> > --- a/include/hw/pci/pci_bridge.h
> > +++ b/include/hw/pci/pci_bridge.h
> > @@ -30,6 +30,7 @@
> >   #include "hw/pci/pci_bus.h"
> >   #include "hw/cxl/cxl.h"
> >   #include "qom/object.h"
> > +#include "qemu/rcu.h" =20
>=20
> Where is this header is used

Left over garbage from a previous attempt to fix.  Good spot.
I'll clean that out and resend shortly.

Thanks,

Jonathan
=20
>=20
> >   typedef struct PCIBridgeWindows PCIBridgeWindows;
> >  =20
> > @@ -73,7 +74,7 @@ struct PCIBridge {
> >       MemoryRegion address_space_mem;
> >       MemoryRegion address_space_io;
> >  =20
> > -    PCIBridgeWindows *windows;
> > +    PCIBridgeWindows windows;
> >  =20
> >       pci_map_irq_fn map_irq;
> >       const char *bus_name; =20
>=20


