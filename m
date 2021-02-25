Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C632497B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 04:29:52 +0100 (CET)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF7Lb-00056s-DL
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 22:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7Kq-0004eY-Px
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:29:04 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7Kp-0004HF-1L
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:29:04 -0500
Received: by mail-pf1-x436.google.com with SMTP id w18so2688856pfu.9
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 19:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wCFbiHVFIZtlnwl5Sdg1mL9571F3r4UAHd66vKBnd3c=;
 b=pm8mCt9PqOmt8tqHt/YmL0Tm6p0Nwj+oR5Xg4lKnfZmUOllxCVpXewSJF6R7q3pFHr
 8RyUybn6mppKGPStqJn35qQtNWIz36o9RkO/X/F9Rugl0k1qiV1KYdo+ZrOuHazlZ+36
 vgCfij8/+d00DPxje2G8ioeaneQKmPLmIxm792FCbl+PfGbuiXr2r0aM71DzyJAaytSI
 DYJJI9Zk12nzwRVGKQpCxvyNFctR/lFwnPeBvK0ASE52GM6P0NtEb6JWzVZ2cQQ/iP3R
 IZST1f1IWtYFpk8F9w9RnVdOwBx+U734IKifoaa1/HOare8QFPY6rTpM32/MAt42qLD8
 i15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCFbiHVFIZtlnwl5Sdg1mL9571F3r4UAHd66vKBnd3c=;
 b=ulTHoAVrFJwYnzN+9CAMXOEq9oUVU0GqrPNkiR1Wb04S5TS3Gwwga0gbkwSj7OoMy5
 zPCh/9JpfCVEmUXWV1NiPehEEKTtM6TaVhTJh1zlCeyRE1fswS+jw0setbTM/aNN7D7l
 /w2cGQ6LTYDdnbHJsKBK8uSV75Q15TYprKV1+yUAiGPryeBxX0LgqfqWvOZXG5H1tqu2
 8o6q7nFF53WW7lJ8YahGQZDMCXbf5JdgcTQH/gF8xwpOu6Vm7UHGOn2eHepZMhrAvpgE
 OZmKTEL0pbS5NIgmlGoVb41zrWZInmr7AWCycFCElwFmU9tULmvOB+Ud+WhRSTzG9EKk
 Rxfw==
X-Gm-Message-State: AOAM530qm0ZAhQi3nm/MYDnSmwMA+E07AGHGzHjAJZLnxtvXfhSgVAL+
 agz7/q6sJ613D1qI/bvYwGFr4rTdSAP69w==
X-Google-Smtp-Source: ABdhPJzErpMMpWHGK7lu1ZwJngOSi3f0yGpP76dVHiQVWbmQb+cvaWNENSMCoP2mRWFljj0+CGHvtg==
X-Received: by 2002:a62:c302:0:b029:1d0:3720:328c with SMTP id
 v2-20020a62c3020000b02901d03720328cmr1212235pfg.48.1614223741212; 
 Wed, 24 Feb 2021 19:29:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x11sm4008966pja.46.2021.02.24.19.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 19:29:00 -0800 (PST)
Subject: Re: [PATCH v22 12/17] i386: separate fpu_helper into user and sysemu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-13-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bcbe72c-3fd4-b90b-0875-4298098d1901@linaro.org>
Date: Wed, 24 Feb 2021 19:28:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-13-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
>  #if !defined(CONFIG_USER_ONLY)
> -    else if (ferr_irq && !(env->hflags2 & HF2_IGNNE_MASK)) {
> -        qemu_irq_raise(ferr_irq);
> +    else {
> +        (void)fpu_check_raise_ferr_irq(env);

Given this is the only use, why split out the function at all, much less make
it return bool and then cast the return value to void?


> -#if defined(CONFIG_USER_ONLY)
> -void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
> -{
> -    helper_fsave(env, ptr, data32);
> -}

Not your bug, obviously, but these usages are broken.

For the record:

In helper_fsave() we reference GETPC().  Which is *only* valid when directly
called from code_gen_buffer.

The signature of cpu_x86_foo must be changed to add a "uintptr_t retaddr"
argument, the callers from linux-user/i386/signal.c must pass 0 for this new
argument (meaning no unwind required), and the helpers must do

void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
{
    cpu_x86_fsave(env, ptr, data32, GETPC());
}

etc.


r~

