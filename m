Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9E3C75F2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 19:49:45 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3MXQ-0003sb-TU
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 13:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3MWS-0002ah-22
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3MWQ-00039e-Ei
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626198521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4JJxrRyLUdpdC1sHcuuXyXzFvR3BSLuPmahCG+xGIA=;
 b=EHa7Rwuvhf+hPCVB9ioaH1YJh8cOx1SyGe6k2GZ1I9dr5epF098YdCG+AQ8R0NNW4qwj0X
 FExMlaAlMR/FWn1BO/i6B1ReBN0jo2h9RRK1abDgfSivHMEmQuVLLA4JoFmoZfKpJhhhaK
 UXs12cYCanaVFnv6Wx24X/8W9bvGRVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-QEWTzcP_PqKrmek-YO-61g-1; Tue, 13 Jul 2021 13:48:38 -0400
X-MC-Unique: QEWTzcP_PqKrmek-YO-61g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540C1804141;
 Tue, 13 Jul 2021 17:48:37 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EDAC60657;
 Tue, 13 Jul 2021 17:48:36 +0000 (UTC)
Date: Tue, 13 Jul 2021 12:48:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2 2/3] qemu-img: Fail fast on convert --bitmaps with
 inconsistent bitmap
Message-ID: <20210713174834.zbnqmo2mfzcdsdcq@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-3-eblake@redhat.com>
 <a5a194b3-4d9c-c64a-ad62-be20e5a64b99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5a194b3-4d9c-c64a-ad62-be20e5a64b99@redhat.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Sat, Jul 10, 2021 at 09:06:24PM +0300, Nir Soffer wrote:
> On 7/9/21 6:39 PM, Eric Blake wrote:
> > Waiting until the end of the convert operation (a potentially
> > time-consuming task) to finally detect that we can't copy a bitmap is
> > bad, comparing to failing fast up front.  Furthermore, this prevents
> > us from leaving a file behind with a bitmap that is not marked as
> > inconsistent even though it does not have sane contents.
> 
> I don't think this is an issue since qemu-img terminate with non-zero
> exit code, and we cannot ensure that image is complete if we fail in
> the middle of the operation for all image formats and protocols.
> 
> For files we could use a temporary file and rename after successful
> conversion for for raw format on block device we don't have any way
> to mark the contents as temporary.

Atomic rename into place for files is nice, but as you point out, it
doesn't help when targetting block devices.  So whatever we do to keep
block devices robust even across temporary state changes is also
sufficient for files, even if we can indeed improve the situation for
files in a later patch.

> 
> But failing fast is very important.
> 
> > This fixes the problems exposed in the previous patch to the iotest.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >   qemu-img.c                                    | 30 +++++++++++++++++--
> >   tests/qemu-iotests/tests/qemu-img-bitmaps     |  2 --
> >   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 20 ++-----------
> >   3 files changed, 29 insertions(+), 23 deletions(-)
> > 
> > diff --git a/qemu-img.c b/qemu-img.c
> > index 7956a8996512..e84b3c530155 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -2101,6 +2101,30 @@ static int convert_do_copy(ImgConvertState *s)
> >       return s->ret;
> >   }
> > 
> > +/* Check that bitmaps can be copied, or output an error */
> > +static int convert_check_bitmaps(BlockDriverState *src)
> > +{
> > +    BdrvDirtyBitmap *bm;
> > +
> > +    if (!bdrv_supports_persistent_dirty_bitmap(src)) {
> > +        error_report("Source lacks bitmap support");
> > +        return -1;
> > +    }
> > +    FOR_EACH_DIRTY_BITMAP(src, bm) {
> > +        const char *name;
> > +
> > +        if (!bdrv_dirty_bitmap_get_persistence(bm)) {
> > +            continue;
> > +        }
> > +        name = bdrv_dirty_bitmap_name(bm);
> > +        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> > +            error_report("Cannot copy inconsistent bitmap '%s'", name);
> 
> We can add a useful hint:
> 
>     Try "qemu-img bitmap --remove" to delete this bitmap from disk.

Yeah, that might be worthwhile.

> 
> > +            return -1;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> >   static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> >   {
> >       BdrvDirtyBitmap *bm;
> > @@ -2127,6 +2151,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> >                                 &err);
> >           if (err) {
> >               error_reportf_err(err, "Failed to populate bitmap %s: ", name);
> > +            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);
> 
> This may fail for the same reason populate failed (e.g. storage became
> inaccessibel in the middle of the copy). Since we fail the convert, I don't
> think it worth to try to do this kind of cleanup.
> 
> If we have a way to disable the bitmap before merge, and enable it after
> successful merge it make more sense, since if the operation fails we are
> left with disabled bitmap.

If we got this far, the guest-visible data WAS copied successfully.
'qemu-img compare' will report success.  The only thing broken at this
point is a bogus bitmap, and leaving a just-created (but empty) bitmap
in place rather than erasing it (since we just created it a few lines
above) is not nice.  I see no problem with keeping this cleanup path
intact, even if it is seldom reached, and even though we still exit
the overall qemu-img convert with an error.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


