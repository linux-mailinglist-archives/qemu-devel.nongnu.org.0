Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445344B042
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:21:52 +0100 (CET)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSwY-0004Tr-V2
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSvS-0003f3-3K
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSvP-0005WJ-V9
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636471239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZOS9/HnQUCsurtRMsbAg4wZYwsjJAelXOfJiOkjtltA=;
 b=AQUtmriGemp2cXRsBcXaLkBfpoEjWCc30cWrJAIBd2KEDWgfFc+z++tR8tYkc1FDoTYCT8
 nzMPm99onAHpwMcmTYWDbiEYrGiBqBcBFO297/l4ul1naNBM8w0GkxX2weXLkIykRkeqGK
 4WpTVayzv9cofuAncohSoODeowHl/D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-EYclhO0MNsWntzXnOBdntg-1; Tue, 09 Nov 2021 10:20:36 -0500
X-MC-Unique: EYclhO0MNsWntzXnOBdntg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4251B879A03;
 Tue,  9 Nov 2021 15:20:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6966788F;
 Tue,  9 Nov 2021 15:20:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B30A11380A7; Tue,  9 Nov 2021 16:20:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Poking around bdrv_is_inserted()
References: <87tuglg7ly.fsf@dusky.pond.sub.org>
 <8735o5g75w.fsf@dusky.pond.sub.org> <YYo9oSBKUSL80x1b@redhat.com>
Date: Tue, 09 Nov 2021 16:20:32 +0100
In-Reply-To: <YYo9oSBKUSL80x1b@redhat.com> (Kevin Wolf's message of "Tue, 9
 Nov 2021 10:21:37 +0100")
Message-ID: <87lf1xbbjz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 09.11.2021 um 07:44 hat Markus Armbruster geschrieben:
>> Screwed up qemu-devel@nongnu.org, sorry for the inconvenience.
>> 
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>> > bdrv_is_inserted() returns false when:
>> >
>> >     /**
>> >      * Return TRUE if the media is present
>> >      */
>> >     bool bdrv_is_inserted(BlockDriverState *bs)
>> >     {
>> >         BlockDriver *drv = bs->drv;
>> >         BdrvChild *child;
>> >
>> >         if (!drv) {
>> >             return false;
>> >
>> > 1. @bs has no driver (this is how we represent "no medium").
>
> Not really any more. "No medium" is blk->root == NULL.

Uh, blk_is_inserted() does *not* check blk->root:

    bool blk_is_inserted(BlockBackend *blk)
    {
        BlockDriverState *bs = blk_bs(blk);

        return bs && bdrv_is_inserted(bs);
    }

Now I'm confused.

>                                                        These days
> bs->drv == NULL basically means "the backend is broken". This happens
> after qcow2_signal_corruption(), and I'm not sure if we have more
> circumstances like it.

I'm not sure having bdrv_is_inserted() return true for "broken" backends
makes sense.

>> >         }
>> >         if (drv->bdrv_is_inserted) {
>> >             return drv->bdrv_is_inserted(bs);
>> >
>> > 2. Its driver's ->bdrv_is_inserted() returns false.  This is how
>> > passthrough block backends signal "host device has no medium".  Right
>> > now, the only user is "host_cdrom".
>> >
>> >         }
>> >         QLIST_FOREACH(child, &bs->children, next) {
>> >             if (!bdrv_is_inserted(child->bs)) {
>> >                 return false;
>> >
>> > 3. Any of its children has no medium.  Common use looking through
>> > filters, which have a single child.
>> >
>> >             }
>> >         }
>> >         return true;
>> >     }
>> >
>> > Makes sense.
>> >
>> > Now look at the uses of QERR_DEVICE_HAS_NO_MEDIUM.
>> >
>> > * external_snapshot_prepare() in blockdev.c:
>> >
>> >     if (!bdrv_is_inserted(state->old_bs)) {
>> >         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
>> >         goto out;
>> >     }
>> >
>> >   where @device is the device name, i.e. BlockdevSnapshot member @node
>> >   or BlockdevSnapshotSync member @device.  Uh-oh: the latter can be
>> >   null.  If we can reach the error_setg() then, we crash on some
>> >   systems.
>
> Sounds like we should write a test case and then fix it.
>
>> > * bdrv_snapshot_delete() and bdrv_snapshot_load_tmp() in
>> >   block/snaphot.c:
>> >
>> >     if (!drv) {
>> >         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
>> >         return -ENOMEDIUM;
>> >     }
>> >
>> >   where @drv is bs->drv.
>> >
>> >   Why do we check only for 1. here instead of calling
>> >   bdrv_is_inserted()?
>
> I guess we could philosophise about the theoretically right thing to do,
> but last time I checked, host_cdrom didn't support snapshots, so it
> probably doesn't matter either way.

We could also philosophize about "any of its children has no medium".
As far as I know, nothing stops me from using a host_cdrom as a backing
file for a QCOW2, and that I *can* snapshot.

Functions (and methods) bdrv_is_inserted(), bdrv_eject(), and
bdrv_lock_medium() are related.  block_int.h groups them under
/* removable device specific */, and block.c under /* removable device
support */.  But only bdrv_is_inserted() recurses into children.  Is
this how it should be?


