Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5887539E946
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 00:06:13 +0200 (CEST)
Received: from localhost ([::1]:34818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqNNr-0002VP-Hg
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 18:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqNMq-0001LJ-Eo
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqNMn-00047l-31
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623103503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=83c5ZWL4hiRduX01x8rT8JyFnWBLoUPojKOvCm+s2AU=;
 b=D06OJ+nF0/ShxippwfpIg8lJno4W0hGLDTnBYF9/K1muOIm1KHzy309R3tGW9BqTb8q6Oc
 F0uZmTGvkF8G1TBzJ2ke8hUncHOafL75paTQHN59urJJyz7NfD/RDUiOB0COxg7vSIJuvi
 vpe7LwE2OWZBVvv19ta0maokOIgJ7C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Yk2-87oQMOys_QDzSqgRjA-1; Mon, 07 Jun 2021 18:04:58 -0400
X-MC-Unique: Yk2-87oQMOys_QDzSqgRjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F4A800C60;
 Mon,  7 Jun 2021 22:04:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C0DB608BA;
 Mon,  7 Jun 2021 22:04:56 +0000 (UTC)
Date: Mon, 7 Jun 2021 17:04:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nirsof@gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210607220454.7yo7gubvfkiw2brh@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 04:22:27PM -0500, Eric Blake wrote:

[replying to myself]

> > Here is simpler reproducer:
> > 
> >     # Create a qcow2 image with a raw backing file:
> >     $ qemu-img create base.raw $((4*64*1024))
> >     $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
> > 
> >     # Write to first 3 clusters of base:
> >     $ qemu-io -f raw -c "write -P 65 0 64k" base.raw
> >     $ qemu-io -f raw -c "write -P 66 64k 64k" base.raw
> >     $ qemu-io -f raw -c "write -P 67 128k 64k" base.raw
> > 
> >     # Write to second cluster of top, hiding second cluster of base:
> >     $ qemu-io -f qcow2 -c "write -P 69 64k 64k" top.qcow2
> > 
> >     # Write zeroes to third cluster of top, hiding third cluster of base:
> >     $ qemu-io -f qcow2 -c "write -z 128k 64k" top.qcow2

Aha. While reproducing this locally, I typoed this as 'write -z 12k
64k', which absolutely changes the map produced...

> 
> $ ./qemu-nbd -r -t -f qcow2 top.qcow2 -A
> $ nbdinfo --map=qemu:allocation-depth nbd://localhost
>          0      131072    1  local
>     131072      131072    2  backing depth 2
> 
> However, _that_ output looks odd - it claims that clusters 0 and 1 are
> local, and 2 and 3 come from a backing file.  Without reading code, I
> would have expected something closer to the qcow2 view, claiming that
> clusters 1 and 2 are local, while 0 and 3 come from a backing file (3
> could also be reported as unallocated, but only if you use a qcow2 as
> the backing file instead of raw, since we have no easy way to
> determine which holes map to file system allocations in raw files).

and totally explains my confusion here.

> 
> /me goes to debug...  I'll need to reply in a later email when I've
> spent more time on that.
> 

After recreating the file properly, by writing the zeroes at 128k
instead of 12k, I now see:

$ nbdinfo --map=qemu:allocation-depth nbd://localhost
         0       65536    2  backing depth 2
     65536      131072    1  local
    196608       65536    2  backing depth 2

which is EXACTLY what I expected.  And sufficient for you to recreate
your backing chain:

Cluster 0 is backing depth 2 + allocated, so it comes from the backing
file; nothing to write in your replacement top.qcow2.  Cluster 1 is
local + allocated, so it comes from top.qcow2 and consists of actual
data, definitely write that one.  Cluster 2 is local + hole,zero, so
it reads as zero, but comes from top.qcow2 without any allocation;
when building your replacement .qcow2 file, you MUST write this
cluster to match the local allocation and override anything being
inherited from the backing file, but it is up to you whether you write
it as allocated zeroes or as an unallocated but reads-as-zero cluster.
Cluster 3 is backing depth 2 + hole,zero, which means it was read from
the backing file, and you can safely omit it from your replacement
top.qcow2.

> In short, I agree that the current situation is awkward, but I'm not
> sure that this patch is right.  Rather, I'm wondering if we have a bug
> in qemu:allocation-depth, and where once that is fixed, you should be
> using that alongside base:allocation when deciding how to guess on how
> to reconstruct a qcow2 backing chain using only information learned
> over NBD.

And since the problem was in my command line transcription skills, and
not in qemu proper, I don't think we want this patch; rather, I feel
we are better served if you could fix your downstream tooling to start
using qemu:allocation-depth if you are trying to recreate which
portions of a qcow2 file MUST be written in order for that qcow2 file
backed by a different image to provide the same data as seen over NBD.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


