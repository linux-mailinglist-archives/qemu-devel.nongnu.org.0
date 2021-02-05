Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8B310E01
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:40:03 +0100 (CET)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l849J-0001hg-OB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l846T-0007tY-3l
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l846N-0002Ih-35
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZQlYE4bia3o1A0TdeA21k/vfnJctiyRticruMA73M38=;
 b=XgEwX5uQPPi+oTNsVQtQPglzW24MNcYu/mLLYi4vC89etPTZZExX0ytegSV26DGPOCBqjK
 Yv8hGtgJWE3tMpEr3kgzW2d62efHEHaCLandCc9Z8PygzEOx/4zCR5fx6aOcja4H/qDq5Q
 bFFwZs0Sf+6NhrgACVrsFrf5pg/8axQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-LSxGi19mNUGsTfozo0ARUg-1; Fri, 05 Feb 2021 11:36:55 -0500
X-MC-Unique: LSxGi19mNUGsTfozo0ARUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F6D61934100;
 Fri,  5 Feb 2021 16:36:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C07095D9D7;
 Fri,  5 Feb 2021 16:36:52 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:36:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all
 contexts
Message-ID: <20210205163651.GH7072@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-30-vsementsov@virtuozzo.com>
 <20210205160158.GE7072@merkur.fritz.box>
 <b9af714d-3a3a-af8d-fb96-7807553bd55e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b9af714d-3a3a-af8d-fb96-7807553bd55e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 05.02.2021 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 05.02.2021 19:01, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > During reopen we may add backing bs from other aio context, which may
> > > lead to changing original context of top bs.
> > > 
> > > We are going to move graph modification to prepare stage. So, it will
> > > be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
> > > non-original aio context, which we didn't aquire which leads to crash.
> > > 
> > > More correct would be to acquire all aio context we are going to work
> > > with. And the simplest ways is to just acquire all of them. It may be
> > > optimized later if needed.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > 
> > I'm afraid it's not as easy. Holding the lock of more than one
> > AioContext is always a bit risky with respect to deadlocks.
> > 
> > For example, changing the AioContext of a node with
> > bdrv_set_aio_context_ignore() has explicit rules that are now violated:
> > 
> >   * The caller must own the AioContext lock for the old AioContext of bs, but it
> >   * must not own the AioContext lock for new_context (unless new_context is the
> >   * same as the current context of bs).
> > 
> > Draining while holding all AioContext locks is suspicious, too. I think
> > I have seen deadlocks before, which is why bdrv_drain_all_*() are
> > careful to only ever lock a single AioContext at a time.
> 
> That's not good :\ Hmm, probably we just should flush everything
> before all graph modifications.

Would that have to be a separate phase before prepare then?

I suppose the same problem exists with drv->bdrv_reopen_prepare, which
might be called in a different state (both graph structure and
AioContext) than before. I'll have to see the patch first that reorders
things, but this callback has always had the problem that sometimes it
wants the old state and sometimes it wants the new state...

Kevin


