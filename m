Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8264F28F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:48:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Hc0-0001uX-JL; Fri, 16 Dec 2022 15:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Hbr-0001rl-Sp
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:47:15 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Hbq-0004EL-EG
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:47:11 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so7257793pje.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6dbfzRBimAFk69nBSUWaicblITG9ZusnffGqLu+6PjE=;
 b=eyfHZcZCXceYShIJNTdI6rccFFKNQuSpmynL2lSSkeAOijyMt8tbU9yLlhNBTfUhUL
 akOenPIwRkN8A0uFhQ1u3NxxebKGaAJhhi4l8asM0gU5hYejemRLSaf14gH0IWogxg35
 KPuRG6a4k5rRIMvzg7jOiVVr2/I/iBxDMdyWxKYPDYwEZFHFfsLiOrNvhD5IgcyXsUpJ
 vTv8pHvVqPPJ6Cl4WpYq/NxguYiyLtpoi1kR7fMHafdO8q/pKWCNQtKRfNkgZ32AbHNG
 XKbtekbqQRsCiPpAfO4pSnJ1B1ywvpSN9wEPNhTotzxZBqrEz9Ozfw8vrMRg9UoVszmq
 Azhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6dbfzRBimAFk69nBSUWaicblITG9ZusnffGqLu+6PjE=;
 b=PEu3kQOKsLESqb5k7QwNkKVmmdSAw0U/q9Juai21auts22tqWpU2DqoBMOi0sPotjX
 Wt6PWkvX6ePFWzozwPVZsdRC9oJ1JpHiXtxaA1nsC2Wzf2neV74xNXBrEZviS/SEbZzI
 cM413qq8W6fK1gATN2tlEWVl8lbQmkL6qz/0buCZwJN5y6onczJmQG714JZuuTwCyFwM
 Cw+/6dwpvdfEADf55+Wd33vAg93/NVPtbBIuFCK7K0aw22cqyqLYCrn6hazC6MokzH0M
 jl4F3KPMtea/RSWrFupAWMhmV2p7IX1xqSIMPv1zts3XHMkWbWqqLKCVrYk7q+8gh6S9
 DvsA==
X-Gm-Message-State: ANoB5pn6hHRfSv643XzvCfoJ/JqGCCmr9sLkHUZ7gj1uUjDsrDa+Qs3E
 MTqhDNHn8xC91AToFR6hi8iZ8bQmtBD9WG1R
X-Google-Smtp-Source: AA0mqf6qgvsZzixyx6xptpEp8+bOfZFqUUJUVlCOa600qbHfE2CPjPdz6o1+IDef9Fo6ki3korQABA==
X-Received: by 2002:a17:902:9341:b0:189:9299:a2cd with SMTP id
 g1-20020a170902934100b001899299a2cdmr33801045plp.18.1671223628791; 
 Fri, 16 Dec 2022 12:47:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902eb8200b001898ca438fcsm2020388plg.282.2022.12.16.12.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:47:08 -0800 (PST)
Message-ID: <917752eb-3aa2-30b6-53c6-fe94a984926f@linaro.org>
Date: Fri, 16 Dec 2022 12:47:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] meson: Set avx512f option to auto
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, tstellar@redhat.com, berrange@redhat.com
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-3-richard.henderson@linaro.org>
In-Reply-To: <20221204015123.362726-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

On 12/3/22 17:51, Richard Henderson wrote:
> I'm not sure why this option wasn't set the same as avx2.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson_options.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 4b749ca549..f98ee101e2 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -102,7 +102,7 @@ option('membarrier', type: 'feature', value: 'disabled',
>   
>   option('avx2', type: 'feature', value: 'auto',
>          description: 'AVX2 optimizations')
> -option('avx512f', type: 'feature', value: 'disabled',
> +option('avx512f', type: 'feature', value: 'auto',
>          description: 'AVX512F optimizations')
>   option('keyring', type: 'feature', value: 'auto',
>          description: 'Linux keyring support')


