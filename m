Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9E60A44B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:07:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omw7v-0004t5-9j; Mon, 24 Oct 2022 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1omw7r-0004rn-56; Mon, 24 Oct 2022 08:00:15 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1omw7m-0008E6-TP; Mon, 24 Oct 2022 08:00:13 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 822725EF83;
 Mon, 24 Oct 2022 14:59:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b691::1:15] (unknown
 [2a02:6b8:b081:b691::1:15])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3WdJ6ggXIw-xmNWctMG; Mon, 24 Oct 2022 14:59:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1666612788; bh=quEauSfJqAyS0DCNTxAKKDzznsKnUSEciJreIBZ7MLw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Z6bwdDMpQadLWJfZGTMYCmPzeekoKxl37cpjhpU/8ce0ZAsXW5WPKJr1SywkAqbFS
 4A8EmxMpspUxQCqpZndzXlxFPqqvRsMlc6ncDje/X4HSulaF/scHbHzVUUJcbVIgXc
 jx861NcpYc4QX85n2XneOqQbY+P9e/RxRKdlm1vU=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fae5e95a-ab8c-3471-dfdb-a959cc7aa1bd@yandex-team.ru>
Date: Mon, 24 Oct 2022 14:59:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] nbd/client: Use smarter assert
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20221017191207.1255807-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221017191207.1255807-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/17/22 22:12, Eric Blake wrote:
> Assigning strlen() to a uint32_t and then asserting that it isn't too
> large doesn't catch the case of an input string 4G in length.
> Thankfully, the incoming strings can never be that large: if the
> export name or query is reflecting a string the client got from the
> server, we already guarantee that we dropped the NBD connection if the
> server sent more than 32M in a single reply to our NBD_OPT_* request;
> if the export name is coming from qemu, nbd_receive_negotiate()
> asserted that strlen(info->name) <= NBD_MAX_STRING_SIZE; and
> similarly, a query string via x->dirty_bitmap coming from the user was
> bounds-checked in either qemu-nbd or by the limitations of QMP.
> Still, it doesn't hurt to be more explicit in how we write our
> assertions to not have to analyze whether inadvertent wraparound is
> possible.
> 
> Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: update subject line and commit message to reflect file being
> touched; adjust a second nearby assertion with the same issue
> 
>   nbd/client.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb1..90a6b7b38b 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -658,11 +658,11 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
>       char *p;
> 
>       data_len = sizeof(export_len) + export_len + sizeof(queries);
> -    assert(export_len <= NBD_MAX_STRING_SIZE);
> +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
>       if (query) {
>           query_len = strlen(query);
>           data_len += sizeof(query_len) + query_len;
> -        assert(query_len <= NBD_MAX_STRING_SIZE);
> +        assert(strlen(query) <= NBD_MAX_STRING_SIZE);
>       } else {
>           assert(opt == NBD_OPT_LIST_META_CONTEXT);
>       }

I'm a bit late, and this should work as is.

Still, for me it's a bit strange: you point to the fact that we probably overflow uint32_t variable. But we keep this fact hidden in the code. So, everyone who read should guess "aha, this extra strlen here is because the previous one may overflow the variable)".

Could we use strnlen() instead of strlen()? That would be also more effective.

-- 
Best regards,
Vladimir


