Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679173295C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:39:43 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvss-0002DF-Eq
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGvqT-0001NT-0g
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:37:13 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGvqL-0003sc-6N
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:37:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id q204so11880530pfq.10
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 19:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pTyphq2Qa/NVTfk6IuE13qs1qajpOtzWDwkWAGwaJyc=;
 b=xcIq79BTbngrzIUFAaXuAIB1k5dS9W9VYu+Y2PAr5F60k6yk60T6xXkyrET6kLY/1a
 rtHkBdtfwkdtt7lAe4AklWP6AbSxLWyxzjjnkqd4tWXKtclJXNxmvZdeFZyc91WhiZk1
 EUmUsSZ7nH2tTJAi1cRkdYxZ2/ZgbwgLeoyhuPMmhB0HnLpzX1iUascZngMadbeCseS/
 Y21Aj6HbOr9CjbE8v80xOBdh4cmGAnJriHuDdqm7NcbtLBBLFjy31zA2f1uhH8rB7ZlA
 8mVNWpS+G11C2Ld5v9dhLEbrsbgG4c0fAoOZyEiDMS8LI67H36nEvhC9go9yqd1jczMm
 uj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pTyphq2Qa/NVTfk6IuE13qs1qajpOtzWDwkWAGwaJyc=;
 b=nH+vBRTuzIPm90k/bCK5LM16/bqgwwiyOaiGTJKHrV21bTUwFvFb9QcI9olRn3Bgoy
 Y1HGp2IJvI1ThWjPdSj3gJm1Wz+O/9lVE631GVTCLoB00YpK3oStNCqysoItrENAFGGx
 RAqAp0/53GocBdmB1Eis9q7OHblE/6w121Kg07no1+yU+ZkZAr6hD0VKeGVMiZvckrnF
 II0aV+Ky223fJcHOb8oVCE5KkdU8rhafZhOASv9rRJnTP/XvuKccZcBARZvGNY8xfahx
 58/y1EIeCUFRNuR4G63LTfxw+3beDBA5kJc9CF8SyGuUpwTa8XBkJEWSQNc+gznEm8Ed
 g4qQ==
X-Gm-Message-State: AOAM531i+bzZEQpRiDJZD7P9+RLUlKNqdwBGNSe+uEhj9Yi0bk8akFR0
 z6kOV4Ox75eRPLawspdE0Y4RRymwTlSeyA==
X-Google-Smtp-Source: ABdhPJwfygNCCv5u6x1DlHphuxZZuC6aqfG9SjqVj37g6b4fCZWgNywvYYocMyzLhXRd5lLLrcjD3A==
X-Received: by 2002:a63:4709:: with SMTP id u9mr16233633pga.250.1614656219832; 
 Mon, 01 Mar 2021 19:36:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o11sm19652874pfp.136.2021.03.01.19.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 19:36:59 -0800 (PST)
Subject: Re: [RFC v2 10/24] target/arm: only perform TCG cpu and machine inits
 if tcg enabled
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed6d6ebf-d32f-7204-eaba-faea8a073d17@linaro.org>
Date: Mon, 1 Mar 2021 19:36:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> @@ -1321,6 +1323,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           }
>       }
>   
> +#ifdef CONFIG_TCG
>       {
>           uint64_t scale;
>   
> @@ -1346,7 +1349,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>                                                     arm_gt_hvtimer_cb, cpu);
>       }
> -#endif
> +#endif /* CONFIG_TCG */

You can use tcg_enabled here.

> -        }
>   
>   #ifndef CONFIG_USER_ONLY
> -        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
> -                cpu);
> +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
> +                                          cpu);

Incorrect indentation change.
Otherwise, LGTM.


r~

