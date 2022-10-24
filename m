Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DA60B48D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:51:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyon-0004jn-FT; Mon, 24 Oct 2022 10:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omyoh-0004iO-Rc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omyof-0002Uf-9W
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666623156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOpl1YRkz7oR7Y/10T9hYrOTyMy+UdHYt2D2QFAsfOE=;
 b=CjHLSFA7FNpn8MTG782EmQ+F2vR+O/sJi7nXp7As8qIAhOXgF2UH4VCJOZYsp6WLbpzdxJ
 ObjHccJ7d/Od6UAcNTTZ2A2ixVavvMmtNHh3jaZ1l4BoIWEftpGURCEnAFPlbo4UZo/+26
 FbOUKvyrrZO/P7IQtKgqmP9sZLxmXjk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-wQFs75scNraWF4501xpWGQ-1; Mon, 24 Oct 2022 10:52:34 -0400
X-MC-Unique: wQFs75scNraWF4501xpWGQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 de21-20020a05620a371500b006eed31abb72so9094824qkb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pOpl1YRkz7oR7Y/10T9hYrOTyMy+UdHYt2D2QFAsfOE=;
 b=hRCHdaZAOOn8F96Fxz+6uxvGutGwTcWkAs3ZDL3AT1XYpo3E+Pvbh46VvuYTG3BaSu
 ZpeRFE4JYjIyJ4sD6IUoCVFm2CMoeIv+MiDO8UFQx7NlE/YBtZ+al6UqX7rUZvbKNj3v
 7/imgNDoG8kAks4d5Qwz/sOaDzg2hRi4ik5tnhtoaIacpz/uE+M2REm+M3TYW/CsIq7M
 dYG1T3hIOdSsJUtEDyJ4WArVzmlejakaqJUxT5e/7JpR/g6qSNQgDUwtrQN1pVJ7FfVE
 ecSBvngAltwQNdcn8hL4mYwMdG5oNPt3UX0UVkwFqVJoMyjgncyO2HpetMGmbkBcUj5M
 eLZA==
X-Gm-Message-State: ACrzQf3/7pRwbgUwvGGXZN7qlysSU9PTujrtHTyoldtdzBI9o3qSywvd
 sBatqlDrMx1jAwR5YvJAqZYG16gk0hVPeTGtAh0HduHnTs7M0ayXxZhk+N9h5dd2yNj4rZ1Z+Ow
 FUiCBJgzQn1Zhr+g=
X-Received: by 2002:a05:620a:2989:b0:6ee:11dd:4f22 with SMTP id
 r9-20020a05620a298900b006ee11dd4f22mr23419577qkp.693.1666623154425; 
 Mon, 24 Oct 2022 07:52:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57Bo4zUA0kR0DF8T15/iiS97GkMjoZIoy4BvEYGHt9CFYmqWCaiI4n64dmavuvMSOjz6RFBA==
X-Received: by 2002:a05:620a:2989:b0:6ee:11dd:4f22 with SMTP id
 r9-20020a05620a298900b006ee11dd4f22mr23419562qkp.693.1666623154154; 
 Mon, 24 Oct 2022 07:52:34 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05620a440c00b006ef0350db8asm41638qkp.128.2022.10.24.07.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:52:33 -0700 (PDT)
Message-ID: <878197f6-6955-13f1-5305-594c16b6c867@redhat.com>
Date: Mon, 24 Oct 2022 16:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 04/11] bdrv_child_try_change_aio_context: add
 transaction parameter
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-5-eesposit@redhat.com> <Y0BPe6+f/db7hvnt@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y0BPe6+f/db7hvnt@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 07/10/2022 um 18:10 schrieb Kevin Wolf:
> Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
>> This enables the caller to use the same transaction to also
>> keep track of aiocontext changes.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> What you're really doing here is factoring out the recursive phase.
> However, the factored out function is never used from anywhere else,
> so I don't understand the purpose of this patch. It feels like an
> unnecessary complication of the code.
> 
> The commit message is unclear to me, too: Who is the caller of
> bdrv_child_try_change_aio_context() that it mentions, and why does it
> make a difference to it how the code is organised internally?

So this was an initial (mis)understanding from what Vladimir suggested,
where everything should be part of a single transaction.
If you want, I can drop this.

Thank you,
Emanuele

> 
> Is this some artifact of changes you made and we don't need it any more
> now?
> 
>>  block.c                            | 31 ++++++++++++++++++++++++------
>>  include/block/block-global-state.h |  5 +++++
>>  2 files changed, 30 insertions(+), 6 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index c02a628336..221bf90268 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -7643,17 +7643,16 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>>   * For the same reason, it temporarily holds also the new AioContext, since
>>   * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
>>   */
>> -int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
>> -                                      BdrvChild *ignore_child, Error **errp)
>> +int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
>> +                                           AioContext *ctx,
>> +                                           BdrvChild *ignore_child,
>> +                                           Transaction *tran,
>> +                                           Error **errp)
> 
> As mentioned above, this is never used anywhere else than from
> bdrv_child_try_change_aio_context(), so if we want to keep the patch, it
> should be static at least.
> 
> Maybe find a better name, too, because all of the transaction related
> operations are in the caller.
> 
> The function comment is not accurate any more either because it
> described the whole of bdrv_child_try_change_aio_context(), while this
> function only contains the recursive part.
> 
> Kevin
> 


