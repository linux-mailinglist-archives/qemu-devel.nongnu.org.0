Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E36344DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:54:24 +0100 (CET)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOkx-0006Ak-O6
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOOhJ-0003P6-Pp
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOOhG-0000Qs-Rw
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616435433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5QpqCM24EbkJLqYxnVl5CCtw/qe+tdk11RNEZedRMs=;
 b=f+gdcNVT07tGXA4Nl2c7Ws/5nCr+Xfrl/26DPSvD5yuulus2B5bMGoSQmheuoPT+3L3a4L
 igECcjQ5Td2OcMmt/vk/OLIU4xGQDoq6419f3VJoujw4qAIYLuScoFcV/Mo3i5MDE0iR0b
 +jkTLcBNtmsZloQZn5CqoKy5GaFh4WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-mh3zF9ErOOS8eDoCoukpQQ-1; Mon, 22 Mar 2021 13:50:31 -0400
X-MC-Unique: mh3zF9ErOOS8eDoCoukpQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F757EC1A0;
 Mon, 22 Mar 2021 17:50:29 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9C455B6AD;
 Mon, 22 Mar 2021 17:50:27 +0000 (UTC)
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
To: ChangLimin <changlm@chinatelecom.cn>, qemu-block <qemu-block@nongnu.org>
References: <2021032217253258728710@chinatelecom.cn>
From: John Snow <jsnow@redhat.com>
Message-ID: <f7eca115-0d93-ab83-cfc7-33035c9a72d4@redhat.com>
Date: Mon, 22 Mar 2021 13:50:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2021032217253258728710@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 5:25 AM, ChangLimin wrote:
> For Linux 5.10/5.11, qemu write zeros to a multipath device using
> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUSY
> permanently. Fallback to pwritev instead of exit for -EBUSY error.
> 
> The issue was introduced in Linux 5.10:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> 
> Fixed in Linux 5.12:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=56887cffe946bb0a90c74429fa94d6110a73119d
> 
> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>

To be clear, when I asked "When do we get -EINVAL?" it wasn't because I 
doubted that we would ever get it, I was just unclear of the 
circumstances in which we might receive EINVAL and was hoping you would 
explain it to me.

> ---
>   block/file-posix.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 20e14f8e96..d4054ac9cb 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1624,8 +1624,12 @@ static ssize_t 
> handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
>           } while (errno == EINTR);
> 
>           ret = translate_err(-errno);
> -        if (ret == -ENOTSUP) {
> -            s->has_write_zeroes = false;
> +        switch (ret) {
> +        case -ENOTSUP:
> +            s->has_write_zeroes = false; /* fall through */
> +        case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY for multipath 
> devices */
> +            return -ENOTSUP;
> +            break;

What effect does this have, now?

We'll return ENOTSUP but we won't disable trying it again in the future, 
is that right?

Kevin, is this what you had in mind?

--js

>           }
>       }
>   #endif
> --
> 2.27.0
> 


