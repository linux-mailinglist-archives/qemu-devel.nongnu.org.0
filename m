Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718F53BBC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:30 +0200 (CEST)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmyu-0008RW-Ut
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmv2-0007lP-7v
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:39:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmv0-0003Bt-Gj
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:39:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso5179627pjg.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MLra2y3RjsABUVe7MidEC48KVDjyFBheFABj2kqJzj8=;
 b=k5lwNeZLwLoOvb++hS1XYKwMF2baoEnxCW23QSQs7hvuecW8h3VD0T/GH17WhwhJ1Z
 9M1eEjDJtWMq0hwpbT3VFzO5wlvFAEQDnxlUTesJ301woDAdQDVdp52/wZDdRHRI9aqc
 xlL5dka7EMMGgqAqqgu/1dAUOZ62BF+PbQASbjXhOBjM6JcTHreKjgg6GCtFjE/HsTr6
 /vpX6m7IlbzN4/FzS4QJjjQnhQHqi2jHvzqROzqoXqlOhN1z9YZwBCq/f2mKRi+ZOIgP
 xCuUWuJdO8rywpU2zhMQ7y7bNKuzjFTDiG7G9zTY58ub6J/I3WvKjGuUbUsdhiBgq7TO
 EGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MLra2y3RjsABUVe7MidEC48KVDjyFBheFABj2kqJzj8=;
 b=HbHGycuDmHSzXaDhJMk1U59TOj/tZt34vrnscyIiBMQskiS13wTTxO1dkyhr+v8Vj1
 ibewvcAjBMecNQ4/Yv1+93Pi9hWdJ2wlqxMTwnfvlhmfSiNRj2xa6wuhO0wwRYbRoWDn
 z1/AYl5BsczPoYPmA/1RKA5Kpscn0iu/PB6V5F00Ygj+46kqIJ9djE8ao5KMxOD88l1W
 tHYCUdygdjYAmoR0/tEDF/dOvMeyQUFD/MmT+r/bDXys0D5TGThcAXVbaF6u4BzPitEQ
 PHV4Vhunip4ynEjVgK7lCH7milrqmKK/DGALOkDgeUA59fNVFGAtf4mDWKpiOgXi6odd
 UGyQ==
X-Gm-Message-State: AOAM5305Ac1kwJgpIa+nXztMubKjxisN7l7pIFm+lt+RBh6WuafKGrK7
 itJrFtAl/2y7wDdpnU41eseS3g==
X-Google-Smtp-Source: ABdhPJwy2YkV3/aKXqUlF7GdqpTQPI674ntibqTKQTfKHTn4KzSVBad/OBTTPdq4qQYXNHjEcMVNBQ==
X-Received: by 2002:a17:902:b683:b0:163:4ef2:3c40 with SMTP id
 c3-20020a170902b68300b001634ef23c40mr5318537pls.123.1654184364977; 
 Thu, 02 Jun 2022 08:39:24 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 e23-20020aa79817000000b00518a473265csm3717401pfl.217.2022.06.02.08.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:39:24 -0700 (PDT)
Message-ID: <0a1051aa-f2f5-02de-693c-2c8b5e002998@linaro.org>
Date: Thu, 2 Jun 2022 08:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/3] target/openrisc: Add basic support for semihosting
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-2-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220527172731.1742837-2-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/27/22 10:27, Stafford Horne wrote:
> +void do_or1k_semihosting(CPUOpenRISCState *env, uint32_t k);
...
> +DEF_HELPER_FLAGS_2(nop, 0, void, env, i32)

Just call the helper "semihosting" and be done with it.
And the helper wants an ifdef for system mode.

> @@ -10,6 +10,7 @@ openrisc_ss.add(files(
>     'fpu_helper.c',
>     'gdbstub.c',
>     'interrupt_helper.c',
> +  'openrisc-semi.c',
>     'sys_helper.c',
>     'translate.c',
>   ))

You want to add the new file for system mode only.
Or, now that I think of it, conditional on CONFIG_SEMIHOSTING itself.

> +static void or1k_semi_return_u32(CPUOpenRISCState *env, uint32_t ret)
> +{
> +    cpu_set_gpr(env, 11, ret);
> +}

Let's drop this until you actually use it.  This appears to be attempting to mirror other, 
more complete semihosting, but missing the third "error" argument.


> +void do_or1k_semihosting(CPUOpenRISCState *env, uint32_t k)
> +{
> +    uint32_t result;
> +
> +    switch (k) {
> +    case HOSTED_EXIT:
> +        gdb_exit(cpu_get_gpr(env, 3));
> +        exit(cpu_get_gpr(env, 3));
> +    case HOSTED_RESET:
> +#ifndef CONFIG_USER_ONLY
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +#endif

Do you in fact want to exit to the main loop after asking for reset?
That's the only way that "no return value" makes sense to me...

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "or1k-semihosting: unsupported "
> +                      "semihosting syscall %d\n", k);

%u.

>   static bool trans_l_nop(DisasContext *dc, arg_l_nop *a)
>   {
> +    if (semihosting_enabled() &&
> +        a->k != 0) {
> +        gen_helper_nop(cpu_env, tcg_constant_i32(a->k));
> +    }

Perhaps cleaner to move the semihosting dispatch switch here, instead of leaving it to the 
runtime?  The reason we have a runtime switch for other guests is that the semihosting 
syscall number is in a register.  This would then be

     if (semihosting_enabled()) {
         switch (a->k) {
         case 0:
             break; /* normal nop */
         case HOSTED_EXIT:
             gen_helper_semihost_exit(cpu_R(dc, 3));
             break;
         case HOSTED_RESET:
             gen_helper_semihost_reset();
             tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);

             dc->base.is_jmp = DISAS_EXIT;
             break;
         ...
         }
     }


r~

