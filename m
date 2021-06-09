Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35DF3A1CBE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:29:55 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2xe-000093-LJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2wt-0007nh-Nc
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2wq-00070M-Ap
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623263342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmaAsBq81K4OskR9wB+JBhTj9moveU/GANasXoFw7lc=;
 b=H4nH86ZnA9gUbPYax1+2NCOJebrm2h8F+D7WNYdWYhnFJ+qmdJGZbEP0UOw26IZoUzSobq
 RabmlZEzAuLBk6hNfa0f0T+0WYTJ/FN29TdTHoi0+4YcebKN82VjHr7L2oi96eZpkhdXck
 iM9EzLXy76TgFS1y2ayUGEuACNsaXcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-nW0MI9KCMsSxrFAl0UaswQ-1; Wed, 09 Jun 2021 14:29:00 -0400
X-MC-Unique: nW0MI9KCMsSxrFAl0UaswQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C72051087F7D;
 Wed,  9 Jun 2021 18:28:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE66B179B3;
 Wed,  9 Jun 2021 18:28:57 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:28:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 19/33] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
Message-ID: <20210609182855.q7a2glkkpxfmfgxy@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-20-vsementsov@virtuozzo.com>
 <20210603162939.a3bulyj2wlj4oavp@redhat.com>
 <5ef44900-ba5d-f29f-ffa4-990dc12adf5d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <5ef44900-ba5d-f29f-ffa4-990dc12adf5d@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 08:23:06PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > +    if (s->x_dirty_bitmap) {
> > > +        if (!s->info.base_allocation) {
> > > +            error_setg(errp, "requested x-dirty-bitmap %s not found",
> > > +                       s->x_dirty_bitmap);
> > > +            return -EINVAL;
> > > +        }
> > > +        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
> > > +            s->alloc_depth = true;
> > > +        }
> > > +    }
> > > +
> > > +    if (s->info.flags & NBD_FLAG_READ_ONLY) {
> > > +        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
> > > +        if (ret < 0) {
> > > +            return ret;
> > > +        }
> > > +    }
> > > +
> > > +    if (s->info.flags & NBD_FLAG_SEND_FUA) {
> > > +        bs->supported_write_flags = BDRV_REQ_FUA;
> > > +        bs->supported_zero_flags |= BDRV_REQ_FUA;
> > 
> > Code motion, so it is correct, but it looks odd to use = for one
> > assignment and |= for the other.  Using |= in both places would be
> > more consistent.
> 
> Actually I see bugs here:
> 
> 1. we should do =, not |=, as on reconnect info changes, so we should reset supported flags.
> 
> 2. in-fligth requests that are in retying loops are not prepared to flags changing. I afraid, that some malicious server may even do some bad thing
> 
> Still, let's fix it after these series. To avoid more conflicts.

Oh, you raise some good points.  And it's not just bs->*flags; qemu as
server uses constant metacontext ids (base:allocation is always
context 0), but even that might not be stable across reconnect.  For
example, with my proposed patch of adding qemu:joint-allocation
metacontext, if the reason we have to reconnect is because the server
is upgrading from qemu 6.0 to 6.1 temporarily bouncing the server, and
the client was paying attention to qemu:dirty-bitmap:FOO, that context
would now have a different id.

Yeah, making this code safer across potential changes in server
information (either to fail the reconnect because the reconnected
server dropped something we were previously depending on, or
gracefully handling the downgrade, or ...) is worth leaving for a
later series while we focus on the more immediate issue of making
reconnect itself stable.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


