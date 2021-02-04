Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DA30EDC0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:52:26 +0100 (CET)
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZRA-0002zO-T3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7ZPK-0002NO-I0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 02:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7ZPI-0000sx-18
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 02:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612425026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BMNUZu2mTh1p49sqaNBXXUJ9F3pNjiHnJcRadmY/Rk=;
 b=VTZ328y0g+BwAApm3G6vKK1Jmo7v/x4V5lkPnktksvairFrE+TLkLoy+IOoYt0Tg+ICoRL
 5WXoBslll5p+79V5e1L3VnsHK7FV+pWi3LneEll+qajVpPTrtAVj+QAop3RMH0/c0r4Bml
 N+u9hrOmezHbeAvhn/nHVLG5KYBzNp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-QYMhHzjuOKe3ske_c6ncRA-1; Thu, 04 Feb 2021 02:50:24 -0500
X-MC-Unique: QYMhHzjuOKe3ske_c6ncRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D16478030B1;
 Thu,  4 Feb 2021 07:50:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF98760C13;
 Thu,  4 Feb 2021 07:50:19 +0000 (UTC)
Date: Thu, 4 Feb 2021 08:50:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 20/36] block: add bdrv_attach_child_common()
 transaction action
Message-ID: <20210204075018.GB6496@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-21-vsementsov@virtuozzo.com>
 <20210203210104.GH5507@merkur.fritz.box>
 <f7876ad8-482b-99be-6e92-072ff894e1a1@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f7876ad8-482b-99be-6e92-072ff894e1a1@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.02.2021 um 08:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 04.02.2021 00:01, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Split out no-perm part of bdrv_root_attach_child() into separate
> > > transaction action. bdrv_root_attach_child() now moves to new
> > > permission update paradigm: first update graph relations then update
> > > permissions.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> > > +static void bdrv_attach_child_common_abort(void *opaque)
> > > +{
> > > +    BdrvAttachChildCommonState *s = opaque;
> > > +    BdrvChild *child = *s->child;
> > > +    BlockDriverState *bs = child->bs;
> > > +
> > > +    bdrv_replace_child_noperm(child, NULL);
> > > +
> > > +    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
> > > +        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
> > 
> > Would failure actually be fatal? I think we can ignore it, the node is
> > in an AioContext that works for it.
> 
> As far as I explored the code, check-aio-context is transparent
> enough, nothing rely on IO, etc, and if we succeeded to change it we
> must success in revert.
> 
> And as I understand it is critical: if we failed to rollback
> aio-context change somewhere (but succeeded in reverting graph
> relation change), it means that we end up with different aio contexts
> inside one block subtree..

Ah, right, we're going to change the graph once again, so what is
working now doesn't have to be working for the changed graph.

Ok, let's leave this as &error_abort.

Kevin


