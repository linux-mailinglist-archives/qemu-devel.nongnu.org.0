Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF453FAF6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWE8-0007Ls-2q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyW5f-0001Cy-AM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyW5a-0006do-HA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654596319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFCQVelYEOI/B5ogxulzH2GdmJpolbFgNiKE24Qrr6Q=;
 b=hgcPYnDwieaurylCi0f+7l4HKjqhMZGDbd8Ng3CFgBfmhkrVQ/ASgatTs6J6jefZaIlUZ2
 5KMNZ3ZA4D4tzy8FFfQNzUtS4jQA+ZO9V5MSc/FUqF67WIDc9doT1scluuvher0S2kmT9A
 AvRjt69qidhieMnZT0IS1qLWXNKb2ds=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-K2UpZ7HKPqGtg-z3uEvOJw-1; Tue, 07 Jun 2022 06:05:18 -0400
X-MC-Unique: K2UpZ7HKPqGtg-z3uEvOJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h14-20020adfa4ce000000b00218518b622eso406265wrb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xFCQVelYEOI/B5ogxulzH2GdmJpolbFgNiKE24Qrr6Q=;
 b=mReWWu8znADgsQIWhXRO7noH8ECeMxvhNd0X1Mj/EC28vOen6ulxIivVDQMFKvVy//
 xAsHuoHJlzJdRzDI41UX2uq4jG1s+meK0EkwzFMeEAYsicOBf59pQseVbC/2M21TthER
 H56QkeSDWlnyeHvxhj8m6U5gHfGoy1NCjrWym/c8HWbxE/Jg6sAnkDvXaMVPZLaM+98f
 Z0MTwkhEq3+fNuVrCzw7u0BLRovgZC+quh9yD581RzKrElYI8rMq34LZb1KjRGhDMGVa
 Jn/aGn9wRUHXlzrkeFhYLeJTnTwvwY8Q3tciQZvl7oyrBtJrsUuJ1lKsTvAAJJ7QPgyo
 FQkw==
X-Gm-Message-State: AOAM530TUZSUFEhSwRSE8MjbuuLaW5oSP4ZF2ekw6kpX9SLxABPJLRWB
 oq/kNGMvE1UMVlk31AkU+wGn5IOb9VBYqQJlW5QsO+UAB6YpeJsLMr0fLifIhVqUvMZKC76u/U0
 VUa8lzd9wQx+CICY=
X-Received: by 2002:a5d:4646:0:b0:210:3e3c:86dc with SMTP id
 j6-20020a5d4646000000b002103e3c86dcmr26535948wrs.277.1654596316096; 
 Tue, 07 Jun 2022 03:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqChYxqAtnFQVqUh7buwxIj6lWs8l3GQd9TGzKbzJo9ERJqi6Nso5jcyEZyNdD9tlIh9jeUA==
X-Received: by 2002:a5d:4646:0:b0:210:3e3c:86dc with SMTP id
 j6-20020a5d4646000000b002103e3c86dcmr26535922wrs.277.1654596315900; 
 Tue, 07 Jun 2022 03:05:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 x4-20020adfffc4000000b0021018642ff8sm17532857wrs.76.2022.06.07.03.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:05:15 -0700 (PDT)
Message-ID: <bceb3388-4533-e9f7-b90d-7b207b1f05a6@redhat.com>
Date: Tue, 7 Jun 2022 12:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 03/45] block/blklogwrites: don't care to remove
 bs->file child on failure
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, Ari Sundholm <ari@tuxera.com>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-4-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-4-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> We don't need to remove bs->file, generic layer takes care of it. No
> other driver cares to remove bs->file on failure by hand.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/blklogwrites.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


