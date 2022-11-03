Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F847617A45
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqWuF-0002pz-79; Thu, 03 Nov 2022 05:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqWu5-0002n8-0X
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqWu2-0006m2-UR
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667469169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWKv8G6ZqTaiCGbF4Po/Mxmb1Vf5/saS76/1Ed6HJ24=;
 b=EbgYJHk9wPkv4d2Fl3blryYIJxgFwW7oyBuq9oSkt8Ikcm8ultEoyRXyjme3Rj5nBFYmti
 z7vNtnNbXjeEnuGWTldWnN8wUUQsN9F75dbZU2TTt4vaI4dKIeeslGtDIIe8pCq+6oYVZx
 IvdSUSMEWN855bnRlFrTOKiU1Y07uPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-i2lMptITPrOtPe-hwF8dcg-1; Thu, 03 Nov 2022 05:52:46 -0400
X-MC-Unique: i2lMptITPrOtPe-hwF8dcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B388E1C0513A;
 Thu,  3 Nov 2022 09:52:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3374C1908B;
 Thu,  3 Nov 2022 09:52:44 +0000 (UTC)
Date: Thu, 3 Nov 2022 10:52:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 hreitz@redhat.com, qemu-block@nongnu.org, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2OPaxoX7UanUzTd@redhat.com>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2HasGvN6qMFq29A@sol.localdomain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 02.11.2022 um 03:49 hat Eric Biggers geschrieben:
> On Tue, Nov 01, 2022 at 07:27:16PM -0700, Eric Biggers wrote:
> > On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> > > Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) calls.
> > 
> > Citation needed.  For direct I/O to block devices, the kernel's block layer
> > checks the alignment before the I/O is actually submitted to the underlying
> > block device.  See
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/fops.c?h=v6.1-rc3#n306
> > 
> > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> > 
> > That "bug" seems to be based on a misunderstanding of the kernel source code,
> > and not any actual testing.
> > 
> > I just tested it, and the error code is EINVAL.
> > 
> 
> I think I see what's happening.  The kernel code was broken just a few months
> ago, in v6.0 by the commit "block: relax direct io memory alignment"
> (https://git.kernel.org/linus/b1a000d3b8ec582d).  Now the block layer lets DIO
> through when the user buffer is only aligned to the device's dma_alignment.  But
> a dm-crypt device has a dma_alignment of 512 even when the crypto sector size
> (and thus also the logical block size) is 4096.  So there is now a case where
> misaligned DIO can reach dm-crypt, when that shouldn't be possible.
> 
> It also means that STATX_DIOALIGN will give the wrong value for
> stx_dio_mem_align in the above case, 512 instead of 4096.  This is because
> STATX_DIOALIGN for block devices relies on the dma_alignment.

In other words, STATX_DIOALIGN is unusable from the start because we
don't know whether the information it returns is actually correct? :-/

I guess we could still use the value returned by STATX_DIOALIGN as a
preferred value that we'll use if it survives probing, and otherwise
fall back to the same probing we've always been doing because there was
no (or no sane) way to get the information from the kernel.

> I'll raise this on the linux-block and dm-devel mailing lists.  It
> would be nice if people reported kernel bugs instead of silently
> working around them...

I wasn't involved in this specific one, but in case you're wondering why
I wouldn't have reported it either...

On one hand, I agree with you because I want bugs in my code reported,
too, but on the other hand, it has also happened to me before that
you're treated as the stupid userland developer who doesn't know how
the kernel works and who should better have kept his ideas of how it
should work to himself - which is not exactly encouraging to report
things when you can just deal with the way they are. I wouldn't have
been able to tell whether in the mind of the respective maintainers,
-EINVAL is required behaviour or whether that was just a totally
unreasonable assumption on our side. Erring on the safe side, I'll give
up an assumption that obviously doesn't match reality.

And even a kernel fix now doesn't change that there are broken kernels
out there and we need to work with them. So reporting it doesn't even
solve our problem, it's just additional effort with limited expectations
of success.

Kevin


