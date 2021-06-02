Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095939956A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 23:28:30 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loYPd-0002wg-7h
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 17:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYOY-0001iC-7V
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loYOV-0004tZ-NH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622669239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLd9GuuUdnY4yJzDad5c85wnpoNYtzTwjaPUKJBKgNs=;
 b=DEcbH4S6JHOJSt8rxvFCCpWfn4GiCq1TTj3yPkIhVv1sBHbxHFOjYpiEC5rFKLT91324ky
 tnWLbkSJloJnmp5CMB1iDUYjYMlnlVLRbIUrn4rs490FB1UnGNZ9IunwbCM/IEdT7N8IPM
 chI5hWANEaL0sZR2rbCx0ipo1UDMLMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-P7AYuQn6OBWk2LwonVPgmA-1; Wed, 02 Jun 2021 17:27:17 -0400
X-MC-Unique: P7AYuQn6OBWk2LwonVPgmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72ED68189C4;
 Wed,  2 Jun 2021 21:27:16 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30B15C1A3;
 Wed,  2 Jun 2021 21:27:15 +0000 (UTC)
Date: Wed, 2 Jun 2021 16:27:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
Message-ID: <20210602212714.qqduut7ifmoconfo@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-14-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)

Commit message said what, but not why.  Presumably this is one more
bit of refactoring to make the upcoming file split in a later patch
easier.  But patch 12/33 said it was the last step before a new file,
and this patch isn't yet at a new file.  Missing some continuity in
your commit messages?

> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 21a4039359..8531d019b2 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
>      NBDClientConnection *conn;
>  } BDRVNBDState;
>  
> -static void nbd_free_connect_thread(NBDClientConnection *conn);
> +static void nbd_client_connection_release(NBDClientConnection *conn);

Is it necessary for a forward declaration, or can you just implement
the new function prior to its users?

At any rate, the refactoring looks sane.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


