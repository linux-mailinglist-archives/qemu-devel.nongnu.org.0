Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B698624E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 14:54:02 +0200 (CEST)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvhvd-0002iV-QV
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 08:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vgoyal@redhat.com>) id 1hvhv6-0002Ia-MH
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 08:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vgoyal@redhat.com>) id 1hvhv4-0004qm-8X
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 08:53:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56122)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vgoyal@redhat.com>) id 1hvhv4-0004q8-0X
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 08:53:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B1EE51F0C
 for <qemu-devel@nongnu.org>; Thu,  8 Aug 2019 12:53:25 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EF260BE1;
 Thu,  8 Aug 2019 12:53:21 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7D5A4220ACF; Thu,  8 Aug 2019 08:53:20 -0400 (EDT)
Date: Thu, 8 Aug 2019 08:53:20 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190808125320.GB3147@redhat.com>
References: <20190801165409.20121-1-stefanha@redhat.com>
 <20190807180355.GA22758@stefanha-x1.localdomain>
 <20190807205715.GE18557@redhat.com>
 <20190808090213.GD31476@stefanha-x1.localdomain>
 <20190808095316.GC2852@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808095316.GC2852@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 12:53:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 08, 2019 at 10:53:16AM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Wed, Aug 07, 2019 at 04:57:15PM -0400, Vivek Goyal wrote:
> > > Kernel also serializes MAP/UNMAP on one inode. So you will need to run
> > > multiple jobs operating on different inodes to see parallel MAP/UNMAP
> > > (atleast from kernel's point of view).
> > 
> > Okay, there is still room to experiment with how MAP and UNMAP are
> > handled by virtiofsd and QEMU even if the host kernel ultimately becomes
> > the bottleneck.
> > 
> > One possible optimization is to eliminate REMOVEMAPPING requests when
> > the guest driver knows a SETUPMAPPING will follow immediately.  I see
> > the following request pattern in a fio randread iodepth=64 job:
> > 
> >   unique: 995348, opcode: SETUPMAPPING (48), nodeid: 135, insize: 80, pid: 1351
> >   lo_setupmapping(ino=135, fi=0x(nil), foffset=3860856832, len=2097152, moffset=859832320, flags=0)
> >      unique: 995348, success, outsize: 16
> >   unique: 995350, opcode: REMOVEMAPPING (49), nodeid: 135, insize: 60, pid: 12
> >      unique: 995350, success, outsize: 16
> >   unique: 995352, opcode: SETUPMAPPING (48), nodeid: 135, insize: 80, pid: 1351
> >   lo_setupmapping(ino=135, fi=0x(nil), foffset=16777216, len=2097152, moffset=861929472, flags=0)
> >      unique: 995352, success, outsize: 16
> >   unique: 995354, opcode: REMOVEMAPPING (49), nodeid: 135, insize: 60, pid: 12
> >      unique: 995354, success, outsize: 16
> >   virtio_send_msg: elem 9: with 1 in desc of length 16
> >   unique: 995356, opcode: SETUPMAPPING (48), nodeid: 135, insize: 80, pid: 1351
> >   lo_setupmapping(ino=135, fi=0x(nil), foffset=383778816, len=2097152, moffset=864026624, flags=0)
> >      unique: 995356, success, outsize: 16
> >   unique: 995358, opcode: REMOVEMAPPING (49), nodeid: 135, insize: 60, pid: 12
> > 
> > The REMOVEMAPPING requests are unnecessary since we can map over the top
> > of the old mapping instead of taking the extra step of removing it
> > first.
> 
> Yep, those should go - I think Vivek likes to keep them for testing
> since they make things fail more completely if there's a screwup.

I like to keep them because otherwise they keep the resources busy
on host. If DAX range is being used immediately, then this optimization
makes more sense. I will keep this in mind.

> 
> > Some more questions to consider for DAX performance optimization:
> > 
> > 1. Is FUSE_READ/FUSE_WRITE more efficient than DAX for some I/O patterns?
> 
> Probably for cases where the data is only accessed once, and you can't
> preemptively map.
> Another variant on (1) is whether we could do read/writes while the mmap
> is happening to absorb the latency.

For small random I/O, dax might not be very effective. Overhead of
setting up mapping and tearing it down is significant.

Vivek

