Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787D3081B5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:11:59 +0100 (CET)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GSE-0002AL-Lz
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5GIY-0000Wq-9M
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 18:01:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5GIV-0006GZ-N6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 18:01:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id n10so5299949pgl.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ozH6DHC+m8CWcKQiFPWnB1Bl8PthneN6y8eRKjfMwfM=;
 b=s4YHUflC7jSH+GygwR9rgkxDBUAq3L+H3zLTZoerzuDmIzpy7LkRchKSyGyl1IsLgS
 Qk5cWjeqo/YctmOyLcGz6iVxB4y6DdAL2lM+pm7HEGAqrCnBJP6eet+VH0+odzOrZtdf
 Q95Jj17b0x9Fx0Iw+ssbuuyubxRkmXKmUII0elRl8dRbKgD9+tdnJ1bDrwwmLJoVrlSQ
 AYRJhtRyDXcUobYfRCQfrGLm82ibTbMYxPrT1Wivw4hopCg3lb3P8lja+PtXhAjATSof
 4L8CLTYS7nglRYhtiQ3lKDE7g5LroHNVzBItWZwJ/oHrHof4i9J+o1JOipx4y200hZCm
 ajmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozH6DHC+m8CWcKQiFPWnB1Bl8PthneN6y8eRKjfMwfM=;
 b=h7c/4mh2lMzEsN9BC4Cm9g3I7yvoolp5gUR3c7kLraC/AtA/KO4jlVGpR+oVIlmv98
 83rHULGetav9/j1IBS01Jmybc+MSBOTnovCPcZMvpnwvvjIAGq/xLMpuXk5T1JPZG50R
 D5EVb55BZnx3r/Fwtt/jACf1ZMjJIgsBDrgXnIhx1Hur5Gmy8rsDlnBZmrsWlndLWKUc
 6i4tT4kqtHSIUFvJc9oQU80HNVg2YCeHwuk9ljmEa60fePgZDfZU0yWgunCj4XAiY/yX
 hN3WqKsdqAY7L6GLZVY7RC1KxVj0+/gkHx/jkUqhh2U+yDtk2hTZTA8BwQPLTqlB4P3u
 Ax8A==
X-Gm-Message-State: AOAM532qFcic9uDjptmgzMUqVGSEPSImotU/rInj/BJte6Fg0B3KcMnA
 rWVNJbMHnNVVZ2g0eze3EpQsKBCJsI2dNVvl
X-Google-Smtp-Source: ABdhPJxZuOO7Jm6Muojlgb4GBwXKLKUeuewGBhApQQGz8eqyxmrYYauS69/8YkyTLXS+qjdU9mp2zw==
X-Received: by 2002:a62:7650:0:b029:1bb:aa42:aa96 with SMTP id
 r77-20020a6276500000b02901bbaa42aa96mr1521849pfc.33.1611874912579; 
 Thu, 28 Jan 2021 15:01:52 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id g5sm6891157pfm.115.2021.01.28.15.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 15:01:51 -0800 (PST)
Subject: Re: [PATCH v14 04/22] cpu: Move synchronize_from_tb() to tcg_ops
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-5-cfontana@suse.de> <87a6ssubjs.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9dc58c7-0dfb-dab5-0ba1-5bc6ddb04e74@linaro.org>
Date: Thu, 28 Jan 2021 13:01:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87a6ssubjs.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 8:58 AM, Alex Bennée wrote:
> Looking at the function here I wonder if we should be worried about the
> thumb state? Peter?
> 
> static void arm_cpu_set_pc(CPUState *cs, vaddr value)
> {
>     ARMCPU *cpu = ARM_CPU(cs);
>     CPUARMState *env = &cpu->env;
> 
>     if (is_a64(env)) {
>         env->pc = value;
>         env->thumb = 0;
>     } else {
>         env->regs[15] = value & ~1;
>         env->thumb = value & 1;
>     }
> }

Plausible.  You could possibly test this via gdbstub, as there are not many
other users.  I think it would be of the form:

(gdb) call foo()

where foo is a thumb function.

> #ifdef CONFIG_TCG
> void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                  const TranslationBlock *tb)
> {
>     ARMCPU *cpu = ARM_CPU(cs);
>     CPUARMState *env = &cpu->env;
> 
>     /*
>      * It's OK to look at env for the current mode here, because it's
>      * never possible for an AArch64 TB to chain to an AArch32 TB.
>      */
>     if (is_a64(env)) {
>         env->pc = tb->pc;
>     } else {
>         env->regs[15] = tb->pc;
>     }
> }
> #endif /* CONFIG_TCG */

This function need only handle any state that is "deferred" across goto_tb.
This is almost always simply the pc, e.g.

    if (use_goto_tb(s, dest)) {
        tcg_gen_goto_tb(n);
        gen_set_pc_im(s, dest);
        tcg_gen_exit_tb(s->base.tb, n);

A few targets do a bit more than that, especially vs delayed branches, but ARM
does not.

But there should be no thumb state that ought to be updated here.


r~

