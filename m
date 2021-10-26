Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65F43BA48
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:06:02 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRlp-0001P1-5D
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mfRhi-0007ZJ-Ba
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:01:47 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:48686
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mfRhf-0000GD-1b
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:01:44 -0400
Received: from movement by movementarian.org with local (Exim 4.94)
 (envelope-from <movement@movementarian.org>)
 id 1mfRhb-0027Fj-Gr; Tue, 26 Oct 2021 20:01:39 +0100
Date: Tue, 26 Oct 2021 20:01:39 +0100
From: John Levon <levon@movementarian.org>
To: Elena <elena.ufimtseva@oracle.com>
Subject: Re: MMIO/PIO dispatch file descriptors (ioregionfd) design discussion
Message-ID: <YXhQk/Sh0nLOmA2n@movementarian.org>
References: <88ca79d2e378dcbfb3988b562ad2c16c4f929ac7.camel@gmail.com>
 <YWUeZVnTVI7M/Psr@heatpipe>
 <YXamUDa5j9uEALYr@stefanha-x1.localdomain>
 <20211025152122.GA25901@nuker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025152122.GA25901@nuker>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, kvm@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 eafanasova@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 felipe@nutanix.com, dinechin@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 08:21:22AM -0700, Elena wrote:

> > I'm curious what approach you want to propose for QEMU integration. A
> > while back I thought about the QEMU API. It's possible to implement it
> > along the lines of the memory_region_add_eventfd() API where each
> > ioregionfd is explicitly added by device emulation code. An advantage of
> > this approach is that a MemoryRegion can have multiple ioregionfds, but
> > I'm not sure if that is a useful feature.
> >
> 
> This is the approach that is currently in the works. Agree, I dont see
> much of the application here at this point to have multiple ioregions
> per MemoryRegion.
> I added Memory API/eventfd approach to the vfio-user as well to try
> things out.
> 
> > An alternative is to cover the entire MemoryRegion with one ioregionfd.
> > That way the device emulation code can use ioregionfd without much fuss
> > since there is a 1:1 mapping between MemoryRegions, which are already
> > there in existing devices. There is no need to think deeply about which
> > ioregionfds to create for a device.
> >
> > A new API called memory_region_set_aio_context(MemoryRegion *mr,
> > AioContext *ctx) would cause ioregionfd (or a userspace fallback for
> > non-KVM cases) to execute the MemoryRegion->read/write() accessors from
> > the given AioContext. The details of ioregionfd are hidden behind the
> > memory_region_set_aio_context() API, so the device emulation code
> > doesn't need to know the capabilities of ioregionfd.
> 
> > 
> > The second approach seems promising if we want more devices to use
> > ioregionfd inside QEMU because it requires less ioregionfd-specific
> > code.
> > 
> I like this approach as well.
> As you have mentioned, the device emulation code with first approach
> does have to how to handle the region accesses. The second approach will
> make things more transparent. Let me see how can I modify what there is
> there now and may ask further questions.

Sorry I'm a bit late to this discussion, I'm not clear on the above WRT
vfio-user. If an ioregionfd has to cover a whole BAR0 (?), how would this
interact with partly-mmap()able regions like we do with SPDK/vfio-user/NVMe?

thanks
john

