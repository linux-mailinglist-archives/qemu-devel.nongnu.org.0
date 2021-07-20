Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E23D02C9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:20 +0200 (CEST)
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wXK-0007oR-Ih
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wVY-0006py-R0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:38:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wVV-0002ae-IA
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:38:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 gp5-20020a17090adf05b0290175c085e7a5so2716507pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qQDH1TwbwFpDAan4WCon3mK25gvuL+uwEXizo+Xn4Cw=;
 b=MXX4tao1GmdSkBt+gRyyxoq0nL37AG8mmJix+etmHFMr/zEhrjMDqmunhXEZtgVH07
 R+TBE8JXmKn4HRTKjxsyqTeeR2p1ojXXIeJqBFbS84oe/zTuY35P2a7MAXEp+XMGfTi0
 SuMP25nNRwGPNGuDGyrsx2FUWdI+F+bAUB8dKSsr9yB6YayCRr3QGGiKMriA14eeZp65
 IgCcmNoXMRNt73wDM+HpYBEWV/mjsGcrgfx1mWYt5JcCu6ZROy5bfLhPwFrgPF+9Nfy1
 bb8W12ag+RsNd1pqIBCWFDDHJMg7lyMT2Sy+8vxVj3CVw6nbcnnpR7WXxSGVGWkWc0Dl
 Cjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qQDH1TwbwFpDAan4WCon3mK25gvuL+uwEXizo+Xn4Cw=;
 b=NuYesmMwvRR/i+dy5t7gi2SOdTjlHDEg/ds+S2+d7yK7l9FJy9Tn9V09huPZLqASpQ
 Yv7CWqZGFt3nKG/RBH5UnnQkLDoGPgFoZ5xW6fJSEwuih6k5f8VohL0PwGyRoTDqA/O2
 07XqHNeucSIn2mR/u7amTekGf3HxM8U0Gt7vXwQLw7YX0c6XFMQBBtXmOBauWZCht/Jn
 60CsbWtXHWaNrkq3T90At8kgrEMw5/oqtzG2TzpaLum+Sj71CBZqQWlHWHLWhbSyBuzs
 gt9tvhxT3CLryZKW2TzKcpTrbSTYSfOmnIQdj/xbgM55sn+43PhQQJTZVVFsdD/oVrhW
 iI8g==
X-Gm-Message-State: AOAM533QHOsdYy89O4OEgjjjfRwl2TSsokIfCIEuZJJIDBecwQTuE7EH
 5jnRXv3CaUNAIQWNXlML8nhrpw==
X-Google-Smtp-Source: ABdhPJxNQh7P5VbkTgz8xsFvzxrCBsDf78SQZ6htDbkjEwm238cYykPM5SYkxLcEV8Ey9SVmR+xhjA==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr202295pjj.165.1626813503370; 
 Tue, 20 Jul 2021 13:38:23 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j6sm27252264pgq.0.2021.07.20.13.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 13:38:22 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] qemu/atomic: Use macros for CONFIG_ATOMIC64
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-2-richard.henderson@linaro.org>
 <CAFEAcA8VMzowUJQL=ccTCHyc0wghMc+fQOXFTSRE56sZL4rNbw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <186fdeab-65b6-926c-70fc-d60cfc71ec3c@linaro.org>
Date: Tue, 20 Jul 2021 10:38:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VMzowUJQL=ccTCHyc0wghMc+fQOXFTSRE56sZL4rNbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 2:01 AM, Peter Maydell wrote:
>> -static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
>> -{
>> -    qatomic_set__nocheck(ptr, val);
>> -}
...
>> +#define qatomic_set_u64   qatomic_set__nocheck
> 
> Previously if you tried to do qatomic_set_i64() etc on something
> that wasn't an int64_t*, the compiler would complain. Now it will
> silently store a different-sized value, I think. Is there a way
> to retain the typechecking in the macro versions?

I can add a trivial _Generic wrapper.


r~

