Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093CA69AA10
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSyhD-0001NE-JD; Fri, 17 Feb 2023 06:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSyhA-0001Ja-LD
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:14:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSyh8-0002Fl-Be
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:14:28 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PJ8Gh5TH9z67Kj3;
 Fri, 17 Feb 2023 19:09:48 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 17 Feb
 2023 11:14:19 +0000
Date: Fri, 17 Feb 2023 11:14:18 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: zhiting zhu <zhitingz@cs.utexas.edu>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Viacheslav A.Dubeyko
 <viacheslav.dubeyko@bytedance.com>
Subject: Re: CXL 2.0 memory pooling emulation
Message-ID: <20230217111418.000014d2@Huawei.com>
In-Reply-To: <Y+6Xj39d2rxnowRx@memverge.com>
References: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
 <20230215151854.00003e34@Huawei.com>
 <Y+yhfFaQ4Kky93mc@memverge.com>
 <20230216180057.00006c49@huawei.com>
 <Y+6Xj39d2rxnowRx@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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

On Thu, 16 Feb 2023 15:52:31 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Thu, Feb 16, 2023 at 06:00:57PM +0000, Jonathan Cameron wrote:
> > On Wed, 15 Feb 2023 04:10:20 -0500
> > Gregory Price <gregory.price@memverge.com> wrote:
> >   
> > > On Wed, Feb 15, 2023 at 03:18:54PM +0000, Jonathan Cameron via wrote:  
> > > > On Wed, 8 Feb 2023 16:28:44 -0600
> > > > zhiting zhu <zhitingz@cs.utexas.edu> wrote:
> > > >   
> > > > 1) Emulate an Multi Headed Device.
> > > >    Initially connect two heads to different host bridges on a single QEMU
> > > >    machine.  That lets us test most of the code flows without needing
> > > >    to handle tests that involve multiple machines.
> > > >    Later, we could add a means to connect between two instances of QEMU.    
> > > 
> > > Hackiest way to do this is to connect the same memory backend to two
> > > type-3 devices, with the obvious caveat that the device state will not
> > > be consistent between views.
> > > 
> > > But we could, for example, just put the relevant shared state into an
> > > optional shared memory area instead of a normally allocated region.
> > > 
> > > i can imagine this looking something like
> > > 
> > > memory-backend-file,id=mem0,mem-path=/tmp/mem0,size=4G,share=true
> > > cxl-type3,bus=rp0,volatile-memdev=mem0,id=cxl-mem0,shm_token=mytoken
> > > 
> > > then you can have multiple qemu instances hook their relevant devices up
> > > to a a backend that points to the same file, and instantiate their
> > > shared state in the region shmget(mytoken).  
> > 
> > That's not pretty.  For local instance I was thinking a primary device
> > which also has the FM-API tunneled access via mailbox, and secondary devices
> > that don't.  That would also apply to remote. The secondary device would
> > then just receive some control commands on what to expose up to it's host.
> > Not sure what convention on how to do that is in QEMU. Maybe a socket
> > interface like is done for swtpm? With some ordering constraints on startup.
> >   
> 
> I agree, it's certainly "not pretty".
> 
> I'd go so far as to call the baby ugly :].  Like i said: "The Hackiest way"
> 
> My understanding from looking around at some road shows is that some
> of these early multi-headed devices are basically just SLD's with multiple
> heads. Most of these devices had to be developed well before DCD's and
> therefore the FM-API were placed in the spec, and we haven't seen or
> heard of any of these early devices having any form of switch yet.
> 
> I don't see how this type of device is feasible unless it's either statically
> provisioned (change firmware settings from bios on reboot) or implements
> custom firmware commands to implement some form of exclusivity controls over
> memory regions.
> 
> The former makes it not really a useful pooling device, so I'm sorta guessing
> we'll see most of these early devices implement custom commands.
> 
> I'm just not sure these early MHD's are going to have any real form of
> FM-API, but it would still be nice to emulate them.
> 
Makes sense.  I'd be fine with adding any necessary hooks to allow that
in the QEMU emulation, but probably not upstreaming the custom stuff.

Jonathan

> ~Gregory


