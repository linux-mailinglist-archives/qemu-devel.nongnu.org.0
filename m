Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A822D387732
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:12:40 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixeR-0008Mj-7C
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lixcj-00066Z-NE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lixcf-0002VN-5C
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621336246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGguORZw/okvy2Tn0MvhDGtS1cqfYnoAGuDLBCjHNM0=;
 b=TkN9h6PGg33GZhGQcyCEnu555tb0DNeEUIHwmvQBJWLjJPUT5uUb+6f/5Y/Q4g1xYY4pAX
 3ycvXgkle7FkAByfljRatB1HDt8h2iapCJzUoJ+QTy7i0r7pIS1SFxu/D+UhyqejL7cCc6
 Ip3F1v2LuMCMZn5hkpa+VezO9X5xB5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-sxcg4BxIOq6vbb6AVqd4DQ-1; Tue, 18 May 2021 07:10:40 -0400
X-MC-Unique: sxcg4BxIOq6vbb6AVqd4DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B27E195D59C;
 Tue, 18 May 2021 11:10:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C206960CE6;
 Tue, 18 May 2021 11:10:33 +0000 (UTC)
Subject: Re: [PATCH 10/21] block/copy-before-write: relax permission
 requirements when no parents
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-12-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <34036b2a-4325-3630-229c-c415d6bd87ba@redhat.com>
Date: Tue, 18 May 2021 13:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-12-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> We are going to publish copy-before-write filter. So, user should be
> able to create it with blockdev-add first, specifying both filtered and
> target children. And then do blockdev-reopen, to actually insert the
> filter where needed.
> 
> Currently, filter unshares write permission unconditionally on source
> node. It's good, but it will not allow to do blockdev-add. So, let's
> relax restrictions when filter doesn't have any parent.
> 
> Test output is modified, as now permission conflict happens only when
> job creates a blk parent for filter node.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c  | 8 +++++---
>   tests/qemu-iotests/283.out | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 4776172f77..af2bb97a30 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>           bdrv_default_perms(bs, c, role, reopen_queue,
>                              perm, shared, nperm, nshared);
>   
> -        if (perm & BLK_PERM_WRITE) {
> -            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
> +        if (!QLIST_EMPTY(&bs->parents)) {

I understand this works because with the transactional system, at the 
time the permissions are checked, the graph has already been changed, yes?

I was wondering still whether there was any way to express this through 
permissions alone.  I guess we could check
“perm & BLK_PERM_CONSISTENT_READ”, but that would actually be just a 
crutch to see whether there are any parents.  I suppose this really is 
about whether there are parents or not.  So:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +            if (perm & BLK_PERM_WRITE) {
> +                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
> +            }
> +            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
>           }
> -        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
>       }
>   }
>   
> diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
> index e08f807dab..d5350ce7a7 100644
> --- a/tests/qemu-iotests/283.out
> +++ b/tests/qemu-iotests/283.out
> @@ -5,7 +5,7 @@
>   {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
>   {"return": {}}
>   {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
> -{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
> +{"error": {"class": "GenericError", "desc": "Conflicts with use by source as 'image', which does not allow 'write' on base"}}
>   
>   === copy-before-write filter should be gone after job-finalize ===
>   
> 


