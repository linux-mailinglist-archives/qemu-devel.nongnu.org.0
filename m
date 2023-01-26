Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF367C7E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKz3V-0004lo-Iy; Thu, 26 Jan 2023 05:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pKz3R-0004lH-Ez
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:00:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pKz3O-0002V2-7E
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:00:25 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P2bgv1W68z6J7DZ;
 Thu, 26 Jan 2023 17:56:11 +0800 (CST)
Received: from localhost (10.81.202.191) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Jan
 2023 10:00:17 +0000
Date: Thu, 26 Jan 2023 10:00:16 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, <alison.schofield@intel.com>, "Mike
 Maslenkin" <mike.maslenkin@gmail.com>
Subject: Re: [PATCH v2 0/7] hw/cxl: RAS error emulation and injection
Message-ID: <20230126100016.00003d1f@Huawei.com>
In-Reply-To: <63d212ac26dc_3e0422944f@iweiny-mobl.notmuch>
References: <20230120142450.16089-1-Jonathan.Cameron@huawei.com>
 <63d212ac26dc_3e0422944f@iweiny-mobl.notmuch>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.202.191]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 25 Jan 2023 21:42:04 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> Jonathan Cameron wrote:
> > v2: Thanks to Mike Maslenkin for review.
> > - Fix wrong parameter type to ct3d_qmp_cor_err_to_cxl()
> > - Rework use of CXLError local variable in ct3d_reg_write() to improve
> >   code readability.
> > 
> > CXL error reporting is complex. This series only covers the protocol
> > related errors reported via PCIE AER - Ira Weiny has posted support for
> > Event log based injection and I will post an update of Poison list injection
> > shortly. My proposal is to upstream this one first, followed by Ira's Event
> > Log series, then finally the Poison List handling. That is based on likely
> > order of Linux kernel support (the support for this type of error reporting
> > went in during the recent merge window, the others are still under review).
> > Note we may propose other non error related features in between!
> > The current revisions of all the error injection can be found at:
> > https://gitlab.com/jic23/qemu/-/tree/cxl-2023-01-11  
> 
> Thanks!
> 
> I see all of the patches for the event log stuff has landed in this
> tree.
> 
> I see the following:
> 
> 	1) I have cleanup patches for[*]
> 		a) The timestamp change
> 		b) the g_new0() allocation
> 
> 	2)  [PATCH v2 7/8] bswap: Add the ability to store to an unaligned 24 bit field
> 	    	Was left alone.  I'm good with that.  But did you said you
> 		wanted to move it into the CXL specific code.  Did you
> 		change your mind?

Let's proposing as a general function and see what feedback we get.
Easy to move later if we need to.

> 
> 	3) Thank you so much for fixing the optional variable stuff!  :-D
> 
> 	4) And thanks for the CXLRetCode fix.  Thanks!
> 
> 	5) In the latest code from 1/20 I see you fixed the static const
> 	   UUID,  Thanks!
> 
> For the event stuff I have tested what is on this branch with the cleanup
> patches.
> 
> I was not sure if you wanted me to re-roll them or just send fixes
> patches.  But I'd like to move forward with the fixes submitted if that is
> ok.  Those are all minor issues which don't affect the behavior much at
> this point.

I've shuffled the tree again as wasn't sure on ordering for posting for upstream,
but it should make minimal difference. Fixes are fine, I'll just squash them into
the relevant patches.  Thanks!

> 
> [*] https://lore.kernel.org/all/20230125-ira-cxl-events-fixups-2023-01-11-v1-0-1931378515f5@intel.com/
> 
> Thank you,
> Ira
> 
> > 
> > In order to test the kernel support for RAS error handling, I previously
> > provided this series via gitlab, enabling David Jiang's kernel patches
> > to be tested.
> > 
> > Now that Linux kernel support is upstream, this series is proposing the
> > support for upstream inclusion in QEMU. Note that support for Multiple
> > Header Recording has been added to QEMU the meantime and a kernel
> > patch to use that feature sent out.
> > 
> > https://lore.kernel.org/linux-cxl/20230113154058.16227-1-Jonathan.Cameron@huawei.com/T/#t
> > 
> > There are two generic PCI AER precursor feature additions.
> > 1) The PCI_ERR_UCOR_MASK register has not been implemented until now
> >    and is necessary for correct emulation.
> > 2) The routing for AER errors, via existing AER error injection, only
> >    covered one of two paths given in the PCIe base specification,
> >    unfortunately not the one used by the Linux kernel CXL support.
> > 
> > The use of MSI for the CXL root ports, both makes sense from the point
> > of view of how it may well be implemented, and works around the documented
> > lack of PCI interrupt routing in i386/q35. I have a hack that lets
> > us correctly route those interrupts but don't currently plan to post it.
> > 
> > The actual CXL error injection uses a new QMP interface as documented
> > in the final patch description. The existing AER error injection
> > internals are reused though it's HMP interface is not.
> > 
> > Injection via QMP:
> > { "execute": "qmp_capabilities" }
> > ...
> > { "execute": "cxl-inject-uncorrectable-errors",
> >   "arguments": {
> >     "path": "/machine/peripheral/cxl-pmem0",
> >     "errors": [
> >         {
> >             "type": "cache-address-parity",
> >             "header": [ 3, 4]
> >         },
> >         {
> >             "type": "cache-data-parity",
> >             "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
> >         },
> >         {
> >             "type": "internal",
> >             "header": [ 1, 2, 4]
> >         }
> >         ]
> >   }}
> > ...
> > { "execute": "cxl-inject-correctable-error",
> >     "arguments": {
> >         "path": "/machine/peripheral/cxl-pmem0",
> >         "type": "physical",
> >         "header": [ 3, 4]
> >     } }
> > 
> > Based on top of:
> > https://lore.kernel.org/all/20230112102644.27830-1-Jonathan.Cameron@huawei.com/
> > [PATCH v2 0/8] hw/cxl: CXL emulation cleanups and minor fixes for upstream
> > 
> > Jonathan Cameron (7):
> >   hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
> >   hw/pci/aer: Add missing routing for AER errors
> >   hw/pci-bridge/cxl_root_port: Wire up AER
> >   hw/pci-bridge/cxl_root_port: Wire up MSI
> >   hw/mem/cxl-type3: Add AER extended capability
> >   hw/pci/aer: Make PCIE AER error injection facility available for other
> >     emulation to use.
> >   hw/mem/cxl_type3: Add CXL RAS Error Injection Support.
> > 
> >  hw/cxl/cxl-component-utils.c   |   4 +-
> >  hw/mem/cxl_type3.c             | 303 +++++++++++++++++++++++++++++++++
> >  hw/mem/cxl_type3_stubs.c       |  10 ++
> >  hw/mem/meson.build             |   2 +
> >  hw/pci-bridge/cxl_root_port.c  |  64 +++++++
> >  hw/pci/pci-internal.h          |   1 -
> >  hw/pci/pcie_aer.c              |  14 +-
> >  include/hw/cxl/cxl_component.h |  26 +++
> >  include/hw/cxl/cxl_device.h    |  11 ++
> >  include/hw/pci/pcie_aer.h      |   1 +
> >  include/hw/pci/pcie_regs.h     |   3 +
> >  qapi/cxl.json                  | 113 ++++++++++++
> >  qapi/meson.build               |   1 +
> >  qapi/qapi-schema.json          |   1 +
> >  14 files changed, 551 insertions(+), 3 deletions(-)
> >  create mode 100644 hw/mem/cxl_type3_stubs.c
> >  create mode 100644 qapi/cxl.json
> > 
> > -- 
> > 2.37.2
> >   
> 
> 


