Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577451533EC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 16:34:19 +0100 (CET)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izMgz-0005VI-BV
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 10:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izMg7-00051H-0g
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:33:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izMg4-00035r-V0
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:33:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20014
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izMg4-0002wT-PN
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580916799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhXZe5o7bF9UgzA8G2Oatp8OJnWoaeFOGrGj+RdfDkE=;
 b=VZTkYkjGS9a1TYDhou5l5S36tM2O8h9BiQ8O2nQoE9OHk2JnPsJvCvH3fpOkTCFTJ+/zUq
 y0DtU8GOmMTMEOqGh1fZPWXP4O8wqUJhRqsJgQXTJMOmGthQ+3y7+HOG6BddhSS/rlcXF5
 kqpOYnGJ/59jgPmg/mB+wcbDXprlhU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-BE84hs68NhKhBGGh_i1lOQ-1; Wed, 05 Feb 2020 10:33:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E237F802683;
 Wed,  5 Feb 2020 15:33:16 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2D519C7F;
 Wed,  5 Feb 2020 15:33:16 +0000 (UTC)
Subject: Re: [PATCH v2 04/33] block: Add BdrvChildRole to BdrvChild
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-5-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3113019f-797f-fe89-abbd-280bbddded31@redhat.com>
Date: Wed, 5 Feb 2020 09:33:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204170848.614480-5-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BE84hs68NhKhBGGh_i1lOQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
> For now, it is always set to 0.  Later patches in this series will
> ensure that all callers pass an appropriate combination of flags.

Sneaky - this re-adds the field you dropped as part of a rename in 2/33. 
  Anyone doing backport had better be aware that they would need this 
whole series, rather than cherry-picking later patches without the 
earlier ones.  But that observation does not affect the patch validity.

> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

> +++ b/block.c
> @@ -2381,6 +2381,7 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>   BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>                                     const char *child_name,
>                                     const BdrvChildClass *child_class,
> +                                  BdrvChildRole child_role,

Hmm - C is loose enough to allow the declaration of a parameter as an 
enum type even when its intended usage is to receive a bitwise-or 
derived from that enum but not declared in the enum.  For example, if I 
understand intent correctly, a caller might pass in 0x3 
(BDRV_CHILD_DATA|BDRV_CHILD_METADATA) which does NOT appear in 
BdrvChildRole.  It feels like it might be cleaner to document the 
interface as taking an unsigned int (although then you've lost the 
documentation that the int is derived from BdrvChildRole), than to abuse 
the typesystem to pass values that are not BdrvChildRole through the 
parameter.

Otherwise, this patch is a mechanical addition.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


