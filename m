Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148369CA29
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4dK-0000V4-CR; Mon, 20 Feb 2023 06:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pU4dH-0000U2-0x
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:46:59 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pU4dE-0004MO-3u
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:46:58 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PL0rb1t2Gz6J68P;
 Mon, 20 Feb 2023 19:42:07 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Feb
 2023 11:46:47 +0000
Date: Mon, 20 Feb 2023 11:46:46 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Jonathan Cameron via <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>
Subject: Re: [PATCH 2/2] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230220114646.000000ff@Huawei.com>
In-Reply-To: <Y+9gSWadbRfdqJGS@memverge.com>
References: <20230131163847.23025-1-Jonathan.Cameron@huawei.com>
 <20230131163847.23025-3-Jonathan.Cameron@huawei.com>
 <20230217161617.000064d1@huawei.com>
 <Y+9gSWadbRfdqJGS@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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

On Fri, 17 Feb 2023 06:08:57 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Fri, Feb 17, 2023 at 04:16:17PM +0000, Jonathan Cameron via wrote:
> > On Tue, 31 Jan 2023 16:38:47 +0000
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> >   
> > > From: Gregory Price <gourry.memverge@gmail.com>
> > > 
> > > This commit enables each CXL Type-3 device to contain one volatile
> > > memory region and one persistent region.
> > > 
> > > Two new properties have been added to cxl-type3 device initialization:
> > >     [volatile-memdev] and [persistent-memdev]
> > > 
> > > The existing [memdev] property has been deprecated and will default the
> > > memory region to a persistent memory region (although a user may assign
> > > the region to a ram or file backed region). It cannot be used in
> > > combination with the new [persistent-memdev] property.
> > > 
> > > Partitioning volatile memory from persistent memory is not yet supported.
> > > 
> > > Volatile memory is mapped at DPA(0x0), while Persistent memory is mapped
> > > at DPA(vmem->size), per CXL Spec 8.2.9.8.2.0 - Get Partition Info.
> > > 
> > > Signed-off-by: Gregory Price <gregory.price@memverge.com>
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >   
> > Hi Gregory,
> > 
> > I've added support for multiple HDM decoders and hence can now
> > test both volatile and non volatile on same device.
> > It very nearly all works. With one exception which is I couldn't
> > poke the first byte of the non volatile region.
> > 
> > I think we have an off by one in a single check.
> > 
> > Interestingly it makes no difference when creating an FS on top
> > (which was my standard test) so I only noticed when poking memory
> > addresses directly to sanity check the HDM decoder setup.
> > 
> > I'll roll a v2 if no one shouts out that I'm wrong.
> > 
> > Note that adding multiple HDM decoders massively increases
> > the number of test cases over what we had before to poke all the
> > corners so I may well be missing stuff.  Hopefully can send an RFC
> > of that support out next week.
> > 
> > Jonathan
> >   
> 
> Very cool! Thanks for pushing this over the finishing line.
> 
> All my testing so far has been really smooth since getting the TCG issue
> worked out.
> 
> > > -MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
> > > -                           unsigned size, MemTxAttrs attrs)  
> [...]
> > > +    if (vmr) {
> > > +        if (*dpa_offset <= int128_get64(vmr->size)) {  
> > 
> > Off by one I think.  < 
> >   
> 
> Yes that makes sense, should be <.  Derp derp.
> 
> Though I think this may alludes to more off-by-one issues?  This says
> 
> if (dpa_offset < vmr->size)
> 
> but dpa_offset should be (hpa - memory_region_base),
> 
> The HPA is used by memory access routing for the whole system to determine
> what device it should access.
> 
> If that corner case is being hit, doesn't it imply the higher level code
> is also susceptible to this, and is routing accesses to the wrong device?

I don't think so though I may be missing something. 

Say vmr->size = 8

hpa  dpa_offset
0       0
1       1
2       2
3       3
4       4
5       5
6       6
7       7
8       0

etc

Also the writes are turning up where I expect them to.

Also just noticed that the code is setting Memory_base in the CXL dvsec.
Given we are emulating a device as if it has been freshly powered up
those should not be set - it's the OS or firmware's job to set them up.
Harmless though, so can be a cleanup to follow the main series.

We don't currently handle dvsec range based routing anyway and
I'm not sure we ever will as it is a pain to test without some firmware
or OS code to program them for us.

Note that if you update your kernel to cxl/next it will currently fail
as the Range register emulation is (I think) rather over enthusiastic
and currently decides to emulate the HDM decoders for the QEMU emulated
type 3 devices.

https://lore.kernel.org/linux-cxl/167640366272.935665.1056268838301725481.stgit@dwillia2-xfh.jf.intel.com/T/#m6c025d5c9b27d8360a64079593f6c5adaa408772

Jonathan


> 
> ~Gregory


