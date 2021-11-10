Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5C44C48B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:38:17 +0100 (CET)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpg0-00050p-Pz
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:38:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mkpen-0004Bs-Be
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mkpel-0005yC-9F
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636558618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TB3z8P8huEG96OOT3ZSQofcOtu11iHt2AtqUlg4DIlE=;
 b=TjBQAz/WRJJzZuy2F/GJRZ4pa47ONt3muG3h3dIvvv7lBVDWZWUFuX2aTTW2NW0QZbeqQI
 2Z8Y8G59EZhhyeoY4AKnk1mKLPgEiYLGlpU8rk4c44qwGeGwvQV2paFEIuegxovzhHXmne
 n+YJQWCjDKJFclUpF3ykt27HpV9iZTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-m4EYGnFwMRmjEHQZzygnbA-1; Wed, 10 Nov 2021 10:36:55 -0500
X-MC-Unique: m4EYGnFwMRmjEHQZzygnbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AD18F6A92;
 Wed, 10 Nov 2021 15:36:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA28B1017CE3;
 Wed, 10 Nov 2021 15:36:03 +0000 (UTC)
Date: Wed, 10 Nov 2021 16:36:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Poking around bdrv_is_inserted()
Message-ID: <YYvm4hkN6XVV4yfC@redhat.com>
References: <87tuglg7ly.fsf@dusky.pond.sub.org>
 <8735o5g75w.fsf@dusky.pond.sub.org> <YYo9oSBKUSL80x1b@redhat.com>
 <87lf1xbbjz.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf1xbbjz.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.2021 um 16:20 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 09.11.2021 um 07:44 hat Markus Armbruster geschrieben:
> >> Screwed up qemu-devel@nongnu.org, sorry for the inconvenience.
> >> 
> >> Markus Armbruster <armbru@redhat.com> writes:
> >> 
> >> > bdrv_is_inserted() returns false when:
> >> >
> >> >     /**
> >> >      * Return TRUE if the media is present
> >> >      */
> >> >     bool bdrv_is_inserted(BlockDriverState *bs)
> >> >     {
> >> >         BlockDriver *drv = bs->drv;
> >> >         BdrvChild *child;
> >> >
> >> >         if (!drv) {
> >> >             return false;
> >> >
> >> > 1. @bs has no driver (this is how we represent "no medium").
> >
> > Not really any more. "No medium" is blk->root == NULL.
> 
> Uh, blk_is_inserted() does *not* check blk->root:
> 
>     bool blk_is_inserted(BlockBackend *blk)
>     {
>         BlockDriverState *bs = blk_bs(blk);
> 
>         return bs && bdrv_is_inserted(bs);
>     }
> 
> Now I'm confused.

It does. blk_bs(blk) returns NULL for blk->root == NULL.

> >                                                        These days
> > bs->drv == NULL basically means "the backend is broken". This happens
> > after qcow2_signal_corruption(), and I'm not sure if we have more
> > circumstances like it.
> 
> I'm not sure having bdrv_is_inserted() return true for "broken"
> backends makes sense.

I wonder if bdrv_is_inserted() makes sense at all (why not just do
whatever you were planning to do if it returns true, and handle the
error?).

But anyway, it returns false for broken backends.

Callers might commonly not be interested in "is a medium inserted?", but
more in "can I access the medium?". In this case, returning false
provides the right answer.

> >> >         }
> >> >         if (drv->bdrv_is_inserted) {
> >> >             return drv->bdrv_is_inserted(bs);
> >> >
> >> > 2. Its driver's ->bdrv_is_inserted() returns false.  This is how
> >> > passthrough block backends signal "host device has no medium".  Right
> >> > now, the only user is "host_cdrom".
> >> >
> >> >         }
> >> >         QLIST_FOREACH(child, &bs->children, next) {
> >> >             if (!bdrv_is_inserted(child->bs)) {
> >> >                 return false;
> >> >
> >> > 3. Any of its children has no medium.  Common use looking through
> >> > filters, which have a single child.
> >> >
> >> >             }
> >> >         }
> >> >         return true;
> >> >     }
> >> >
> >> > Makes sense.
> >> >
> >> > Now look at the uses of QERR_DEVICE_HAS_NO_MEDIUM.
> >> >
> >> > * external_snapshot_prepare() in blockdev.c:
> >> >
> >> >     if (!bdrv_is_inserted(state->old_bs)) {
> >> >         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
> >> >         goto out;
> >> >     }
> >> >
> >> >   where @device is the device name, i.e. BlockdevSnapshot member @node
> >> >   or BlockdevSnapshotSync member @device.  Uh-oh: the latter can be
> >> >   null.  If we can reach the error_setg() then, we crash on some
> >> >   systems.
> >
> > Sounds like we should write a test case and then fix it.
> >
> >> > * bdrv_snapshot_delete() and bdrv_snapshot_load_tmp() in
> >> >   block/snaphot.c:
> >> >
> >> >     if (!drv) {
> >> >         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
> >> >         return -ENOMEDIUM;
> >> >     }
> >> >
> >> >   where @drv is bs->drv.
> >> >
> >> >   Why do we check only for 1. here instead of calling
> >> >   bdrv_is_inserted()?
> >
> > I guess we could philosophise about the theoretically right thing to do,
> > but last time I checked, host_cdrom didn't support snapshots, so it
> > probably doesn't matter either way.
> 
> We could also philosophize about "any of its children has no medium".
> As far as I know, nothing stops me from using a host_cdrom as a backing
> file for a QCOW2, and that I *can* snapshot.

I'm surprised to learn that host_device actually implements
.bdrv_co_pwritev.

So yes, I suppose if you have a qcow2 formatted CD with a snapshot in
it, and you insert it into your physical drive and somehow convince the
kernel to let us open it read-write, and then you eject the CD while the
guest is running and try to delete the snapshot, then you might get the
wrong error message.

I think this is still deep in "then don't do that" territory, but if you
feel like slapping a bdrv_is_inserted() on it, feel free.

> Functions (and methods) bdrv_is_inserted(), bdrv_eject(), and
> bdrv_lock_medium() are related.  block_int.h groups them under
> /* removable device specific */, and block.c under /* removable device
> support */.  But only bdrv_is_inserted() recurses into children.  Is
> this how it should be?

We don't actually have checks to prevent it, but I doubt you can build
anything meaningful with the combination of removable media and non-raw
drivers.

I know qcow2 will be horribly confused if you swap out the file under
its feet. If you must, you can change bs->file (even without host_cdrom,
blockdev-reopen should be enough). If it breaks, you get to keep the
pieces.

So it probably only makes a difference in a case that can't work anyway.

Kevin


