Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125F687D5D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYlE-00032m-40; Thu, 02 Feb 2023 07:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNYkT-0002vf-L7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:31:36 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNYkP-0002p9-OI
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:31:29 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P6ymP4L4Mz6JB1M;
 Thu,  2 Feb 2023 20:30:13 +0800 (CST)
Received: from localhost (10.81.211.68) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 12:31:19 +0000
Date: Thu, 2 Feb 2023 12:31:18 +0000
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, =?ISO-8859-1?Q?J=F8r?=
 =?ISO-8859-1?Q?gen?= Hansen <Jorgen.Hansen@wdc.com>, Ajay Joshi
 <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>, Sid Manning
 <sidneym@quicinc.com>
Subject: Re: An issue with x86 tcg and MMIO
Message-ID: <20230202123118.00003bd6@Huawei.com>
In-Reply-To: <CAFEAcA9ohWGgaCK60Di4iUdgYqpmHeB_WnDGv4PzyfyfquMUzw@mail.gmail.com>
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
 <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
 <20230202093911.000053cb@Huawei.com>
 <2e85fdea-9ffc-9a20-1c61-45ddd17a7fd6@linaro.org>
 <CAFEAcA9ohWGgaCK60Di4iUdgYqpmHeB_WnDGv4PzyfyfquMUzw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.211.68]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

On Thu, 2 Feb 2023 11:39:28 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 2 Feb 2023 at 10:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 2/1/23 23:39, Jonathan Cameron wrote:  
> > > Not sure - if we can do the handling above then sure we could make that change.
> > > I can see there is a path to register the callbacks but I'd kind of assumed
> > > ROM meant read only...  
> >
> > I think "romd" means "read mostly".
> >
> > In the case of flash, I believe that a write changes modes (block erase something
> > something) and the region changes state into MMIO.  But normal state is read mode where
> > read+execute go through unchallenged.  
> 
> In QEMU a ROMD MemoryRegion (created by memory_region_init_rom_device())
> is a memory region backed by RAM for reads and by callbacks for writes.
> (I think ROMD stands for "ROM device".)
> 
> You can then use memory_region_device_set_romd() to put the ROMD into
> either ROMD mode (the default, reads backed by RAM) or MMIO mode
> (reads backed by MMIO callbacks). Writes are always callbacks regardless.
> This is mainly meant for flash devices, which are usually reads-as-data
> but have a programming mode where you write a command to it and then
> read back command results. It's possible to use it for other tricks too.
> 
> When a ROMD is in ROMD mode then execution from it is as fast as execution
> from any RAM; when it is in MMIO mode then execution from it is as slow
> as execution from any other MMIO-backed MemoryRegion.

Thanks for the info - I don't think ROMD helps us much here as we'd need
to be constantly in the MMIO mode as we need the callbacks for both read
and write.

> 
> Note that AFAIK you can't execute from MMIO at all with KVM (either
> ROMD-in-MMIO mode or a plain old MMIO device).

That may not be a significant problem for CXL emulation - though we should
definitely make that restriction clear and it might slow down some testing.
As far as I know there are no usecases beyond testing of software stacks
and TCG is fine for that.

> 
> You might want to look at whether QEMU's iommu functionality is helpful
> to you -- I'm assuming CXL doesn't do weird stuff on a less-than-page
> granularity, and the iommu APIs will let you do "programmatically decide
> where this address should actually go". The other option involves
> mapping and unmapping MemoryRegions inside a container MR.

Unfortunately it does weird stuff well below a page granularity.
Interleaving is down to 256 bytes.

We discussed the memory region approach when this originally came up.
The issue is that we get an insane number of memory regions to support
even basic interleave setups (many millions) - hence doing the address
decoding via a read and write callbacks at runtime instead. 

Jonathan

> 
> thanks
> -- PMM


