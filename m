Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F69153A3B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 22:26:30 +0100 (CET)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izSBp-0000Vz-ED
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 16:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izSAy-0008Or-65
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izSAw-000080-RE
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:25:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60164
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izSAw-00007q-Nf
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580937934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrWG13wGTi+uSdUPeY3VbGkRN1r/QqsmyEdedWx0hNw=;
 b=KcHGqvyWoJtE+FA5AI1UZyvW1xyUoFe/5AjTcy1uSTuPmsm3jZIjuTdoDM8tiK8nCKqlC/
 9SLVkr1oWZVUmFygs09zI4I72hk8x2E6IG89IZuFbfvtR8elsL2hb07kEPgDMfct2qjx/K
 ChRZRfcpmK8as+pltJoXuyRmqB4NzEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-FiJ5bOZGM5mqkcLnvcjwbQ-1; Wed, 05 Feb 2020 16:25:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A85711835A0D;
 Wed,  5 Feb 2020 21:25:26 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC50F859D2;
 Wed,  5 Feb 2020 21:25:25 +0000 (UTC)
Subject: Re: [PATCH v2 17/33] block: Split bdrv_default_perms_for_storage()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-18-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0ee0f553-4011-401c-1304-e72c140c5fa6@redhat.com>
Date: Wed, 5 Feb 2020 15:25:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204170848.614480-18-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: FiJ5bOZGM5mqkcLnvcjwbQ-1
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
> We can be less restrictive about pure data children than those with
> metadata on them.
> 
> For bdrv_format_default_perms(), we keep the safe option of
> bdrv_default_perms_for_metadata() (until we drop
> bdrv_format_default_perms() altogether).
> 
> That means that bdrv_default_perms_for_data() is unused at this point.
> We will use it for all children that have the DATA role, but not the
> METADATA role.  So far, no child has any role, so we do not use it, but
> that will change.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block.c | 53 +++++++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 43 insertions(+), 10 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


