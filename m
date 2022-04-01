Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F84EEDF3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:18:25 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHAW-0001KB-U2
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:18:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naH8h-0007Ar-Os
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naH8g-0005xI-67
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648818989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtJHMovmBOjMMtk0M9iWOe8UQp81Z4vl6GHNUWF35Uw=;
 b=G1UJV5oFqMq8Km2K3I+lQ4YuRIq+LnwIlSnGtuN0tEXv17d7VAiJq7Nnf9ppvhYfd87rtE
 VJ8Epg5hrm5nWk98LZFjr0ILN4yGvbyopgxySyhw3MjZKIwKCxG295UtPnGERtYKir01x2
 3dnenWEOhNzCWJbhytWfcpKoWkkEc9Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-31jBtT27MQKUUEbif-5C6g-1; Fri, 01 Apr 2022 09:16:28 -0400
X-MC-Unique: 31jBtT27MQKUUEbif-5C6g-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a05640207d100b00418f00014f8so1505842edy.18
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AtJHMovmBOjMMtk0M9iWOe8UQp81Z4vl6GHNUWF35Uw=;
 b=ueZU+GLGIvYb9DBytXF9UQqAVMJO7EBWce82ANMv+amlj0wmKlqtY9Z4Kyc02x51ON
 SvIC12y00UVRViMXL3z5uSdpTjm/c5NPMJBFN4kFlWLV3HRKZw9iQ1RP66Fxoe/RUqIK
 HUfbvpzbQsswKRHrXmkYv0yshxK5sA5X4J06d0gNr3wvISb4ReUlXC0NxMtIFXTJIarn
 Rxd+3Yq5WgUEs6hZD20kQMCeGdC59kPdmMhQyfa2NyWmrLDaEINkvlY0EyhNenX2299E
 yprde6BWXVLkF7hVSM36LwIEOpUg+h1anPcRRWTLg3JhRr0gT7Uhv2O2T5lAgxzFpWSb
 bhRA==
X-Gm-Message-State: AOAM5336B8inWBZ1dr3mIOnw01cwAUIWWwazlpe0/ASdgXBJ/l7UQHt/
 GLnHL4th9p2lUrYKLv1/oYRcOdOYZA5/sWuqwmjJHMvdrQXBD6kGUvwQiwIevyTLndzptZXpAzG
 2viDoW28LGJ2iNI0=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr9371826ejc.132.1648818987434; 
 Fri, 01 Apr 2022 06:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmTNf7AoWzkWpBFnAt+evTq+HAk8QYbKX0dGjOfAqpPFJ5gr7DoTA7F+PcBRAo2xfB/rckNQ==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr9371788ejc.132.1648818986996; 
 Fri, 01 Apr 2022 06:16:26 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a170906255500b006e08c4862ccsm1035819ejb.96.2022.04.01.06.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:16:26 -0700 (PDT)
Message-ID: <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
Date: Fri, 1 Apr 2022 15:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-6-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-6-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to limit block_copy() call in time. To be used in the
> next commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/block-copy.c         | 26 +++++++++++++++++++-------
>   block/copy-before-write.c  |  2 +-
>   include/block/block-copy.h |  2 +-
>   3 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/block/block-copy.c b/block/block-copy.c
> index ec46775ea5..b47cb188dd 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c

[...]

> @@ -894,12 +902,16 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
>           .max_workers = BLOCK_COPY_MAX_WORKERS,
>       };
>   
> -    return block_copy_common(&call_state);
> -}
> +    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
> +                          g_free);

A direct path for timeout_ns == 0 might still be nice to have.

> +    if (ret < 0) {
> +        /* Timeout. call_state will be freed by running coroutine. */

Maybe assert(ret == -ETIMEDOUT);?

> +        return ret;

If I’m right in understanding how qemu_co_timeout() works, 
block_copy_common() will continue to run here.  Shouldn’t we at least 
cancel it by setting call_state->cancelled to true?

(Besides this, I think that letting block_copy_common() running in the 
background should be OK.  I’m not sure what the implications are if we 
do cancel the call here, while on-cbw-error is break-guest-write, 
though.  Should be fine, I guess, because block_copy_common() will still 
correctly keep track of what it has successfully copied and what it hasn’t?)

> +    }
>   
> -static void coroutine_fn block_copy_async_co_entry(void *opaque)
> -{
> -    block_copy_common(opaque);
> +    ret = call_state->ret;
> +
> +    return ret;

But here we still need to free call_state, right?

>   }
>   
>   BlockCopyCallState *block_copy_async(BlockCopyState *s,


