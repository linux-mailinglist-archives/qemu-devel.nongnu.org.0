Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D4407F6E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:37:10 +0200 (CEST)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPULj-00062U-Up
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUJ7-0004fo-BF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:34:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUJ4-00063m-Hb
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:34:24 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso4907877pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=29oRC90LFDF/E/x4fowrK86+Sum+Sswmyrg2fDB5KqI=;
 b=AsW5ElIFZUOd5BeeMIKNVnN2TnSGivmW+9whbFSvOeEKlUQFIAYsgT2fsg/zLJA9W0
 m1je1wDRazBsxns4kj1AZrLInLHTIvkwn4WSZsU6yGnwK8nziP+4aDHYMV29vUGu0Hii
 QTTmDufbj/CnJG/eHiNgQC4N8hFgVFx3nMDDrNAx6Z8gKEtrvKgzVueCaYJSJTmXsEOn
 JTjVqcnXqLLf2iAePpQi1LvLZxSQUQQ1XiLaL498cPydF9sY3MyFltCgIQ3UgdmuTmHc
 78Il9kVqqnuYHXNlIMcVExrxkYDoNjbQF/UeYLg5WfVRrcJvICfEbLw8+9wQglwiBRTO
 HIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=29oRC90LFDF/E/x4fowrK86+Sum+Sswmyrg2fDB5KqI=;
 b=TXjGo0KsF6CzIPapl0UthpYxWXW/w0f0J448MJ0L86VpgP+Y3K1ry7eCNbzM64rwh3
 Y7SQ2+RyBSycF3urVFCZsW5M3OQekytg/0GU81IKnGJZfh3uBs1URrmrAfCKdnH2j6mC
 TrioUBDFLSVZEd7i/o2C4velf8LSlfJvkEpxcgPaPdPjH4I9GQo1ME4KE6cAR6rjW404
 dl89lwRb9Db0CotvRCGdbICQ29sjIhoFDoJAYerG25n0M7CV68k60vhYSMbEPFOFIOrb
 snoB4/2IT9XrSBbHRBWPVqW8uxNZUhYgSqkbYzMD0sgmW6hjamU/F/Nz35qwVdH6Gbkg
 8UTw==
X-Gm-Message-State: AOAM532ZtNWfOaHnS83EVLCRh9xZTiLIza8jkaXVw6Xuk1XoDREmJI7H
 OFDrm26PLvh/DK5TLHMLZLov7A==
X-Google-Smtp-Source: ABdhPJwA4asKvbwY6Bzu7IAZxnoZ0QvQnflYmKr1v9wLtw1cfAH9Mt1WJ80l1Lr4L6hmcFgHi05HRg==
X-Received: by 2002:a17:902:ba90:b0:135:6709:705 with SMTP id
 k16-20020a170902ba9000b0013567090705mr7177730pls.79.1631471660471; 
 Sun, 12 Sep 2021 11:34:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t13sm4546825pjj.1.2021.09.12.11.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 11:34:20 -0700 (PDT)
Subject: Re: [PATCH v4 01/30] accel/tcg: Restrict cpu_handle_halt() to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210912172731.789788-1-f4bug@amsat.org>
 <20210912172731.789788-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f880cc11-f738-c1ce-cf3a-fbff36cf69f2@linaro.org>
Date: Sun, 12 Sep 2021 11:34:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912172731.789788-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 10:27 AM, Philippe Mathieu-Daudé wrote:
> Commit 372579427a5 ("tcg: enable thread-per-vCPU") added the following
> comment describing EXCP_HALTED in qemu_tcg_cpu_thread_fn():
> 
>      case EXCP_HALTED:
>           /* during start-up the vCPU is reset and the thread is
>            * kicked several times. If we don't ensure we go back
>            * to sleep in the halted state we won't cleanly
>            * start-up when the vCPU is enabled.
>            *
>            * cpu->halted should ensure we sleep in wait_io_event
>            */
>           g_assert(cpu->halted);
>           break;
> 
> qemu_wait_io_event() is sysemu-specific, so we can restrict the
> cpu_handle_halt() call in cpu_exec() to system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v4: Reduce ifdef'ry to cpu_handle_halt (rth)
> ---
>   accel/tcg/cpu-exec.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

