Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A8487DD3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:50:02 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wBV-0000DF-5d
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:50:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wA4-00070x-0S
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:48:32 -0500
Received: from [2607:f8b0:4864:20::534] (port=44722
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5w9z-0001Oi-1X
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:48:31 -0500
Received: by mail-pg1-x534.google.com with SMTP id y9so6388888pgr.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 12:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDQ08ou8NyZNbVkVlsSgc8MGSAtJOyzlIeLvHBE1jyc=;
 b=CJ2iU5VUvQJjcaMEp/r+mYRM0wXic7kU85TMNIrPLdoZ29gEO/pW/3iiTek4NYuoDm
 UqVBNNKNHEizLw/CqlrLPbpFjizaOhUq9CBWgeT8PoWSWxNxjXD+lfY18HTKoGkHwI4X
 jsDtvk+GQYPY/91qoBgL1CZ71erQI0Qrxhm0TZneTAt98me67oDNTioffucT1JJpOVNP
 mxlMLewtAPZphmakeXHFhoq5zL4CRxvyh+y6DKhrPQdsiepvdIMkrXDHk6bdy2I64/5p
 D5cHEIIih42846lBArj/kzkh0ukppcUItdP301TT9BWLeePzljE7/CWIpihNYHy76Psq
 JE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDQ08ou8NyZNbVkVlsSgc8MGSAtJOyzlIeLvHBE1jyc=;
 b=N0WGF50OI25HTN/1F6emxOBqYznFGuBE5YBphaWAiHpQo/JNAMgCcwpvhxHS/OrzDK
 ZhwjsnPLsOz6upvDSmTzoGaVTS2ALX++Ntcz8GhX4Ev/1clqMZkYFyJrara7TNVa+9bS
 WpVOEMhTa5baVLOhyImXRSOAq9ibokw9L9xGrnSeHLp3oiYuXem8MIPW4Pf+idsFlAFw
 zWXDckjRZKqhzUSLit8DslXQFbksGY20BEZzAea603yur1UU/7+Y9ToLkDTUOhpnTxwz
 +ycUuRJVqeDXjD+u9Q7qXVE1Gk/EM+2y3K+tRxfF7YvnRdV7Qpzo0DTc1y5BZ2lJZ0mS
 ba3Q==
X-Gm-Message-State: AOAM530vzRioTW8igGM60qMm2ZlcoY2uWZtXAQdeZNarotePmXWWa0GW
 G2V5gwN/obqHogWU1qzZRTUd4g==
X-Google-Smtp-Source: ABdhPJxGiO28wLTMm8XUr8bSsr89XjkKVI6gNc0TvcA41MKrOhh2zy/JkXXZrcqVt6/HCO5PnB6otQ==
X-Received: by 2002:a63:2146:: with SMTP id s6mr57687089pgm.253.1641588505590; 
 Fri, 07 Jan 2022 12:48:25 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l12sm7041448pfc.181.2022.01.07.12.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:48:25 -0800 (PST)
Subject: Re: [PATCH v3 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
 <20220107112749.981-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06256f71-8d17-a9ab-b45d-5bb1034453f3@linaro.org>
Date: Fri, 7 Jan 2022 12:48:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107112749.981-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 3:27 AM, Weiwei Li wrote:
> @@ -342,6 +342,11 @@ static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
>   
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (ctx->ext_zfinx) {
> +        return;
> +    }
> +
>       if (ctx->mstatus_fs != MSTATUS_FS) {

This should also test RVF.

Finally, there needs to be a change to write_misa -- MSTATUS_FS needs to be cleared when 
RVF is disabled.


r~

