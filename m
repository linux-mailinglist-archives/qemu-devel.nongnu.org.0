Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED639F8DC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:19:55 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcaA-00066Z-HT
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqcZ8-0005Hs-Gt
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:18:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqcZ2-0007TD-0B
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9CD5JyPjDZGL5onOkHox1D5qqZtw/6PkTkEaD3Ajjpg=;
 b=aGnKw9zXRY6baboWB9hFBhhEC+IchQ0Dx08LCaG8FztvEjPLFYiFPZ7RYwBJuxKJVzPtuF
 EmAc/cFrb4x1zYCFc5sl1MJPEHcSNF9ony2iZHMmfRVQSiCNpWn+8DKM+GhYIT6sxs8aQQ
 S9LVcYzHFbV4e9sAzoEAoq36zK2j42I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-zFfkzimHOtezxv7sXxvErA-1; Tue, 08 Jun 2021 10:18:40 -0400
X-MC-Unique: zFfkzimHOtezxv7sXxvErA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859508049CD;
 Tue,  8 Jun 2021 14:18:39 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC69608BA;
 Tue,  8 Jun 2021 14:18:38 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:18:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
Message-ID: <20210608141836.c2n3o7n3idtv357d@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
 <20210602212714.qqduut7ifmoconfo@redhat.com>
 <b544ab72-4386-a24b-8c73-71a4d1e44d89@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b544ab72-4386-a24b-8c73-71a4d1e44d89@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 01:00:08PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 03.06.2021 00:27, Eric Blake wrote:
> > On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > ---
> > >   block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
> > >   1 file changed, 26 insertions(+), 17 deletions(-)
> > 
> > Commit message said what, but not why.  Presumably this is one more
> > bit of refactoring to make the upcoming file split in a later patch
> > easier.  But patch 12/33 said it was the last step before a new file,
> > and this patch isn't yet at a new file.  Missing some continuity in
> > your commit messages?
> > 
> > > 
> > > diff --git a/block/nbd.c b/block/nbd.c
> > > index 21a4039359..8531d019b2 100644
> > > --- a/block/nbd.c
> > > +++ b/block/nbd.c
> > > @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
> > >       NBDClientConnection *conn;
> > >   } BDRVNBDState;
> > > -static void nbd_free_connect_thread(NBDClientConnection *conn);
> > > +static void nbd_client_connection_release(NBDClientConnection *conn);
> > 
> > Is it necessary for a forward declaration, or can you just implement
> > the new function prior to its users?
> > 
> 
> Actually, otherwise we'll need a forward declaration for nbd_client_connection_do_free(). Anyway, this all doesn't make real sense before moving to separate file

Fair enough.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


