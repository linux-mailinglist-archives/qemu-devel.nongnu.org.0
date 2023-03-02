Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE86A8BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrIx-0006iF-RX; Thu, 02 Mar 2023 17:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXrIv-0006Ya-B3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:21:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXrIt-00081f-LI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:21:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso497329pju.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677795694;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5BdHKoIB8APHpqS8+uzCpSjSjIUJBzINWTHOSa+BUTk=;
 b=qSCmcZfj9rwU5xX8M5eI6ajKmI94dLmojj2E9/2LJIQN1oRKLU9bEvL+IJI8lWvNze
 fbASWj1QucXCHq9kzsao2/iFacbgZMfosKbNihuxV3gw2+IJMNoSO/qX2Yk1yWf5h+DL
 Ij1f0fUQEJdkm6OnKS07TRD+ySZIbHWw+QIJk+0J6TYN0GQnLDKGL+gxNlH1stZBU7yA
 mOWgIyHhuTg/CciKPGP3UEE/qcPmnh7fdHHM6d8uTuddwYZC+CKPTaYfAguc66FiYRUP
 Syrs76w48xry/58v1aVEyaahvRkaHBeOH0uQYhOSf00KgkKIKMKSn/vHqMmaoZpXsi6K
 iHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795694;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BdHKoIB8APHpqS8+uzCpSjSjIUJBzINWTHOSa+BUTk=;
 b=JBU9tkSQ6TK9vS7LngiDrDKZfv9Sbd7E3beOxguzmwZmGIkAucjNh3HgV0K2h4MVO3
 /Z2HcLEFmXXB9Vt4XoMbWHC06Uz/PUJXj0YqLzyusAdrPLE2bOWHh3NqlBzoV8sGTzYZ
 TQP4BPLQ8uP2mSlaZxIvDj6rEich2a6ncF46KWM/awQNoQPauxyasJ4eTCfd9IsSgrBz
 mYKXfX4ecjUhFYq8WUJev3nqCYbZDo4F+YWa2oQdSaAmjCYsNzLw+d4A1dKDN4akB6Sm
 hPQRdKa0PwfrCvrjq4Gz4KqdCKTWGMpQQysxsXZQeFkPpcJ2cyC50+YRqOzTxSxNWGud
 Qp/g==
X-Gm-Message-State: AO0yUKUCoZOgSZG6ZwIO/Ayw1MJtexuzNWCWmZoyO5YVyFWjwMZvxpFd
 Z6fF9Q0dXSDy5jpt09aedM71gw==
X-Google-Smtp-Source: AK7set8sR9G7rU+kWiZ45McYLvsOKeXUGRvKwIrXx0ACTw0ncR25g420Tz1PsiR54UiJfgYUqlyY2Q==
X-Received: by 2002:a17:902:e841:b0:199:2a89:f912 with SMTP id
 t1-20020a170902e84100b001992a89f912mr14164419plg.20.1677795694018; 
 Thu, 02 Mar 2023 14:21:34 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a170902b59000b0019cbabf127dsm157907pls.182.2023.03.02.14.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:21:33 -0800 (PST)
Message-ID: <c3c114ce-a70d-ab39-a8f9-41378b4a6ee0@linaro.org>
Date: Thu, 2 Mar 2023 14:21:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 25/26] gdbstub: split out softmmu/user specifics for
 syscall handling
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302190846.2593720-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:08, Alex Bennée wrote:
> @@ -104,9 +104,10 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
>       }
>   
>       gdbserver_syscall_state.current_syscall_cb = cb;
> -#ifndef CONFIG_USER_ONLY
> -    vm_stop(RUN_STATE_DEBUG);
> -#endif
> +
> +    /* user/softmmu specific handling */
> +    gdb_pre_syscall_handling();

I think this placement of vm_stop is inconvenient, and that we don't need to continue.  If 
we move it down below the construction of gdbserver_syscall_state.syscall_buf...

>       p = &gdbserver_syscall_state.syscall_buf[0];
>       p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
>       *(p++) = 'F';
> @@ -141,27 +142,13 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
>           }
>       }
>       *p = 0;
> -#ifdef CONFIG_USER_ONLY
> -    gdb_put_packet(gdbserver_syscall_state.syscall_buf);
> -    /*
> -     * Return control to gdb for it to process the syscall request.
> -     * Since the protocol requires that gdb hands control back to us
> -     * using a "here are the results" F packet, we don't need to check
> -     * gdb_handlesig's return value (which is the signal to deliver if
> -     * execution was resumed via a continue packet).
> -     */
> -    gdb_handlesig(gdbserver_state.c_cpu, 0);
> -#else
> -    /*
> -     * In this case wait to send the syscall packet until notification that
> -     * the CPU has stopped.  This must be done because if the packet is sent
> -     * now the reply from the syscall request could be received while the CPU
> -     * is still in the running state, which can cause packets to be dropped
> -     * and state transition 'T' packets to be sent while the syscall is still
> -     * being processed.
> -     */
> -    qemu_cpu_kick(gdbserver_state.c_cpu);
> -#endif
> +
> +    if (gdb_send_syscall_now()) { /* true only for *-user */
> +        gdb_put_packet(gdbserver_syscall_state.syscall_buf);
> +    }
> +
> +    /* user/softmmu specific handling */
> +    gdb_post_syscall_handling();

... then we don't need 3 separate hooks for user/softmmu.

softmmu:

void gdb_syscall_handling(const char *syscall_buf)
{
     vm_stop(RUN_STATE_DEBUG);
     qemu_cpu_kick(gdbserver_state.c_cpu);
}

user:

void gdb_syscall_handling(const char *syscall_buf)
{
     gdb_put_packet(syscall_buf);
     gdb_handlesig(gdbserver_state.c_cpu, 0);
}


r~

