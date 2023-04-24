Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6046ED196
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:41:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyJS-0002az-VQ; Mon, 24 Apr 2023 11:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pqyJQ-0002aQ-IS; Mon, 24 Apr 2023 11:41:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pqyJN-00028D-G4; Mon, 24 Apr 2023 11:41:07 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q4q5g61phz6J6xr;
 Mon, 24 Apr 2023 23:37:59 +0800 (CST)
Received: from localhost (10.126.170.151) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 24 Apr
 2023 16:41:01 +0100
Date: Mon, 24 Apr 2023 16:40:58 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 <qemu-arm@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI
 eXpander Bridges
Message-ID: <20230424164058.00000a3d@Huawei.com>
In-Reply-To: <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.170.151]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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

On Mon, 24 Apr 2023 10:28:30 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 21 Apr 2023 at 17:50, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > This patch and the problem it is trying to resolve will form part of a talk
> > I will be giving next week at Linaro Connect. https://sched.co/1K85p
> >
> > So in the spirit of giving people almost no warning... Plus being able to
> > say the discussion has kicked off here is the simplest solution I could
> > come up with. If we can agree on an approach to the sizing of memory
> > windows question by Thursday even better (I'll update the slides!) ;)
> >
> > This is a precursor for CXL on arm-virt (for which DT support was
> > requested). CXL QEMU emulation uses pxb-cxl which inherits from the
> > slightly simpler pxb-pcie. ACPI support for these additional host bridges
> > has been available for some time but relies an interesting dance with
> > EDK2:
> > * During initial board creation the PXB buses are largely ignored
> >   and ACPI tables + DT passed to EDK2 only expose the root bus on
> >   which the section of the PXB instance that exists as a normal PCI EP
> >   may be discovered.
> > * EDK2 then carries out full PCI bus enumeration, including the buses
> >   below the PXB host bridges.
> > * Finally EDK2 calls back into QEMU to rebuild the tables via
> >   virt_acpi_build_update(), at which point the correct DSDT for the
> >   PXB host bridges is generated and an adjust DSDT section is generated
> >   for the primary host bridge (holes are bunched in the _CRS).
> >
> > For device tree bindings there is no such dance with the firmware and as
> > such we need QEMU to directly present device tree entries for the primary
> > PCIe bus and the PXB instances.  
> 
> So, not knowing anything about CXL, my naive question is:
> this is PCI, why can't we handle it the way we handle everything
> else PCI, i.e. present the PCI controller in the DTB and it's
> the guest kernel's job to probe, enumerate, etc whatever it wants ?

Absolutely the kernel will still do the enumeration.  But there's a problem
- it won't always work, unless there is 'enough room'.

If the aim is to do it in a similar fashion to how PCI Expander Bridges (PXB)
are handled today with ACPI (we could look at doing something different of course)

We have one set of memory windows for assigning PCI bars into etc. In the model
used for PXB, that set of resources is shared between different host bridges
including the main one (each one has separate DT description).

So for virt, VIRT_PCIE_MMIO, VIRT_PCIE_IO, VIRT_PCIE_ECAM, VIRT_HIGH_PCIE_ECAM
and VIRT_HIGH_PCIE_MMIO are split up between the host bridges.
Each host bridge has it's own DT description. 

For ACPI, how to split up available memory windows up depends on the requirements
of the PCIe devices below the host bridges.  For ACPI we 'know' the answer
as to what is required at the point of creating the description because EDK2
did the work for us.  For DT we currently don't.  What to do about that is the
question this RFC tries to address.

In theory we could change the kernel to support enumerating PXB instances, but
that's a very different model from today where they are just 'standard'
host bridges, using the generic bindings for ACPI (and after this patch for DT).

I'll add an example in a reply (on wrong machine and stuck in a meeting today).

Jonathan

> 
> thanks
> -- PMM


