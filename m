Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5A667C74
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1HD-0004zH-Pt; Thu, 12 Jan 2023 12:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pG1Gy-0004x2-4W
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:21:53 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pG1Gu-0007us-II
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:21:51 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NtB983S1Dz67Xmk;
 Fri, 13 Jan 2023 01:18:52 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 12 Jan
 2023 17:21:31 +0000
Date: Thu, 12 Jan 2023 17:21:30 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>
Subject: Re: [PATCH 0/8] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
Message-ID: <20230112172130.0000391b@Huawei.com>
In-Reply-To: <Y8AppXP+eP9cEz+i@memverge.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <Y8AppXP+eP9cEz+i@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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

On Thu, 12 Jan 2023 10:39:17 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Wed, Jan 11, 2023 at 02:24:32PM +0000, Jonathan Cameron via wrote:
> > Gregory's patches were posted as part of his work on adding volatile support.
> > https://lore.kernel.org/linux-cxl/20221006233702.18532-1-gregory.price@memverge.com/
> > https://lore.kernel.org/linux-cxl/20221128150157.97724-2-gregory.price@memverge.com/
> > I might propose this for upstream inclusion this cycle, but testing is
> > currently limited by lack of suitable kernel support.  
> 
> fwiw the testing i've done suggests the problem isn't necessarily the
> implementation so much as either the EFI support or the ACPI tables.
> 
> For example, we see memory expanders come up no problem and turn into
> volatile memory on real hardware, with the same kernels with just a few
> commands.  My gut feeling is that either a mailbox command is missing or
> that the ACPI tables are missing/significantly different.
> 
> I haven't been able to investigate further at this point, but that's my
> current state with the voltile type-3 device testing.

My assumption was that all shipping hardware platforms were doing the
enumeration and bring up of memory expanders in the BIOS / firmware.
Those are then presented to the OS already set up exactly as if they were
normal memory.  We could do the same on QEMU but that means a lot of
work in EDK2. Note that it makes no sense to do the enumeration and
creation of ACPI tables in QEMU itself though could hack it like that.
This stuff is done in firmware because that enables it for legacy
OSes. Everything is more or less presented to the OS like you would
present RAM (EFI memory map, ACPI tables etc).

Firmware enumeration doesn't typically support hotplug, so if we add
support for hotplug of volatile memory type 3 devices to the kernel
we will also be able to do 'cold plug' and have the kernel bring them up
in a similar fashion to what we do for non-volatile (for non volatile there
is typically no real support in firmware as there is a bunch of policy to
deal with that doesn't belong in firmware). (simplifying heavily ;)

So I don't think we are missing anything in the emulation, just in the
software layers above it.  Could be wrong though ;)

Jonathan



