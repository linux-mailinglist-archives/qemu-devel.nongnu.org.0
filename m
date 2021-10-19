Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA64335EF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:27:58 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcoDk-0001CA-K6
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mco9f-0000Bp-Pm
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mco9a-0002gQ-8v
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634646216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDR8hJWj4p18ll6vpxHJQHo22rZCE1zG/ppJjHd5SKY=;
 b=WFHeOqvao1RfNqY3DLlFWoNo2qPoRoeNeTM84/L0mWGG7mgMo1hHwfL9sYojS+M2MQ+Gv7
 6dV+VR8lVegfy+zxuIV7JBBbwJ8SPNi8UV6lTr8OmY2Ntg3Np249Jv6EGKNw1buuy1AyRa
 xq6voMSayI7eAhv+Uk7YHSX82JciSrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-xtDXIlsvOBeLrZ8LZfmxjg-1; Tue, 19 Oct 2021 08:23:35 -0400
X-MC-Unique: xtDXIlsvOBeLrZ8LZfmxjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6753A10A8E00;
 Tue, 19 Oct 2021 12:23:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AE4560936;
 Tue, 19 Oct 2021 12:23:33 +0000 (UTC)
Date: Tue, 19 Oct 2021 14:23:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block: Fail gracefully when blockdev-snapshot creates
 loops
Message-ID: <YW64w8dA7VPQOEwq@redhat.com>
References: <20211018134714.48438-1-kwolf@redhat.com>
 <e4c03aee-fd0f-0b8a-3b86-35776d2d3ad3@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e4c03aee-fd0f-0b8a-3b86-35776d2d3ad3@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.10.2021 um 16:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 18.10.2021 16:47, Kevin Wolf wrote:
> > Using blockdev-snapshot to append a node as an overlay to itself, or to
> > any of its parents, causes crashes. Catch the condition and return an
> > error for these cases instead.
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1824363
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   block.c                    | 10 ++++++++++
> >   tests/qemu-iotests/085     | 31 ++++++++++++++++++++++++++++++-
> >   tests/qemu-iotests/085.out | 33 ++++++++++++++++++++++++++++++---
> >   3 files changed, 70 insertions(+), 4 deletions(-)
> > 
> > diff --git a/block.c b/block.c
> > index 45f653a88b..231dddf655 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -84,6 +84,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
> >                                              BdrvChildRole child_role,
> >                                              Error **errp);
> > +static bool bdrv_recurse_has_child(BlockDriverState *bs,
> > +                                   BlockDriverState *child);
> > +
> >   static void bdrv_replace_child_noperm(BdrvChild *child,
> >                                         BlockDriverState *new_bs);
> >   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
> > @@ -2673,6 +2676,7 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >       int drain_saldo;
> >       assert(!child->frozen);
> > +    assert(old_bs != new_bs);
> >       if (old_bs && new_bs) {
> >           assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
> > @@ -2892,6 +2896,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
> >       assert(parent_bs->drv);
> > +    if (bdrv_recurse_has_child(child_bs, parent_bs)) {
> > +        error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
> > +                   parent_bs->node_name, child_name, child_bs->node_name);
> 
> Seems, child_bs and parent_bs should be swapped.

Oops, thanks. I'm fixing it up while applying.

Kevin


