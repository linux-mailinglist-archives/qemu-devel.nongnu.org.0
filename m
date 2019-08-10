Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBE88E8C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 23:35:12 +0200 (CEST)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwZ15-0006jM-Hf
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 17:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bo.liu@linux.alibaba.com>) id 1hwZ0N-0006Hx-N6
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 17:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bo.liu@linux.alibaba.com>) id 1hwZ0M-00033l-Fm
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 17:34:27 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:30074)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bo.liu@linux.alibaba.com>)
 id 1hwZ0M-0002vZ-5d
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 17:34:26 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422; MF=bo.liu@linux.alibaba.com; NM=1;
 PH=DS; RN=5; SR=0; TI=SMTPD_---0TZ76dSR_1565472841; 
Received: from US-160370MP2.local(mailfrom:bo.liu@linux.alibaba.com
 fp:SMTPD_---0TZ76dSR_1565472841) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 11 Aug 2019 05:34:03 +0800
Date: Sat, 10 Aug 2019 14:34:00 -0700
From: Liu Bo <bo.liu@linux.alibaba.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190810213400.rpzxazwfrbxxkneq@US-160370MP2.local>
References: <20190801165409.20121-1-stefanha@redhat.com>
 <20190807180355.GA22758@stefanha-x1.localdomain>
 <20190807205715.GE18557@redhat.com>
 <20190808090213.GD31476@stefanha-x1.localdomain>
 <20190808095316.GC2852@work-vm>
 <20190809082102.GB25286@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809082102.GB25286@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180323
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 47.88.44.36
Subject: Re: [Qemu-devel] [Virtio-fs] [PATCH 0/4] virtiofsd: multithreading
 preparation part 3
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
Reply-To: bo.liu@linux.alibaba.com
Cc: virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 09, 2019 at 09:21:02AM +0100, Stefan Hajnoczi wrote:
> On Thu, Aug 08, 2019 at 10:53:16AM +0100, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > On Wed, Aug 07, 2019 at 04:57:15PM -0400, Vivek Goyal wrote:
> > > 2. Can MAP/UNMAP be performed directly in QEMU via a separate virtqueue?
> > 
> > I think there's two things to solve here that I don't currently know the
> > answer to:
> >   2a) We'd need to get the fd to qemu for the thing to mmap;
> >       we might be able to cache the fd on the qemu side for existing
> >       mappings, so when asking for a new mapping for an existing file then
> >       it would already have the fd.
> > 
> >   2b) Running a device with a mix of queues inside QEMU and on
> >       vhost-user; I don't think we have anything with that mix
> 
> vhost-user-net works in the same way.  The ctrl queue is handled by QEMU
> and the rx/tx queues by the vhost device.  This is in fact how vhost was
> initially designed: the vhost device is not a full virtio device, only
> the dataplane.

> > > 3. Can READ/WRITE be performed directly in QEMU via a separate virtqueue
> > >    to eliminate the bad address problem?
> > 
> > Are you thinking of doing all read/writes that way, or just the corner
> > cases? It doesn't seem worth it for the corner cases unless you're
> > finding them cropping up in real work loads.
> 
> Send all READ/WRITE requests to QEMU instead of virtiofsd.
> 
> Only handle metadata requests in virtiofsd (OPEN, RELEASE, READDIR,
> MKDIR, etc).

For now qemu is not aware of virtio-fs's fd info, but I think it's
doable, I like the idea.

thanks,
-liubo
> 
> > > I'm not going to tackle DAX optimization myself right now but wanted to
> > > share these ideas.
> > 
> > One I was thinking about that feels easier than (2) was to change the
> > vhost slave protocol to be split transaction; it wouldn't do anything
> > for the latency but it would be able to do some in parallel if we can
> > get the kernel to feed it.
> 
> There are two cases:
> 1. mmapping multiple inode.  This should benefit from parallelism,
>    although mmap is still expensive because it involves TLB shootdown
>    for all other threads running this process.
> 2. mmapping the same inode.  Here the host kernel is likely to serialize
>    mmaps even more, making it hard to gain performance.
> 
> It's probably worth writing a tiny benchmark first to evaluate the
> potential gains.
> 
> Stefan



> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs

