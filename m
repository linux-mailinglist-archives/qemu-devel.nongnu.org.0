Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87B60657B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:13:07 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYAL-0001bZ-RY
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:13:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY6e-0002qd-BY
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olX2r-0003fO-U9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:01:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olX2k-0000O2-Ft
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:01:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id bp11so34989032wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvrSjSJ6D916PsozApvJ+kFXoEiIYcNNi36lLT1GRJQ=;
 b=NuJmd/20E3VhGwstD6llm1UmvClkYdhz1wTlTjGYAbRrmIOXyoaZuaz8l+z4t/z4jb
 HiCTX4IqnXvnlVzf6YaXPtSABxRU2WjgGhyoYeJDnyejZLQwtnjKoWQgcQfDWbSdq4WE
 NQj3SdXhxFsZwmufh2U3RFFVW1auH75OqEWmQavKxjGphPBJAlSv3YYTzuSiH1kUp9kj
 rMDBazu9mQY1qXNxgQNAzjiFrGG8knmZ8KtBb2Z+2BXno267z4xeR075ylzFCgC2H3ZE
 G1StguOERdTXY8Sdj/wuk+JczUhHklMhCoZqFq04lf541Dlyw4RoDijdPG5TdOECCcJ6
 IkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvrSjSJ6D916PsozApvJ+kFXoEiIYcNNi36lLT1GRJQ=;
 b=2pzRFA4xq7MTGpyNqzLSfTwkVKeaqktyavI1WLNefn2eQh9Us/6UdSx9uM6d3JfJh7
 3SvdEZClmZRLoIYoxltD86Wb7EzCTW4gVDWjKFdk37sg0hX/5g+iQtzTxAI9xuUTsirw
 WQNSEVV4bn08g5Rvn8DZnyXOmHzclRClmzq0wOLkYXOtbX6p4rk8Q+ZxgYCskZKL3PlB
 Pj09FfdJRcpg46l3RiH8ujLhWcqTfgT3RJMidnjEE4b4dHnolIfGVrCIe+OKI5epwd0/
 jJQDf9l9cR8Srzmyg4UF0LSrQREcskV1714RcSxiV7Yvxk0LjjFH1VvirumV/bqOcONB
 2P4w==
X-Gm-Message-State: ACrzQf14rtGpm1cm6lSMTweKDZWONmYQLHEHFtlgqNbwdOswQs1toqER
 jbeJC01c8IVpLfwHd2xTAXCJ0Q==
X-Google-Smtp-Source: AMsMyM4ZwnObHjAZy5It4k7h0FzE5o/xVWKmzksMDLISmr4KdAvkdMonkujaaspGznjTAG3GLc9PSQ==
X-Received: by 2002:a5d:45c1:0:b0:22e:6d1f:46d0 with SMTP id
 b1-20020a5d45c1000000b0022e6d1f46d0mr9023535wrs.557.1666278065156; 
 Thu, 20 Oct 2022 08:01:05 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 a1-20020adfdd01000000b0022add371ed2sm16673398wrm.55.2022.10.20.08.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:01:04 -0700 (PDT)
Message-ID: <52685842-3305-18c5-188f-d68297ab35e9@linaro.org>
Date: Thu, 20 Oct 2022 17:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 11/31] tcg: Allocate TCGTemp pairs in host memory order
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115242.2301066-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 20/10/22 13:52, Richard Henderson wrote:
> Allocate the first of a pair at the lower address, and the
> second of a pair at the higher address.  This will make it
> easier to find the beginning of the larger memory block.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-internal.h |  4 ++--
>   tcg/tcg.c          | 60 ++++++++++++++++++++--------------------------
>   2 files changed, 28 insertions(+), 36 deletions(-)

> @@ -4116,18 +4114,12 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
>       }
>   
>       /* If the two inputs form one 64-bit value, try dupm_vec. */
> -    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
> -        if (!itsl->mem_coherent) {
> -            temp_sync(s, itsl, s->reserved_regs, 0, 0);
> -        }
> -        if (!itsh->mem_coherent) {
> -            temp_sync(s, itsh, s->reserved_regs, 0, 0);
> -        }
> -#if HOST_BIG_ENDIAN
> -        TCGTemp *its = itsh;
> -#else
> -        TCGTemp *its = itsl;
> -#endif
> +    if (itsl - itsl->temp_subindex == itsh - itsh->temp_subindex) {
> +        TCGTemp *its = itsl - itsl->temp_subindex;
> +
> +        temp_sync(s, its + 0, s->reserved_regs, 0, 0);
> +        temp_sync(s, its + 1, s->reserved_regs, 0, 0);

No mention of dropping the 'mem_coherent' checks?

>           if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
>                                its->mem_base->reg, its->mem_offset)) {
>               goto done;


