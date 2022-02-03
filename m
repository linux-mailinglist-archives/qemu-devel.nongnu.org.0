Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA824A85A1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 14:59:48 +0100 (CET)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFceI-0002kH-Nt
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 08:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFccR-0000q2-Fm
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:57:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFccO-00084T-7L
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643896667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Syno0/szVsj8qfsJA1HWs9rwpf5R8DQZ89YaQf19fc=;
 b=Pm9rg0SfHpaR7lY8LQAcyKJYEJqIGKQMRU4Ohocg8CcBggZ5T748WDnHyiWIofJuyAd9Oy
 ELaGEI73u73f9ZMZo538xalyGNuWzBMn0ATWYnDv+sTvXVMhiO6To1tYKGTpvtuOq8p73S
 URkNrn3/99FCjuKqUYPY6KxBBNxbGns=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-09mNsGRoN_CsHo4Qf8JkAg-1; Thu, 03 Feb 2022 08:57:44 -0500
X-MC-Unique: 09mNsGRoN_CsHo4Qf8JkAg-1
Received: by mail-qv1-f72.google.com with SMTP id
 3-20020ad45b83000000b00423e8603906so2414906qvp.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 05:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Syno0/szVsj8qfsJA1HWs9rwpf5R8DQZ89YaQf19fc=;
 b=FoyhqGZBYY6oPsX5QHHtdCdcZrmQkCP6iGYzvz9tqBLOrtf4oZj7m4+00TvQkti5HD
 OkxukpJtTXBVm8jVmg2fCaIkBS1ttnfVxw1YOKcEHgA+Upt+cbBXxLYRH+T9gOCWsVoF
 wI2mS5P1X5BXZ2VandeTOJnVzh4LxQzjaaBtIMSs7fqw9oKvDp44fOnYnhtMob3KBLVo
 JwHb6ZEsLFoYdd98PoGSIMe9EUYuQ4fH2bZA07yJn7NcZ7k+Y+/CP+AW6nmAXMI2kdug
 v7VuHwiwZPrAaCHorOf+dPjLmlYZ1glAK/oaBGWxlqHm6qsf4w+xk0hv2OKMjCTxfnq/
 eFsg==
X-Gm-Message-State: AOAM533mIFKN4uh4FNsCpHrU/N1djmxXgy3Wm2pPEQh4T2lOjD+/QuzF
 JIztjx81vp7UDQXk6qIrhHuPXxw7ngAcyRkmhgFggEb5m5UKk43dEb9GL+479p88P3+46kv2ha/
 m0ovqJSiCeb6awMg=
X-Received: by 2002:a37:c85:: with SMTP id 127mr22901300qkm.6.1643896663707;
 Thu, 03 Feb 2022 05:57:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLSVVzao4n5YQuOaKY3bGBsZ+Df7WkpkM9x1vNKr19chet21RpPJcVR2K1LkKd2JipywRsgw==
X-Received: by 2002:a37:c85:: with SMTP id 127mr22901288qkm.6.1643896663453;
 Thu, 03 Feb 2022 05:57:43 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o22sm12930425qkl.88.2022.02.03.05.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 05:57:42 -0800 (PST)
Message-ID: <6aa2ea07-2b04-89bb-b170-1319c90d4181@redhat.com>
Date: Thu, 3 Feb 2022 14:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 01/12] introduce BDRV_POLL_WHILE_UNLOCKED
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-2-eesposit@redhat.com>
 <YfEnUG2m2AlvJqpE@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YfEnUG2m2AlvJqpE@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/01/2022 11:49, Stefan Hajnoczi wrote:
> On Tue, Jan 18, 2022 at 11:27:27AM -0500, Emanuele Giuseppe Esposito wrote:
>> Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  include/block/block-global-state.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
>> index 419fe8427f..7ad9496f56 100644
>> --- a/include/block/block-global-state.h
>> +++ b/include/block/block-global-state.h
>> @@ -158,6 +158,11 @@ void bdrv_drain_all(void);
>>      AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
>>                     cond); })
>>  
>> +#define BDRV_POLL_WHILE_UNLOCKED(bs, cond) ({              \
>> +    BlockDriverState *bs_ = (bs);                          \
>> +    AIO_WAIT_WHILE_UNLOCKED(bdrv_get_aio_context(bs_),     \
>> +                            cond); })
> 
> No doc comments? When and why is this API useful? Are there any
> preconditions or assumptions (e.g. cond must be thread-safe)?
> 
I am planning to add the following comment above the macro:

/*
 * Unlocked counterpart of BDRV_POLL_WHILE. Uses AIO_WAIT_WHILE_UNLOCKED,
 * so it does not release+acquire the AioContext lock if we are in the
 * main loop, therefore the caller does not need to take it.
 * This function avoids taking the AioContext lock unnecessarly, so use
 * it only when sure that the lock is not taken already, otherwise it
 * might cause deadlocks.
 *
 * @cond must be thread-safe.
 */

Emanuele


