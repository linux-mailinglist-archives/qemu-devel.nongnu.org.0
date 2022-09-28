Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C455EE491
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:45:06 +0200 (CEST)
Received: from localhost ([::1]:42948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odc3N-0000I4-8t
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaSx-0005Ir-Tg
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:03:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaSu-0004UL-ID
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:03:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id c24so12278762plo.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mdAzjl6IyU8tvxzZG2JHN5uBLEw4boCOr3S6Cf3tUt0=;
 b=Ve5lqRJFHJaobo6Nvr+9R9354ZrwFZNe7OsAjdIYCVtx1Az01Gf6qEtzXBwNG0GptT
 FNAXZrgBz0rH1XNBiLYq6w9ex6BuXWhcHNrf1heiaQ6bGyTpIDoiWhoynaZFf59vKtHq
 b29YHUNByFO1V5uziCYF4N8p3ZXj2CNEHTyQjo+nLGXQNMQb4RHqMRTvmNVu4c/SETKz
 v5IRpYDQQpfkRbXj8dFrfYTmQEZdzKr2giqhVkXir6AgGXwGDtOxr0b/4DMkD1grkzqB
 uErx6IBVwJ8ReM/MQ4JCfJKDv18Go2GyeU54Sf7SP9tPxRKcViYZ1kZWg52sXu4fN9gs
 HVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mdAzjl6IyU8tvxzZG2JHN5uBLEw4boCOr3S6Cf3tUt0=;
 b=7sbwuTTtkoml/M0PeC1D1CIhXwWKMW2Sh8DHPi4z+BsnccW808h6zrDq836WtJzb/W
 qyDjKYqTgpw6IuQFA+BEvyGM4oEegn2jPcK0obGhbOh5rnCUmselU/ebWVUzWmZK09qF
 s9mBQfFY8zbItKbq/Ltajp5sI4d4AgUen6x5xR8ZV1lmkuPfJPAYCGYMtn1ltb660cHR
 iebC4gBUXlu83aTTEkyld1qbJ6Tp//ckRLpn+sRhXAJfe2wnql7CA1W4uG5dhNy23MGE
 fNutx2Csr5+dTNNU/fJREAuSUUL6PUZUuTfXp09sAqxH75oJ5D59sZ45um7eps3W5LaA
 piXA==
X-Gm-Message-State: ACrzQf35aLUEGDop+sUql1ojS0kzvSq7TfdbM49RWkkMXfI0dwy47qAS
 xOJxjANYKccGhhcq38hH1KA7JA==
X-Google-Smtp-Source: AMsMyM6Bf0l3JVVvZvQwSZOQg1m0yNkXOrTC23Jsmg4oKnq52vB8N1Qy+f72rJ+LLt/UypxpIDtmYA==
X-Received: by 2002:a17:903:1112:b0:179:ce23:dd57 with SMTP id
 n18-20020a170903111200b00179ce23dd57mr795041plh.114.1664384598225; 
 Wed, 28 Sep 2022 10:03:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a088b00b001f22647cb56sm1786018pjc.27.2022.09.28.10.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:03:17 -0700 (PDT)
Message-ID: <eebd5989-73e5-7b2d-f83b-fd3d413ea8e0@linaro.org>
Date: Wed, 28 Sep 2022 10:03:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/15] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest. As we
> should only be processing accesses from CPU cores we can push the CPU
> extraction logic out to the main access functions. If the access does
> not come from a CPU we log it and fail the transaction with
> MEMTX_ACCESS_ERROR.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> 
> ---
> v2
>    - update for new field
>    - bool asserts
> v3
>    - fail non-CPU transactions
> ---
>   hw/intc/arm_gic.c | 174 +++++++++++++++++++++++++++++++---------------
>   1 file changed, 118 insertions(+), 56 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..7b4f3fb81a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,42 @@ static const uint8_t gic_id_gicv2[] = {
>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>   };
>   
> -static inline int gic_get_current_cpu(GICState *s)
> +
> +/*
> + * The GIC should only be accessed by the CPU so if it is not we
> + * should fail the transaction (it would either be a bug in how we've
> + * wired stuff up, a limitation of the translator or the guest doing
> + * something weird like programming a DMA master to write to the MMIO
> + * region).
> + *
> + * Note the cpu_index is global and we currently don't have any models
> + * with multiple SoC's with different CPUs. However if we did we would
> + * need to transform the cpu_index into the socket core.
> + */
> +typedef struct {
> +    bool valid;
> +    int cpu_index;
> +} GicCPU;
> +
> +static inline GicCPU gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>   {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> +    if (attrs.requester_type != MTRT_CPU) {
> +        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
> +                      "%s: saw non-CPU transaction", __func__);
> +        return (GicCPU) { .valid = false };
>       }
> -    return 0;
> +    g_assert(attrs.requester_id < s->num_cpu);
> +
> +    return (GicCPU) { .valid = true, .cpu_index = attrs.requester_id };
>   }

I think you should split this function, and do away with the struct.

>   static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
>                                    unsigned size, MemTxAttrs attrs)
>   {
> +    GICState *s = (GICState *)opaque;
> +    GicCPU cpu = gic_get_current_cpu(s, attrs);
> +
> +    if (!cpu.valid) {
> +        return MEMTX_ACCESS_ERROR;
> +    }

This would become

     if (!gic_valid_cpu(attrs)) {
         return MEMTX_ACCESS_ERROR;
     }
     cpu = gic_get_cpu(attrs);



r~

