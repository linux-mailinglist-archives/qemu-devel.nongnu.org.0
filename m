Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3364430EF3C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:08:00 +0100 (CET)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7acH-0002GK-TQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7aaJ-0001Gu-UD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7aaH-00014e-Qe
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612429553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3nka1WlGycd2zA23QQsKCkmdKgDG8FTpIhL/PIMS+vo=;
 b=G+lqjxMBeAc2OTcvVEobI+RQTAJPDr3zbWiw2HG0So1jRFCZhv+r/AXXujxedar7RXjsyN
 K1cUp1LIkQ7ZtISxOywE8u5bVXPOnbCBcWrpkmG6Y98e97ok1UGePqmqV4rwOd6LryArNt
 VfiUyJIkeMg9QvKTkWHM+I4SLFRAvo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-0Ee-FxAIP6uDFk0AdmVssA-1; Thu, 04 Feb 2021 04:05:51 -0500
X-MC-Unique: 0Ee-FxAIP6uDFk0AdmVssA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 149BC107ACE3;
 Thu,  4 Feb 2021 09:05:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95CB4E155;
 Thu,  4 Feb 2021 09:05:48 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:05:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 23/36] block: adapt bdrv_append() for inserting filters
Message-ID: <20210204090547.GC6496@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-24-vsementsov@virtuozzo.com>
 <20210203213346.GJ5507@merkur.fritz.box>
 <a68bc8ae-3cc5-5f9b-e3c0-6e39b23edc87@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a68bc8ae-3cc5-5f9b-e3c0-6e39b23edc87@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.02.2021 um 09:30 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 04.02.2021 00:33, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > >   int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
> > >                   Error **errp)
> > >   {
> > > -    Error *local_err = NULL;
> > > +    int ret;
> > > +    GSList *tran = NULL;
> > > -    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
> > > -    if (local_err) {
> > > -        error_propagate(errp, local_err);
> > > -        return -EPERM;
> > > +    assert(!bs_new->backing);
> > > +
> > > +    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
> > > +                                   &child_of_bds, bdrv_backing_role(bs_new),
> > > +                                   &bs_new->backing, &tran, errp);
> > > +    if (ret < 0) {
> > > +        goto out;
> > >       }
> > 
> > I don't think changing bs->backing without bdrv_set_backing_hd() is
> > correct at the moment. We lose a few things:
> > 
> > 1. The bdrv_is_backing_chain_frozen() check
> > 2. Updating backing_hd->inherits_from if necessary
> > 3. bdrv_refresh_limits()
> > 
> > If I'm not missing anything, all of these are needed in the context of
> > bdrv_append().
> 
> I decided that bdrv_append() is only for appending new nodes, so
> frozen and inherts_from checks are not needed. And I've added
> assert(!bs_new->backing)...
> 
> Checking this now:
> 
> - appending filters is obvious
> - bdrv_append_temp_snapshot() creates new qcow2 node based on tmp
>   file, don't see any backing initialization (and it would be rather
>   strange)

Yes, the internal uses are obviously unproblematic for the frozen check.

> - external_snapshot_prepare() do check if
>   (bdrv_cow_child(state->new_bs)) {  error-out }

Ok, the only thing bdrv_set_backing_hd() can and must check is whether
the link to the old backing file was frozen, and we know that we don't
have an old backing file. Makes sense.

Same thing for inherits_from, we only do this if the the new backing
file (i.e. the old active layer for bdrv_append) was already in the
backing chain of the new node.

> So everything is OK. I should describe it in commit message and add a
> comment to bdrv_append.

What about bdrv_refresh_limits()? The node gains a new backing file, so
I think the limits could change.

Ideally, bdrv_child_cb_attach/detach() would take care of this, but at
the moment they don't.

Kevin


