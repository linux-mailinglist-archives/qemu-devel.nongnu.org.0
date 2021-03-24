Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74467347B3B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:58:23 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4xi-0006GI-GN
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4qj-0005om-Fq
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4qd-0001Ua-KP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616597461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwT75KGdRMZHxnQwshFRe3rLbCBXaIr8CoB2lNLCl6M=;
 b=Ej6InHKEz6f3fKptfgLRTjmbfusfOY7LFz1MLcVrie9ffLk0ZZ7FUWvbQ5VORhajukPKPb
 9rKKvgJ7FKPWHGJFdSolzLSBZHdn+0Q62imZaL4CghLIUFyiBCP99sJA4jL7bpT34uqr7S
 9lYNQZDkAtmxY3WRhnNmCDOwsYgJ2Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-ri6l8pSPPzSJ13dM_j4qvw-1; Wed, 24 Mar 2021 10:50:59 -0400
X-MC-Unique: ri6l8pSPPzSJ13dM_j4qvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6129C10AA49D;
 Wed, 24 Mar 2021 14:50:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-161.ams2.redhat.com
 [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46788614FF;
 Wed, 24 Mar 2021 14:50:50 +0000 (UTC)
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
To: ChangLimin <changlm@chinatelecom.cn>, qemu-block <qemu-block@nongnu.org>
References: <2021032217253258728710@chinatelecom.cn>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>
Date: Wed, 24 Mar 2021 15:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2021032217253258728710@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
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
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.21 10:25, ChangLimin wrote:
> For Linux 5.10/5.11, qemu write zeros to a multipath device using
> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUSY
> permanently.

So as far as I can track back the discussion, Kevin asked on v1 why we’d 
set has_write_zeroes to false, i.e. whether the EBUSY might not go away 
at some point, and if it did, whether we shouldn’t retry BLKZEROOUT then.
You haven’t explicitly replied to that question (as far as I can see), 
so it kind of still stands.

Implicitly, there are two conflicting answers in this patch: On one 
hand, the commit message says “permanently”, and this is what you told 
Nir as a realistic case where this can occur.  So that to me implies 
that we actually should not retry BLKZEROOUT, because the EBUSY will 
remain, and that condition won’t change while the block device is in use 
by qemu.

On the other hand, in the code, you have decided not to reset 
has_write_zeroes to false, so the implementation will retry.

So I don’t quite understand.  Should we keep trying BLKZEROOUT or is 
there no chance of it working after it has at one point failed with 
EBUSY?  (Are there other cases besides what’s described in this commit 
message where EBUSY might be returned and it is only temporary?)

> Fallback to pwritev instead of exit for -EBUSY error.
> 
> The issue was introduced in Linux 5.10:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> 
> Fixed in Linux 5.12:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=56887cffe946bb0a90c74429fa94d6110a73119d
> 
> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
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

(Not sure why this break is here.)

Max

>           }
>       }
>   #endif
> --
> 2.27.0
> 


