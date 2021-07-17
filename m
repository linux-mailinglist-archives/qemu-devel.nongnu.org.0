Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B463CC662
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 22:52:03 +0200 (CEST)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4rI3-00043H-2R
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 16:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rGu-00036q-Pc
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:50:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rGt-0001aF-7p
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:50:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so9476788pjb.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lrqWd3oSURLVeTHkukXUjh2mk8NfVzvS6HiZojwEMA8=;
 b=wetGUf33VHAw6y/p6P6iB9P8M+2BaZkKYSsiA3dVWm7qJE9/hCqo7FBwzOz2w28yKY
 al0/k9UGQxdpL7dK+xXHANwuRWzgoLrYOBv0HOlHG7/YxCBQWCinDNozJ2zY510bSB94
 XQeJ591Ym4z+aNd8npm2tCr6Jb/G3wQiH4TEcE5taApVT/GIdstW82Q45j2HfPbbLD2u
 pYESYNIulWvWMI8NiuKvzQFzFLZYaR5F061lJyREXK3WY2uau8/zv7cWlV//axyAfMWo
 NnzUUupf/lX8wIoeaBaFJ+MWTeZQm5PC6pNgi8+LxihWmqcOXnU5s6DqZD3csPOaCLoK
 2YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrqWd3oSURLVeTHkukXUjh2mk8NfVzvS6HiZojwEMA8=;
 b=hS9poFq5lf5uW4aGNjNLA8/vtHsZyUrj0IrRma0973zSi4Y5qkwr2Fsv1psvJCggnC
 PIPg5K9uwwoBAmzTM2T/+3CZ1gDZSXDO+9sNW6+w80MJZmlY+DnbOhNyR9egoK4RvI70
 gpOXt7tRK953V6wqIloTmnG+F1aPrfFuvpBbnlpgP7cwGf2zpodaC1Lw/tnNAGK049HY
 pUaFR58+vzXoNUIjJzDXd/9vsnWmqyXBvWU0OtP7hQMyRX210Q+6/xP1Hon7ta3bIQLn
 onYh78Z71R3WDQn/tUSQN9JYMujg03mERn6CkCazcnNjbP2MUwUQ4SLZxp1EjbT+C/xD
 npCQ==
X-Gm-Message-State: AOAM530vyhYPf+8DiwBx4jNFPhXUsdRZmkX9KAgaafyKafUExNslIu7L
 uDSL8AxcI+qgvMb5WKt6/z4CJQ+lthyBUw==
X-Google-Smtp-Source: ABdhPJyJT6QC4RnTib+gSp7k3Z0iuDx/11WXFXlpPrAeYsgLPCrnPYP1hldLm0LvUlFYYvS+98mslQ==
X-Received: by 2002:a17:902:b60e:b029:129:4665:1106 with SMTP id
 b14-20020a170902b60eb029012946651106mr12939815pls.25.1626555049406; 
 Sat, 17 Jul 2021 13:50:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q17sm16946646pgd.39.2021.07.17.13.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:50:49 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
Date: Sat, 17 Jul 2021 13:50:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +#define DO_VABAV(OP, ESIZE, TYPE)                               \
> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
> +                                    void *vm, uint32_t ra)      \
> +    {                                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        TYPE *m = vm, *n = vn;                                  \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            if (mask & 1) {                                     \
> +                int64_t n0 = n[H##ESIZE(e)];                    \
> +                int64_t m0 = m[H##ESIZE(e)];                    \
> +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \

Any particular reason you're not using TYPE for n0 and m0?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

