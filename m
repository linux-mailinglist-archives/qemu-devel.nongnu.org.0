Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E5699BC0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:02:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiZZ-0005ci-Sl; Thu, 16 Feb 2023 13:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSiZE-0005Sm-4m
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:01:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSiZA-0005Ot-IW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:01:11 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PHjLF2J3cz67xgN;
 Fri, 17 Feb 2023 01:56:21 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Feb
 2023 18:00:58 +0000
Date: Thu, 16 Feb 2023 18:00:57 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: zhiting zhu <zhitingz@cs.utexas.edu>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Viacheslav A.Dubeyko
 <viacheslav.dubeyko@bytedance.com>
Subject: Re: CXL 2.0 memory pooling emulation
Message-ID: <20230216180057.00006c49@huawei.com>
In-Reply-To: <Y+yhfFaQ4Kky93mc@memverge.com>
References: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
 <20230215151854.00003e34@Huawei.com>
 <Y+yhfFaQ4Kky93mc@memverge.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 15 Feb 2023 04:10:20 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Wed, Feb 15, 2023 at 03:18:54PM +0000, Jonathan Cameron via wrote:
> > On Wed, 8 Feb 2023 16:28:44 -0600
> > zhiting zhu <zhitingz@cs.utexas.edu> wrote:
> >   
> > > Hi,
> > > 
> > > I saw a PoC:
> > > https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/T/ to
> > > implement memory pooling and fabric manager on qemu. Is there any further
> > > development on this? Can qemu emulate a memory pooling on a simple case
> > > that two virtual machines connected to a CXL switch where some memory
> > > devices are attached to?
> > > 
> > > Best,
> > > Zhiting  
> > [... snip ...]
> > 
> > Note though that there is a long way to go before we can do what you
> > want.  The steps I'd expect to see along the way:
> > 
> > 1) Emulate an Multi Headed Device.
> >    Initially connect two heads to different host bridges on a single QEMU
> >    machine.  That lets us test most of the code flows without needing
> >    to handle tests that involve multiple machines.
> >    Later, we could add a means to connect between two instances of QEMU.  
> 
> I've been playing with this a bit.
> 
> Hackiest way to do this is to connect the same memory backend to two
> type-3 devices, with the obvious caveat that the device state will not
> be consistent between views.
> 
> But we could, for example, just put the relevant shared state into an
> optional shared memory area instead of a normally allocated region.
> 
> i can imagine this looking something like
> 
> memory-backend-file,id=mem0,mem-path=/tmp/mem0,size=4G,share=true
> cxl-type3,bus=rp0,volatile-memdev=mem0,id=cxl-mem0,shm_token=mytoken
> 
> then you can have multiple qemu instances hook their relevant devices up
> to a a backend that points to the same file, and instantiate their
> shared state in the region shmget(mytoken).

That's not pretty.  For local instance I was thinking a primary device
which also has the FM-API tunneled access via mailbox, and secondary devices
that don't.  That would also apply to remote. The secondary device would
then just receive some control commands on what to expose up to it's host.
Not sure what convention on how to do that is in QEMU. Maybe a socket
interface like is done for swtpm? With some ordering constraints on startup.

> 
> Additionally, these devices will require a set of what amounts to
> vendor-specific mailbox commands - since the spec doesn't really define
> what multi-headed devices "should do" to manage exclusivity.

The device shouldn't manage exclusivity.  That's a job for the fabric
manager + DCD presentation of the memory with device enforcing some rules
+ if it supports some of the capacity adding types, it might need a
simple allocator.
If we need vendor specific commands then we need to take that to the
relevant body. I'm not sure what they would be though.

> 
> Not sure if this would be upstream-worthy, or if we'd want to fork
> mem/cxl-type3.c into like mem/cxl-type3-multihead.c or something.
> 
> The base type3 device is going to end up overloaded at some point i
> think, and we'll want to look at trying to abstract it.

Sure.  Though we might end up with the normal type3 implementation being
(optionally) the primary device for a MHD (the one with the FM-API
tunneling available on it's mailbox).  Would need a secondary
device though which you instantiate with a link to the primary one
or with a socket. (assuming primary opens socket as well).

Jonathan

> 
> ~Gregory


