Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8F1533A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 16:16:15 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izMPW-0005YF-7W
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 10:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izMOB-0004ZU-DZ
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:14:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izMO9-0004Hl-6P
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:14:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34301
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izMO9-0004BH-0u
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580915688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHardJAU/x8KvNBMWVspVCdQMRb93Jx3quo+pj4sAfM=;
 b=SYZs943A8i++5EoYPmb7ZCexlj8a9fAWBQmb10uIIAv8zfIGLETe4XdH+6vCYONr/QnkFd
 CkzLq9B4BSjZGmv4qi4ilhuR+9dz6GMvJbrOe9gkwTbUgeXmOZVL4N3JqaUmqgCYtQnBQo
 9JIVueUe1x6wl0Sdy2Q79xt+fy7e3UY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-pZNJ5TdRPEOHn0AvtJct5Q-1; Wed, 05 Feb 2020 10:14:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6773863AD0;
 Wed,  5 Feb 2020 15:14:44 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1AC0857AE;
 Wed,  5 Feb 2020 15:14:41 +0000 (UTC)
Subject: Re: [PATCH v4 01/10] hbitmap: assert that we don't create bitmap
 larger than INT64_MAX
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200205112041.6003-1-vsementsov@virtuozzo.com>
 <20200205112041.6003-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <de3d3b22-dec9-390b-61ad-97c0dbde0800@redhat.com>
Date: Wed, 5 Feb 2020 09:14:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205112041.6003-2-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: pZNJ5TdRPEOHn0AvtJct5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/20 5:20 AM, Vladimir Sementsov-Ogievskiy wrote:
> We have APIs which returns signed int64_t, to be able to return error.

s/returns/return/

> Therefore we can't handle bitmaps with absolute size larger than
> (INT64_MAX+1). Still, keep maximum to be INT64_MAX which is a bit
> safer.
> 
> Note, that bitmaps are used to represent disk images, which can't

s/Note,/Note/

> exceed INT64_MAX anyway.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   util/hbitmap.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


