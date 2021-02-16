Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745531C7B7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:03:39 +0100 (CET)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwGg-0000fP-47
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBwFX-00008A-0B
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBwFS-0001Sf-Qw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613466141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWx/vqU6aTLYjyXcp+ctzZJ4YqXvh5iYu8eDiN91H+4=;
 b=Y6em7TXA9ypjzeneOaFubrsAvjOTw8ShIMD3FMkTbVRfR9wrmxQzNbwSAhVCXpu+l4QwTA
 AsI7eohPwoMS1N7XdSSynyqkER0uCj4SXVd1K3Yn1tYh4K+PEBBFN8ysO2t0vqkedcuPQG
 BaWq7wzm2GzCdmP0B1yDAdO3Al/+Mvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-QpqH3Y4JN4S5AV48Djim-w-1; Tue, 16 Feb 2021 04:02:19 -0500
X-MC-Unique: QpqH3Y4JN4S5AV48Djim-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F99F1020C22;
 Tue, 16 Feb 2021 09:02:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-159.ams2.redhat.com [10.36.113.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA7C60C5F;
 Tue, 16 Feb 2021 09:02:07 +0000 (UTC)
Date: Tue, 16 Feb 2021 10:02:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 03/14] block: check return value of bdrv_open_child
 and drop error propagation
Message-ID: <20210216090206.GA5282@merkur.fritz.box>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-4-vsementsov@virtuozzo.com>
 <e076e88b-b5b0-258f-7300-2e4f6db985c6@redhat.com>
 <20210215092203.GA7226@merkur.fritz.box>
 <da15e18f-ac36-aaf4-6cca-2550939497a2@redhat.com>
 <775123c9-2210-49fb-78ce-cddd2b34abb2@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <775123c9-2210-49fb-78ce-cddd2b34abb2@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berto@igalia.com, pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, armbru@redhat.com, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2021 um 06:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 15.02.2021 23:04, Eric Blake wrote:
> > On 2/15/21 3:22 AM, Kevin Wolf wrote:
> > 
> > > > With this patch applied, 'check unit-test' fails with:
> > > > 
> > > > Running test test-replication
> > > > Unexpected error in bdrv_open_driver() at ../block.c:1481:
> > > > Could not open '/tmp/p_local_disk.z1Ugyc': Invalid argument
> > > > ERROR test-replication - missing test plan
> > > > 
> > 
> > > The problem is this hunk:
> > > 
> > > diff --git a/block/qcow2.c b/block/qcow2.c
> > > index 5d94f45be9..e8dd42d73b 100644
> > > --- a/block/qcow2.c
> > > +++ b/block/qcow2.c
> > > @@ -1611,9 +1611,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
> > >       /* Open external data file */
> > >       s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
> > >                                      &child_of_bds, BDRV_CHILD_DATA,
> > > -                                   true, &local_err);
> > > -    if (local_err) {
> > > -        error_propagate(errp, local_err);
> > > +                                   true, errp);
> > > +    if (!s->data_file) {
> > >           ret = -EINVAL;
> > >           goto fail;
> > >       }
> > > 
> > > bdrv_open_child() can return NULL in non-error cases, when the child is
> > > optional and it isn't given. The test doesn't use an external data file,
> > > so this returns NULL without setting an error, which now gets turned
> > > into -EINVAL instead.
> > > 
> > > This makes the most basic tests fail with qcow2 (iotests 001 is enough).
> > > 
> > > The other hunks in this patch don't suffer from the same problem because
> > > they pass allow_none=false.
> > 
> > Thanks; that's enough to figure out how to repair the patch:
> > 
> > diff --git i/block/qcow2.c w/block/qcow2.c
> > index e8dd42d73b4c..38137ca30eb0 100644
> > --- i/block/qcow2.c
> > +++ w/block/qcow2.c
> > @@ -1292,6 +1292,7 @@ static int
> > validate_compression_type(BDRVQcow2State *s, Error **errp)
> >   static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
> >                                         int flags, Error **errp)
> >   {
> > +    ERRP_GUARD();
> >       BDRVQcow2State *s = bs->opaque;
> >       unsigned int len, i;
> >       int ret = 0;
> > @@ -1612,7 +1613,7 @@ static int coroutine_fn
> > qcow2_do_open(BlockDriverState *bs, QDict *options,
> >       s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
> >                                      &child_of_bds, BDRV_CHILD_DATA,
> >                                      true, errp);
> > -    if (!s->data_file) {
> > +    if (*errp) {
> >           ret = -EINVAL;
> >           goto fail;
> >       }
> 
> Agree.. Or better refactor bdrv_open_child to follow more common (and
> recommended) semantics (i.e. NULL + errp on error, non-null on
> succsess).. But this will require more investigation.

But what non-NULL value to return when there is no BdrvChild object?

If anything, you could switch to an int return value and pass the
BdrvChild pointer by reference. I'm not sure if that would be a massive
improvement, though.

Kevin


