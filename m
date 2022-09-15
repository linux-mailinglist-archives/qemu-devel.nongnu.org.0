Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5415B9655
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:26:38 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkCj-0001Rs-B5
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk30-0005jS-17
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:16:34 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk2k-0007FO-BM
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:16:32 -0400
Received: by mail-io1-xd36.google.com with SMTP id h194so12484081iof.4
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tKKlnH5HP/sD3yLbjv2y4G50e4xRU+1fe4XOCijvhGc=;
 b=UzU2gF7IZLNlVrTwio4LVvIrhFJJvVDANO4BfLkgtlMaBlRJjVnTJWSre/L1QCSE1N
 FZl5tKfoKGdgqlhKw5SkTgOr/NB7Fh13O3tRr+xIpkYeKfBQSrNRRXKFYobtyfEVDeIp
 NskBxdcaozXhayKBAz06PfmBURilVDw6XLDCgXQbdkFp8x8f8nBLak1RtmpdXYPrtMT4
 xwXfLtCJD6rd2dxN9/s93vUckvK0gabSQocRgA7Fc8FeW+f7+vy71qZlskFYZkyZ0MVd
 qyRqfuledbdSk9lOPzExVWiT1xOLa0RGJEyl3HaeivC7DYNag1MDo5STF6JaDnw+Pd3W
 wZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tKKlnH5HP/sD3yLbjv2y4G50e4xRU+1fe4XOCijvhGc=;
 b=EOVv876VykAsl8Dd0VDfC+IHvf/gyEwTDQzIE6b0G+5lIfJaYlb3cdEphw1QazB6lg
 0WyXoMw2ky0jj6p/zwZ+TXezBol2SxfjWTOtHfHNE8OY0Lvgx3DbdKmHyZWK6Gkc2ogu
 JbzdYdcmZ5B6gfopdCHN7vrqhGleuyEyqH4JVBVQinr88QvOUAY0AulXNcbsq4lKH1Kg
 ejt8fC/LJuDTDcAzGoJjxxB1hr6LkJ8s0Fem/I4dnHvibwINiiJYQ6EIt0zNw7XRS9/K
 u2N53IuXkrJv/m37PJ0jrMGK6TaazeRIB/begwAPik0+7eLiKT+GrUFIqWIFMq2ixOfR
 i7Xg==
X-Gm-Message-State: ACgBeo1YKkttKxqnWdyjEzDQsuSSeqm2DFDuFAETHmp7bGxwYlghm/qp
 EcQH6oeBoVwhCA6ngX6SMsuKVZrQNCfNrk5/
X-Google-Smtp-Source: AA6agR7vR+FWHBQKKQpyvIu7Mfw522rxWUnOLNsmlx509fs4LL6BI76XV0ZwLU8fBqk3V+1cTiwPWA==
X-Received: by 2002:a02:6386:0:b0:349:d0b1:bb7 with SMTP id
 j128-20020a026386000000b00349d0b10bb7mr21108183jac.172.1663229775653; 
 Thu, 15 Sep 2022 01:16:15 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm7695827ils.28.2022.09.15.01.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:16:15 -0700 (PDT)
Message-ID: <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
Date: Thu, 15 Sep 2022 09:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/14/22 17:09, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> ---
>   hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>   1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..7feedac735 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>   };
>   
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>   {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_cpu == 1);

Better without "== 1" -- this field ought to be boolean.

> +    g_assert(attrs.requester_id < s->num_cpu);

Do we still need the qtest_enabled test to short circuit the num_cpu test within the 
assert?  I guess if tests aren't failing then perhaps we don't...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

