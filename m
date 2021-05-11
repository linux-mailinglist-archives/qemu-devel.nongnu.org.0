Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77E37A3F6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:46:49 +0200 (CEST)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOyW-0004Hi-DB
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgOty-0004an-83
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:42:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgOtv-0008Pd-Sp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620726122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNUeuCZVqt8vLL11KMdcqr8Q1bbAbSN1nHhIjAW3j6c=;
 b=gg3KAQDgAQyxSNX4jab2oyU2fL4nxMkBch+9YgJGB2IexMVuNpMgaQyOwcaPRdLHkKUdsQ
 nLPt8Cgl+PeuV8r3zxVpO8K1SaOCSbfdyQuG5GRpqYDA8cT4Tfzq8G8q12+Ng2pD6Qb9SQ
 M5nya6cfsEAYQACOa7Vi0HntDhWR7qY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-X8wBCWEJNt-EMGdjVsysTQ-1; Tue, 11 May 2021 05:42:00 -0400
X-MC-Unique: X8wBCWEJNt-EMGdjVsysTQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so10661359edq.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wNUeuCZVqt8vLL11KMdcqr8Q1bbAbSN1nHhIjAW3j6c=;
 b=o5diUWg3FpLgeTMjS1sBxrwarf7nXIvDJ1SuuriVZgF/px7PPWBxv8k+ko9BKtwlZN
 8vKOHQN1MuV4PZxZ4OLIj+7jkv3NG4JxJgoiUN5Yfz7rWB39G+8hmCpdFYHR53qkUZUt
 ETRgpt9+Kz9zWBJOopQmtpTWvMYPRaa3h0A+FsXi9jVxXzKogisOGu9AQXQqRS/d28tJ
 iRsj+HYF2EIqHLRDxN43H4Xp77jaCImm5wCn5Jo95JJR0WMU6tPHgdQ0s99A/Vz4JgbX
 6J2w9mtPxJmmhfgBp5Ugu/4kQzKSJDz4xzjI4ATBNvsrMVwHBmeDLPl8EpsWbN3fNPqL
 oKig==
X-Gm-Message-State: AOAM530LJ1j2q/mAnBh58yzLBSSczZq/ZDlAAb+GEWzYjVtvefxfXlqa
 uh8JFzvqVwB4mIGrlkhedu7W2lzT/FeEpJ3kzoRavsuyK99SClwTRORvmMhzGCA8VEPkw0Pq7DW
 QrQfT/RTRmECVkKM=
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr35297574edv.87.1620726119298; 
 Tue, 11 May 2021 02:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhSM/UawZnKn5Woojw3r1cFdIVLKXsfQrYv2vSjovsMGxUadNkDmruX1N8za45vQRPukD+OQ==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr35297554edv.87.1620726119054; 
 Tue, 11 May 2021 02:41:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id u4sm212472eds.1.2021.05.11.02.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 02:41:58 -0700 (PDT)
Subject: Re: [PATCH 01/72] qemu/host-utils: Use __builtin_bitreverseN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <58ff1939-ece5-6e97-df1b-f6a4b4661d1e@redhat.com>
Date: Tue, 11 May 2021 11:41:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:46, Richard Henderson wrote:
> Clang has added some builtins for these operations;
> use them if available.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/host-utils.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index cdca2991d8..f1e52851e0 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -272,6 +272,9 @@ static inline int ctpop64(uint64_t val)
>    */
>   static inline uint8_t revbit8(uint8_t x)
>   {
> +#if __has_builtin(__builtin_bitreverse8)
> +    return __builtin_bitreverse8(x);
> +#else
>       /* Assign the correct nibble position.  */
>       x = ((x & 0xf0) >> 4)
>         | ((x & 0x0f) << 4);
> @@ -281,6 +284,7 @@ static inline uint8_t revbit8(uint8_t x)
>         | ((x & 0x22) << 1)
>         | ((x & 0x11) << 3);
>       return x;
> +#endif
>   }
>   
>   /**
> @@ -289,6 +293,9 @@ static inline uint8_t revbit8(uint8_t x)
>    */
>   static inline uint16_t revbit16(uint16_t x)
>   {
> +#if __has_builtin(__builtin_bitreverse16)
> +    return __builtin_bitreverse16(x);
> +#else
>       /* Assign the correct byte position.  */
>       x = bswap16(x);
>       /* Assign the correct nibble position.  */
> @@ -300,6 +307,7 @@ static inline uint16_t revbit16(uint16_t x)
>         | ((x & 0x2222) << 1)
>         | ((x & 0x1111) << 3);
>       return x;
> +#endif
>   }
>   
>   /**
> @@ -308,6 +316,9 @@ static inline uint16_t revbit16(uint16_t x)
>    */
>   static inline uint32_t revbit32(uint32_t x)
>   {
> +#if __has_builtin(__builtin_bitreverse32)
> +    return __builtin_bitreverse32(x);
> +#else
>       /* Assign the correct byte position.  */
>       x = bswap32(x);
>       /* Assign the correct nibble position.  */
> @@ -319,6 +330,7 @@ static inline uint32_t revbit32(uint32_t x)
>         | ((x & 0x22222222u) << 1)
>         | ((x & 0x11111111u) << 3);
>       return x;
> +#endif
>   }
>   
>   /**
> @@ -327,6 +339,9 @@ static inline uint32_t revbit32(uint32_t x)
>    */
>   static inline uint64_t revbit64(uint64_t x)
>   {
> +#if __has_builtin(__builtin_bitreverse64)
> +    return __builtin_bitreverse64(x);
> +#else
>       /* Assign the correct byte position.  */
>       x = bswap64(x);
>       /* Assign the correct nibble position.  */
> @@ -338,6 +353,7 @@ static inline uint64_t revbit64(uint64_t x)
>         | ((x & 0x2222222222222222ull) << 1)
>         | ((x & 0x1111111111111111ull) << 3);
>       return x;
> +#endif
>   }
>   
>   /* Host type specific sizes of these routines.  */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


