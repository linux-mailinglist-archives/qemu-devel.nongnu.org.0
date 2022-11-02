Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F1615862
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 03:50:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq3oo-0004xv-T1; Tue, 01 Nov 2022 22:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq3om-0004x9-G7; Tue, 01 Nov 2022 22:49:28 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq3ok-0000Ag-JW; Tue, 01 Nov 2022 22:49:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 024EB61729;
 Wed,  2 Nov 2022 02:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DFEC433D6;
 Wed,  2 Nov 2022 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667357362;
 bh=bPQ9S5JT2H4RJSyJaSOScxcRTwVV93Xm8K/5OBN1/ic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC7z2M0vrlSrHiDuM0gG1FBNO3AHEBghnalC1voum4BZmB3D2USgtZoO2/4HJgu8I
 HRJu/30cmJOyYc7zGEsm6shqCQaF83gxwySYrrDd3Jimq4cDDfpRJPBiFSdxEMEmCu
 ZCp1lSk01Qp7CQ1KSDlho61ATyqZtsK3QBCFkfdiDHQ9Ng4feGFwrLqwD4gg22e0Eo
 tKvuxi4KdTqKOBs2mNockA0wHG8w7qMaUg/F+t2lVtasFocZhlKpoI1xY7zZKnmggf
 JAYwB1cEQV/tS3D4TxxY/9RqcD5tzasER76LHvg26W+opIjWeuIEzZp5dMFtoSicRO
 NEv3I1KJx2hdA==
Date: Tue, 1 Nov 2022 19:49:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2HasGvN6qMFq29A@sol.localdomain>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2HVgnwAPdTIaZR6@sol.localdomain>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ebiggers@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, Nov 01, 2022 at 07:27:16PM -0700, Eric Biggers wrote:
> On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> > Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) calls.
> 
> Citation needed.  For direct I/O to block devices, the kernel's block layer
> checks the alignment before the I/O is actually submitted to the underlying
> block device.  See
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/fops.c?h=v6.1-rc3#n306
> 
> > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> 
> That "bug" seems to be based on a misunderstanding of the kernel source code,
> and not any actual testing.
> 
> I just tested it, and the error code is EINVAL.
> 

I think I see what's happening.  The kernel code was broken just a few months
ago, in v6.0 by the commit "block: relax direct io memory alignment"
(https://git.kernel.org/linus/b1a000d3b8ec582d).  Now the block layer lets DIO
through when the user buffer is only aligned to the device's dma_alignment.  But
a dm-crypt device has a dma_alignment of 512 even when the crypto sector size
(and thus also the logical block size) is 4096.  So there is now a case where
misaligned DIO can reach dm-crypt, when that shouldn't be possible.

It also means that STATX_DIOALIGN will give the wrong value for
stx_dio_mem_align in the above case, 512 instead of 4096.  This is because
STATX_DIOALIGN for block devices relies on the dma_alignment.

I'll raise this on the linux-block and dm-devel mailing lists.  It would be nice
if people reported kernel bugs instead of silently working around them...

- Eric

