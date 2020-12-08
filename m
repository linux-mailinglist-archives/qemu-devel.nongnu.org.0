Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B712D312E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:35:18 +0100 (CET)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgtQ-0003sv-NL
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmglq-0007yq-Dm
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:27:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmgll-00010d-K9
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607448438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpSqtZjYP1u/Sjxx+7XYGPaD5wgut7WwuBUgWZbzFDg=;
 b=BLYb2kTqdA5if3A9OXchemxLdJISxRWKi3vkCAfAh44Fhbx/TgYYWbBSzA9wIA/keFoUxP
 yHmjIt2qasweUbgHGNFNQNXHYCS7xkFAma5EZl5Xpl1GWB3uqjBq/Q4tTEAwrTJW8qgTIH
 bkZ00pzKWR1Ux9hG3qN6bC5ocZ5ujlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-vQHfYdNkPXKEhJ7UrDu-Dw-1; Tue, 08 Dec 2020 12:27:15 -0500
X-MC-Unique: vQHfYdNkPXKEhJ7UrDu-Dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661131073849;
 Tue,  8 Dec 2020 17:26:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7F5519C78;
 Tue,  8 Dec 2020 17:26:16 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:26:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/3] block: Simplify qmp_block_resize() error paths
Message-ID: <20201208172615.GB24068@merkur.fritz.box>
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-2-kwolf@redhat.com>
 <68405fb1-59db-f9ee-852b-52a77cc2a2ce@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <68405fb1-59db-f9ee-852b-52a77cc2a2ce@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mreitz@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.12.2020 um 15:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.12.2020 20:23, Kevin Wolf wrote:
> > The only thing that happens after the 'out:' label is blk_unref(blk).
> > However, blk = NULL in all of the error cases, so instead of jumping to
> > 'out:', we can just return directly.
> > 
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   blockdev.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/blockdev.c b/blockdev.c
> > index fe6fb5dc1d..229d2cce1b 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -2468,17 +2468,17 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
> >       if (size < 0) {
> >           error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size");
> > -        goto out;
> > +        return;
> >       }
> >       if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
> >           error_setg(errp, QERR_DEVICE_IN_USE, device);
> > -        goto out;
> > +        return;
> >       }
> >       blk = blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
> >       if (!blk) {
> > -        goto out;
> > +        return;
> >       }
> >       bdrv_drained_begin(bs);
> > @@ -2487,7 +2487,6 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
> >       bdrv_co_leave(bs, old_ctx);
> >       bdrv_drained_end(bs);
> > -out:
> >       bdrv_co_lock(bs);
> >       blk_unref(blk);
> >       bdrv_co_unlock(bs);
> > 
> 
> Initialization of blk to NULL becomes redundant with this patch, so
> may be dropped too.

Good catch, I'll change this while applying.

Kevin


