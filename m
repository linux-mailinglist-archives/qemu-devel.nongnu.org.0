Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E8389525
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:16:14 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQjt-0008AU-CO
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQgb-0006Bo-TY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:12:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQgX-0004U2-Pl
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:12:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso1290772wmc.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1V5u0cxk836cjDmNLpiLHTZAkS9XXb3kzV8WZgLgq2k=;
 b=DS0ABfQsTPRkgEy3CP8gZoBNuCYw7r+rGMQ7g/FYLdsvdAY8MTmfjGvo1NcTU1gtn7
 4xFe1+kzn2PSkWpghM8kmGFy5NC+n5eOKj4TmD5Ozkem4X2ZofFx6dzm2KQACHEEdY2N
 DldPMcOOeeIJ4e8MWG/7fmoExOiD8UBofeMFZR5E9ii8XxBO95/BUFT8p5ge/e7G6JzP
 QK8H8Mic+Earua0P28KsI/Fkjkz/1JHAzhimTTI3K7/bXkaIS5MjKF7iG0SGBl0a5vXs
 9k7utDsk7vI617a01+m/FtgHMrEdlo2K31/VaOfVhjEX6EGtp8bKyTSYJOkTvAuracvr
 9eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1V5u0cxk836cjDmNLpiLHTZAkS9XXb3kzV8WZgLgq2k=;
 b=pa5fTObOELDq9oRcHOzKQtkNmgdGdH242I2rcq2nl4DEzUiSV7YKiaAlX1mZB/KkBT
 KtRztgNOhGH4acgCYOY4+0sYZvsrmepTeJQOAEqdKM979fCxjn4sAy7g6YE/9FX5vj2h
 FqxWjjTXlj48953zW4a2sF9TByomJZ1D/7OSot2Dc5Oahk1Ihr8a6cfr1OEKAHAxW/h2
 JaAibK9EygEVK0S7hhoEHEJrIsKyt+E1+KjtbMfxnrT/fDxABD2GlbPrN0SrFXasRO/p
 mnit/mqoLydeAIb+qrxBAn+midoJO7a+hAD+I11N0hIyi4OhwO/oM3hsC/0XtQhWuewH
 NnJQ==
X-Gm-Message-State: AOAM531ohUmKk77mOS8+vuiJZvFMMFnAGMovObcLWxvBilHicw2FR9x0
 A2sKPRsLB4+MQRFZW6QGjyA=
X-Google-Smtp-Source: ABdhPJxJpHH1QDdTrT/azir0wR75yJHORnjct85j6SKoKuI7EhHKof7150cRk2LPDuYsOWplvUYm8w==
X-Received: by 2002:a1c:3183:: with SMTP id x125mr516822wmx.80.1621447962270; 
 Wed, 19 May 2021 11:12:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l3sm214912wmh.2.2021.05.19.11.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:12:41 -0700 (PDT)
Subject: Re: [RFC PATCH 10/15] exec/gdbstub: Make gdb_exit() /
 gdb_set_stop_cpu() target agnostic
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-11-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <06a5da5a-06ec-b60a-b80a-4b3474ae9a53@amsat.org>
Date: Wed, 19 May 2021 20:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Alex...

On 5/17/21 1:55 PM, Philippe Mathieu-Daudé wrote:
> gdb_exit() and gdb_set_stop_cpu() prototypes don't have to be
> target specific. Remove this limitation to be able to build
> softmmu/cpus.c and softmmu/runstate.c once for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/gdbstub.h | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index a024a0350df..84b1f2ff2aa 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -45,17 +45,6 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
>   */
>  void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
>  int use_gdb_syscalls(void);
> -void gdb_set_stop_cpu(CPUState *cpu);
> -
> -/**
> - * gdb_exit: exit gdb session, reporting inferior status
> - * @code: exit code reported
> - *
> - * This closes the session and sends a final packet to GDB reporting
> - * the exit status of the program. It also cleans up any connections
> - * detritus before returning.
> - */
> -void gdb_exit(int code);
>  
>  #ifdef CONFIG_USER_ONLY
>  /**
> @@ -177,6 +166,18 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
>   */
>  int gdbserver_start(const char *port_or_device);
>  
> +/**
> + * gdb_exit: exit gdb session, reporting inferior status
> + * @code: exit code reported
> + *
> + * This closes the session and sends a final packet to GDB reporting
> + * the exit status of the program. It also cleans up any connections
> + * detritus before returning.
> + */
> +void gdb_exit(int code);
> +
> +void gdb_set_stop_cpu(CPUState *cpu);
> +
>  /**
>   * gdb_has_xml:
>   * This is an ugly hack to cope with both new and old gdb.
> 

