Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A1382C40
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:35:01 +0200 (CEST)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licSa-0007vv-1k
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1licQb-0005nb-07
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1licQY-0007ah-6L
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621254772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t00gxRzHMozRwhqGuJzycPpSnCCoqXtbKHMauZ6Xo3A=;
 b=I1ChW0UcYZ+zsM+X4shRfdPzImxm7MruffKcYP6dlCvv6nqst6v63doZsIUqlyaK2Z6/Uv
 lc/JMbdmpwNSK3YNUMS5XCbpdLS3gH3ce1LLeBjbmPp70QAlkuvY1galyeSV2faP1uOmZe
 rAL5C8M3at4tYC+f5NABDy/UkZ5sMpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-qPwrjaERNsmSkIHinE_uaQ-1; Mon, 17 May 2021 08:32:47 -0400
X-MC-Unique: qPwrjaERNsmSkIHinE_uaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FA08015F8;
 Mon, 17 May 2021 12:32:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ED7D5DDAD;
 Mon, 17 May 2021 12:32:43 +0000 (UTC)
Subject: Re: [PATCH 02/21] block: introduce blk_replace_bs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-4-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <41fa0138-267f-db18-0030-717e40a79397@redhat.com>
Date: Mon, 17 May 2021 14:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
> Add function to change bs inside blk.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/sysemu/block-backend.h | 1 +
>   block/block-backend.c          | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 880e903293..aec05ef0a0 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -98,6 +98,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
>   BlockDriverState *blk_bs(BlockBackend *blk);
>   void blk_remove_bs(BlockBackend *blk);
>   int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
> +int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
>   bool bdrv_has_blk(BlockDriverState *bs);
>   bool bdrv_is_root_node(BlockDriverState *bs);
>   int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
> diff --git a/block/block-backend.c b/block/block-backend.c
> index de5496af66..b1abc6f3e6 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -870,6 +870,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
>       return 0;
>   }
>   
> +/*
> + * Change BlockDriverState associated with @blk.
> + */
> +int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
> +{
> +    return bdrv_replace_child_bs(blk->root, new_bs, errp);
> +}

Reviewed-by: Max Reitz <mreitz@redhat.com>

(Looks indeed like we don’t need to do any of the things that 
blk_insert_bs() and blk_remove_bs() do besides inserting and removing 
the node.)


