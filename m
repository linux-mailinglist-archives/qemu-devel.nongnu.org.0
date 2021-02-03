Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F630E422
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:38:39 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ov7-0006Kz-IR
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7OtC-0005eF-7N
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:36:39 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ot6-0008Nr-Vg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:36:37 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so558697pgj.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6d47kQyZY5qgse373ItBUkYcCX4/QQV/elqgB67+AJ0=;
 b=lF0XqRaHumDeE6utQ3axpXKr91H04+kWs0H/bEJVtLyO2l69vTTjjsLRiw/sGIStah
 Lhx4ZW82tQ/W0wYfRI9FKPC+vviVtZjtkUJzih+Xhy+844ooqW6vkr3aRzpOmB81/hOB
 WHqFYzWIK1Mr07N39ZTgEdhitZxXedvQN4z4XbcKwVP1zGJ6apWnAyT3VSza5Fp0frsO
 CduoEdq4qMuiLSqsh+hMpKxMfTmorgOmmN/qhEqGhyyfwV9ru1lLu+ANw2F86n8R79k4
 h2qcLUeJYB0LkqDA4RPsr11vFpfPwfHDjIbGFqMly7pmrsCE0UwF/fEg++0NNgpvj/sj
 /Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6d47kQyZY5qgse373ItBUkYcCX4/QQV/elqgB67+AJ0=;
 b=bGQFMIUP860FZSngQ5LvpzJkldKUpJSEkEQeqJ140WUHE3ROpyC4CFru7UOQ8gPhy9
 +X00XdNsmYCI5tIYwOYbceuWKXF/flUT/VU5+EzgIWn2o02l2MBAr7bl9qOfjJ/xHmZq
 e/zFTOmmnpxuCZ6F/UOkZC1EJCFIcQmm3e372qx2LygRfn/w4sIBTlVsza6mVgMmicVG
 SKjo3cLTb7d2PFXRSOmRSbXkoYsyAUrsPXVHUpYWeTXCd/Vc4N1UFbu81PQUX0L3J/h3
 N7moyc4K8HIc7FZE33sKk4KClyjU0YxEQF5rW9dAtvZEPsfKvcYaF5MPf2XGtehibJ9w
 V6Rw==
X-Gm-Message-State: AOAM532IzkfUm+KVHGBgDU8mxbsRSJ1TylvjeDcbmSUit9yKKcKcLx50
 5AOd6CeRKJ+n/UDIujmravfnHw==
X-Google-Smtp-Source: ABdhPJykBuuaJc0ZN181L9eESbqj4+QC3pli9SKg1LcT+lXXlCPjX6ghY0oX6z8420v+qDKWdFez2A==
X-Received: by 2002:a63:455c:: with SMTP id u28mr5566230pgk.142.1612384590527; 
 Wed, 03 Feb 2021 12:36:30 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id k9sm3695805pgh.94.2021.02.03.12.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 12:36:29 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210203045816.10953-1-rebecca@nuviainc.com>
 <20210203045816.10953-3-rebecca@nuviainc.com>
 <42e9640c-9798-2515-1e7d-131609078833@linaro.org>
 <67c1c588-1210-da0e-24c2-49bb77c1d217@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c5b4424-f8d2-faf5-414a-4b752135bd5d@linaro.org>
Date: Wed, 3 Feb 2021 10:36:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67c1c588-1210-da0e-24c2-49bb77c1d217@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 10:28 AM, Rebecca Cran wrote:
> On 2/3/21 10:17 AM, Richard Henderson wrote:
>> On 2/2/21 6:58 PM, Rebecca Cran wrote:
>>>           if (!arm_singlestep_active(env)) {
>>> -            env->uncached_cpsr &= ~PSTATE_SS;
>>> +            env->pstate &= ~PSTATE_SS;
>>> +        } else {
>>> +            env->pstate |= PSTATE_SS;
>>>           }
>>
>> Where did this addition come from?
> 
> I thought this was needed given your comment:
> 
> "This is missing the restore of PSTATE_SS for when singlestep *is* active."

No, that was this:

> +    /* Save SPSR_ELx.SS into PSTATE. */
> +    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
> +    val &= ~PSTATE_SS;

which is a restore, not an unconditional enable as you do above.


r~

