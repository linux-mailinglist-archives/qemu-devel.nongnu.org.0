Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DC6B9C6E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc84z-00035q-Ud; Tue, 14 Mar 2023 13:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc84u-000357-95
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:04:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc84r-0005Mv-EV
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:04:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r29so6993318wra.13
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRSw/IHwDKK0p71VvxwdRzp1Ddb4oKY5ibSkEXnNCN8=;
 b=S0Ne3XORjzD/KZ2AAJJvqgO1CtiV7lR/RIYQ8yiW2f6xM9KXK/NcuQiqhqGbEUtz1Z
 yEzyiKAEap/1N1F5IkJXIWJyuyCqNfawc1U1j91mOifsGnfQ5KMS8YtpwrXXcS0skkrB
 SO22Lmfss9+tXsJK3vBo3fWzmMHJbGZpl4tk+Dc/9XSp/G+wTfB2tA6UVSLvMhZGy8CD
 dPNS1H+BfI9OdMgqRFUcaUhNDe+sU8fIE/bB5IVCp6i34pjkyDOa/SaGL+NIhAC/H/yP
 YklmXQ5W/+cH45IlGMzXyKYCNYk75dQrwfIG/o7vg76WKNJzUUCpLjNjMsBDYo7QqaDD
 bHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRSw/IHwDKK0p71VvxwdRzp1Ddb4oKY5ibSkEXnNCN8=;
 b=CfpAiv2PK3KkI/B30e/d55fcm5zIAA4b3XT8enJnXPSXplpa5X0CUWID7B1gKvCrjz
 M+oeZfekkOG3DuJWOVHUFEExa/KYvxTWg1pSro8sAs4I5PgO7U0fgWdPItNi5qsYrxYR
 O1Dv0DH3n6ElJeug1vCplSDYDjDjCF8IpwA7YTpOwC9i/bMqHY+tzQ7z71RCC/cOl/bO
 m9JEbspjsJcVSNEfH5KQYnPkA1/LF0h670lj9FzHSSAiX+UfdckzwXGvyRsmKyv4qPiy
 AwJCuzgy/vN7QQ/Ax93nFPA/re3cH4kv8zrOfCjC4a0rcCkgwlHpfgI2dOjKzMTMJGAr
 mDsg==
X-Gm-Message-State: AO0yUKWQAxOgnDsPhhwF3slqQw0wszkxtS6qwNjfn4Qf8BTkm7xdY+WH
 0mUsZVFIT0MgsazL9jwD4WNKk/SQsWj0VIj4ZcQnSA==
X-Google-Smtp-Source: AK7set++/AKSgONnDu9MYx6Kv4xzKYTM9CCYdTFV8NqgRkciBlPpZI6b3HDVqewojkMCMGsswIbOXA==
X-Received: by 2002:adf:e703:0:b0:2c3:dd81:49ad with SMTP id
 c3-20020adfe703000000b002c3dd8149admr25281259wrm.33.1678813483853; 
 Tue, 14 Mar 2023 10:04:43 -0700 (PDT)
Received: from [192.168.69.115] (lfbn-mon-1-678-16.w2-4.abo.wanadoo.fr.
 [2.4.247.16]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d46d0000000b002be505ab59asm2489963wrs.97.2023.03.14.10.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:04:43 -0700 (PDT)
Message-ID: <378d53a4-6c3e-ecdc-78bc-93a8757f49f6@linaro.org>
Date: Tue, 14 Mar 2023 18:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/ide: Remove unuseful IDE_DMA__COUNT definition
Content-Language: en-US
To: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <20230224153410.19727-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224153410.19727-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ping?

On 24/2/23 16:34, Philippe Mathieu-Daudé wrote:
> First, IDE_DMA__COUNT represents the number of enumerated
> values, but is incorrectly listed as part of the enum.
> 
> Second, IDE_DMA_CMD_str() is internal to core.c and only
> takes sane enums from ide_dma_cmd. So no need to check the
> 'enval' argument is within the enum range. Only checks
> IDE_DMA_CMD_lookup[] entry is not NULL.
> 
> Both combined, IDE_DMA__COUNT can go.
> 
> Reduce IDE_DMA_CMD_lookup[] scope which is only used locally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/core.c             | 10 +++++-----
>   include/hw/ide/internal.h |  3 ---
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 5d1039378f..8bf61e7267 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -63,19 +63,19 @@ static const int smart_attributes[][12] = {
>       { 190,  0x03, 0x00, 0x45, 0x45, 0x1f, 0x00, 0x1f, 0x1f, 0x00, 0x00, 0x32},
>   };
>   
> -const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT] = {
> +static const char *IDE_DMA_CMD_lookup[] = {
>       [IDE_DMA_READ] = "DMA READ",
>       [IDE_DMA_WRITE] = "DMA WRITE",
>       [IDE_DMA_TRIM] = "DMA TRIM",
> -    [IDE_DMA_ATAPI] = "DMA ATAPI"
> +    [IDE_DMA_ATAPI] = "DMA ATAPI",
>   };
>   
>   static const char *IDE_DMA_CMD_str(enum ide_dma_cmd enval)
>   {
> -    if ((unsigned)enval < IDE_DMA__COUNT) {
> -        return IDE_DMA_CMD_lookup[enval];
> +    if (!IDE_DMA_CMD_lookup[enval]) {
> +        return "DMA UNKNOWN CMD";
>       }
> -    return "DMA UNKNOWN CMD";
> +    return IDE_DMA_CMD_lookup[enval];
>   }
>   
>   static void ide_dummy_transfer_stop(IDEState *s);
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index fc0aa81a88..e864fe8caf 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -352,11 +352,8 @@ enum ide_dma_cmd {
>       IDE_DMA_WRITE,
>       IDE_DMA_TRIM,
>       IDE_DMA_ATAPI,
> -    IDE_DMA__COUNT
>   };
>   
> -extern const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT];
> -
>   #define ide_cmd_is_read(s) \
>           ((s)->dma_cmd == IDE_DMA_READ)
>   


