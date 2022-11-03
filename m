Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC513618455
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:27:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqd3C-0005zj-PB; Thu, 03 Nov 2022 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oqd30-0005tJ-PO; Thu, 03 Nov 2022 12:26:30 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oqd2u-0001NO-Dg; Thu, 03 Nov 2022 12:26:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2B9F61F68;
 Thu,  3 Nov 2022 16:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D59AC433D6;
 Thu,  3 Nov 2022 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667492774;
 bh=RBs5FE0P6n4+XntZCeqOVHUZfJwI/b8/EJFSRdJlUic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CaTJEQY0c2kqmfSbGaJivCPLkAm+qu+qg/vlGVR4x1GsywSXgEtUrjzBzoTuzOx0p
 fmnFMcK5qMzDb9m1XPT/X0L89ZAa+eQssq/7Pjxs9Rc/m73Eje9QntLytnujMtSDtW
 6M/OuZWjYWt9aU51JCAtpCaBL26vYb0CCT4RxnkHZIHij9uY1GTR0OAoV+lU9QlTJ8
 32+HxmQOggmXYMak68kQGdKzGQAvYTBqeHKTK/inYzi8gJHG+roO00viJACOXFW7Z7
 UT0SWT8kLafJCDJnoyC2yMitNgXZZB0Be5j2XSfuznwUWet2iWTeARjfQz6cLKIAV4
 xZvN21ad5vruA==
Date: Thu, 3 Nov 2022 16:26:12 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 hreitz@redhat.com, qemu-block@nongnu.org, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2PrpOCjKsZ+rywG@gmail.com>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain> <Y2OPaxoX7UanUzTd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2OPaxoX7UanUzTd@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ebiggers@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 10:52:43AM +0100, Kevin Wolf wrote:
> Am 02.11.2022 um 03:49 hat Eric Biggers geschrieben:
> > On Tue, Nov 01, 2022 at 07:27:16PM -0700, Eric Biggers wrote:
> > > On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> > > > Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) calls.
> > > 
> > > Citation needed.  For direct I/O to block devices, the kernel's block layer
> > > checks the alignment before the I/O is actually submitted to the underlying
> > > block device.  See
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/fops.c?h=v6.1-rc3#n306
> > > 
> > > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> > > 
> > > That "bug" seems to be based on a misunderstanding of the kernel source code,
> > > and not any actual testing.
> > > 
> > > I just tested it, and the error code is EINVAL.
> > > 
> > 
> > I think I see what's happening.  The kernel code was broken just a few months
> > ago, in v6.0 by the commit "block: relax direct io memory alignment"
> > (https://git.kernel.org/linus/b1a000d3b8ec582d).  Now the block layer lets DIO
> > through when the user buffer is only aligned to the device's dma_alignment.  But
> > a dm-crypt device has a dma_alignment of 512 even when the crypto sector size
> > (and thus also the logical block size) is 4096.  So there is now a case where
> > misaligned DIO can reach dm-crypt, when that shouldn't be possible.
> > 
> > It also means that STATX_DIOALIGN will give the wrong value for
> > stx_dio_mem_align in the above case, 512 instead of 4096.  This is because
> > STATX_DIOALIGN for block devices relies on the dma_alignment.
> 
> In other words, STATX_DIOALIGN is unusable from the start because we
> don't know whether the information it returns is actually correct? :-/

That's a silly point of view.  STATX_DIOALIGN has only been in a released kernel
for a few weeks (v6.0), the bug is only in one edge case, and it will get fixed
quickly and backported to v6.0.y where users of 6.0 will get it.

Basically every Linux API has been broken at one point or the other, but things
get fixed.  Direct I/O itself has been totally broken on some filesystems, so by
this argument why are you even using direct I/O?  Actually, why are you even
using Linux?  Just use one of those operating systems with no bugs instead.

Also note that your alternative is probing, which is super broken because many
filesystems fall back to buffered I/O for misaligned direct I/O instead of
returning an error.

So please cooperate with getting things fixed properly instead of continuing to
use broken workarounds.

> > I'll raise this on the linux-block and dm-devel mailing lists.  It
> > would be nice if people reported kernel bugs instead of silently
> > working around them...
> 
> I wasn't involved in this specific one, but in case you're wondering why
> I wouldn't have reported it either...
> 
> On one hand, I agree with you because I want bugs in my code reported,
> too, but on the other hand, it has also happened to me before that
> you're treated as the stupid userland developer who doesn't know how
> the kernel works and who should better have kept his ideas of how it
> should work to himself - which is not exactly encouraging to report
> things when you can just deal with the way they are. I wouldn't have
> been able to tell whether in the mind of the respective maintainers,
> -EINVAL is required behaviour or whether that was just a totally
> unreasonable assumption on our side. Erring on the safe side, I'll give
> up an assumption that obviously doesn't match reality.

The error code is documented in the read(2) and write(2) man pages.  So clearly
either the kernel was wrong or the man page was wrong.  Either way it needed to
be reported.

- Eric

