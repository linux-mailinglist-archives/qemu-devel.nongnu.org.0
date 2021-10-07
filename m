Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE9425E5B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:59:51 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaUX-0003o2-Pr
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYaGQ-0002Ts-JL
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYaGE-00026U-1R
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633639501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3bpNmwDobRlJHnx3SrrGjAHx9txHJDRbT3eLmwIeiw=;
 b=hmYJKq1aT3+ERbM6O9EVSwdHr9zZzVh5m0fQZxeL0mFNGMJxS3RSJ7XimrTFGJU3/l9J7E
 BXc5lo+St+B0vCdrxMZ7xN4pw9niuDY6o0GO2hzsdJrl7krStey/75YxKNx1s6qZcEpFha
 ozb92/+prM9ROxJsmej6i6srzdTiRBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-E9FSh5j5MJCOxuiDNqkZvw-1; Thu, 07 Oct 2021 16:44:59 -0400
X-MC-Unique: E9FSh5j5MJCOxuiDNqkZvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C96FBA7333;
 Thu,  7 Oct 2021 20:38:08 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 029B8669ED;
 Thu,  7 Oct 2021 20:38:07 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:38:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 14/12] block-backend: update blk_co_pwrite() and
 blk_co_pread() wrappers
Message-ID: <20211007203806.gqpygsvhtshvcmqu@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211007175243.642516-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211007175243.642516-2-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 07:52:43PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> Make bytes argument int64_t to be consistent with modern block-layer.
> Callers should be OK with it as type becomes wider.
> 
> What is inside functions?
> 
> - Conversion from int64_t to size_t. Still, we
> can't have a buffer larger than SIZE_MAX, therefore bytes should not be
> larger than SIZE_MAX as well. Add and assertion.

s/and/an/

> 
> - Passing to blk_co_pwritev() / blk_co_preadv() which already has
>   int64_t bytes argument.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/sysemu/block-backend.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


