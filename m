Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B942FF5B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 02:07:05 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbXE8-0002aU-At
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 20:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXAg-0001Sr-OE
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 20:03:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXAf-0000Mk-3o
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 20:03:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gn3so2749537pjb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TywXgvkhx8QJZQ3wufUTkXNeX0b/R1SGSwCT8WI6MGo=;
 b=gE1dg1RksifSNpg/z++rCOc+P6ul82gaMuUKzWMRWanMri0ntpd/TDI0eSFiUYiW15
 ohgzsTaKovqrt1DVXeyWDwkwDC9Bnr3IY6Ex6eZ0HSf6aBostaFlflaIAsLa5sfZJMSN
 Tec0ix+UKqShb4eEPBSfv2Edol75rFDdCZaCcvoEwBWetjwuYzuXQl4umbHvtH1KKjl6
 7Qg12DSOL4TFIhjbMJGmyblfmbhaIoS2ySb8p8gw3UZHxYuEbuKMxBH0JiT9cQqPnoSj
 DVrMvqVLe9tevzq2orVapRLEJlUK6SNgcp7nGNxiQeTWCDhh3UAFnYwx1ZOJS1M2eXt7
 LqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TywXgvkhx8QJZQ3wufUTkXNeX0b/R1SGSwCT8WI6MGo=;
 b=PUNOxFRgZCU9EHMrIGiwnz4NsFzE0icwN0qFC3eTc+OT2PzLJx/+ESwktj2KC5jLex
 0zYw4sFP5yEyO/uA1Jl4cLC1+xzvtbA2oI98npYMQUvRoth4biGEE3JW3k1S8Aa4m5jA
 9ZCdiAvK5/WlJjx4rE61wPos9sxWLXv+QAyCBSgMdXkG0rwYGlMWnYkwzItPMQbGrocE
 N2dUc1eaFTtn7jVqVgr8wC0ShPGdF1w1m22pZ+q/IOgHS6xq3ygC0g2dDBzuUBtXisbk
 nSi4Z2vRBc2v+HTlbygSLLKndiCxvHRiUNAUFL0pm9GJ0u5GeO/LHS0iWDulXdTOXm1w
 a/Jw==
X-Gm-Message-State: AOAM531JJSEPg28ES1lfyRas3fWNiHPQv/hyqfBwn/OYYmhwAc0UvaE9
 RCIKjm9qOhME0szf/tQAbrjdRPUNEqtvLQ==
X-Google-Smtp-Source: ABdhPJwJ3WsgkscEo9IQHj60Oz5Y68lUIow4nmHP05xxI05YTMPxtihbQ099Jt+vqLZzXG7hwpr6QQ==
X-Received: by 2002:a17:90b:20d2:: with SMTP id
 ju18mr29915104pjb.66.1634342607913; 
 Fri, 15 Oct 2021 17:03:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k13sm6061168pfc.197.2021.10.15.17.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 17:03:27 -0700 (PDT)
Subject: Re: [PATCH v13 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <839af1bf-b7e0-e9a3-19eb-fbc3aaa380b4@linaro.org>
Date: Fri, 15 Oct 2021 17:03:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:29 PM, Alexey Baturo wrote:
> +
> +    /*
> +     * CSRs for PointerMasking extension
> +     */
> +    target_ulong mmte;
> +    target_ulong mpmmask;
> +    target_ulong mpmbase;
> +    target_ulong spmmask;
> +    target_ulong spmbase;
> +    target_ulong upmmask;
> +    target_ulong upmbase;

You need to update machine.c to migrate these.
C.f. vmstate_pmp.


r~

