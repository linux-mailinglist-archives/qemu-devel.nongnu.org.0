Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4E5F2376
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oezTp-0003pf-6N
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oezSm-0002Mv-SR
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:57:00 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oezSk-0001aG-Np
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:57:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86862B80C99;
 Sun,  2 Oct 2022 13:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2ECC433D7;
 Sun,  2 Oct 2022 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664719014;
 bh=qO3hIZW9pTAXKAlh4vUiIdwgn5hVGFl9JsBQtCk2vTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OwTEsbDGZpJUFCshG3OmtnH8tG8GH3WveLWD6/uaCyoziZPNRIPBOJ6itJLW0CqDm
 rcBimG+xXPNxIwM5zT/DeJZLUYLSTK+DqFkVJdZa37DeGFP7QtEEUrTpdY8JsGcBfS
 7OaosCYqWKT9GqDYG5JNul2enF1/Rd3Ukdk+3u7v4wpXexzgepeYmvggtOSCqoD0Gn
 JX4JLriIBKxKnKWyVp65fPRi7BltatpYYIzIm7vToyctgL6TKCz6HyucyRjkKCOKWl
 M5UFVEbr0AkgGAI7pUCBFlR2UFzwDoZeS3u9rr6V+HTIE38YOKTr2lPWHvIzweAo7D
 cQWR+aHvJxfjA==
Date: Sun, 2 Oct 2022 07:56:50 -0600
From: Keith Busch <kbusch@kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Kevin Wolf <kwolf@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Message-ID: <YzmYojlHKZ79mseE@kbusch-mbp>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
 <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
 <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
 <20220929163931.GA10232@lst.de>
 <32db4f89-a83f-aac4-5d27-0801bdca60bf@redhat.com>
 <28ce86c01271c1b9b8f96a7783b55a8d458325d2.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ce86c01271c1b9b8f96a7783b55a8d458325d2.camel@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 02, 2022 at 11:59:42AM +0300, Maxim Levitsky wrote:
> On Thu, 2022-09-29 at 19:35 +0200, Paolo Bonzini wrote:
> > On 9/29/22 18:39, Christoph Hellwig wrote:
> > > On Thu, Sep 29, 2022 at 10:37:22AM -0600, Keith Busch wrote:
> > > > > I am aware, and I've submitted the fix to qemu here:
> > > > > 
> > > > >   https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html
> > > > 
> > > > I don't think so. Memory alignment and length granularity are two completely
> > > > different concepts. If anything, the kernel's ABI had been that the length
> > > > requirement was also required for the memory alignment, not the other way
> > > > around. That usage will continue working with this kernel patch.
> 
> Yes, this is how I also understand it - for example for O_DIRECT on a file which
> resides on 4K block device, you have to use page aligned buffers.
> 
> But here after the patch, 512 aligned buffer starts working as well - If I
> understand you correctly the ABI didn't guarantee that such usage would fail,
> but rather that it might fail.

The kernel patch will allow buffer alignment to work with whatever the hardware
reports it can support. It could even as low as byte aligned if that's the
hardware can use that.

The patch aligns direct-io with the same criteria blk_rq_map_user() has always
used to know if the user space buffer is compatible with the hardware's dma
requirements. Prior to this patch, the direct-io memory alignment was an
artificial software constraint, and that constraint creates a lot of
unnecessary memory pressure.

As has always been the case, each segment needs to be a logical block length
granularity. QEMU assumed a buffer's page offset also defined the logical block
size instead of using the actual logical block size that it had previously
discovered directly.

> If I understand that correctly, after the patch in question, 
> qemu is able to use just 512 bytes aligned buffer to read a single 4K block from the disk,
> which supposed to fail but wasn't guarnteed to fail.
> 
> Later qemu it submits iovec which also reads a 4K block but in two parts,
> and if I understand that correctly, each part (iov) is considered
> to be a separate IO operation,  and thus each has to be in my case 4K in size, 
> and its memory buffer *should* also be 4K aligned.
>
> (but it can work with smaller alignement as well).

Right. The iov length needs to match the logical block size. The iov's memory
offset needs to align to the queue's dma_alignment attribute. The memory
alignment may be smaller than a block size.
 
> Assuming that I understand all of this correctly, I agree with Paolo that this is qemu
> bug, but I do fear that it can cause quite some problems for users,
> especially for users that use outdated qemu version.
> 
> It might be too much to ask, but maybe add a Kconfig option to keep legacy behavier
> for those that need it?

Kconfig doesn't sound right.

The block layer exports all the attributes user space needs to know about for
direct io.

  iov length:    /sys/block/<block-dev>/queue/logical_block_size
  iov mem align: /sys/block/<block-dev>/queue/dma_alignment

If you really want to change the behavior, I think maybe we could make the
dma_alignment attribute writeable (or perhaps add a new attribute specifically
for dio_alignment) so the user can request something larger.

