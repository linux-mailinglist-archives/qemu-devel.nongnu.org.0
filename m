Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361C54533C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:42:32 +0200 (CEST)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMAw-0000zd-Sg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzKTn-0003D4-8u
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:53:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzKTl-0005fD-My
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:53:50 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso26999445pjl.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CferoRiRLcONzWkBJeLPubRl37OEbxsefFDmVAJQQv4=;
 b=QPQbIb6/hWEw/xYughXXBYKbuTcdQ05flISoSUzpKGBzM6ftzKXRTdSx0HC2Vg2eL2
 VI2IJm+VKK4/x11iZXxl9tM+byWLECTG+Lck1M4dd8/ih8CxA7ary4VcAJgeZOEhIcqt
 IeEYomtTVgIaBTOmYYpegt34LpYGyJFRu3IXaAP11vKQ0b0vUx5LApn2bFjbYWt1uWke
 5SKYGYk2qTVBG3tCv9Kb9TRg+mJfRAgaGXoskQ9WeofF8fKZXHXa0wJVVGE25dgZBTRO
 CZhBDW0kvae5ZGp3CTgeSMn519rZslUU7u7jAsKfkp99XR7UqImcsugigqURvLJ3Bk8F
 iUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CferoRiRLcONzWkBJeLPubRl37OEbxsefFDmVAJQQv4=;
 b=6tbramqirqC9cKf+2Fog6mvnUqAfBslzxoKypJmjFD441rAROh5zXfqQDMqQgw+RjY
 7Swe2WIlQw7uhphapbWh+TXSCDWFn0YMohI7+KXWZc82qP/r7fy7NxL3iMyDimgz2JSF
 R+g9k2aA8OE6NDoT/i+wOXQ5HcGeRfamGCDNqCTTUKxO/FQljYBjBMX8HJFZFmWxtFsz
 cFL0EUOesCSjMXFIPLM9M/l8tvcKY6zWEhHlxPg0ujAdAlRILLO6ApFfEP9HPGmcHVcU
 vNv4VbaD4NhHM1OiB0m/PNSfdmcZYNRyIR5h4HcIj2deZ7IUef2vF9DQgOgvyXDIaMBy
 n8vg==
X-Gm-Message-State: AOAM533BRplRU8lip7sZyZbtjQDTTosfvPDEsiFyojV1GIF84a1tvNso
 uROpneUBPIjOfh2nxwXjWaXbrg==
X-Google-Smtp-Source: ABdhPJyqXaOY2okojV17t7gGv1JNgwrhlNTBh8DUhcJbBH7AvvNOseo3U0Y2GrV0V/5CGeoEcsvOGQ==
X-Received: by 2002:a17:90a:c303:b0:1df:1ab6:68fb with SMTP id
 g3-20020a17090ac30300b001df1ab668fbmr4001041pjt.181.1654790028390; 
 Thu, 09 Jun 2022 08:53:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 jh22-20020a170903329600b0015e8d4eb25bsm17036451plb.165.2022.06.09.08.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 08:53:47 -0700 (PDT)
Message-ID: <5f8a2a73-dc3b-821c-8ee3-127d4e0c78d2@linaro.org>
Date: Thu, 9 Jun 2022 08:53:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] target/mips: implement Octeon-specific arithmetic
 instructions
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
 <165476302832.40568.14732977026786901317.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165476302832.40568.14732977026786901317.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/22 01:23, Pavel Dovgalyuk wrote:
> +static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
> +{
> +    TCGv t0, t1;
> +
> +    if (a->rt == 0) {
> +        /* nop */
> +        return true;
> +    }

I believe that we're standardizing on using gen_store_gpr, and not checking for r0 everywhere.


> +static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
> +{
> +    TCGv t0;
> +
> +    if (a->rt == 0) {
> +        /* nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rs);
> +    tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1);

a->lenm1 + 1.

> +    tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1);

Likewise.


r~

