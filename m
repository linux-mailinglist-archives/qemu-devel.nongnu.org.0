Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC636605586
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 04:27:17 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLHA-0004IN-Gf
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:27:16 -0400
Received: from [::1] (port=47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLDi-0000UU-Fc
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLCK-0007sa-Bp
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:22:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLCI-00058V-LI
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:22:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id b5so17953096pgb.6
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GbohqvCyfVKFJvom7iUm6FVm0BK6iwvR11fRfhMGz9Q=;
 b=Vm1tP2ZP/gKialDhATfcNdd7yoz9h03flQrUoMkvZP0jnMpbEitZa9uhk7GrN5t0TC
 ggOK6+dfIul5uXuJCvV82nifjJscnebOkUwe3LBcVBUGgt9fUoXQLiH8DG1fsG3tpz2S
 4tg6NsYMIzTShvmT9YTDPWzfAtQiO2DQ0Vi8drOfn8NxNgcCVnaml66I8Ar6U5QG4wHz
 qQj4Kku8TWvN1bDzr2fbN7+qksvRx1nX0YDjKkC26P8RkH4Y/TPImaeVJh9lY8qPRfEU
 ed8dmZr2G7Fh1qJ4k7UDNI/wvqTVF/EjeFcYb3w5D07B3vbCbHNgE6cAh8EDgD3u4vl1
 XhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbohqvCyfVKFJvom7iUm6FVm0BK6iwvR11fRfhMGz9Q=;
 b=W8/YLYXkk2psbAmny+Vb8bW9kdFUKBR6esDYDC6hUr9NHQaQr7P7ulfjq3t4zDPlBn
 bvT1Mr59pNcVhaXBgrotsK/neLU/XuYjRYxW/yNDVqhjF/dtAkzxJEARnM7jSBHS0zrA
 zhP2JyqJG0wiHCMH8VRwjGdfnUM1KClmZBYPbfC1gbRx1ffWpYs67gcAu/mT29rE2eIA
 hTn7JFznxniotUYlhgyA6AMzxsgkfwGcqoCjQ4ftRYWD29Q57yDrMtVwQIRMIzrV3MZP
 MyNdusIyODtvM3LSUVlGCOfYCz1VoiJ5bIlpP4bSr0piXdcK9q3wgPsyL9uGZOdLEb3V
 0KGw==
X-Gm-Message-State: ACrzQf18b7DyA6z3Q3qHupqQAaSBsnAghkJCnUSNUPslR1zStpPylGhp
 PPzqUiAFtOld8Zm82FFSCIzOJA==
X-Google-Smtp-Source: AMsMyM4kDQMPXTx6VH3/fo28XYQMKoCuoXiTqz2NhJ6zd/wknQ7KMpEHsksnwosyJUJq2onxPrfyrw==
X-Received: by 2002:a62:5202:0:b0:562:d28e:f715 with SMTP id
 g2-20020a625202000000b00562d28ef715mr11716155pfb.26.1666232529956; 
 Wed, 19 Oct 2022 19:22:09 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902d50300b00174d9bbeda4sm11677935plg.197.2022.10.19.19.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 19:22:09 -0700 (PDT)
Message-ID: <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
Date: Thu, 20 Oct 2022 12:21:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019151651.334334-3-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/20/22 01:16, Greg Kurz wrote:
> When QEMU is started with `-daemonize`, all stdio descriptors get
> redirected to `/dev/null`. This basically means that anything
> printed with error_report() and friends is lost.
> 
> One could hope that passing `-D ${logfile}` would cause the messages
> to go to `${logfile}`, as the documentation tends to suggest:
> 
>        -D logfile
>                Output log in logfile instead of to stderr
> 
> Unfortunately, `-D` belongs to the logging framework and it only
> does this redirection if some log item is also enabled with `-d`
> or if QEMU was configured with `--enable-trace-backend=log`. A
> typical production setup doesn't do tracing or fine-grain
> debugging but it certainly needs to collect errors.
> 
> Ignore the check on enabled log items when QEMU is daemonized. Previous
> behaviour is retained for the non-daemonized case. The logic is unrolled
> as an `if` for better readability. Since qemu_set_log_internal() caches
> the final log level and the per-thread property in global variables, it
> seems more correct to check these instead of intermediary local variables.
> 
> Special care is needed for the `-D ${logfile} -d tid` case : `${logfile}`
> is expected to be a template that contains exactly one `%d` that should be
> expanded to a PID or TID. The logic in qemu_log_trylock() already takes
> care of that for per-thread logs. Do it as well for the QEMU main thread
> when opening the file.

I don't understand why daemonize changes -d tid at all.
If there's a bug there, please separate it out.

I don't understand the is_main_log_thread checks.
Why is the main thread special?

> -    /*
> -     * In all cases we only log if qemu_loglevel is set.
> -     * Also:
> -     *   If per-thread, open the file for each thread in qemu_log_lock.
> -     *   If not daemonized we will always log either to stderr
> -     *     or to a file (if there is a filename).
> -     *   If we are daemonized, we will only log if there is a filename.
> -     */
>       daemonized = is_daemonized();
> -    need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
> +    need_to_open_file = false;
> +    if (!daemonized) {
> +        /*
> +         * If not daemonized we only log if qemu_loglevel is set, either to
> +         * stderr or to a file (if there is a filename).
> +         * If per-thread, open the file for each thread in qemu_log_trylock().
> +         */
> +        need_to_open_file = qemu_loglevel && !log_per_thread;
> +    } else {
> +        /*
> +         * If we are daemonized, we will only log if there is a filename.
> +         */
> +        need_to_open_file = filename != NULL;
> +    }

I would have thought that this was the only change required -- ignoring qemu_loglevel when 
daemonized.


r~

