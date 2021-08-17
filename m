Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103833EE9B7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:28:33 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvOa-0004ck-3a
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFvNU-0003Zx-VT
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFvNS-0005pE-4W
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629192441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziLibRFq4LmINPnHZ5Vek/4tfRATvMYN2709y185uB4=;
 b=IQrW2lxI+R300qWioO9EkFau5Bgpg5cAUodNIgMDNHVzwTM1EICLzcRYrwKlHPf9ZHkLya
 vjlM0Wgz7CgyGVd9M3Iy5bqo1nEugA1h+WIVzEmA//M6jDzsy0u436AZ2fHdNlKBiHP1v+
 4F9gvamRVMHCma87QcYE+0f5CAhoODE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-X8pQyJxlPReUAripeZGEnQ-1; Tue, 17 Aug 2021 05:27:20 -0400
X-MC-Unique: X8pQyJxlPReUAripeZGEnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so655759wme.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ziLibRFq4LmINPnHZ5Vek/4tfRATvMYN2709y185uB4=;
 b=peJWnlrWUfnXeBq9WM1nYLusCBI4wB0VkLWhRWw1TRmY+VvIpf1kpo+Il6SLITJlTy
 ZBxshuHQ5MRe9Kdv0YIKU1Rg0ziQQyk98riXigWDD5C/xjTymYUrRty4zbgVS3+RD+aS
 cpM0IZP4Wd8rlxWs0/u9sQJnrWvdas6ATXOhAya8qe271YJJqiM8RUJwXeA7/ZIxoEHU
 LQ4+bDwG9MWMpip9xgFA7gmBAo8BJ8lCcNFpP4kicofNyoIMjbO85JosSYA6vewGHlKj
 VfSsEJqWJp97XCZjXzxqX5b3Gij7AZEJNhRHQNBIyK4Zy+wOZO9W/yUmMoCF04k2Dqv6
 Pguw==
X-Gm-Message-State: AOAM531E/VGKMMf3SMAw+WDCCsGHgqZYx5EuABhGREe0Iez1eBjSdbJF
 M2pwe56X3ZuiyaZQ2XvR3qcTiiYCyjYvx0lB2PyM8eVC9IOg8bmNRYBxpld5uXeyhw2vs5UTmJa
 3/HX1nalPjJ8i7dM=
X-Received: by 2002:a5d:4691:: with SMTP id u17mr2847187wrq.254.1629192438131; 
 Tue, 17 Aug 2021 02:27:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy3KbW7rrwuG10oElT1CQ2/Xh4J8Ezjir8osNmrWDfB1gG5noq3GvQwgbK1cMOi6fQXJLqCg==
X-Received: by 2002:a5d:4691:: with SMTP id u17mr2847163wrq.254.1629192437872; 
 Tue, 17 Aug 2021 02:27:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o125sm1527044wme.15.2021.08.17.02.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 02:27:17 -0700 (PDT)
Subject: Re: [PATCH for-6.2 1/2] include/qemu/int128.h: introduce bswap128s
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
 <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b5b5ca02-aac5-4bc3-3898-b45c53c8b5a6@redhat.com>
Date: Tue, 17 Aug 2021 11:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 9:13 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Introduces bswap128s based on bswap128. Since bswap128 is defined using
> int128_* methods available in either CONFIG_INT128 or !CONFIG_INT128
> builds, place both outside of #ifdef CONFIG_INT128.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  include/qemu/int128.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index 64500385e3..e0d385628c 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -153,11 +153,6 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
>      *a -= b;
>  }
>  
> -static inline Int128 bswap128(Int128 a)
> -{
> -    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
> -}

Personally I'd move this one to the other #ifdef side,
and implement here with __builtin_bswap128().

>  #else /* !CONFIG_INT128 */
>  
>  typedef struct Int128 Int128;
> @@ -338,4 +333,15 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
>  }

> +static inline Int128 bswap128(Int128 a)
> +{
> +    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
> +}

   #endif /* CONFIG_INT128 */

And add this generic one here indeed:

> +static inline void bswap128s(Int128 *s)
> +{
> +    *s = bswap128(*s);
> +}
> +
>  #endif /* INT128_H */
> 


