Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E793A1A40
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:57:14 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Zt-0003mZ-Ba
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0Wo-000132-Nk
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0Wl-0005zj-93
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R04rQrfkbRR9YtqYqUalpnvyKZJROTanwpMLhOfd2YE=;
 b=exAfPQiDz+CpzNpFVeqMc3laR3HMWViP8ydHd4AgN4lPwfYWrbvphT5mqeCob4ox9yvgbW
 KWHftLB3ddn2iYQMLbMPrEyfD31lmw7KKb2MZsb2ZgTLEXHrJj98gsoTYNN0oYfvGDpxsc
 n9R7Il1GFctnfSZRgCGpc6BUCJFeTLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-VTdF-R3NOyeCRBwOqPtDPA-1; Wed, 09 Jun 2021 11:53:53 -0400
X-MC-Unique: VTdF-R3NOyeCRBwOqPtDPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04236100C621;
 Wed,  9 Jun 2021 15:53:51 +0000 (UTC)
Received: from redhat.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB8A5C1D5;
 Wed,  9 Jun 2021 15:53:48 +0000 (UTC)
Date: Wed, 9 Jun 2021 17:53:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] Allow changing bs->file on reopen
Message-ID: <YMDkCxp3PD9TmMwp@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <b2420fae-1ce5-ee5b-792a-ede183280ec7@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b2420fae-1ce5-ee5b-792a-ede183280ec7@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.05.2021 um 17:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi Alberto!
> 
> What are your plans for v5? I'm now finishing a new series which makes
> backup-top filter public, and I want to base it on your series
> (otherwise I can't add a test).

Berto, where are we with this? I see that Vladimir picked up one or two
patches for his series, but I think we still need a v5 at least for the
rest?

If you can't find the time, should someone else pick up all patches?

Kevin

> 17.03.2021 20:15, Alberto Garcia wrote:
> > Based-on: <20210317143529.615584-1-vsementsov@virtuozzo.com>
> > 
> > Hello,
> > 
> > this is the same as v3, but rebased on top of Vladimir's "block:
> > update graph permissions update v3", which you can get here:
> > 
> > git: https://src.openvz.org/scm/~vsementsov/qemu.git
> > tag: up-block-topologic-perm-v3
> > 
> > Tip: you may find it easier to review patch 4 if you use 'git diff -w'
> > since a big part of the changes that you see in
> > qmp_x_blockdev_reopen() are just indentation changes.
> > 
> > Berto
> > 
> > v4:
> > - Rebase on top of version 3 of Vladimir's branch
> > v3: https://lists.gnu.org/archive/html/qemu-block/2021-03/msg00553.html
> > v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
> > v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> > 
> > Output of git backport-diff against v3:
> > 
> > Key:
> > [----] : patches are identical
> > [####] : number of functional differences between upstream/downstream patch
> > [down] : patch is downstream-only
> > The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> > 
> > 001/6:[----] [--] 'block: Add bdrv_reopen_queue_free()'
> > 002/6:[0018] [FC] 'block: Allow changing bs->file on reopen'
> > 003/6:[----] [--] 'iotests: Test replacing files with x-blockdev-reopen'
> > 004/6:[0071] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
> > 005/6:[----] [--] 'iotests: Test reopening multiple devices at the same time'
> > 006/6:[----] [-C] 'block: Make blockdev-reopen stable API'
> > 
> > Alberto Garcia (6):
> >    block: Add bdrv_reopen_queue_free()
> >    block: Allow changing bs->file on reopen
> >    iotests: Test replacing files with x-blockdev-reopen
> >    block: Support multiple reopening with x-blockdev-reopen
> >    iotests: Test reopening multiple devices at the same time
> >    block: Make blockdev-reopen stable API
> > 
> >   qapi/block-core.json       |  24 ++---
> >   include/block/block.h      |   2 +
> >   block.c                    | 135 ++++++++++++++++----------
> >   blockdev.c                 |  78 +++++++++------
> >   tests/qemu-iotests/155     |   9 +-
> >   tests/qemu-iotests/165     |   4 +-
> >   tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
> >   tests/qemu-iotests/245.out |  11 ++-
> >   tests/qemu-iotests/248     |   4 +-
> >   tests/qemu-iotests/248.out |   2 +-
> >   tests/qemu-iotests/296     |  11 ++-
> >   tests/qemu-iotests/298     |   4 +-
> >   12 files changed, 351 insertions(+), 123 deletions(-)
> > 
> 
> 
> -- 
> Best regards,
> Vladimir
> 


