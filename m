Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D56327CDC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:09:43 +0100 (CET)
Received: from localhost ([::1]:59640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgQo-0006p7-Jy
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgOk-0005mm-8r
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgOi-0004ha-HZ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614596851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r81W1InYztGPGkvlKwGRev9oGFVdT52XuTP8Wum3rZs=;
 b=T2d46xzQQfQNncgnOnSJq1gRE+eaug5w2RzXWBKJHcrtw2UUGh0bw0e2CEQcElZY1s4Llw
 fobsHpGbVIovGtz4pbyndcUkU+9GeB20b82JsGip9wcWMj/N3/2DaPCwHpsTM+Rt+fHBLA
 En9CoNaZGTT33YA6vcE+mFHOyGBHhas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-aq4an6oKNDyyTeoSThXRBw-1; Mon, 01 Mar 2021 06:07:30 -0500
X-MC-Unique: aq4an6oKNDyyTeoSThXRBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD4EEC1A0;
 Mon,  1 Mar 2021 11:07:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 981166EF59;
 Mon,  1 Mar 2021 11:07:27 +0000 (UTC)
Date: Mon, 1 Mar 2021 12:07:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
Message-ID: <20210301110726.GC7698@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
 <20210224123305.GA11025@merkur.fritz.box>
 <05d57ba7-684b-a897-5e7e-1ebb6350ca31@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <05d57ba7-684b-a897-5e7e-1ebb6350ca31@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 18:02 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 24.02.2021 15:33, Kevin Wolf wrote:
> > Am 09.02.2021 um 09:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 08.02.2021 21:44, Alberto Garcia wrote:
> > > > Signed-off-by: Alberto Garcia <berto@igalia.com>
> > > > ---
> > > >    qapi/block-core.json       |  2 +-
> > > >    include/block/block.h      |  1 +
> > > >    block.c                    | 16 +++++--
> > > >    blockdev.c                 | 85 +++++++++++++++++++++-----------------
> > > >    tests/qemu-iotests/155     |  9 ++--
> > > >    tests/qemu-iotests/165     |  4 +-
> > > >    tests/qemu-iotests/245     | 27 +++++++-----
> > > >    tests/qemu-iotests/248     |  2 +-
> > > >    tests/qemu-iotests/248.out |  2 +-
> > > >    tests/qemu-iotests/298     |  4 +-
> > > >    10 files changed, 89 insertions(+), 63 deletions(-)
> > > > 
> > > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > > index c0e7c23331..b9fcf20a81 100644
> > > > --- a/qapi/block-core.json
> > > > +++ b/qapi/block-core.json
> > > > @@ -4177,7 +4177,7 @@
> > > >    # Since: 4.0
> > > >    ##
> > > >    { 'command': 'x-blockdev-reopen',
> > > > -  'data': 'BlockdevOptions', 'boxed': true }
> > > > +  'data': { 'options': ['BlockdevOptions'] } }
> > > 
> > > Do we also want to drop x- prefix?
> > 
> > libvirt really wants to have a stable blockdev-reopen interface in 6.0
> > because enabling the incremental backup code depends on this (they just
> > toggle the readonly flag if I understand correctly, so most of the work
> > we're currently doing isn't even relevant at this moment for libvirt).
> 
> Do you know what is the case exactly? If they do it to remove dirty bitmap
> from backing image after snapshot operation, probably we'd better improve
> block-dirty-bitmap-remove command to be able to reopen r-o image?
> 
> (I just recently faced such a task)

I think it was to switch nodes between read-only and read-write, but I
don't remember the exact context.

Peter, can you add the details?

> > Given that the soft freeze is coming closer (March 16), I wonder if we
> > should just make this API change and declare the interface stable. We
> > can then make Vladimir's fixes and the file reopening on top of it - if
> > it's in time for 6.0, that would be good, but if not we could move it to
> > 6.1 without impacting libvirt.
> > 
> > I think we're reasonable confident that the QAPI interfaces are right,
> > even if maybe not that all aspects of the implementation are right yet.
> > 
> > What do you think?
> 
> I think it's OK.. We have it since 4.0. What will we win keeping -x
> for years? Even latest change from updating one device to several
> could be easily done with help of 'alternate' if the command was
> already stable.

I think your series is kind of important to really call the
implementation stable. We can always feature flags to indicate the fixes
if necessary, but it would still feel better to declare something stable
that doesn't have known bugs. :-)

Do you think your series will still take a while? Maybe my first
comments sounded a bit negative because it was really hard to review at
first without knowing the final state, but after all I think the
approach is sane and apart from some implementation details, we're not
that far away from getting it into a mergable state.

Kevin


