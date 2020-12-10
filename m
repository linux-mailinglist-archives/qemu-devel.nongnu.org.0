Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B0D2D63CB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:41:01 +0100 (CET)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPw4-0007OG-0o
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPpT-0004Se-Us
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPpR-0004vk-QL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607621648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5fZawlMIHmJo2uiXX/h3jGwaro74FhUBlVka5E8k1s4=;
 b=E4zIys1wcU7ohuSitHtXlnF8JRcMVAH7xFJH5haPiYb6l3No27j/eUQBXd8L97JvkLys7L
 ycoc1KpojuwBqzvZyiUEr4lIDQppDaiRyc2/fxJWUXY+wE9BaK7dwxxjPPF0ybMSAHP21i
 UbyQJVhTZ5gXrfsldfQQY1csjEue360=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-j5RLoDUOO0aeRSJHoeDooA-1; Thu, 10 Dec 2020 12:34:06 -0500
X-MC-Unique: j5RLoDUOO0aeRSJHoeDooA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54238180A086;
 Thu, 10 Dec 2020 17:34:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-58.ams2.redhat.com
 [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F5C1E5;
 Thu, 10 Dec 2020 17:33:57 +0000 (UTC)
Subject: Re: [PATCH v14 02/13] block: add API function to insert a node
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-3-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e0c83922-c039-5eed-6f50-276a9455fc64@redhat.com>
Date: Thu, 10 Dec 2020 18:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Provide API for insertion a node to backing chain.
> 
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block.h |  2 ++
>   block.c               | 25 +++++++++++++++++++++++++
>   2 files changed, 27 insertions(+)

[...]

> diff --git a/block.c b/block.c
> index f1cedac362..b71c39f3e6 100644
> --- a/block.c
> +++ b/block.c
> @@ -4698,6 +4698,31 @@ static void bdrv_delete(BlockDriverState *bs)
>       g_free(bs);
>   }
>   
> +BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
> +                                   int flags, Error **errp)
> +{
> +    BlockDriverState *new_node_bs;
> +    Error *local_err = NULL;
> +
> +    new_node_bs =  bdrv_open(NULL, NULL, node_options, flags, errp);

s/ =  / = /

With that done:

Reviewed-by: Max Reitz <mreitz@redhat.com>


