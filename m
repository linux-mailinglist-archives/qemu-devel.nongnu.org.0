Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7493C7600
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 19:54:16 +0200 (CEST)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Mbm-0002dM-UF
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 13:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3Maf-0001Vb-TJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3Mab-0006Bs-OP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626198780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4JU30cM3gl7D7yY1509eX+SlNwyGNbAmsB/aBAd5f5U=;
 b=N9hStK5k3nz6S7REUlXx6r2Ef7CDzZSHxLruUkKsIao2nVXv8s99lz/9e9CcPIu8u2KoO6
 AORIhSqocxcWXze/4em1rgiZeDFUY/1jRsbAXHmEAZBOJ+WiWvFMwCfSb9v9dg/0Sspbcv
 ZvZZenI2wplkHm7Z9PQm0s79iZ3MVpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-gtCho3syMpayK_quChM3fw-1; Tue, 13 Jul 2021 13:52:59 -0400
X-MC-Unique: gtCho3syMpayK_quChM3fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8891C801107;
 Tue, 13 Jul 2021 17:52:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCE6D60BD8;
 Tue, 13 Jul 2021 17:52:57 +0000 (UTC)
Date: Tue, 13 Jul 2021 12:52:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2 3/3] qemu-img: Add --skip-broken-bitmaps for 'convert
 --bitmaps'
Message-ID: <20210713175255.papat2frmbxcdrs5@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-4-eblake@redhat.com>
 <32217a0a-f9cf-dba6-1f07-0b540ae1ae6f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32217a0a-f9cf-dba6-1f07-0b540ae1ae6f@redhat.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 10, 2021 at 09:37:35PM +0300, Nir Soffer wrote:
> > We don't want to delete inconsistent bitmaps by default: although a
> > corrupt bitmap is only a loss of optimization rather than a corruption
> > of user-visible data, it is still nice to require the user to opt in
> > to the fact that they are aware of the loss of the bitmap.  Still,
> > requiring the user to check 'qemu-img info' to see whether bitmaps are
> > consistent, then use 'qemu-img bitmap --remove' to remove offenders,
> > all before using 'qemu-img convert', is a lot more work than just
> > adding a knob 'qemu-img convert --bitmaps --skip-broken-bitmaps' which
> > opts in to skipping the broken bitmaps.
> 
> I think this is more than convenience. During live storage migration in
> oVirt, we mirror the top layer to the destination using libvirt blockCopy,
> and copy the rest of the chain using qemu-img convert with the --bitmaps
> option.

Still, this feels like enough of a feature that I'd really like R-b in
time to prepare a pull request for inclusion in soft freeze; the
justification for it being a bug fix is a tough sell.

> > +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> 
> I liked --skip-broken more, but Vladimir is right that this is not really a
> sub-option.

getopt_long() lets you abbreviate; '--sk' and '--skip-broken' are both
unambiguous prefixes of '--skip-broken-bitmaps'.

> > @@ -2117,7 +2118,7 @@ static int convert_check_bitmaps(BlockDriverState *src)
> >               continue;
> >           }
> >           name = bdrv_dirty_bitmap_name(bm);
> > -        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> > +        if (!skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> >               error_report("Cannot copy inconsistent bitmap '%s'", name);
> 
> We can add another hint:
> 
>     Try --skip-brocken-bitmaps to skip this bitmap or "qemu-img bitmap
>     --remove" to delete it from disk.

Sure, I can see about adding that.


> 
> >               return -1;
> >           }
> > @@ -2125,7 +2126,8 @@ static int convert_check_bitmaps(BlockDriverState *src)
> >       return 0;
> >   }
> > 
> > -static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> > +static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst,
> > +                                bool skip_broken)
> >   {
> >       BdrvDirtyBitmap *bm;
> >       Error *err = NULL;
> > @@ -2137,6 +2139,10 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> >               continue;
> >           }
> >           name = bdrv_dirty_bitmap_name(bm);
> > +        if (skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> > +            warn_report("Skipping inconsistent bitmap %s", name);
> 
> In other logs we quote the bitmap name:'%s'

Yes, will fix.

> > +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> > @@ -143,6 +143,16 @@ $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
> >       echo "unexpected success"
> >   TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> >       | _filter_irrelevant_img_info
> 
> A new title here will make the test output much more clear.

Or even just a bare 'echo' to separate things with blank lines.  Will
improve.

> > +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> > @@ -145,4 +145,35 @@ Format specific information:
> >       corrupt: false
> >   qemu-img: Cannot copy inconsistent bitmap 'b0'
> >   qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory
> 
> Why to we get this error? I guess it is part of the first copy that should
> fail?

Yes - proof that we no longer leave a broken file around, but instead
failed fast (in fact, that's part of the previous patch).

> 
> > +qemu-img: warning: Skipping inconsistent bitmap b0
> > +qemu-img: warning: Skipping inconsistent bitmap b2
> 
> Looks useful, I need to check that we log such warnings.
>

Anything else I should improve before sending a v2?


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


