Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A563A675BBE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIvMr-0007Q6-KX; Fri, 20 Jan 2023 12:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIvMA-0007AA-3M
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:39:16 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIvM7-0000UX-8B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:39:13 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nz6DF625Gz6J9Pc;
 Sat, 21 Jan 2023 01:38:37 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 17:39:07 +0000
Date: Fri, 20 Jan 2023 17:39:06 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Fan Ni
 <fan.ni@samsung.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, "alison.schofield@intel.com"
 <alison.schofield@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Adam
 Manzanares" <a.manzanares@samsung.com>, "bwidawsk@kernel.org"
 <bwidawsk@kernel.org>, "gregory.price@memverge.com"
 <gregory.price@memverge.com>, "hchkuo@avery-design.com.tw"
 <hchkuo@avery-design.com.tw>, "cbrowy@avery-design.com"
 <cbrowy@avery-design.com>, "ira.weiny@intel.com" <ira.weiny@intel.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [RFC] cxl-host: Fix committed check for passthrough decoder
Message-ID: <20230120173906.000053ea@Huawei.com>
In-Reply-To: <20230116143723.00002291@huawei.com>
References: <CGME20230113002756uscas1p2b602bff26576110407491f67eff5e065@uscas1p2.samsung.com>
 <20230113002727.11411-1-fan.ni@samsung.com>
 <20230113094725.0000705c@Huawei.com>
 <20230113171044.GA24788@bgt-140510-bm03>
 <20230116143723.00002291@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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

On Mon, 16 Jan 2023 14:37:23 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Fri, 13 Jan 2023 17:10:51 +0000
> Fan Ni <fan.ni@samsung.com> wrote:
> 
> > On Fri, Jan 13, 2023 at 09:47:25AM +0000, Jonathan Cameron wrote:
> >   
> > > On Fri, 13 Jan 2023 00:27:55 +0000
> > > Fan Ni <fan.ni@samsung.com> wrote:
> > >     
> > > > For passthrough decoder (a decoder hosted by a cxl component with only
> > > > one downstream port), its cache_mem_registers field COMMITTED
> > > > (see spec 2.0 8.2.5.12 - CXL HDM Decoder Capability Structure) will not
> > > > be set by the current Linux CXL driver. Without the fix, for a cxl
> > > > topology setup with a single HB and single root port, the memdev read/write
> > > > requests cannot be passed to the device successfully as the function
> > > > cxl_hdm_find_target will fail the decoder COMMITTED check and return
> > > > directly, which causes read/write not being directed to cxl type3 device.
> > > > 
> > > > Before the fix, a segfault is observed when trying using cxl memory for
> > > > htop command through 'numactl --membind' after converting cxl memory
> > > > into normal RAM.    
> > > 
> > > We also need to fix that segfault.    
> > With the patch, we do not see the segfault anymore. The segfault was
> > there before the patch because for a passthrough decoder, we cannot find a
> > target as the committed field check cannot pass, the read request will
> > return 0 (in cxl_read_cfmws) which can be used for futher addressing.
> > With the patch, we skip the committed check for passthrough decoder and
> > the requests can be passed to the device so the segfault is fixed. Our
> > concern is that the fix may also let the requests pass for unprogrammed
> > decoder, which is not allowed in current code.  
> 
> Agreed on the concern. That is one reason we need a more comprehensive solution.
> 
> > > 
> > >     
> > > > 
> > > > Detailed steps to reproduce the issue with the cxl setup where there is
> > > > only one HB and a memdev is directly attached to the only root port of
> > > > the HB are listed as below,
> > > > 1. cxl create-region region0
> > > > 2. ndctl create-namespace -m dax -r region0
> > > > 3. daxctl reconfigure-device --mode=system-ram --no-online dax0.0
> > > > 4. daxctl online-memory dax0.0
> > > > 5. numactl --membind=1 htop
> > > > 
> > > > Signed-off-by: Fan Ni <fan.ni@samsung.com>    
> > > 
> > > Ah. This mess is still going on. I've not been testing with this
> > > particular combination because the kernel didn't support it.
> > > The kernel code assumes that the implementation made the choice
> > > (which is an option in the spec) to not have any HDM decoders
> > > for the pass through case. As such it never programmed them
> > > (if you dig back a long way in the region bring patch sets in the
> > > kernel you'll find some discussion of this). Now I knew that meant
> > > the configuration didn't 'work' but nothing should be crashing -
> > > unless you mean that something in linux userspace is trying to
> > > access the memory and crashing because that fails
> > > (which is fine as far as I'm concerned ;)
> > > 
> > > The work around for QEMU testing so far has been to add another root
> > > port and put nothing below that. The HDM decoders then have to be
> > > implemented so the kernel does what we expect.    
> > Do you mean we already have the workaround somewhere or it is what we
> > have planned? currently the kernel will create a passthrough decoder if
> > the number of downstream is 1. If we have the workaround, there
> > should never be a passthrough decoder being created and we should not
> > see the issue.  
> 
> I have code as describe (now, didn't until few minutes ago).
> I'll send it out later this week after a little more testing / internal review.
> 
> > > 
> > > I'm not against a more comprehensive fix.  Two options come to mind.
> > > 1) Add an option to the host bridge device to tell it not to implement
> > >    hdm decoders at all. I'm not keen to just automatically drop them
> > >    because having decoders on a pass through HB is a valid configuration.
> > > 2) Cheat and cleanly detect a pass through situation and let the accesses
> > >    through.  I'm not particularly keen on this option though as it
> > >    will fail to test the code once it's 'fixed' in Linux.  IIRC the spec
> > >    doesn't say that programming such an HDM decoder is optional.
> > > 
> > > I guess we could be a bit naughty with option 1 and flip the logic even
> > > though it would break backwards compatibility. So default to no HDM decoder.
> > > I doubt anyone will notice given that's the configuration that would have
> > > worked.  However I would want to keep the option to enable these decoders
> > > around.  I can spin up a patch or do you want to do it? My suggestion is option
> > > 1 with default being no HDM decoder.  
> 
> I went with this option. Implementation uses the reset callback in QEMU
> for the pxb-cxl to edit the capability header table to 'hide' the HDM decoder
> if it finds just one downstream port (on second reset, as on first one the
> ports have not yet been created).  In cxl-host.c we direct everything to that
> downstream port.
> 
> > > 
> > > Jonathan    
> > Please feel free to spin up a patch.  
> 
> Will do,

I've run out of time today to write a proper cover letter etc for the patch set
and want to run a few tests on non pass through cases to make sure there are
no side effects, but if you want to try it in the meantime I've pushed an
updated tree to gitlab.

https://gitlab.com/jic23/qemu/-/tree/cxl-2023-01-20
Top two patches enable a pass through decoder for the host bridge if there
is only one root port below it.

Thanks,

Jonathan


> 
> Jonathan
> 
> > > 
> > > 
> > >     
> > > > ---
> > > >  hw/cxl/cxl-host.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> > > > index 1adf61231a..5ca0d6fd8f 100644
> > > > --- a/hw/cxl/cxl-host.c
> > > > +++ b/hw/cxl/cxl-host.c
> > > > @@ -107,8 +107,11 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
> > > >      uint32_t target_idx;
> > > >  
> > > >      ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
> > > > -    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> > > > -        return false;
> > > > +
> > > > +    /* skip the check for passthrough decoder */    
> > > 
> > > You have a mix of spaces and tabs for indentation. Should all be 4 spaces
> > > for QEMU code.
> > >     
> > > > +	if (FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT)
> > > > +		&& !FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> > > > +		return false;    
> > > 
> > > Why is this code specific to a pass through decoder?
> > > All it's telling us (I think) is no one tried to commit the decoder yet.
> > >     
> > > >      }
> > > >  
> > > >      ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);    
> > >    
> 
> 


