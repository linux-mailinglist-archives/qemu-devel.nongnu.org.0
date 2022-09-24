Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E95E8FB8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:45:28 +0200 (CEST)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocC1f-0005sp-Lw
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocC02-0003PA-RL
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:43:46 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:34700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocC01-0004xq-4c
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:43:46 -0400
Received: by mail-qk1-x735.google.com with SMTP id g2so2093370qkk.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FlRTO0R8D/30i8IY9uwcQSEag684lykjkRugsADkBhw=;
 b=rWlUhaA2e80k3YIO6SF0Ya5gqjAuU9k7mG62mfBcQybOdnxbvRnqRRBWJBP297l7KZ
 OIRnZqu6bbUEVgyYMltVWJ0gNL/noQ/2dF9CfqYjP7GS/Pu6B4909HxKjS44kHBkHKD3
 3ulVulp/sNUmCie8PkRLpcc2cwaBeUwE2OeNvRg+3RnM12ugWsdO7pLKyfCKJflPQoA7
 DIYeC//1KSc5Gf87R2NrHy1Ht9EcB+lb5e9pLJWfmfGt3yxYnYg6Sx/yadADXf4wK5Pw
 UQOlChe7DAtl3oHqo7NioruT93+fQ0Uf8cWFU5IqmiFoz3a7elFGmdhdDnNuDmfhuXGM
 UuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FlRTO0R8D/30i8IY9uwcQSEag684lykjkRugsADkBhw=;
 b=WQzi65QrxjrZ5I7p/4DXe1+bKzb9Z4uHqhi2xqAIiVZN4gX2FKr14kMjB9siP43BI4
 4J/rMGKnY8V9+xKoWi4Eg5xzDxkHtImxZjY7njAU9h2XEi2EIQ2psMmE71W0fwNvDRAm
 CofQI1h6HFxA/fPdLZFu1rR2ZK6uddD1cE6GdB4cZx9c3KsXmwAyqX2L54VpEIeaX2O3
 72p2NiCuH6Svb56APT57nb1V4F+gQuHsbjhuLLgkkg/H8M9ETpAhMrVij+XGDSDUr0Nh
 zrc1hqwFXfg8A3Qi8l/MCdoU4QfjL1REzC2BzT78DZQ+fOdxl93x6Fs5RK/thBZqVg/9
 bFDA==
X-Gm-Message-State: ACrzQf2r04xpulNI9leRKyRnDoTZr6zCch3T1rZVW6bUzWPJcQmiNrVv
 VLjcomcblWvQ473sWeNNCADdNA==
X-Google-Smtp-Source: AMsMyM5vOwoPcHPHwCfhAV35n8JyB356oleYGOqfqyZMjgUMhXyk8ACvuLbjKu7WCPBH17vuIMdfrg==
X-Received: by 2002:a05:620a:957:b0:6cd:ed32:ed2e with SMTP id
 w23-20020a05620a095700b006cded32ed2emr9857436qkw.48.1664052224042; 
 Sat, 24 Sep 2022 13:43:44 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a0bc200b006ce7d9dea7asm8285045qki.13.2022.09.24.13.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:43:43 -0700 (PDT)
Message-ID: <dae44515-adf2-78fb-fd91-dd310849b6a7@linaro.org>
Date: Sat, 24 Sep 2022 20:43:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 22/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-23-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-23-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> +static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    static const X86OpEntry opcodes_0F78[4] = {
> +        {},
> +        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A)),
> +        {},
> +        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A)),
> +    };
> +    *entry = *decode_by_prefix(s, opcodes_0F78);
> +}

These are sse4a.

> +static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    if (s->prefix & PREFIX_REPNZ) {
> +        entry->gen = gen_INSERTQ_r;
> +    } else if (s->prefix & PREFIX_DATA) {
> +        entry->gen = gen_EXTRQ_r;
> +    } else {
> +        entry->gen = NULL;
> +    };
> +}
...
> +    [0x79] = X86_OP_GROUP2(0F79,       V,x, U,x,       cpuid(SSE4A)),

These are not -- they're AMD New Media.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

