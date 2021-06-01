Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE50397BD4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:43:06 +0200 (CEST)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCAD-0006WR-Nh
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loC96-0005gz-AR
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:41:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loC93-0000wz-La
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622583713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5HO0ZiVDVD8wr7YIPLhTqmtTeqF2PACLArviVU/qbnE=;
 b=ESLRdOcCkwKaBpONnWcDZoufUNHy2/i12x3W38I5t5iJl47KTzlSr7V11F0doMPrer5lKZ
 4xk5fEBlhv+/TQlFhMEk2yk3eYb8scVlgKeKQXBqbDLMf9tmVoo4NLeIS7yTVge0HuzOPi
 g2PiwZdSwEllDKmWqjx9b22DdcI1768=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-XVqB0BDwMpaapNCS17DIqg-1; Tue, 01 Jun 2021 17:41:49 -0400
X-MC-Unique: XVqB0BDwMpaapNCS17DIqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B92F3801107;
 Tue,  1 Jun 2021 21:41:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0ED5D6DC;
 Tue,  1 Jun 2021 21:41:48 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:41:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 03/33] block/nbd: ensure ->connection_thread is always
 valid
Message-ID: <20210601214146.4hsrf2dllwpycgq6@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Fri, Apr 16, 2021 at 11:08:41AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Roman Kagan <rvkagan@yandex-team.ru>
> 
> Simplify lifetime management of BDRVNBDState->connect_thread by
> delaying the possible cleanup of it until the BDRVNBDState itself goes
> away.
> 
> This also reverts
>  0267101af6 "block/nbd: fix possible use after free of s->connect_thread"
> as now s->connect_thread can't be cleared until the very end.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
>  [vsementsov: rebase, revert 0267101af6 changes]
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 56 ++++++++++++++++++++---------------------------------
>  1 file changed, 21 insertions(+), 35 deletions(-)
> 

>  static void nbd_clear_bdrvstate(BlockDriverState *bs)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> +    NBDConnectThread *thr = s->connect_thread;
> +    bool thr_running;
> +
> +    qemu_mutex_lock(&thr->mutex);
> +    thr_running = thr->state == CONNECT_THREAD_RUNNING;
> +    if (thr_running) {
> +        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> +    }
> +    qemu_mutex_unlock(&thr->mutex);
> +
> +    /* the runaway thread will clean it up itself */

s/clean it up/clean up/

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


