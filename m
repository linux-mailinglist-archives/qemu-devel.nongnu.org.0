Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F93327E37
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:23:37 +0100 (CET)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhaK-00035G-S0
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lGhYr-0002Jp-UJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lGhYo-0007NP-3F
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614601320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42vm0LUhLUEFyxx1d9i0y8u6I8WwcWY7Coxk/nq2ngM=;
 b=ScbngTWOHOJxsOhF2W8JyOWl8LlWBRjyFUsf/hAsfw4VVswrSl9NG6RZnQjK9ptaZSPb+7
 uL/lmkzI0EG3IpgIy+SaHjpCLgtTwo4K051y6nKLYUNkM0zW+ODg6/+/YlIFEPDihkK1d2
 FvgB+WrXdC7MWzpM8IbhBvlUfvFDCMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-cPe7FLCxMXqkH2B_cYfyNQ-1; Mon, 01 Mar 2021 07:21:59 -0500
X-MC-Unique: cPe7FLCxMXqkH2B_cYfyNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 146DE80196C;
 Mon,  1 Mar 2021 12:21:58 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 165795C1C4;
 Mon,  1 Mar 2021 12:21:55 +0000 (UTC)
Date: Mon, 1 Mar 2021 13:21:52 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
Message-ID: <20210301122152.GH2875719@angien.pipo.sk>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
 <20210224123305.GA11025@merkur.fritz.box>
 <05d57ba7-684b-a897-5e7e-1ebb6350ca31@virtuozzo.com>
 <20210301110726.GC7698@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210301110726.GC7698@merkur.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 12:07:26 +0100, Kevin Wolf wrote:
> Am 25.02.2021 um 18:02 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > 24.02.2021 15:33, Kevin Wolf wrote:
> > > Am 09.02.2021 um 09:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > 08.02.2021 21:44, Alberto Garcia wrote:
> > > > > Signed-off-by: Alberto Garcia <berto@igalia.com>
> > > > > ---
> > > > >    qapi/block-core.json       |  2 +-
> > > > >    include/block/block.h      |  1 +
> > > > >    block.c                    | 16 +++++--
> > > > >    blockdev.c                 | 85 +++++++++++++++++++++-----------------
> > > > >    tests/qemu-iotests/155     |  9 ++--
> > > > >    tests/qemu-iotests/165     |  4 +-
> > > > >    tests/qemu-iotests/245     | 27 +++++++-----
> > > > >    tests/qemu-iotests/248     |  2 +-
> > > > >    tests/qemu-iotests/248.out |  2 +-
> > > > >    tests/qemu-iotests/298     |  4 +-
> > > > >    10 files changed, 89 insertions(+), 63 deletions(-)
> > > > > 
> > > > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > > > index c0e7c23331..b9fcf20a81 100644
> > > > > --- a/qapi/block-core.json
> > > > > +++ b/qapi/block-core.json
> > > > > @@ -4177,7 +4177,7 @@
> > > > >    # Since: 4.0
> > > > >    ##
> > > > >    { 'command': 'x-blockdev-reopen',
> > > > > -  'data': 'BlockdevOptions', 'boxed': true }
> > > > > +  'data': { 'options': ['BlockdevOptions'] } }
> > > > 
> > > > Do we also want to drop x- prefix?
> > > 
> > > libvirt really wants to have a stable blockdev-reopen interface in 6.0
> > > because enabling the incremental backup code depends on this (they just
> > > toggle the readonly flag if I understand correctly, so most of the work
> > > we're currently doing isn't even relevant at this moment for libvirt).
> > 
> > Do you know what is the case exactly? If they do it to remove dirty bitmap
> > from backing image after snapshot operation, probably we'd better improve
> > block-dirty-bitmap-remove command to be able to reopen r-o image?
> > 
> > (I just recently faced such a task)
> 
> I think it was to switch nodes between read-only and read-write, but I
> don't remember the exact context.
> 
> Peter, can you add the details?

Libvirt indeed has code to drive blockdev-reopen to use it to toggle the
read-write state for block dirty bitmap manipulation.

Few of the cases where we use it:

- after blockjobs to toggle the destination image writable (the
  blockjobs turns it RO when it finishes) so that we can merge the
  appropriate bitmaps

- for deletion of bitmaps in backing images in the checkpoint APIs

Both of the operations really require blockdev-reopen and are required
for the incremental backup feature as whole since bitmap manipulation is
crucial for it and it doesn't happen automatically.

The blockdev code has the facilities to also use blockdev-reopen to
change RO/RW state for blockjobs if it will be needed in the future or
it can be later used to even replace the auto-read-only feature of the
protocol node drivers which were actually added to make -blockdev work
in libvirt's s-virt environment properly.


