Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA716CEF9B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:40:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYpo-0006Zg-M3; Wed, 29 Mar 2023 12:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYpm-0006ZF-OX
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:39:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYpl-0003fD-2O
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:39:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso16720965pjb.3
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680107975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ivmr51mvy81KoF8KGCG/W9r00l5pymoTyJ+SLLb7qsw=;
 b=y/InJg1ZJkVeqUNVxQP6MEdvot+DyLnjrXaG+lMHyjigV6EreRrWo1w2xRLhb+q9yI
 Sc0K7QOGn3PA2ldZMPkIzxDlwt4jwO4RZ+iv80jPRmJWOyPVrSh5ASxwCb2EfuShiMTL
 0U+ose1yKJrtJWFZiy9QpaFyk1+GvMhlPQfkrtcXGGndCDdImQW0w/ezSWhc2fgwrfq5
 49UvdSfHOZ8vI3wxq4Myriw+584+bO+3BZqwh18gVriMAMTaYqw1SzfBUvLcZVGPkfKT
 AtYYV0tJWrpU7kmhcyVULMMTrqt4lKf+kIwnHj2v7Vq+F52hPk0VA1wtZz8Jauw6Aux5
 GlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivmr51mvy81KoF8KGCG/W9r00l5pymoTyJ+SLLb7qsw=;
 b=fw0uxLtHlcsCs/+wVSSYqamAhSCIM0Dx7hYHp2jG5XcALBXl//o2xFUTM/CX1w84jY
 9yiS4jEoU6PQROy/GZCFzEUPXjEHw5lC/OStxvEZJxCGPVonZCiUoajvSwYXnJaqJk+0
 e0QBJdevHRF7tmuFyTRTPklgeZnLLhADGhYWUA2MgYDIIR2CaGpFwhmRikuUu3YgUkzx
 3jhZqxCmpA3i6A2+4Fd0HmBGZIugAcGt+54+W51qemB8fpGyzK/1LgnM3xTpLyKp+Lhs
 wbpWjKYUytJ91+zE5bW0Mrl7tq9X0FuEikSjYOczcOVqhQ/oon2R6oORO/CMoLQrQc0J
 ZH6w==
X-Gm-Message-State: AAQBX9fChva+z21G7QY+Y47gJSudKBXrJLo8AzRq3L3/lbV2YFjMoaUJ
 GrTi2Kv3sFIDEGZhOtU93VX9og==
X-Google-Smtp-Source: AKy350aJ0jrE8y4YB2fjM5PRgufCdszGlhWmsUFUO1uixpDRUhAdnN9SwmXHEdc2MfDXSxHuzPphXA==
X-Received: by 2002:a17:90b:33cc:b0:237:40a5:7cb9 with SMTP id
 lk12-20020a17090b33cc00b0023740a57cb9mr21898864pjb.5.1680107975624; 
 Wed, 29 Mar 2023 09:39:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a17090aac0b00b002342ccc8280sm1635659pjq.6.2023.03.29.09.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:39:35 -0700 (PDT)
Message-ID: <3f659630-f990-a2e8-d498-2c4c4888fc5f@linaro.org>
Date: Wed, 29 Mar 2023 09:39:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if
 necessary
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20230329161852.84992-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329161852.84992-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/29/23 09:18, Philippe Mathieu-Daudé wrote:
> It is pointless to build libgdb_user.fa in a system-only build
> (or libgdb_softmmu.fa in a user-only build). Besides, in some
> restricted build configurations, some APIs might be restricted /
> not available. Example in a KVM-only builds where TCG is disabled:
> 
>    $ ninja qemu-system-x86_64
>    [99/2187] Compiling C object gdbstub/libgdb_user.fa.p/user.c.o
>    FAILED: gdbstub/libgdb_user.fa.p/user.c.o
>    ../../gdbstub/user.c: In function ‘gdb_breakpoint_insert’:
>    ../../gdbstub/user.c:438:19: error: implicit declaration of function ‘cpu_breakpoint_insert’; did you mean ‘gdb_breakpoint_insert’? [-Werror=implicit-function-declaration]
>      438 |             err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
>          |                   ^~~~~~~~~~~~~~~~~~~~~
>          |                   gdb_breakpoint_insert
>    ../../gdbstub/user.c:438:19: error: nested extern declaration of ‘cpu_breakpoint_insert’ [-Werror=nested-externs]
>    ../../gdbstub/user.c: In function ‘gdb_breakpoint_remove’:
>    ../../gdbstub/user.c:459:19: error: implicit declaration of function ‘cpu_breakpoint_remove’; did you mean ‘gdb_breakpoint_remove’? [-Werror=implicit-function-declaration]
>      459 |             err = cpu_breakpoint_remove(cpu, addr, BP_GDB);
>          |                   ^~~~~~~~~~~~~~~~~~~~~
>          |                   gdb_breakpoint_remove
>    ../../gdbstub/user.c:459:19: error: nested extern declaration of ‘cpu_breakpoint_remove’ [-Werror=nested-externs]
>    cc1: all warnings being treated as errors
>    ninja: build stopped: subcommand failed.
> 
> Fixes: 61b2e136db ("gdbstub: only compile gdbstub twice for whole build")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

>   gdbstub/meson.build | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub/meson.build b/gdbstub/meson.build
> index bd5c5cd67d..cdb4d28691 100644
> --- a/gdbstub/meson.build
> +++ b/gdbstub/meson.build
> @@ -20,11 +20,13 @@ gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
>   libgdb_user = static_library('gdb_user',
>                                gdb_user_ss.sources() + genh,
>                                name_suffix: 'fa',
> -                             c_args: '-DCONFIG_USER_ONLY')
> +                             c_args: '-DCONFIG_USER_ONLY',
> +                             build_by_default: have_user)
>   
>   libgdb_softmmu = static_library('gdb_softmmu',
>                                   gdb_softmmu_ss.sources() + genh,
> -                                name_suffix: 'fa')
> +                                name_suffix: 'fa',
> +                                build_by_default: have_system)
>   
>   gdb_user = declare_dependency(link_whole: libgdb_user)
>   user_ss.add(gdb_user)


