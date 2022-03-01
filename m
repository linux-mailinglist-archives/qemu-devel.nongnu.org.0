Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6ED4C888A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:52:00 +0100 (CET)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzAl-00082D-AB
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOz2s-0007Xi-Lp
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOz2p-0006GB-Ry
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646127826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmpfnTQoZ8B+IPFERq0Jf5dKMvgXcsUowwWPzjTrTv8=;
 b=XLlBARBMgY2cwZesGSiKb3KEnkTl8zv4OkHzv6+Q93CIQlODHfs5IOevAYqkVnr3DINhay
 EZAGifiaASAlL9c2S40WBUfvp2T2xjktgeDO+MprZ88rULqb61Hpvzyn8JeO+mhY+H85SQ
 YYIU/e9U4L/ed33bYVLlryKKC7HeIJQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-tBdsHeO8PMKOYUQQjgLHMA-1; Tue, 01 Mar 2022 04:43:42 -0500
X-MC-Unique: tBdsHeO8PMKOYUQQjgLHMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j42-20020a05600c1c2a00b00381febe402eso318115wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZmpfnTQoZ8B+IPFERq0Jf5dKMvgXcsUowwWPzjTrTv8=;
 b=xe0NN65zLjwtqyGXeDkEGMqKJUyBIpxMlLPNLWgIh9/cyRugSBTgTJMQ+FZsjoUx1A
 2LWoOvX8byJJiU4bKlfYB8hMNQLrG5N4t97m2F5G+y/2gqh10pugXp1z8J5ANpFZ6VeR
 3KdMeKg7WodVnoJbjwdhSezKVPigLADToLPnutVmh5xlxZgZUEN3eK9UWdWoIumLHcuH
 VM3JR8YLC88B0qyFXNWOX1IrrVPx6e1jbOLnXzjaNb9DnLYe6Ks6ktpYNNuWb+vMpAJa
 RlhPPFsgTHn9HaNu1GNjs0ArlF2DQLIPLpI+cYuJo5UwlzUSCnCuwF3cIuHdY7+ql3+X
 WgHw==
X-Gm-Message-State: AOAM533ppm9wGhf53pEuIJ+D9opCKtk6xxIJUBtiUoP8ZrhJP6wrPWn+
 p/IQ7XgmmtwqcwpeJyh+icpdnMIm2n6gGqYTPHjazjioEQD/lLUZRDAbV3G2Yk0Mbg6JsfgjkRD
 5eRq2ywI68o6Fb3o=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr16907595wmh.59.1646127821093; 
 Tue, 01 Mar 2022 01:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjG/q3wp52TbSdYRZZNQtsU5JU5F71ik+lY54llC3FkRM5Iwoigj52urdIrzp3Ly9M0XeB+A==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr16907584wmh.59.1646127820852; 
 Tue, 01 Mar 2022 01:43:40 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a056000010200b001ea9626b8fasm6852504wrx.19.2022.03.01.01.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:43:40 -0800 (PST)
Message-ID: <60cc0a1c-1db9-6f1c-6d35-2a9b2a55149e@redhat.com>
Date: Tue, 1 Mar 2022 10:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Fix mvc, mvo and pack tests with Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220301093911.1450719-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220301093911.1450719-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.22 10:39, Thomas Huth wrote:
> These instructions use addressing with a "base address", meaning
> that if register r0 is used, it is always treated as zero, no matter
> what value is stored in the register. So we have to make sure not
> to use register r0 for these instructions in our tests. There was
> no problem with GCC so far since it seems to always pick other
> registers by default, but Clang likes to chose register r0, too,
> so we have to use the "a" constraint to make sure that it does
> not pick r0 here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/tcg/s390x/mvc.c  | 4 ++--
>  tests/tcg/s390x/mvo.c  | 4 ++--
>  tests/tcg/s390x/pack.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/tcg/s390x/mvc.c b/tests/tcg/s390x/mvc.c
> index aa552d52e5..7ae4c44550 100644
> --- a/tests/tcg/s390x/mvc.c
> +++ b/tests/tcg/s390x/mvc.c
> @@ -20,8 +20,8 @@ static inline void mvc_256(const char *dst, const char *src)
>      asm volatile (
>          "    mvc 0(256,%[dst]),0(%[src])\n"
>          :
> -        : [dst] "d" (dst),
> -          [src] "d" (src)
> +        : [dst] "a" (dst),
> +          [src] "a" (src)
>          : "memory");
>  }
>  
> diff --git a/tests/tcg/s390x/mvo.c b/tests/tcg/s390x/mvo.c
> index 5546fe2a97..0c3ecdde2e 100644
> --- a/tests/tcg/s390x/mvo.c
> +++ b/tests/tcg/s390x/mvo.c
> @@ -11,8 +11,8 @@ int main(void)
>      asm volatile (
>          "    mvo 0(4,%[dest]),0(3,%[src])\n"
>          :
> -        : [dest] "d" (dest + 1),
> -          [src] "d" (src + 1)
> +        : [dest] "a" (dest + 1),
> +          [src] "a" (src + 1)
>          : "memory");
>  
>      for (i = 0; i < sizeof(expected); i++) {
> diff --git a/tests/tcg/s390x/pack.c b/tests/tcg/s390x/pack.c
> index 4be36f29a7..55e7e214e8 100644
> --- a/tests/tcg/s390x/pack.c
> +++ b/tests/tcg/s390x/pack.c
> @@ -9,7 +9,7 @@ int main(void)
>      asm volatile(
>          "    pack 2(4,%[data]),2(4,%[data])\n"
>          :
> -        : [data] "r" (&data[0])
> +        : [data] "a" (&data[0])
>          : "memory");
>      for (i = 0; i < 8; i++) {
>          if (data[i] != exp[i]) {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


