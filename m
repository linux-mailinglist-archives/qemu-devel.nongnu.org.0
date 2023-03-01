Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17336A64BC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 02:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXB9v-0007ji-Rn; Tue, 28 Feb 2023 20:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXB9u-0007jS-Eu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 20:21:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXB9s-0007qD-SY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 20:21:30 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so15618025pjb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 17:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PcFqs96t+/JGXoAq6gVLOXrsvN2eBSdItU0v2+/hoGo=;
 b=paODFKRjey7o7P1jgwuM3Zjx2TypXm/YjSco45/Haz6Z/tmUW+Aj4IP+jSf9p0GyG/
 ExGvlim6SfRHhtPghyY1ttbYgMTMZFx49h/Nn7BcacfUEsANCzZYHlDVPXa/B78mDs4t
 /45+XUlXuJJml620niCU68i/44//z7J+2hLuOC6CCUIiFBEqo+DBK/VvIiWIjw4ZsJAK
 34clCQTM7ujsdpde5ScMy+DzkIDLiimF5NwuLXtAnFCHlmMqrj1W4pMonW2DoC8FAM2D
 TZau5XGchAIqH75ONKEAto6AruDTmcF9CJjRr2fVV0aQc6QdqxwLikh5e1J2jaDF5EhC
 CfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PcFqs96t+/JGXoAq6gVLOXrsvN2eBSdItU0v2+/hoGo=;
 b=3JBUxET+s1AFUP8eUHHlLFg1yO6c5paMKMs7AksikMX0V7X0p2Sniiw3O8+UXQDvO4
 8KWU66bR43Wa4xbJh9Xpub629/nQsQJjmZA7ZkRFc/seRi1X5SRUGyzYrMkZSLNJay2B
 f21NQMM2qH5KT1s01i2RoEDwGIuGiucC049PG5OhWAboBdc2CTu++PsO44n82011OjkD
 LTuSXCYRuYRGAw0MKL+NjJn1eq7H/zyi11iKq7HDx35Tennuvp20NwrcLkzsVCJS39Ec
 pWMCUOCczL55rvAWOoigXEOHaEpK+UGOnxh+/iQ5wAu4quLhOw/K5AzvdMw9pZ/65oGp
 3ZFA==
X-Gm-Message-State: AO0yUKU2MJlKf0S4vBEnMlhw+E2REOHobdh2HWukQZffW5TZ+yhJ3S2g
 vN33Mdi5fnyOnzU7yNc0jMXCyA==
X-Google-Smtp-Source: AK7set+G+oqBAZVWEI9qJdHdFShSHbt6tYFqMoZMLiCWAXGiaVKxUrnN0P49EB+HrL2KrZ6rGEYT9g==
X-Received: by 2002:a05:6a21:3395:b0:cc:786d:2128 with SMTP id
 yy21-20020a056a21339500b000cc786d2128mr6111913pzb.53.1677633687013; 
 Tue, 28 Feb 2023 17:21:27 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s13-20020a65690d000000b004fcda0e59c3sm6292424pgq.69.2023.02.28.17.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 17:21:26 -0800 (PST)
Message-ID: <4d42d401-9049-afc0-a5d3-9de28457afc2@linaro.org>
Date: Tue, 28 Feb 2023 15:21:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RESEND v7 1/9] target/arm: Move cortex sysregs into a
 separate file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-2-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228192628.26140-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/28/23 09:26, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into a new file.
> 
> Also move the function declaration to the more appropriate cpregs.h.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cortex-regs.c | 69 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpregs.h      |  6 ++++
>   target/arm/cpu64.c       |  1 +
>   target/arm/cpu_tcg.c     | 59 ----------------------------------
>   target/arm/internals.h   |  6 ----
>   target/arm/meson.build   |  1 +
>   6 files changed, 77 insertions(+), 65 deletions(-)
>   create mode 100644 target/arm/cortex-regs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

