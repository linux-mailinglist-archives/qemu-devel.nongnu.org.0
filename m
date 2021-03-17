Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C025F33FBC4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:25:29 +0100 (CET)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfXc-0002NK-8h
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMfW2-0001rk-J3
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMfVz-00062Z-4l
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616023424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/GebJ3KRBOXByyb6jm04RnrgWT+vhH72A3eFUqF4hk=;
 b=I6C2wmZjVQwZX1CqyF/rZyOqIaoTIevBdHf/cpPGHbGXN1aEXqZA5ydqIqWVJeuIU9SQcn
 tWYUY1Ui3hzJEDtpqHlvop9RO86Vmoa2hdYSy5szqNG/PLylW6o5vnNPREKTvqKGxBUXsV
 WO22GM8YtcxB/phdKzT67V9YNTCZYgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-4-KNzwtmO4mMRpz6ZscVYQ-1; Wed, 17 Mar 2021 19:23:43 -0400
X-MC-Unique: 4-KNzwtmO4mMRpz6ZscVYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBCF107B769;
 Wed, 17 Mar 2021 23:23:41 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 460395D6AC;
 Wed, 17 Mar 2021 23:23:41 +0000 (UTC)
Subject: Re: [PATCH V3] file-posix: allow -EBUSY -EINVAL errors during write
 zeros on block
To: ChangLimin <changlm@chinatelecom.cn>, qemu-block <qemu-block@nongnu.org>
References: <2021031008163294066310@chinatelecom.cn>
From: John Snow <jsnow@redhat.com>
Message-ID: <284d4c03-b7b1-cc77-c187-3dc468e83e0c@redhat.com>
Date: Wed, 17 Mar 2021 19:23:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2021031008163294066310@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 7:16 PM, ChangLimin wrote:
> Since Linux 5.10, write zeros to a multipath device using
> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUSY
> permanently.
> 

When do we get -EINVAL? Both of the commits referenced below don't 
specifically mention it, so I am not sure in which circumstances that 
might arise.

> Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_block
> allow -EBUSY and -EINVAL errors during ioctl(fd, BLKZEROOUT, range).
> 
> Reference commit in Linux 5.10:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02 
> <https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02>
> 
> Although it will be fixed in 5.12, I think it's good to avoid similar 
> problem in the future.
> https://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9a626cd99@kernel.dk/ 
> <https://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9a626cd99@kernel.dk/>
> 

Wait, if they're fixing the function to actually apply a different 
fallback path, shouldn't we *not* allow EBUSY?

> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> ---
>   block/file-posix.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 05079b40ca..4e132db929 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1629,8 +1629,13 @@ static ssize_t 
> handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
>           } while (errno == EINTR);
> 
>           ret = translate_err(-errno);
> -        if (ret == -ENOTSUP) {
> -            s->has_write_zeroes = false;
> +        switch (ret) {
> +        case -ENOTSUP:
> +            s->has_write_zeroes = false; /* fall through */
> +        case -EINVAL:
> +        case -EBUSY:
> +            return -ENOTSUP;
> +            break;

oh, we're not "allowing" them, we're treating the failure *more 
seriously* so that we avoid attempting to call this function ever again 
for this FD.

Can you please add a brief comment here, something like:

/* Linux 5.10/5.11 may return these for multipath devices */

>           }
>       }
>   #endif
> --
> 2.27.0
> 


