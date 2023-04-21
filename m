Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC356EAA30
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:19:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppjR-0005Kj-5X; Fri, 21 Apr 2023 08:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppjO-0005KG-Pr
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:19:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppjM-0008Ug-Nv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:19:14 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2tpH1HBWz67lGm;
 Fri, 21 Apr 2023 20:17:59 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 13:19:09 +0100
Date: Fri, 21 Apr 2023 13:19:08 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, Fan Ni
 <fan.ni@samsung.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type
 and rework inheritance.
Message-ID: <20230421131908.000052f4@huawei.com>
In-Reply-To: <CAFEAcA8g2GeCmQkx3MvotqNVV7AOD7-6BxFckiYcooJj9-UFyg@mail.gmail.com>
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230421041812-mutt-send-email-mst@kernel.org>
 <CAFEAcA8g2GeCmQkx3MvotqNVV7AOD7-6BxFckiYcooJj9-UFyg@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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

On Fri, 21 Apr 2023 09:59:57 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 21 Apr 2023 at 09:19, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Apr 20, 2023 at 03:27:48PM +0100, Jonathan Cameron wrote:  
> > > Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
> > > a device that didn't have that a an ancestor type. PXB_DEV() used instead of
> > > PXB_CXL_DEV()/
> > >
> > > https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/
> > >
> > > During the discussion it became clear that the inheritance of the various
> > > TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
> > > fix then cleans up the inheritance of types based on functionality.
> > >
> > > There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.
> > >
> > > Before this series
> > > TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
> > > had TYPE_PCI_DEVICE as their direct parent though they shared a common
> > > struct PXBDev for their state.  As a result this state contained
> > > some data that was irrelevant for some the types.
> > >
> > > This series changes to
> > > TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
> > > TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
> > > TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.
> > >
> > > Each of the TYPE_PXB*_DEV has a state structure adding those elements
> > > to their parent that they need. This also allowed dropping a wrapping
> > > structure for the CXL state as the PXBCXLDev structure already provides
> > > the equivalent grouping.
> > >
> > > Patches are similar to those posted in the thread but rebased on v8.0.0.  
> >
> > this conflicts with
> >     Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless overridden"
> >
> > I think you acked that one?  
> 
> We should take one or the other, but not both. If this patchset
> is good then it's probably better to fix the bug rather than
> revert the feature, I think.

If it's easy to drop the revert that would be my preference.

If not, then I'm fine spinning a new version of that patch without
the bug (so with patch 1 of this squashed in).  Patch 2 is somewhat related
refactoring.  Not necessary to fix the issue even though it was motivated
by that bug.

Jonathan

> 
> -- PMM


