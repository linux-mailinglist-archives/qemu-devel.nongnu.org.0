Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1B416655
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:04:45 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUxY-0005Z6-Ue
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTUs1-0000C2-Nk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTUru-00065z-FA
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632427131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTC45hGcxE8oaKdGsBELzC4gs3WPJ2vmkob1p9yEhfk=;
 b=C6UE8H5diBFlJa7b2EtiHHGE5aH4srOlZzVmjDL54qtkClBHv1bOxko31jl6kmUaGQZB0Q
 C/frKBQEUnHB04SFnOyCj+7yVFz7CRSyzmPkyLETzYydLyNRohJjegblJCjSj6Mh0qktCr
 B28WAf/+upesbUBLk0D+MGI+0X7y+dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-8VDkAxaXPmuCxyw6su4_1A-1; Thu, 23 Sep 2021 15:58:47 -0400
X-MC-Unique: 8VDkAxaXPmuCxyw6su4_1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BFD0801B3D;
 Thu, 23 Sep 2021 19:58:44 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2B84180;
 Thu, 23 Sep 2021 19:58:28 +0000 (UTC)
Date: Thu, 23 Sep 2021 14:58:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
Message-ID: <20210923195827.5kmq25dcojk7bhzr@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903102807.27127-7-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:28:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to support 64 bit write-zeroes requests. Now update the
> limit variable. It's absolutely safe. The variable is set in some
> drivers, and used in bdrv_co_do_pwrite_zeroes().
> 
> Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
> that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
> remaining logic including num, offset and bytes variables is already
> supporting 64bit requests.
> 
> So the only thing that prevents 64 bit requests is limiting
> max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
> We'll drop this limitation after updating all block drivers.
> 
> Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
> will be modified to do bdrv_check_request() for write-zeroes path.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h | 9 +++++----
>  block/io.c                | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


