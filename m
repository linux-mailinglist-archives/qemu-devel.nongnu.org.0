Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FFA43CA1F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:52:25 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiPo-0007yv-GM
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mfhww-0004kk-5H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:22:35 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:45154
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mfhws-0004Nw-Vv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:22:33 -0400
Received: from movement by movementarian.org with local (Exim 4.94)
 (envelope-from <movement@movementarian.org>)
 id 1mfhwq-002PuS-9X; Wed, 27 Oct 2021 13:22:28 +0100
Date: Wed, 27 Oct 2021 13:22:28 +0100
From: John Levon <levon@movementarian.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: MMIO/PIO dispatch file descriptors (ioregionfd) design discussion
Message-ID: <YXlEhCYAJuhsVwDv@movementarian.org>
References: <88ca79d2e378dcbfb3988b562ad2c16c4f929ac7.camel@gmail.com>
 <YWUeZVnTVI7M/Psr@heatpipe>
 <YXamUDa5j9uEALYr@stefanha-x1.localdomain>
 <20211025152122.GA25901@nuker> <YXhQk/Sh0nLOmA2n@movementarian.org>
 <YXkmx3V0VklA6qHl@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXkmx3V0VklA6qHl@stefanha-x1.localdomain>
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
Cc: Elena <elena.ufimtseva@oracle.com>, john.g.johnson@oracle.com,
 jag.raman@oracle.com, kvm@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, eafanasova@gmail.com,
 felipe@nutanix.com, dinechin@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 11:15:35AM +0100, Stefan Hajnoczi wrote:

> > > I like this approach as well.
> > > As you have mentioned, the device emulation code with first approach
> > > does have to how to handle the region accesses. The second approach will
> > > make things more transparent. Let me see how can I modify what there is
> > > there now and may ask further questions.
> > 
> > Sorry I'm a bit late to this discussion, I'm not clear on the above WRT
> > vfio-user. If an ioregionfd has to cover a whole BAR0 (?), how would this
> > interact with partly-mmap()able regions like we do with SPDK/vfio-user/NVMe?
> 
> The ioregionfd doesn't need to cover an entire BAR. QEMU's MemoryRegions
> form a hierarchy, so it's possible to sub-divide the BAR into several
> MemoryRegions.

I think you're saying that when vfio-user client in qemu calls
VFIO_USER_DEVICE_GET_REGION_IO_FDS, it would create a sub-MR corresponding to
each one, before asking KVM to configure them?

thanks
john

