Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE723F6376
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:54:46 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZhF-0000ib-QS
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZZZ-0007HH-1r
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:46:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZZV-0001px-SN
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:46:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id q11so5307594wrr.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AfdohAMj44zzRxfM+EwqWF9t7i8KXlBop0c7k4PG08c=;
 b=U48x2R1xPQhmSZArTr8fK1wP6oSvgOGnj1o1n+F+u1dZ1yW4K5HZMoBXsjf7PX62ks
 IDNbO74OQ8MAUJ9HiVrEkTojbROb54sv7KaBdJFB3CDA60RgcxA3X15sNAg5eNT0Z4Fs
 8EkSoWPHHxXmxXcmDC4C8ravvTLAxVy0h3CQa29buOuigAJSOpoyRxT86Cdcyq7sAnvr
 FUrH7uJJWCD0ooseh4yb+DHLi3iM/i9GkDOcZNnI/XrT2r+bNn+rgpf25oMIn5ZbB/r4
 r5iRb55UrA8mlHRRXq8YjpwkhhU5dnNvY++I1AnO6m1W0jtgkvAWPx1pB3TI1TQgFZP3
 dKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AfdohAMj44zzRxfM+EwqWF9t7i8KXlBop0c7k4PG08c=;
 b=BaDQ53Wr+0pa5dYbt1iQQ3SqZpAHVg0QH355TUEVYJM7FLbb+d8a8csiIaQMROwTXl
 7KobyHNw0rtklgi+gheZAW08RhsD1M5LJIlI6t5EO4WAhdJA4cBr+l5/89nSIyyhYsOL
 BFIeVsAknr/slzDTp4r9n0jJNHnu11BHefJN4vzuKh2FnseleMR/u9pOSt+gD6E68Cag
 YSoPx3xMFbu2Ian6bSj+h97EYmCcF4JsrDs49wd8cJ8Nvm9KZ8yTEkmqCnJujX8YrPIC
 Lf4Fk+2o06EFW2LzkbiaKmlfFPfqhnlX3KsNai0Q2Z8OssYyXyMSp1ATylGt4D7vIKph
 Ym/g==
X-Gm-Message-State: AOAM532h4rmMtRoZP5Oku1MfPgQnr25f6x2XRScPbRQsSjB3qsa/tx3p
 /Rdx3jQDFc1GixStUh5Ho6M=
X-Google-Smtp-Source: ABdhPJyEuEezkY6edFzkZyAHSJgVx2jIlyiB0OoRaeIjC1BFyNhQeRewwE4nW/ZeFflDKFaU9WyDYw==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr20000216wro.185.1629823604342; 
 Tue, 24 Aug 2021 09:46:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i9sm22569601wre.36.2021.08.24.09.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:46:43 -0700 (PDT)
Subject: Re: [PATCH v2 22/30] linux-user/mips: Improve do_break
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9875df00-0813-0509-7e8f-30789e5e1c2a@amsat.org>
Date: Tue, 24 Aug 2021 18:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822035537.283193-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:55 AM, Richard Henderson wrote:
> Rename to do_tr_or_bp, as per the kernel function.
> Add a 'trap' argument, akin to the kernel's si_code, but clearer.
> The return value is always 0, so change the return value to void.
> Use force_sig and force_sig_fault.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/cpu_loop.c | 47 ++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 20 deletions(-)

>      default:
> -        info->si_signo = TARGET_SIGTRAP;
> -        info->si_errno = 0;
> -        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

