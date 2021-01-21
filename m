Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10662FF821
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:44:23 +0100 (CET)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2igg-000159-Bq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2if5-0000VW-RC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2if3-0003XU-Bd
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611268959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW05jpBQUjIo15fntQKf+Sbu9CtoXO1s1tIeEo6y38g=;
 b=J0Y7dpKv1MFloAqIm1RqyY2yt7z+r7qxvjDEhrPk32cOo+3BJZg2+c7ZeNz7ivOCoaqB5W
 mjNxKZeytFq1G24jkawBCIBg7rOUKN4/HSf063A45w5soRLjRk/7vqP1UpfW1nSiQUyRoN
 07IL+so67k19VQeKHFZWviWQ1neeh/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-p5ZgcazAMgOEV4lccRgsJQ-1; Thu, 21 Jan 2021 17:42:36 -0500
X-MC-Unique: p5ZgcazAMgOEV4lccRgsJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6A7802B45;
 Thu, 21 Jan 2021 22:42:34 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2AB60BF3;
 Thu, 21 Jan 2021 22:42:30 +0000 (UTC)
Subject: Re: [PATCH v4 03/16] block: fix theoretical overflow in
 bdrv_init_padding()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-4-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1856d39a-0a11-85cc-8b3a-c6322f8f838d@redhat.com>
Date: Thu, 21 Jan 2021 16:42:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
> Calculation of sum may theoretically overflow, so use 64bit type and
> add some good assertions.
> 
> Use int64_t constantly.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 21e8a50725..d9bc67f1b0 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1537,8 +1537,12 @@ static bool bdrv_init_padding(BlockDriverState *bs,
>                                int64_t offset, int64_t bytes,
>                                BdrvRequestPadding *pad)
>  {
> -    uint64_t align = bs->bl.request_alignment;
> -    size_t sum;
> +    int64_t align = bs->bl.request_alignment;
> +    int64_t sum;
> +
> +    bdrv_check_request(offset, bytes, &error_abort);
> +    assert(align <= INT_MAX); /* documented in block/block_int.h */
> +    assert(align * 2 <= SIZE_MAX); /* so we can allocate the buffer */

Would look better as assert(align <= SIZE_MAX / 2); but not technically
wrong as written because the earlier line proved align is less than 32
bits so align*2 can't overflow 63 bits.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


