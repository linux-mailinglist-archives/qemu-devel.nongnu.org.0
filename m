Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8DD2B2796
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:56:59 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdh3I-0003qV-MW
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdh1c-0003DN-Bg
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:54:32 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdh1X-0001aY-HQ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:54:30 -0500
Received: by mail-pg1-x52c.google.com with SMTP id i13so8173075pgm.9
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/KDwDwPZ10fx3D8quFHTsGGhNP/WVt6JhdufgI66SSg=;
 b=XHG42vhp20Eub3Iv0H/PIPKvVlmk93fVwaWgYcGki/YKepIE76saKW+to6ddeLXM3c
 NyJZt0C0Foz9DJ5JRvLqkBWf1LTTTr/ldKrbWAu/lmo4MOUrO08S3YZVjDjbbkOIf/3a
 NFvbauRLJ40TXiE7PAHct9qsM8bGWLOyGy3MjY6fqa4zN+w2JuDJZcoF0Fvpb1ECMeEj
 AJyGAP3+mnAIH6+WtXDrVbUwuR9kpP6xalxYkkYzavbn3DVh2YY0+awEwPSqUJ92Vsxr
 N2P83ILmFu7yNB2VYb4nUnB2YUa/qSpRK9DMHNKfvkgQAnygJZI2vSQYOFIMnOwGjpj5
 n2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KDwDwPZ10fx3D8quFHTsGGhNP/WVt6JhdufgI66SSg=;
 b=r7kAAdbu7r6TuFREhmYT3oFEurBl5bR9wUjtt0haZuNpobpSfO+2/e6IGXrnnNJIMp
 hX0ghOAfsXdk4KKOF6PdjkK73Zb+ixjypY82NitbMOwLq8Rfgf1jIOxL7zLlXoRY1iI8
 GmsckNC3NN9HoqzoYfuq+rUoaqs04TafAZAk9l2Zpw2vRJG4+lPadV1vpwhh7Zkxxdr7
 B4rx/Cb495par4FAY45ThdLGGLpXKUUrcKYEz8FqBfZEMEAk3JMhQn3/TlHhys+VwIcK
 sSgYCEo6tYWffE1BmBGhadEhJ72aYsEYOAoCF6FZfrhi+dVljVrTy15tz5UbHp4O91Dn
 n7wg==
X-Gm-Message-State: AOAM532QnqqX/QAlMf4QPMntyE/06bG5VLK3WgUWJeF5oxl233bFpSSG
 F8SKfcKNwIsK22RLrpp3VOl+qhvO9gwGfg==
X-Google-Smtp-Source: ABdhPJwREOnuJzrqmeWIQSPtAuScA7MFSSqp7f1cjPYO4Zayt1oSdsn9T4bnwoIyvvFEgoTqLWJF/A==
X-Received: by 2002:a17:90a:a104:: with SMTP id
 s4mr5164750pjp.60.1605304465536; 
 Fri, 13 Nov 2020 13:54:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 15sm12051782pjy.0.2020.11.13.13.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:54:24 -0800 (PST)
Subject: Re: [PATCH 14/17] target/arm: set HPFAR_EL2.NS on secure stage 2
 faults
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc4e0a70-872b-2e38-1af4-62b44e355c60@linaro.org>
Date: Fri, 13 Nov 2020 13:54:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> @@ -3444,6 +3444,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>                  target_el = 3;
>              } else {
>                  env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
> +                if (fi.s1ns) {
> +                    env->cp15.hpfar_el2 |= HPFAR_NS;
> +                }

This should only be set for SEL2, not non-secure EL2.

> +        if (arm_is_secure_below_el3(env) && fi->s1ns) {
> +            env->cp15.hpfar_el2 |= HPFAR_NS;
> +        }

... like you did here.


r~

