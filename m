Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC86323BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:34:12 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtMp-0004Sk-Gb
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEtLv-0003h7-Ci
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEtLr-0004bx-VZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614169991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+M0XHHHcaACiVMg/kk2CGXVy8vn4RqplZlEhRgtnFV8=;
 b=ivrX9op8OxFGcdKSsrArtuYs7dchGVpv3UXWIEfHIaQX8NoGqRUgV0OxJURdDBpVQxxJE5
 h9OuCNWijyhZK6Dmdy29+7yI+79Yn4GnglQS47XcNCwj15AschDbEYBf8Wc8g2GAnoubK4
 sPZZO2rOSm+v4CQODAFP8tX9yxGLhjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-_tdy0lCDP2qZaoHdknkudg-1; Wed, 24 Feb 2021 07:33:09 -0500
X-MC-Unique: _tdy0lCDP2qZaoHdknkudg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15BC4107ACF5;
 Wed, 24 Feb 2021 12:33:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF18410016F0;
 Wed, 24 Feb 2021 12:33:06 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:33:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
Message-ID: <20210224123305.GA11025@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2021 um 09:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 08.02.2021 21:44, Alberto Garcia wrote:
> > Signed-off-by: Alberto Garcia <berto@igalia.com>
> > ---
> >   qapi/block-core.json       |  2 +-
> >   include/block/block.h      |  1 +
> >   block.c                    | 16 +++++--
> >   blockdev.c                 | 85 +++++++++++++++++++++-----------------
> >   tests/qemu-iotests/155     |  9 ++--
> >   tests/qemu-iotests/165     |  4 +-
> >   tests/qemu-iotests/245     | 27 +++++++-----
> >   tests/qemu-iotests/248     |  2 +-
> >   tests/qemu-iotests/248.out |  2 +-
> >   tests/qemu-iotests/298     |  4 +-
> >   10 files changed, 89 insertions(+), 63 deletions(-)
> > 
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index c0e7c23331..b9fcf20a81 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -4177,7 +4177,7 @@
> >   # Since: 4.0
> >   ##
> >   { 'command': 'x-blockdev-reopen',
> > -  'data': 'BlockdevOptions', 'boxed': true }
> > +  'data': { 'options': ['BlockdevOptions'] } }
> 
> Do we also want to drop x- prefix?

libvirt really wants to have a stable blockdev-reopen interface in 6.0
because enabling the incremental backup code depends on this (they just
toggle the readonly flag if I understand correctly, so most of the work
we're currently doing isn't even relevant at this moment for libvirt).

Given that the soft freeze is coming closer (March 16), I wonder if we
should just make this API change and declare the interface stable. We
can then make Vladimir's fixes and the file reopening on top of it - if
it's in time for 6.0, that would be good, but if not we could move it to
6.1 without impacting libvirt.

I think we're reasonable confident that the QAPI interfaces are right,
even if maybe not that all aspects of the implementation are right yet.

What do you think?

Kevin


