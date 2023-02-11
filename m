Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76BA6934A1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQyzs-0001zL-9D; Sat, 11 Feb 2023 18:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQyzq-0001yx-Nq
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:09:30 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQyzo-00013R-Gl
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:09:30 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k13so10232429plg.0
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YDHdJs+7UZ9bms3sCYTMUPvgcIeHuYMpstsoE4bFqVo=;
 b=JgyOOLtJh31FCfHfo752G4clA/toEJ84x93bC3ccMTXFH0nDZ013JJ0Wx95tB4xS/e
 VJbISH/XiNo/EXMYGx9gZ/8ftqHfDE1n0OxK7VqV9Hx/ofIhxwCyJ20041Jddx0p6Wvv
 zGkOBc4RbBPUclUHtM2sGRkTf8LIX72Drfe/mxhYo4CZkSgAbRJOv6EvdV7htvkgkYQV
 MbVCdKWl+QWyuBxOdNYQKYVSl/dpPrx6UXr5LFrqP0vVOUyAsbV20euiiXui7KwT3sfh
 HJVyMoe1XY5ZuuMY3gEb3ruNriNrRw4ux3KvoltO0o2jzZQrcGfRA3cYalITLGU3TQBk
 D44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDHdJs+7UZ9bms3sCYTMUPvgcIeHuYMpstsoE4bFqVo=;
 b=RRveRRbXMlwKQmhtEGmI5VtcFJiJT0iXIA9PdzSz/RbEgqJrhYBbo4MeYM/X3raDYF
 +Sw79FfJdYYbQ0NJv+6Fa0aAu8vaeSZVEk5D9ftGHmzdBH5+ojZ6k11DEcGpnE1Vr6/e
 bIYLklxyPgJUIgPURG6h6oMXHuv58Vl55H8pkv0bF2zlJp6/ajowLjsMyGG6CacFuihl
 WbUrCU2OhkZLwZAZGG2QHm7US7jmhULe9Dn31dakjokn3jenlyiQpfTDh2/3GbsIyBOl
 S8iKdXz/xSVPf2fObx2t1UDOw1Ri9ZvGvKU3CUMqybFz3iYxLnCQswVxiZyixU8ivlIL
 cmgg==
X-Gm-Message-State: AO0yUKVql1MkRP/GlU78Ob72QtmXBLf7bCPyo/WOEO569SbFRLx87Zx6
 lLJtuHQien3ATXoyfjika3v5/g==
X-Google-Smtp-Source: AK7set+S6r0Xr85d3fpYK2+UQ8Ct3BseskinnrHIwVi+QJuBvknr25EEjHsSgPz/nbDxvvkzXVPWiQ==
X-Received: by 2002:a17:903:20d4:b0:19a:7ce7:feb6 with SMTP id
 i20-20020a17090320d400b0019a7ce7feb6mr3957494plb.14.1676156966842; 
 Sat, 11 Feb 2023 15:09:26 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b0019a5f1410d1sm5299634plb.43.2023.02.11.15.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:09:26 -0800 (PST)
Message-ID: <3277df5d-7c6a-d33a-1cab-6506742c66db@linaro.org>
Date: Sat, 11 Feb 2023 13:09:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/9] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/10/23 13:18, Warner Losh wrote:
> +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
> +        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
> +{
> +    abi_long ret;
> +    void *hnamep, *holdp = NULL, *hnewp = NULL;
> +    size_t holdlen;
> +    abi_ulong oldlen = 0;
> +    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
> +
> +    if (oldlenp) {
> +        if (get_user_ual(oldlen, oldlenp)) {
> +            return -TARGET_EFAULT;
> +        }
> +    }

You need to check for write early.  Either access_ok, or lock_user.

> +    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++) {
> +        *q++ = tswap32(*p);
> +    }

Why the inconsistent increments?

> +    unlock_user(holdp, oldp, holdlen);

Usually we don't want writeback on error.


r~

