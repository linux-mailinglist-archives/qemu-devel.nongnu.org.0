Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007046523BB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eeM-0004sX-Ty; Tue, 20 Dec 2022 10:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7ee7-0004qb-Ms
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:35:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7ee4-0003HT-BJ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:35:10 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nc0w83lHcz67L21;
 Tue, 20 Dec 2022 23:33:28 +0800 (CST)
Received: from localhost (10.81.208.216) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Dec
 2022 15:34:54 +0000
Date: Tue, 20 Dec 2022 15:34:53 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Gregory Price <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, <alison.schofield@intel.com>,
 <dave@stgolabs.net>, <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <hchkuo@avery-design.com.tw>, <cbrowy@avery-design.com>,
 <ira.weiny@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20221220153453.00000436@Huawei.com>
In-Reply-To: <Y6CloIiuruB/h7qp@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20221219124211.000032b7@Huawei.com>
 <Y6CNcuIzUVmKL0SM@memverge.com>
 <20221219172502.00001338@Huawei.com>
 <Y6CloIiuruB/h7qp@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.208.216]
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

On Mon, 19 Dec 2022 12:55:44 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> > I think an address space needs a memory region, not a memdev.
> > Initialize a container region with memory_region_init()
> > We could then add the two memdev associated regions (with different 
> > attributes) as subregions using memory_region_add_subregion()
> > 
> > Similar is done for the system memory
> > https://elixir.bootlin.com/qemu/latest/source/softmmu/physmem.c#L2675
> > creates it.  Then it's mostly accessed by get_system_memory()
> > 
> > Memory is then added to that at particular base addresses via for example
> > https://elixir.bootlin.com/qemu/latest/source/hw/arm/virt.c#L2210
> > and similar.
> > I think we can do the same here.
> >  
> 
> Ah, I'm just confused then, this seems reasonable
> 
> > Curious question on this lot. How are you testing it?  Some exciting scripts
> > to bring the hdm decoders up etc for the volatile region? Or some prototype
> > driver code?  
> 
> Unfortunately I got pulled off this work for a bit to handle something
> more pressing.  

No problem. It happens to us all!

> I have only tested that the existing functionality
> (persistent mode) works as intended, and that at least the ndctl/cxl
> tools report capacity as expected.
> 
> As of right now there is no code in the driver to actually touch these
> regions in a way that works to be able to online these volatile regions
> - at least so far as I know.
> 
> I don't remember where I left off, but some pmem-to-ram tutorials online
> suggest you could online pmem regions like this
> 
> cxl create-region -d decoder0.0 -m mem0
> echo offline > /sys/devices/system/memory/auto_online_blocks
> ndctl create-namespace -f --mode devdax --continue
> daxctl enable-device [device name]
> daxctl reconfigure-device --mode=system-ram all
> 
> However I don't think this is successful in creating the dax devices,
> and therefore the reconfiguring into ram.

Sure. I only bothered testing the it in some dax modes rather than via kmem.
It 'should' work but more testing needed there.

However as you've noted, that only applies to the pmem regions at the moment.
I wondered if you'd scripted the HDM decoder setup etc for test purposes
(so what the driver will do). Alternative to that would be enabling the driver
support. Not sure if anyone is looking at that yet. Final alternative would
be to port the existing EDK2 based support to work on QEMU.  All non trivial
jobs so may take a while,

Jonathan

