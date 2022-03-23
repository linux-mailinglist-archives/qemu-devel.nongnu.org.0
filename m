Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E134E5B3F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:27:31 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9Ry-0005Mq-3V
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:27:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Qt-0004Lm-TZ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:26:23 -0400
Received: from [2607:f8b0:4864:20::42e] (port=39723
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Qs-000524-E6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:26:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id u22so2505546pfg.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=om6FyfvRPe79fGjk9QhMTeh7v4GQMiJ5kWCOziZecw8=;
 b=u8SM0d729Ycng/CMcBBR2EMBE+CpVuee6seRp/xAA0EuDAs820YQF2NvXC5Js5IM4+
 6IyfIk42MbsTdd8+nDplTP/7H8z2fHg/02jmQXV3/upc0uS55HS/X0CJxbUrPvC6khxo
 R+MNu2XN+88nps0DsY0nXWNxIs3lJoiG+/Nwnn/bq7d5LahNJmkwkHGCSEkilpwPCtFO
 WR2h4lqv2uevVIwqYtIugBxAR4v+no3axitn+yhmmL58DjynpgyDPbTAfK411uzfZ6tb
 9uZSL7LcNF0tM2/oCvCz/5610Qgt1XarIZVAUHdNI/nmx+fMlnq/xBNt0ZD42tnXa8F6
 RJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=om6FyfvRPe79fGjk9QhMTeh7v4GQMiJ5kWCOziZecw8=;
 b=ebBViDd6d0nxJb4Yv/Iz6vtD/B7pTPiM0QdSFwuIvLbe6ox/8YA8Sd6eMg2DCKQ1Nj
 fV34auMxig9YBVn5bd07Jfz9qtNHj3Jbhm2lZ0zz+CFuOg0cpvduYSegBaFXfRExvvyQ
 8mn+CawGxiaBh3aHgnTzM1hlQDvjKHakO38POEfASn58BZheuII+vPQWn59Wdx8bZ1mI
 bmVKAAeFmYI56aqVuj5XnR+CkHQsu/8pJRhJz6KtGNvntzif7yEVC665Wq0Vd/YyWUb+
 W8Bwghf5ntrqjlCjf/zHN1/vEqvM3hWSwjQfJr2jJu5U+70KUur21QwAmT3OGdc1Tu3m
 /TqA==
X-Gm-Message-State: AOAM531bX9eL+mygDoUTvZWYBOKIf8cV+MR1mpFOI/xiMzoI64NQvL1O
 aHweObkPTbo2ElQKzwcLICUURg==
X-Google-Smtp-Source: ABdhPJx5qZHXeN66h/uS1YgHZDtwo0pq6vGHKhSoeKwOVn1RpEU9TKx65skyfbUQrggtz40VB0wR0A==
X-Received: by 2002:a05:6a00:21c5:b0:4f7:2e26:d142 with SMTP id
 t5-20020a056a0021c500b004f72e26d142mr2043863pfj.83.1648074380895; 
 Wed, 23 Mar 2022 15:26:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u41-20020a056a0009a900b004fa831fb240sm905261pfg.6.2022.03.23.15.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:26:19 -0700 (PDT)
Message-ID: <c84aecf3-74f3-28f8-e73e-d03a067dd6e5@linaro.org>
Date: Wed, 23 Mar 2022 15:26:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 07/13] accel-ops: Introduce create_vcpu_thread_precheck
 / postcheck handlers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-8-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-8-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Introduce precheck/postcheck handlers which will help to
> refactor code common to the various create_vcpu_thread()
> implementations.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 4 ++++
>   softmmu/cpus.c             | 8 +++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> index 6013c9444c..26b542d35c 100644
> --- a/include/sysemu/accel-ops.h
> +++ b/include/sysemu/accel-ops.h
> @@ -31,6 +31,10 @@ struct AccelOpsClass {
>       bool (*cpus_are_resettable)(void);
>   
>       void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
> +    /* If non-NULL, return whether common vCPU thread must be created */
> +    bool (*create_vcpu_thread_precheck)(CPUState *cpu);
> +    void (*create_vcpu_thread_postcheck)(CPUState *cpu);


I don't think this is the correct trade-off.
These new hooks are only used by rr, and at least in this patch set, incorrectly.

I think you should keep the single create_vcpu_thread hook, and if null, use your new 
common_vcpu_thread_create.  Leave rr to be the single accel setting the hook, and then 
it's easier not to break rr during the reorg as well.


r~

