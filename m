Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA0645AF3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uVR-0004fL-Mm; Wed, 07 Dec 2022 08:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uUm-0004X6-Nx
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uUl-0002kb-6w
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419794;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJaQ9F/vtZVfiwzRokoFg7rcXZVrZBhg+UuI/ES615Y=;
 b=M1lmTCXRo7Gr5OwC6hZ50esYHg3FQkhiQ7VH2dD4aylX3c0EODu5Kdg3b8C6kSAAbVuFHD
 +kC8WTtwSRWNYyTdzzonCXXcVJtIFRwJIXcquX2X7h7GBXADQXY4uBqje9zWEhuWRO1JNu
 QGNauWimEZU85Lbwn08JoigxbuwjaTM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-C6Zs3FA5MTyWRWu7iAPfgg-1; Wed, 07 Dec 2022 08:29:53 -0500
X-MC-Unique: C6Zs3FA5MTyWRWu7iAPfgg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso9983759wme.3
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 05:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJaQ9F/vtZVfiwzRokoFg7rcXZVrZBhg+UuI/ES615Y=;
 b=xIDoxO9qJRN+kOfyd8q2FtsLmwUXKVb9NpTgEQwlr7hUf1ZRtLyNARvMJm/mdwe+rx
 YvcgbJLKbpnxUMxNENbXh360nheBB3lo75V/dKq0KI+h3F9QVEBrjjFtPfkAYzqKqkmI
 iCxD3x6GPrt1GxTtS8IwsMQKwtLjxRbe1G18MSLmZuDWRm3ZH1mBLtf72VDwfMq8YsUo
 dMjC/tdutNtLcI1hxSlQlQOM1SLTKOi8qKqPeIA7Rp6ZJBmIKcqO6I9wwLkFiuX5Qlaz
 Ahi2S4FRbiYMGRMUbXiCrilmwB76AnVjAAOxmL0l/Sq55JxalKEG52mC5C1n3LO7NfWa
 EDXw==
X-Gm-Message-State: ANoB5pmny69yWDlDfDc7LJCywm5zWZL67te7HDbR+EeijzlbfUhn5Pzb
 RMaMCSZFcbjb1QSquOO2vHnCR4J3sGSS0MOMi9n/xVLqct2iut8Scpx8hSh3LYXTZmVrdhdGrdg
 iNbVg+YzW0M1uLp4=
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr16089385wrs.583.1670419791209; 
 Wed, 07 Dec 2022 05:29:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KzN1qNUfA11RbeGc58O0ToGpgqdG7evwcw+9DH/kEribm5HOiQFPtqD9aIsEzdtSTQ8bObw==
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr16089375wrs.583.1670419790964; 
 Wed, 07 Dec 2022 05:29:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d670c000000b002424b695f7esm12825765wru.46.2022.12.07.05.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 05:29:50 -0800 (PST)
Message-ID: <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
Date: Wed, 7 Dec 2022 14:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger.pro@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221207132439.635402-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/7/22 14:24, Eric Auger wrote:
> Initialize r0-3 to avoid compilation errors when
> -Werror=maybe-uninitialized is used
>
> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  2495 |     d->Q(3) = r3;
>       |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  2494 |     d->Q(2) = r2;
>       |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  2493 |     d->Q(1) = r1;
>       |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  2492 |     d->Q(0) = r0;
>       |     ~~~~~~~~^~~~
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>
> ---
>
> Am I the only one getting this? Or anything wrong in my setup.

With Stefan's correct address. Forgive me for the noise.

Eric
> ---
>  target/i386/ops_sse.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 3cbc36a59d..b77071b8da 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2451,7 +2451,7 @@ void glue(helper_vpgatherqq, SUFFIX)(CPUX86State *env,
>  #if SHIFT >= 2
>  void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
>  {
> -    uint64_t r0, r1, r2, r3;
> +    uint64_t r0 = 0, r1 = 0, r2 = 0, r3 = 0;
>  
>      switch (order & 3) {
>      case 0:


