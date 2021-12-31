Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725494825BA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 21:11:38 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3OFT-0005MX-Iu
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 15:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OC1-0002Ql-E1
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:08:01 -0500
Received: from [2607:f8b0:4864:20::629] (port=35492
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OBy-00015o-Vl
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:08:01 -0500
Received: by mail-pl1-x629.google.com with SMTP id n16so20853434plc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hdsj0Lp/8fh7hpvT87fjGFU+kaFDguNJtjevDTV84Y4=;
 b=KsWprDx3RQX12U+FXWoBABpc0V+fgF3BUYZ/DOnzrG/Sa9m7LJzIjYIGdFkKxLDGd0
 BGKKslINjN71kM8cOoUplZBadFGA9ALc8MEaAbQrp87eianKLKui+FSRnkH6DHMKtU1T
 xGdsCQI2hkmk4zCIm37VktVyOwtDydUoU1zDkbjQeNNwktjp10l0Hc4vQJAhiAPkrdtM
 bT0S9CJJu2rLR+epVTY4VZkX9ZkW/fgw/pOcQN964Tlsy8jWPp1CP94KsuWbkNOKiOVd
 dD+l5XFG+OkrF0x9dZNRNcYPrdZ6TZF69a6u8SjbL6FnDg7jbOqXDq6c3HJs3wpz/xvu
 HJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hdsj0Lp/8fh7hpvT87fjGFU+kaFDguNJtjevDTV84Y4=;
 b=7CNXXTNm6Lj8pKaYQvSuAxsd2tr6ZPgu3hEA5udehrYlTxZaFAACMz7eQS0FC6o29l
 vPD6fcHdXY1rBjPuI+aE9G57WaA73h2e2dAtwkSNkUD48s05lzOwMf2AOzycbvKNwFzd
 C3F0hjphwMjKK3Z5L6nWnL+dUgS/1h5XV0UMYf027mfaZVok99kRFPmQ+qDxXPyTmNwO
 CELsItIxils2lMnqWAGndAA9CiOagDuv9smWlIBj7Vho+pQ8jKlTkyKiVEPTTFrH7tMF
 vj1dOsqu6Bw/fEPT/n5axgWpvCJQC4ZNn4C8pP++DTzJhgxiF6+S8q/wSoPAH5XR41qm
 7bJA==
X-Gm-Message-State: AOAM530D1q0A10Z44BYBSwDdr29U3XCQuxHfSQs4W0M+LMJmBtqlHToW
 SuJ5eoe7yt5ASgyID9XrwMhJZQ==
X-Google-Smtp-Source: ABdhPJylCjbnB2uOhVNt2sGk9VSlZeTfloZA+e6y697zKBPRogO899fE1xzYGKAs/NSGp8Sidlu78A==
X-Received: by 2002:a17:90b:388d:: with SMTP id
 mu13mr44845249pjb.86.1640981277613; 
 Fri, 31 Dec 2021 12:07:57 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id mi5sm32842256pjb.21.2021.12.31.12.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:07:57 -0800 (PST)
Subject: Re: [PATCH v2 4/6] target/riscv: add support for zdinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71a505a1-fd9f-6cbd-2bbc-6bce301bf1f4@linaro.org>
Date: Fri, 31 Dec 2021 12:07:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 7:23 PM, Weiwei Li wrote:
> +    if (reg_num != 0) {
> +        switch (get_ol(ctx)) {

get_xl, not get_ol, two instances.


> +#ifdef TARGET_RISCV32
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
> +        return t;
> +    }
> +#else
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_deposit_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1], 32, 32);
> +        return t;
> +    }

Unify these two cases and use tcg_gen_concat_tl_i64.


r~

