Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58337138D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:19:34 +0200 (CEST)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVfp-0008Ao-4U
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldVdg-0007DS-3O
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldVdc-0001ts-6T
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620037033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snsteE7M99/GqqEv4tXpJQ/j1Br4zhsvlNlSXBpS+7o=;
 b=WF+U10lEnh2BVufb/85N9zo6jhrjHCVLw2YGBcz+qNKTDpEUaMhsUzuGG/hyCYk0GXcOW5
 C0b2WdUzDmjY1o2lKutcvO1W3idDuDnS/FA623/v2bV2Gt34luIykcQJSGO8bV2rCC4i1R
 Es7mzoYAfJRTrUcaLyJTrjpZMDn8Azw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-rIdJF9bTPJeyHX-5-zrNzA-1; Mon, 03 May 2021 06:17:11 -0400
X-MC-Unique: rIdJF9bTPJeyHX-5-zrNzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4324100A605;
 Mon,  3 May 2021 10:17:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A334460937;
 Mon,  3 May 2021 10:17:09 +0000 (UTC)
Date: Mon, 3 May 2021 12:17:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PULL 37/64] block/snapshot: Fix fallback
Message-ID: <YI/NpCFPtipl8Oah@merkur.fritz.box>
References: <20200907110936.261684-1-kwolf@redhat.com>
 <20200907110936.261684-38-kwolf@redhat.com>
 <CAFEAcA8wGL61unoO=zGWR8KB6AiL8TR7MZeh7R34qGhzy7VKrg@mail.gmail.com>
 <YI/E+8jNzPT6Jqfy@merkur.fritz.box>
 <1b1f6fe6-1a0e-61f8-1197-d26667a3d6fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1b1f6fe6-1a0e-61f8-1197-d26667a3d6fc@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.05.2021 um 11:45 hat Max Reitz geschrieben:
> On 03.05.21 11:40, Kevin Wolf wrote:
> > Am 01.05.2021 um 00:30 hat Peter Maydell geschrieben:
> > > On Mon, 7 Sept 2020 at 12:11, Kevin Wolf <kwolf@redhat.com> wrote:
> > > > 
> > > > From: Max Reitz <mreitz@redhat.com>
> > > > 
> > > > If the top node's driver does not provide snapshot functionality and we
> > > > want to fall back to a node down the chain, we need to snapshot all
> > > > non-COW children.  For simplicity's sake, just do not fall back if there
> > > > is more than one such child.  Furthermore, we really only can fall back
> > > > to bs->file and bs->backing, because bdrv_snapshot_goto() has to modify
> > > > the child link (notably, set it to NULL).
> > > > 
> > > > Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > > Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> > > > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > > 
> > > Hi; Coverity thinks it's found a problem with this code
> > > (CID 1452774):
> > 
> > Cc: Max as the patch author
> 
> Yes, I’m writing a patch to add a comment.
> 
> > > > @@ -205,39 +258,46 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
> > > >           return ret;
> > > >       }
> > > > 
> > > > -    if (bs->file) {
> > > > -        BlockDriverState *file;
> > > > -        QDict *options = qdict_clone_shallow(bs->options);
> > > > +    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
> > > > +    if (fallback_ptr) {
> > > > +        QDict *options;
> > > >           QDict *file_options;
> > > >           Error *local_err = NULL;
> > > > +        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
> > > > +        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
> > > > +
> > > > +        options = qdict_clone_shallow(bs->options);
> > > > 
> > > > -        file = bs->file->bs;
> > > >           /* Prevent it from getting deleted when detached from bs */
> > > > -        bdrv_ref(file);
> > > > +        bdrv_ref(fallback_bs);
> > > > 
> > > > -        qdict_extract_subqdict(options, &file_options, "file.");
> > > > +        qdict_extract_subqdict(options, &file_options, subqdict_prefix);
> > > >           qobject_unref(file_options);
> > > > -        qdict_put_str(options, "file", bdrv_get_node_name(file));
> > > > +        g_free(subqdict_prefix);
> > > > +
> > > > +        qdict_put_str(options, (*fallback_ptr)->name,
> > > > +                      bdrv_get_node_name(fallback_bs));
> > > > 
> > > >           if (drv->bdrv_close) {
> > > >               drv->bdrv_close(bs);
> > > >           }
> > > > -        bdrv_unref_child(bs, bs->file);
> > > > -        bs->file = NULL;
> > > > 
> > > > -        ret = bdrv_snapshot_goto(file, snapshot_id, errp);
> > > > +        bdrv_unref_child(bs, *fallback_ptr);
> > > > +        *fallback_ptr = NULL;
> > > 
> > > Here we set *fallback_ptr to NULL...
> > > 
> > > > +
> > > > +        ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
> > > >           open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
> > > >           qobject_unref(options);
> > > >           if (open_ret < 0) {
> > > > -            bdrv_unref(file);
> > > > +            bdrv_unref(fallback_bs);
> > > >               bs->drv = NULL;
> > > >               /* A bdrv_snapshot_goto() error takes precedence */
> > > >               error_propagate(errp, local_err);
> > > >               return ret < 0 ? ret : open_ret;
> > > >           }
> > > > 
> > > > -        assert(bs->file->bs == file);
> > > > -        bdrv_unref(file);
> > > > +        assert(fallback_bs == (*fallback_ptr)->bs);
> > > 
> > > ...but here we dereference *fallback_ptr, and Coverity doesn't see
> > > anything that it recognizes as being able to change it.
> > > 
> > > > +        bdrv_unref(fallback_bs);
> > > >           return ret;
> > > >       }
> > > 
> > > False positive, or real issue? (If a false positive, a comment
> > > explaining what's going on wouldn't go amiss -- as a human reader
> > > I'm kind of confused about whether there's some kind of hidden
> > > magic going on here.)
> > 
> > I think it's a false positive because drv->bdrv_open() is supposed to
> > give it a non-NULL value again. Not sure if we can make the assumption
> > in every case without checking it, but it feels reasonable to require
> > that drv->bdrv_open() would return failure otherwise. Max?
> 
> Yes.  I think it’s sensible to add an *fallback_ptr non-NULL check to the
> assert condition (i.e.,
> 
> assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
> 
> ), because the intention of the condition is already to verify that
> .bdrv_open() has opened the right node.  So we might say what’s missing is
> to also assert that it has opened any node at all, but if we’re fine with
> asserting that it has opened the right node (which we did since
> 7a9e51198c24), we should definitely be fine with asserting that it has
> opened any node at all.

True, that's a good point.

Kevin


