Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7947369449
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:59:46 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwLR-0002Lk-Rl
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZwKU-0001oG-VX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZwKT-000115-Dj
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619186324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v07IoICeAJQMsfrCPEyIXiLlT9uBgi40d0NbZq3lww8=;
 b=DHCJUFKfdhrVGx7WGfG6vDJj0ISocAUHAbPaLjk74+Ww4QgKK3k6rX2MK9kC7oMmYLdUgR
 6KYPOKkWa2fxaSVRLQsAHM03kewQQsdnb2F/giwLHR8qleLaAbH0UGmkDTZh0bT2YFfyFV
 l21mGhohNCzCPbsyBQ7YB4INcaSl1ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-jK6SNaIzNVm1e_2hQ4bJTQ-1; Fri, 23 Apr 2021 09:58:42 -0400
X-MC-Unique: jK6SNaIzNVm1e_2hQ4bJTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 951DE83DD2E;
 Fri, 23 Apr 2021 13:58:41 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A70846090F;
 Fri, 23 Apr 2021 13:58:40 +0000 (UTC)
Date: Fri, 23 Apr 2021 15:58:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 1/2] block: Add BDRV_O_NO_SHARE for blk_new_open()
Message-ID: <YILSj3T5RdYML/5E@merkur.fritz.box>
References: <20210422164344.283389-1-kwolf@redhat.com>
 <20210422164344.283389-2-kwolf@redhat.com>
 <23f7a203-8b94-4bde-a06d-3ade7924eddf@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <23f7a203-8b94-4bde-a06d-3ade7924eddf@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.04.2021 um 11:43 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 22.04.2021 19:43, Kevin Wolf wrote:
> > Normally, blk_new_open() just shares all permissions. This was fine
> > originally when permissions only protected against uses in the same
> > process because no other part of the code would actually get to access
> > the block nodes opened with blk_new_open(). However, since we use it for
> > file locking now, unsharing permissions becomes desirable.
> > 
> > Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
> > any permissions that can be unshared.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   include/block/block.h |  1 +
> >   block/block-backend.c | 19 +++++++++++++------
> >   2 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/block/block.h b/include/block/block.h
> > index b3f6e509d4..735db05a39 100644
> > --- a/include/block/block.h
> > +++ b/include/block/block.h
> > @@ -101,6 +101,7 @@ typedef struct HDGeometry {
> >       uint32_t cylinders;
> >   } HDGeometry;
> > +#define BDRV_O_NO_SHARE    0x0001 /* don't share permissons */
> >   #define BDRV_O_RDWR        0x0002
> >   #define BDRV_O_RESIZE      0x0004 /* request permission for resizing the node */
> >   #define BDRV_O_SNAPSHOT    0x0008 /* open the file read only and save writes in a snapshot */
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 413af51f3b..61a10ea860 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -398,15 +398,19 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
> >       BlockBackend *blk;
> >       BlockDriverState *bs;
> >       uint64_t perm = 0;
> > +    uint64_t shared = BLK_PERM_ALL;
> > -    /* blk_new_open() is mainly used in .bdrv_create implementations and the
> > -     * tools where sharing isn't a concern because the BDS stays private, so we
> > -     * just request permission according to the flags.
> > +    /*
> > +     * blk_new_open() is mainly used in .bdrv_create implementations and the
> > +     * tools where sharing isn't a major concern because the BDS stays private
> > +     * and the file is generally not supposed to be used by a second process,
> > +     * so we just request permission according to the flags.
> >        *
> >        * The exceptions are xen_disk and blockdev_init(); in these cases, the
> >        * caller of blk_new_open() doesn't make use of the permissions, but they
> >        * shouldn't hurt either. We can still share everything here because the
> > -     * guest devices will add their own blockers if they can't share. */
> > +     * guest devices will add their own blockers if they can't share.
> > +     */
> 
> Probably old comment "We can still share everything" is a bit in
> conflict with commit message (and new logic).

I read that paragraph as referring to xen_disk and blockdev_init() only,
which still don't pass BDRV_O_NO_SHARE after this series. The comment
explains why they don't have to pass it.

Kevin


