Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B230373C7C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:37:28 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHiR-000415-Fa
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1leHh3-00030P-Kt
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:36:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1leHh0-0000L0-1U
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:36:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n2so1908803wrm.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zyu6Jh1tIOrjge7LLfUbkEs1c9RHhrPmpbhHLZmktxA=;
 b=L8Tis+vll+aXblNC3JWxUiL+yIhTErknwINOvynPgbS4ZuKXbkvH1aNWa6rQqvsZfD
 vAoO3uPk3TlBoBqikFw0Haj7NsCAovL4nEFrzWjmNgaFlsBSGcWpO9Aw7fW0LVhyXfPE
 1k0OQnf9FizaRtvUeMUihTkr1bgLwU6Q5n1DMyQ81Nkxik1zGWBiZFo02x5rbC2HgCxr
 Kya2r1aAEV6oGMciLMnqrItH7rFMFvcyFBCSuRbotjBvvOqF0UbOAqadXdtbbbGsFCem
 veOu4i2mW4MIYwV4okGhVrRzqscSOINPnsQRsd9/4dujjUZxkRZ0cx+nVRyrxUVIUFpx
 h5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zyu6Jh1tIOrjge7LLfUbkEs1c9RHhrPmpbhHLZmktxA=;
 b=p9kbViMcsRQfnDaedh9KbetgKlt85YOtYZdPKVQO+3MeF3Hxvlm0qEXB+zSLz4t/eu
 OrFfTNSjliXNG6LmVSgK0OkNRzDEtMcaOpG3Yt27LCWRjnbjVRyIQ9M/Ol9JbXsm6YOY
 frKCKYYKLD6Je3edzRpeFkDy2FVY+PMzrbbahs4522mzVId+56HLCByQfzRRC/mdzlDS
 ZIzt+HUiBoiKe968oh38D8Sl5Nnxe94mIeF3tbaliqRQP9V305UCjZwlffk/X7maMbx7
 P2G/WAGAlIvF7dWfl1G9/fZFJm6POrMJ1cSpofzAaPZiLV7XrL/LsJj6b74DPq+3GDG4
 SqAQ==
X-Gm-Message-State: AOAM533dx1iUN8RjijaWToD/0HYykpUCdoGnLgS6qtMR1YEQ3nDam8u0
 /7UjIfEmwtSqOeAnvtpRc+NQ5w==
X-Google-Smtp-Source: ABdhPJz/IvG8KyGzIGTbWxRr/eUPRkSETnPiLt8uXT0ThC6Yk/I/G8eJxF3vacbVsGLhS4mN0HFuIg==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr37196313wrm.34.1620221756170; 
 Wed, 05 May 2021 06:35:56 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id p7sm19126623wrt.24.2021.05.05.06.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 06:35:55 -0700 (PDT)
Subject: Re: [PATCH] target/avr: Ignore unimplemented WDR opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502190900.604292-1-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <36dd1481-d89e-5f1c-5715-9275df83b722@adacore.com>
Date: Wed, 5 May 2021 15:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502190900.604292-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 5/2/21 à 9:09 PM, Philippe Mathieu-Daudé a écrit :
> Running the WDR opcode triggers a segfault:
> 
>    $ cat > foo.S << EOF
>    > __start:
>    >     wdr
>    > EOF
>    $ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
>    $ qemu-system-avr -serial mon:stdio -nographic -no-reboot \
>      -M mega -bios foo.elf -d in_asm --singlestep
>    IN:
>    0x00000000:  WDR
>    Segmentation fault (core dumped)
> 
>    (gdb) bt
>       #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at ../gdbstub.c:718
>       #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at ../gdbstub.c:743
>       #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at ../gdbstub.c:2742
>       #3  0x00005555adc99b96 in cpu_handle_guest_debug (cpu=0x5555af5a4af0) at ../softmmu/cpus.c:306
>       #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at ../accel/tcg/tcg-accel-ops-rr.c:224
>       #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at ../util/qemu-thread-posix.c:521
>       #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
>       #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6
> 
> Since the watchdog peripheral is not implemented, simply
> log the opcode as unimplemented and keep going.
> 
> Reported-by: Fred Konrad <konrad@adacore.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/avr/helper.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 35e10195940..981c29da453 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -188,11 +188,7 @@ void helper_break(CPUAVRState *env)
>   
>   void helper_wdr(CPUAVRState *env)
>   {
> -    CPUState *cs = env_cpu(env);
> -
> -    /* WD is not implemented yet, placeholder */
> -    cs->exception_index = EXCP_DEBUG;
> -    cpu_loop_exit(cs);
> +    qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
>   }

Seems ok to me, at least better than having a segfault.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

>   
>   /*
> 

