Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D23005F9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:49:39 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xkn-0006UD-Kk
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2xja-00060V-TG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2xjW-0006Qz-DQ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611326897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uBBeM+ESpLxvSkBwAXN18jVio2wBeahrzp7pwJuAss=;
 b=A8NStKyFhX344N0cpaHgVInrfhFbf1WcVYtb7LZvgahcwgoQGNaSevAAoBcX/B8HpubpTI
 kNHaIC1XetOvhEubjtpxWZSSfeQAjPzws2V0aGwGSL8gvxCbpwq87ant4BHjW1knvps+gk
 RvIgh4s0WOdpa5TckP9FDMe7fef3KGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-tPnMRye3O12D_bPzUw3OhQ-1; Fri, 22 Jan 2021 09:48:11 -0500
X-MC-Unique: tPnMRye3O12D_bPzUw3OhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7787107ACE3;
 Fri, 22 Jan 2021 14:48:08 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1346EF53;
 Fri, 22 Jan 2021 14:48:04 +0000 (UTC)
Subject: Re: [PATCH v4 07/16] block/io: improve bdrv_check_request: check qiov
 too
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-8-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7a7dfe73-55f6-a380-4f1e-1d114dadb543@redhat.com>
Date: Fri, 22 Jan 2021 08:48:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> Operations with qiov add more restrictions on bytes, let's cover it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 46 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 4a057660f8..42e687a388 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -898,8 +898,14 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
>      return waited;
>  }
>  
> -int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
> +static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
> +                                   QEMUIOVector *qiov, size_t qiov_offset,
> +                                   Error **errp)
>  {
> +    /*
> +     * Check generic offset/bytes correctness
> +     */
> +
>      if (offset < 0) {
>          error_setg(errp, "offset is negative: %" PRIi64, offset);
>          return -EIO;
> @@ -929,12 +935,38 @@ int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
>          return -EIO;
>      }
>  
> +    if (!qiov) {
> +        return 0;
> +    }

I guess this short circuit is for write zeroes...

> +
> +    /*
> +     * Check qiov and qiov_offset
> +     */
> +
> +    if (qiov_offset > qiov->size) {
> +        error_setg(errp, "qiov_offset(%zu) overflow io vector size(%zu)",
> +                   qiov_offset, qiov->size);
> +        return -EIO;
> +    }
> +
> +    if (bytes > qiov->size - qiov_offset) {
> +        error_setg(errp, "bytes(%" PRIi64 ") + qiov_offset(%zu) overflow io "
> +                   "vector size(%zu)", bytes, qiov_offset, qiov->size);
> +        return -EIO;
> +    }

Yes, worthwhile additions.

> @@ -3135,7 +3167,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
>      if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
>          return -ENOMEDIUM;
>      }
> -    ret = bdrv_check_request32(dst_offset, bytes);
> +    ret = bdrv_check_request32(dst_offset, bytes, NULL, 0);

...ah, it's also for copy_range; basically any caller that isn't using a
qiov and therefore can't overflow qiov bounds.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


