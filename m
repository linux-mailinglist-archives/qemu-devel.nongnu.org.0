Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C816396593
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:39:22 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkwj-00020C-3T
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lnksx-00008A-V5
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lnkst-0007Yx-Vb
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622478920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+MRli41onuOJizNix7KDCP1Qz08oLePlDqHO4UaKTA=;
 b=XbOx/BW/8LTFdJe1rBhjaZqeHlPzsRc2IlScsoPqemKgznvluSOgoihljBEQRgpeip+DWk
 dEOTXX+PUs43bMAJMTZocvVJ73JLdElqIAixQMzmAViAs1ZaWhJCRdIX4zXod0tmQduuUR
 fz29jra0qC6KgHd99QPuTrkuCncd5mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ssypu8gnO8WTC-4dos4zGQ-1; Mon, 31 May 2021 12:35:19 -0400
X-MC-Unique: ssypu8gnO8WTC-4dos4zGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63DA1007467;
 Mon, 31 May 2021 16:35:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DC05C1B4;
 Mon, 31 May 2021 16:35:16 +0000 (UTC)
Date: Mon, 31 May 2021 18:35:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 5/5] block: improve permission conflict error message
Message-ID: <YLUQQtEUbeHdluPQ@merkur.fritz.box>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-6-vsementsov@virtuozzo.com>
 <YLUJzdunvOGmfdkO@merkur.fritz.box>
 <e08592be-2520-217a-0b68-fb7f44ac6c47@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e08592be-2520-217a-0b68-fb7f44ac6c47@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: berto@igalia.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.05.2021 um 18:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 31.05.2021 19:07, Kevin Wolf wrote:
> > Am 04.05.2021 um 11:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Now permissions are updated as follows:
> > >   1. do graph modifications ignoring permissions
> > >   2. do permission update
> > > 
> > >   (of course, we rollback [1] if [2] fails)
> > > 
> > > So, on stage [2] we can't say which users are "old" and which are
> > > "new" and exist only since [1]. And current error message is a bit
> > > outdated. Let's improve it, to make everything clean.
> > > 
> > > While being here, add also a comment and some good assertions.
> > > 
> > > iotests 283, 307, qsd-jobs outputs are updated.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > ---
> > >   block.c                               | 29 ++++++++++++++++++++-------
> > >   tests/qemu-iotests/283.out            |  2 +-
> > >   tests/qemu-iotests/307.out            |  2 +-
> > >   tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
> > >   4 files changed, 25 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/block.c b/block.c
> > > index 2f73523285..354438d918 100644
> > > --- a/block.c
> > > +++ b/block.c
> > > @@ -2032,20 +2032,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
> > >       return c->klass->get_parent_desc(c);
> > >   }
> > > +/*
> > > + * Check that @a allows everything that @b needs. @a and @b must reference same
> > > + * child node.
> > > + */
> > >   static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
> > >   {
> > > -    g_autofree char *user = NULL;
> > > -    g_autofree char *perm_names = NULL;
> > > +    g_autofree char *a_user = NULL;
> > > +    g_autofree char *a_against = NULL;
> > > +    g_autofree char *b_user = NULL;
> > > +    g_autofree char *b_perm = NULL;
> > > +
> > > +    assert(a->bs);
> > > +    assert(a->bs == b->bs);
> > >       if ((b->perm & a->shared_perm) == b->perm) {
> > >           return true;
> > >       }
> > > -    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
> > > -    user = bdrv_child_user_desc(a);
> > > -    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
> > > -               "allow '%s' on %s",
> > > -               user, a->name, perm_names, bdrv_get_node_name(b->bs));
> > > +    a_user = bdrv_child_user_desc(a);
> > > +    a_against = bdrv_perm_names(b->perm & ~a->shared_perm);
> > > +
> > > +    b_user = bdrv_child_user_desc(b);
> > > +    b_perm = bdrv_perm_names(b->perm);
> > > +    error_setg(errp, "Permission conflict on node '%s': %s wants to use it as "
> > > +               "'%s', which requires these permissions: %s. On the other hand %s "
> > > +               "wants to use it as '%s', which doesn't share: %s",
> > > +               bdrv_get_node_name(b->bs),
> > > +               b_user, b->name, b_perm, a_user, a->name, a_against);
> > 
> > I think the combination of a_against and b_perm is confusing to report
> > because one is the intersection of permissions (i.e. only the
> > permissions that actually conflict) and the other the full list of
> > unshared permissions.
> > 
> > We could report both the full list of required permissions (which is
> > what your current error message claims to report) and of unshared
> > permissions. I'm not sure if there is actually any use for this
> > information.
> > 
> > The other option that would feel consistent is to report only the
> > conflicting permissions, and report them only once because they are the
> > same for both sides.
> > 
> 
> Agreed.
> 
> So, what about:
> 
>   error_setg(errp, "Permission conflict on node '%s": permissions %s are both required by %s (%s) and unshared by %s (%s).", bdrv_get_node_name(b->bs), a_against, b_user, b->name, a_user, a->name);

I'm not sure if I'm happy with the child names simply in parentheses,
but I don't have a good alternative. I was thinking something like
"(node used as %s)", but while writing down the example below, that
turned out confusing because a_user and b_user can refer to nodes, too.

"permissions '%s'" with single quotes might be preferable, too.

So a real error message from the current version of the patch is:

    Permission conflict on node 'base': node 'other' wants to use it as
    'image', which requires these permissions: write. On the other hand
    node 'source' wants to use it as 'image', which doesn't share: write

It would then become:

    Permission conflict on node 'base': permissions 'write' are both
    required by node 'other' (image) and unshared by 'source' (image).

Looks like an improvement to me, but if anyone has a good idea what to
do about the unclear meaning of the parentheses, I would be happy to
hear suggestions.

Kevin

> > >       return false;
> > >   }
> > > diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
> > > index c9397bfc44..92f3cc1ed5 100644
> > > --- a/tests/qemu-iotests/283.out
> > > +++ b/tests/qemu-iotests/283.out
> > > @@ -5,7 +5,7 @@
> > >   {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
> > >   {"return": {}}
> > >   {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
> > > -{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
> > > +{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': node 'other' wants to use it as 'image', which requires these permissions: write. On the other hand node 'source' wants to use it as 'image', which doesn't share: write"}}
> > >   === backup-top should be gone after job-finalize ===
> > > diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
> > > index 66bf2ddb74..e03932ba4f 100644
> > > --- a/tests/qemu-iotests/307.out
> > > +++ b/tests/qemu-iotests/307.out
> > > @@ -53,7 +53,7 @@ exports available: 1
> > >   === Add a writable export ===
> > >   {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
> > > -{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
> > > +{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand block device 'sda' wants to use it as 'root', which doesn't share: write"}}
> > >   {"execute": "device_del", "arguments": {"id": "sda"}}
> > >   {"return": {}}
> > >   {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
> > > diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
> > > index 9f52255da8..b0596d2c95 100644
> > > --- a/tests/qemu-iotests/tests/qsd-jobs.out
> > > +++ b/tests/qemu-iotests/tests/qsd-jobs.out
> > > @@ -16,7 +16,7 @@ QMP_VERSION
> > >   {"return": {}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> > > -{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
> > > +{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand stream job 'job0' wants to use it as 'intermediate node', which doesn't share: write"}}
> > >   {"return": {}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
> > >   *** done
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> 
> -- 
> Best regards,
> Vladimir
> 


