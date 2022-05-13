Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F5525C83
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:48:54 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQ2f-00037p-Pg
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPso-0005RX-Ij; Fri, 13 May 2022 03:38:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPsl-0002Fj-ST; Fri, 13 May 2022 03:38:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id g6so14606591ejw.1;
 Fri, 13 May 2022 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oCBkQM9zodLIhxllxBOVqcORyPnHsGTLA/nfirdgt9s=;
 b=AQc4KVRC5t22uJBKfmMOOudR6B1fgpsPjeFB11hKYu9Hr1D4Vc3wnJTAokQ1hWfYvy
 4jTn7qaITJRB0Oq6YoSSfOwBdO6THN39lwjiMWfcd8VcXQEwhae/4PLhU/6n/m0Gos6a
 zzzHvGY2XXlAlb6ydXcUy+csUcRt1BYjZkDumUCGQN2vXNKmpgj+iFoDL/MjdXP8P2n0
 LKa2UB7duIzAbQHazaIx5fFCL0iPtA09p1nnk+DNFBuAQXvTYM4Fb6XqLQlBP/qlwOW8
 ADuz19NTkJmjqzMe4Ze6hwLlA0nj4Rd/AaxY7aiu1fe08n96O9cHcHufEoY9P8wN8tbq
 mf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oCBkQM9zodLIhxllxBOVqcORyPnHsGTLA/nfirdgt9s=;
 b=6ibf8hqkzmgSZo/V6VwNdDqsJpHuNPz5EVhFvNlyxkj+CozF70Q1yvzRbTf+uzRHXR
 eJqpIHYbr/kFxhcUdx8N2jkbKtw5lcnCTowVjnlheil3rLYNmrJzPbnqDahMr7pkS34P
 4l9jmKPxh4atarbs3LqLAQU4cnSGzo2B0R1WY16dz2g3quG7pzbDVFZF2PdnXAWAUlum
 ONLpIY2JXVrxvCqzSwErnKNrd0icISiT/yhyYGYC0EfWUKENntCm10yaep+NkMX7b2Kx
 bkt+ARBmxRuWR/Z7mKhid6JJfCHYnmksCoRRYcHCD4TcB5paW67OxIaxnjBfFIenTiZt
 m2HQ==
X-Gm-Message-State: AOAM533qNDIX9U+UPlhn5cMzj92M1jzBymu/MPISvuSkRVZpMf+Z/ImD
 qbltumNCamBRsrDAzG5ygXXT5qf/fEmm7g==
X-Google-Smtp-Source: ABdhPJxmS9ff+q/YyJtESSktgpWHaP2Cad1AaPtyy2xXsD2z1u5iyE9y3a94/xjMmpERipUNkIJJVg==
X-Received: by 2002:a17:907:2da7:b0:6f4:801c:6c3d with SMTP id
 gt39-20020a1709072da700b006f4801c6c3dmr2981793ejc.310.1652427509768; 
 Fri, 13 May 2022 00:38:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f9-20020a056402328900b0042890ee5034sm610071eda.55.2022.05.13.00.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:38:29 -0700 (PDT)
Message-ID: <9cd4b9fa-5097-cbca-91ce-c135e9387932@redhat.com>
Date: Fri, 13 May 2022 09:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/7] block: Make bdrv_co_pwrite() take a const buffer
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512235103.2224817-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220512235103.2224817-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 01:51, Alberto Faria wrote:
> It does not mutate the buffer.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/block/block_int-io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
> index bb454200e5..d4d3bed783 100644
> --- a/include/block/block_int-io.h
> +++ b/include/block/block_int-io.h
> @@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
>   }
>   
>   static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
> +    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
>   {
>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>       IO_CODE();

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

