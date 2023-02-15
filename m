Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBDC697F69
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYq-00033E-JY; Wed, 15 Feb 2023 10:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSJYn-00030s-Ju
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:19:05 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSJYi-00058F-35
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:19:05 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PH1ny3MnWz6J6G2;
 Wed, 15 Feb 2023 23:14:30 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 15:18:55 +0000
Date: Wed, 15 Feb 2023 15:18:54 +0000
To: zhiting zhu <zhitingz@cs.utexas.edu>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Viacheslav A.Dubeyko
 <viacheslav.dubeyko@bytedance.com>
Subject: Re: CXL 2.0 memory pooling emulation
Message-ID: <20230215151854.00003e34@Huawei.com>
In-Reply-To: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
References: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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

On Wed, 8 Feb 2023 16:28:44 -0600
zhiting zhu <zhitingz@cs.utexas.edu> wrote:

> Hi,
> 
> I saw a PoC:
> https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/T/ to
> implement memory pooling and fabric manager on qemu. Is there any further
> development on this? Can qemu emulate a memory pooling on a simple case
> that two virtual machines connected to a CXL switch where some memory
> devices are attached to?
> 
> Best,
> Zhiting

Hi Zhiting,

+CC linux-cxl as it's not as much of a firehose as qemu-devel
+CC Slava who has been driving discussion around fabric management.
> 

No progress on that particular approach though some discussion on
what the FM architecture itself might look like.

https://lore.kernel.org/linux-cxl/7F001EAF-C512-436A-A9DD-E08730C91214@bytedance.com/

There was a sticky problem with doing MCTP over I2C which is that
there are very few I2C controllers that support the combination of
master and subordinate needed to do MCTP.  The one that was used for
that (aspeed) doesn't have ACPI bindings (and they are non trivial to
add due to clocks etc and likely to be controversial on kernel side
given I just want it for emulation!).  So far we don't have DT bindings for CXL
(either the CFMWS - CXL fixed memory windows or pxb-cxl - the host bridge)
I'll be sending out one of the precursors for that as an RFC soon.

So we are in the fun position that we can either emulate the comms path
to the devices, or we can emulate the host actually using the devices.
I was planning to get back to that eventually but we have other options
now CXL 3.0 has been published.

CXL 3.0 provides two paths forwards that let us test the equivalent
functionality with fewer moving parts.
1) CXL SWCCI which is an extra PCI function next to the switch upstream port
   that provides a mailbox that takes FM-API commands.
PoC Kernel code at:
https://lore.kernel.org/linux-cxl/20221025104243.20836-1-Jonathan.Cameron@huawei.com/
Latest branch in 
gitlab.com/jic23/qemu should have switch CCI emulation support. (branches
are dated) Note we have a lot of stuff outstanding, either out for review
or backed up behind things that are.
2) Multi Headed Devices.  These allow FM-API commands over the normal CXL
   mailbox.

I did a very basic PoC to see how this would fit in with the kernel side
of things but recently there has been far too much we need to enable in
the shorter term. 

Note though that there is a long way to go before we can do what you
want.  The steps I'd expect to see along the way:

1) Emulate an Multi Headed Device.
   Initially connect two heads to different host bridges on a single QEMU
   machine.  That lets us test most of the code flows without needing
   to handle tests that involve multiple machines.
   Later, we could add a means to connect between two instances of QEMU.
2) Add DCD support (we'll need the kernel side of that as well)
3) Wire it all up.
4) Do the same for a Switch with MLDs behind it so we can poke the fun
   corners.

Note that in common with memory emulation in general for CXL on QEMU
the need to do live address decoding will make performance terrible.
There are probably ways to improve that, but whilst we are at the stage
of trying to get as much functional as possible for testing purposes,
I'm not sure anyone will pursue those options.  May not make sense in
the longer term either.  I'm more than happy to offer suggestions
/ feedback on approaches to this and will get back to it myself
once some more pressing requirements are dealt with.

Jonathan

