Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4A697980
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEdg-0003UQ-Ol; Wed, 15 Feb 2023 05:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSEde-0003UF-MY
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:03:46 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pSEdc-0008Hd-2M
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:03:46 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PGtp0322Dz6J67P;
 Wed, 15 Feb 2023 17:59:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 10:03:28 +0000
Date: Wed, 15 Feb 2023 10:03:27 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Dan Williams <dan.j.williams@intel.com>, <linux-cxl@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Kees Cook <keescook@chromium.org>,
 <stable@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Michal
 Hocko <mhocko@suse.com>, <linux-mm@kvack.org>, <linux-acpi@vger.kernel.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 00/18] CXL RAM and the 'Soft Reserved' => 'System RAM'
 default
Message-ID: <20230215100327.0000728f@Huawei.com>
In-Reply-To: <Y+wC+rPRbAc9rudx@memverge.com>
References: <167564534874.847146.5222419648551436750.stgit@dwillia2-xfh.jf.intel.com>
 <Y+vSj8FD6ZaHhfoN@memverge.com>
 <63ebd56e639e9_32d61294f4@dwillia2-xfh.jf.intel.com.notmuch>
 <Y+vag3hg3VRNRUti@memverge.com>
 <20230214211824.00007f91@Huawei.com>
 <Y+wCeSig++c3ACkj@memverge.com> <Y+wC+rPRbAc9rudx@memverge.com>
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

On Tue, 14 Feb 2023 16:54:02 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Tue, Feb 14, 2023 at 04:51:53PM -0500, Gregory Price wrote:
> > On Tue, Feb 14, 2023 at 09:18:24PM +0000, Jonathan Cameron wrote:  
> > > On Tue, 14 Feb 2023 14:01:23 -0500
> > > Gregory Price <gregory.price@memverge.com> wrote:
> > > 
> > > Could you test it with TCG (just drop --enable-kvm)?  We have a known
> > > limitation with x86 instructions running out of CXL emulated memory
> > > (side effect of emulating the interleave).  You'll need a fix even on TCG
> > > for the corner case of an instruction bridging from normal ram to cxl memory.
> > > https://lore.kernel.org/qemu-devel/20230206193809.1153124-1-richard.henderson@linaro.org/
> > > 
> > > Performance will be bad, but so far this is only way we can do it correctly.
> > > 
> > > Jonathan
> > >   
> > 
> > Siiiggghh... i had this patch and dropped --enable-kvm, but forgot to
> > drop "accel=kvm" from the -machine line
> > 
> > This was the issue.
> > 
> > And let me tell you, if you numactl --membind=1 python, it is
> > IMPRESSIVELY slow.  I wonder if it's even hitting a few 100k
> > instructions a second.
> > 
> > 
> > This appears to be the issue.  When I get a bit more time, try to dive
> > into the deep dark depths of qemu memory regions to see how difficult
> > a non-mmio fork might be, unless someone else is already looking at it.
> > 
> > ~Gregory  
> 
> Just clarifying one thing:  Even with the patch, KVM blows up.
> Disabling KVM fixes this entirely.  I haven't tested without KVM but
> with the patch, i will do that now.

yup.  The patch only fixes TCG so that's expected behavior.

Fingers crossed on this 'working'.

I'm open to suggestions on how to work around the problem with KVM
or indeed allow TCG to cache the instructions (right not it has
to fetch and emulate each instruction on it's own).

I can envision how we might do it for KVM with userspace page fault handling
used to get a fault up to QEMU which can then stitch in a cache
of the underlying memory as a stage 2 translation to the page (a little
bit like how post migration copy works) though I've not prototyped
anything...

I think it would be complex code that would be little used
so we may just have to cope with the emulation being slow.

Intent is very much to be able to test the kernel code etc, not
test it quickly :)

Jonathan

