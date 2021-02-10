Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E0316CD3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:34:19 +0100 (CET)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tNa-0003yH-6d
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9sxx-0002rF-UD
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9sxw-0007Wb-5V
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4xEj40JHMAkmV+UGhduMi2CBUCvRQPSMHkbc+5myCA=;
 b=FqS5Ty/65gqb58sI6mT0Wf0C6yiPDXcAfkA6pLogUTU16dxP0xA4ePPf4+tRCDkpN9wkv1
 0EYY759d0/KE2p0TXCuoCrYbSGAmp7yTZsiXKMA8ATwbC/d/SDnsYUVV2axIcn1bGAaisR
 TuILfYDTiYJQY97UgWWloBmCSTjfEyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-wWglDauNPPeja3SDHR0_Jw-1; Wed, 10 Feb 2021 12:07:42 -0500
X-MC-Unique: wWglDauNPPeja3SDHR0_Jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE02AFA8C;
 Wed, 10 Feb 2021 17:07:40 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36595D6B1;
 Wed, 10 Feb 2021 17:07:38 +0000 (UTC)
Subject: Re: [PATCH 1/7] qemu/queue: add some useful QLIST_ and QTAILQ_ macros
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-2-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <97ee3fe5-63d7-5bfe-807d-23764cbdd557@redhat.com>
Date: Wed, 10 Feb 2021 18:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129165030.640169-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
> Add QLIST_FOREACH_FUNC_SAFE(), QTAILQ_FOREACH_FUNC_SAFE() and
> QTAILQ_POP_HEAD(), to be used in following commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/qemu/queue.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/include/qemu/queue.h b/include/qemu/queue.h
> index e029e7bf66..03e1fce85f 100644
> --- a/include/qemu/queue.h
> +++ b/include/qemu/queue.h
> @@ -173,6 +173,13 @@ struct {                                                                \
>                   (var) && ((next_var) = ((var)->field.le_next), 1);      \
>                   (var) = (next_var))
>   
> +#define QLIST_FOREACH_FUNC_SAFE(head, field, func) do {                 \
> +    typeof(*QLIST_FIRST(head)) *qffs_var, *qffs_next_var;               \
> +    QLIST_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {        \
> +        (func)(qffs_var);                                               \
> +    }                                                                   \
> +} while (/*CONSTCOND*/0)
> +

On one hand I have inexplicable reservations against adding these macros 
if they’re only used one time in the next patch.

On the other, I have one clearly expressible reservation, and that’s the 
fact that perhaps some future functions that could make use of this want 
to take more arguments, like closures.

Could we make these function vararg macros?  I.e., e.g.,

#define QLIST_FOREACH_FUNC_SAFE(head, field, func, ...) do {
     ...
         (func)(qffs_var, ## __VA_ARGS__);
     ...

Max

>   /*
>    * List access methods.
>    */
> @@ -490,6 +497,13 @@ union {                                                                 \
>                (var) && ((prev_var) = QTAILQ_PREV(var, field), 1);        \
>                (var) = (prev_var))
>   
> +#define QTAILQ_FOREACH_FUNC_SAFE(head, field, func) do {                \
> +    typeof(*QTAILQ_FIRST(head)) *qffs_var, *qffs_next_var;              \
> +    QTAILQ_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {       \
> +        (func)(qffs_var);                                               \
> +    }                                                                   \
> +} while (/*CONSTCOND*/0)
> +
>   /*
>    * Tail queue access methods.
>    */
> 


