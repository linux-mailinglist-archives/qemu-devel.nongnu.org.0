Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A05440443
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:41:30 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYgr-0007QQ-B5
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYRs-0001sx-Jp
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYRp-000223-OD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635539155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yLJ8hNf/zCn6PN5OKRdVoO3Fn4Kr/pjRdsySfVC7qno=;
 b=DF70nZ+Y2ff/rtKKRqexrmQIafURPjz3A9DJRMCweFrrAoOQ7lwffWjpOfsmzpN001ioY+
 +rkkYTBWjtn9wRZ2dU1lCqWEMwum2DBqGGhHXZK6oywf1DDOcf6UFIeTSbeFK+1GcqF+jA
 9MTg+8zMkGNgQxX4Qz9Vc/wUpHQcwZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-t8SkRxhSOxu6vQSurMFkaA-1; Fri, 29 Oct 2021 16:25:49 -0400
X-MC-Unique: t8SkRxhSOxu6vQSurMFkaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B77802928;
 Fri, 29 Oct 2021 20:25:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DAD27060;
 Fri, 29 Oct 2021 20:25:43 +0000 (UTC)
Date: Fri, 29 Oct 2021 15:25:41 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/4] qemu-img: implement compare --stat
Message-ID: <20211029202541.r56oijl2gclu2avy@redhat.com>
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211028102441.1878668-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, nikita.lapshin@virtuozzo.com,
 qemu-devel@nongnu.org, nsoffer@redhat.com, hreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:24:38PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> With new option qemu-img compare will not stop at first mismatch, but

With the new --stat option, qemu-img compare...

[Of course the subject line should be self-contained: think 'git
shortlog' and friends.  But I also argue the commit body should
generally be self-contained, rather than assuming you read the subject
line - why? because there are enough user interfaces out there
(including my email program) where the subject line is displayed
visually far away from the body, to the point that it is not always
safe to assume someone read the subject line.  If it feels too
redundant, visual tricks like starting the body with '...' force the
reader to realize they need to read the subject for full context, but
that comes with its own set of oddities]

> instead calculate statistics: how many clusters with different data,
> how many clusters with equal data, how many clusters were unallocated
> but become data and so on.
> 
> We compare images chunk by chunk. Chunk size depends on what
> block_status returns for both images. It may return less than cluster
> (remember about qcow2 subclusters), it may return more than cluster (if
> several consecutive clusters share same status). Finally images may
> have different cluster sizes. This all leads to ambiguity in how to
> finally compare the data.
> 
> What we can say for sure is that, when we compare two qcow2 images with
> same cluster size, we should compare clusters with data separately.
> Otherwise, if we for example compare 10 consecutive clusters of data
> where only one byte differs we'll report 10 different clusters.
> Expected result in this case is 1 different cluster and 9 equal ones.
> 
> So, to serve this case and just to have some defined rule let's do the
> following:
> 
> 1. Select some block-size for compare procedure. In this commit it must
>    be specified by user, next commit will add some automatic logic and
>    make --block-size optional.
> 
> 2. Go chunk-by-chunk using block_status as we do now with only one
>    differency:

difference

>    If block_status() returns DATA region that intersects block-size
>    aligned boundary, crop this region at this boundary.
> 
> This way it's still possible to compare less than cluster and report
> subcluster-level accuracy, but we newer compare more than one cluster
> of data.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/tools/qemu-img.rst |  18 +++-
>  qemu-img.c              | 210 +++++++++++++++++++++++++++++++++++++---
>  qemu-img-cmds.hx        |   4 +-
>  3 files changed, 216 insertions(+), 16 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index d58980aef8..8b6b799dd4 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>  
>    Strict mode - fail on different image size or sector allocation
>  
> +.. option:: --stat
> +
> +  Instead of exiting on the first mismatch, compare the whole images
> +  and print statistics on the amount of different pairs of blocks,
> +  based on their block status and whether they are equal or not.
> +
> +.. option:: --block-size BLOCK_SIZE
> +
> +  Block size for comparing with ``--stat``. This doesn't guarantee an
> +  exact size for comparing chunks, but it does guarantee that those
> +  chunks will never cross a block-size-aligned boundary.

Would it be safe to require that this be a power-of-2?  (If anything,
requiring now and relaxing later is better than allowing any number
now but later wishing it were a sane number)

> +
>  Parameters to convert subcommand:
>  
>  .. program:: qemu-img-convert
> @@ -378,7 +390,7 @@ Command description:
>  
>    The rate limit for the commit process is specified by ``-r``.
>  
> -.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
> +.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
>  
>    Check if two images have the same content. You can compare images with
>    different format or settings.
> @@ -405,9 +417,9 @@ Command description:
>    The following table sumarizes all exit codes of the compare subcommand:
>  
>    0
> -    Images are identical (or requested help was printed)
> +    Images are identical (or requested help was printed, or ``--stat`` was used)
>    1
> -    Images differ
> +    Images differ (1 is never returned when ``--stat`` option specified)

Why not?  Even when we print statistics, it's still easy to tell if
the data appears identical (block status might differ, but the guest
would see the same content), or had at least one difference.

>    2
>      Error on opening an image
>    3
> diff --git a/qemu-img.c b/qemu-img.c
> index f036a1d428..0cb7cebe91 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c

> +static void cmp_stat_print_status(int status)
> +{
> +    printf("%s%s%s%s",
> +           status & BDRV_BLOCK_DATA ? "D" : "_",
> +           status & BDRV_BLOCK_ZERO ? "Z" : "_",
> +           status & BDRV_BLOCK_ALLOCATED ? "A" : "_",
> +           status & BDRV_BLOCK_EOF ? "E" : "_");

Would this be more efficient with "%c%c%c%c" as the format, and using
'_' and friends below?

> @@ -1410,6 +1528,25 @@ static int img_compare(int argc, char **argv)
>      filename1 = argv[optind++];
>      filename2 = argv[optind++];
>  
> +    if (!stat && block_size) {
> +        error_report("--block-size can be used only together with --stat");
> +        ret = 2;
> +        goto out3;
> +    }
> +
> +    if (stat && !block_size) {
> +        /* TODO: make block-size optional */
> +        error_report("You must specify --block-size together with --stat");
> +        ret = 2;
> +        goto out3;
> +    }
> +
> +    if (stat && strict) {
> +        error_report("--stat can't be used together with -s");
> +        ret = 2;
> +        goto out3;
> +    }

Given this block...

>  
>          assert(pnum1 && pnum2);
>          chunk = MIN(pnum1, pnum2);
>  
> -        if (strict) {
> +        if (strict && !stat) {

...the check for !stat here is dead.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


