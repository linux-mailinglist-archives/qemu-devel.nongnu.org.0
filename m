Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3683E153ABB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 23:12:13 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izSu3-0003KR-MU
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 17:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izStE-0002av-06
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izStC-0004VH-1d
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:11:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42489
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izStB-0004LX-Sz
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580940676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ME46MiVRcOADUM+suwKM/2NCczx8NTyW7vEFOlqDYM=;
 b=PJo6q4bnhJEYLB7Tme+flHzQaeG/l+MYycurUMGFmY1qhu0P2pDT7ZjDmME4L5MwP/EQuX
 fVds3vSGhjx3RUo7rmrHYs/n8Bv91OpvSiyWg/V50DTp1+fTwFf8KQYEvxOA4eKkYNt9Cl
 MdgFt3bn44EjQ+cGm4xFZlMnjYjOsw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Vn2X9HKWOqK5ajcnklCwJg-1; Wed, 05 Feb 2020 17:11:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC199DB23;
 Wed,  5 Feb 2020 22:11:13 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1226060BEC;
 Wed,  5 Feb 2020 22:11:12 +0000 (UTC)
Subject: Re: [PATCH v2 20/33] block: Switch child_format users to child_of_bds
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-21-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <17379798-c834-689f-23d5-c3742ee3af95@redhat.com>
Date: Wed, 5 Feb 2020 16:11:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204170848.614480-21-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Vn2X9HKWOqK5ajcnklCwJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/20 11:08 AM, Max Reitz wrote:
> Both users (quorum and blkverify) use child_format for
> not-really-filtered children, so the appropriate BdrvChildRole in both
> cases is DATA.  (Note that this will cause bdrv_inherited_options() to
> force-allow format probing.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/blkverify.c | 4 ++--
>   block/quorum.c    | 7 ++++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


