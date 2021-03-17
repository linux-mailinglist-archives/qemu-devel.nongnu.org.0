Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4A33F643
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:07:13 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZdW-0003Ck-8J
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMZBd-00054M-LN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMZBY-0006jL-In
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615999094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=inowED2en/MCkL+q+3Zq25IyC6ShuRXrH6tWzSv1t3A=;
 b=TKJBnebCeb0MBp1j/bWyPsaCo/pB/k9PcRRN8AbdTFVwKYmmEqb2TF2e9cOwU7cjr77jzb
 52cn6+td0OnGbbYtSdH+DNc03ZajBzqBBvuqnQrV5u4mzlTd87HAAdBTU7HefIzyaVjSr8
 RPLPK6nJlek5/+Z+0Zl+RsI6OhcLNmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-0tYwMHChPlKAWuUUsFSypQ-1; Wed, 17 Mar 2021 12:38:12 -0400
X-MC-Unique: 0tYwMHChPlKAWuUUsFSypQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 207378064D2;
 Wed, 17 Mar 2021 16:38:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F8B19C45;
 Wed, 17 Mar 2021 16:38:09 +0000 (UTC)
Date: Wed, 17 Mar 2021 17:38:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH] curl: Allow reading after EOF
Message-ID: <YFIwcFbh5S+r2hmA@merkur.fritz.box>
References: <20210317151734.41656-1-kwolf@redhat.com>
 <79654a81-d1aa-f2a2-a6a3-59737798e0e8@redhat.com>
 <0718a09a-e30d-fb5c-db53-77bcdec95bb3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0718a09a-e30d-fb5c-db53-77bcdec95bb3@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: afrosi@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 16:46 hat Eric Blake geschrieben:
> On 3/17/21 10:32 AM, Eric Blake wrote:
> > On 3/17/21 10:17 AM, Kevin Wolf wrote:
> >> This makes the curl driver more consistent with file-posix in that it
> >> doesn't return errors any more for reading after the end of the remote
> >> file. Instead, zeros are returned for these areas.
> >>
> >> This inconsistency was reported in:
> >> https://bugzilla.redhat.com/show_bug.cgi?id=1935061
> >>
> >> Note that the image used in this bug report has a corrupted snapshot
> >> table, which means that the qcow2 driver tries to do a zero-length read
> >> after EOF on its image file.
> >>
> >> The old behaviour of the curl driver can hardly be called a bug, but the
> >> inconsistency turned out to be confusing.
> >>
> >> Reported-by: Alice Frosi <afrosi@redhat.com>
> >> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >> ---
> >>
> >> It is not entirely clear to me if this is something we want to do. If we
> >> do care about consistency between protocol drivers, something like this
> >> should probably be done in block/io.c eventually - but that would
> >> require converting bs->total_sectors to byte granularity first.
> > 
> > Something that's been (low priority) on my todo list for a while.  NBD
> > has the same problem.
> 
> Actually, NBD has already been patched to fuzz around the lack of
> byte-accurateness in the block layer; see commit 9cf638508.  So doing
> something similar in the curl driver as a workaround until the block
> layer does it for everyone is tolerable, but does not scale.

Right, duplicating the same code in every protocol driver wouldn't be
great.

> >> Any opinions on what the most desirable semantics would be and whether
> >> we should patch individual drivers until we can have a generic solution?
> > 
> > In nbdkit, we took the following approach in the 'truncate' driver:
> > 
> > If presented with an image that is not a multiple of the desired block
> > size, we round the image size up (corner cases for images with sizes
> > near 2^63 where rounding would wrap to negative; and since qemu enforces
> > a max image size at 2^63-2^32 to avoid 32-bit operations ever
> > overflowing).  Reads of the virtual tail come back as zero, writes to
> > the virtual tail are allowed if they would write zero into the tail, and
> > fail with ENOSPC otherwise.
> 
> The current code in block/nbd.c does this for reads, but fails on EIO
> without regards to the content of what is being attempted to write into
> that tail.  I like the nbdkit behavior better.

I don't, honestly. Making the success of a write depend on the content
written is just too surprising. Is there a real use case behind this
that would justify it?

I think the file-posix behaviour (which is really just the kernel
behaviour) is the most sane: On regular files, which can be extended,
extend the image file on writes. On block devices, return -ENOSPC.

> > Doing that in the block layer makes more sense than doing it per-driver.
> > 
> > Thus, I'm not sure if I'm a fan of this patch.

What we need to decide is the semantics that we want to have.

If the behaviour implemented by this patch (or a similar patch) is what
we want, then I would say we should commit it, even if we're planning to
refactor things in the long term so that it's implemented in the generic
block layer.

> >>
> >>  block/curl.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/block/curl.c b/block/curl.c
> >> index 50e741a0d7..a8d87a1813 100644
> >> --- a/block/curl.c
> >> +++ b/block/curl.c
> >> @@ -898,6 +898,7 @@ out:
> >>  static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
> >>          uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
> >>  {
> >> +    BDRVCURLState *s = bs->opaque;
> >>      CURLAIOCB acb = {
> >>          .co = qemu_coroutine_self(),
> >>          .ret = -EINPROGRESS,
> >> @@ -906,6 +907,15 @@ static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
> >>          .bytes = bytes
> >>      };
> >>  
> >> +    if (offset > s->len || bytes > s->len - offset) {
> >> +        uint64_t req_bytes = offset > s->len ? 0 : s->len - offset;
> >> +        qemu_iovec_memset(qiov, req_bytes, 0, bytes - req_bytes);
> >> +        bytes = req_bytes;
> 
> In nbd.c, I also have:
>    if (offset >= client->info.size) {
>         assert(bytes < BDRV_SECTOR_SIZE);
> 
>     if (offset + bytes > client->info.size) {
>         assert(slop < BDRV_SECTOR_SIZE);
> 
> With those assertions added, I can give it

Hm, that requires splitting it into two blocks. Maybe I should just copy
the whole thing from the NBD driver. Makes it a bit longer, but then
it's more obviously doing the same.

Anyway, these assertions show that we have already decided on the
desired behaviour for reads because we already read zeros in
bdrv_aligned_preadv() as long as things are sector aligned. Changing
bs->total_sectors to bytes would result in the same behaviour as this
patch.

What we can try is how hard this conversion is really. If we can just do
it right away, it's probably preferable.

Kevin


