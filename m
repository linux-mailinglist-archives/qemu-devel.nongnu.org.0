Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF41407E95
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:25:12 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSI3-0000kI-Po
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSGY-0007if-US
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:23:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSGU-0003n6-Bh
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:23:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y17so6568054pfl.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsaJxW/g/NJbXkXRoSHhEe7eeJS1G//5jCxq12MsI1w=;
 b=gMrjGLhTC7K6r7gTp6nL/aDRhhQb7vOfjM8J6LPOLFiIIiZi6dWBHlj9D5tqBz8Fnt
 FTdgz3p2wCxJq2vvuTP9ZGhdOR8uGrOx3rMl562hoZXUy6e/JOhAQFO7fmABiemUd/0H
 vX73PJK9Ju4bYXtBW66cYMQfIIQs6WyI+LE4NrKiyUq2foKVg0Ipmm8t6K+vMDW/Z3ey
 C4Fk9bpntVRMQ2UBPk4xcnzeOXR6E6hRvuIxdMrTWpPv7BIUMxnmz28cEHhsy+4qS+km
 6xGLRa00kVSq8zWkX2/UOTvELvciFtvZXVTnZOLaW9xeW82qiw1SfeFDYwdOkaUoAXUZ
 janQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsaJxW/g/NJbXkXRoSHhEe7eeJS1G//5jCxq12MsI1w=;
 b=D7M8+kOL9rclDMu9/5+40+PaTZgkVOCplH8FMCOcf5cPEd9CfPpkibMZ/cug+2b6vU
 UYSXmrjAqDgmbxuxLHezrF8be0b+N7O0iEZTTmEe6j/saOceZakncd0BF3wlTK9HZQiu
 um3jwv9UgDPn4SaRD8Ha+3YG+w+vg6ptgf4+0bFad+svxcBfYPuxl1I0HYzu5dSIwWls
 mBgpHbQMas0Ns/C15NSYsIKKQDFDYK+XNMonytNaEJLIlJURjRMZ65/Pag7fg+FRoBdX
 LHymZZ65A1DGW2MBKkd0yrkwoezKC/NF2Al41i6la/G/WSH1NR4dOFPVGLiOqm/6TNT7
 uqUA==
X-Gm-Message-State: AOAM531yxS8WF3r1Ns2AffnDqe9tJ+mn/fJpLHBnfqfLtksL7rc24UQp
 KuUtNLw0WAEKrGckkGOmm9rUcw==
X-Google-Smtp-Source: ABdhPJzlIQfZmXC9pX7NfEULMux68LadqpnE4p973g+yQL8DiiRi2hGPDz6tUpV5iBU58R9p0OmAow==
X-Received: by 2002:a63:63c7:: with SMTP id x190mr7228827pgb.70.1631463812747; 
 Sun, 12 Sep 2021 09:23:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i7sm5256021pgd.56.2021.09.12.09.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:23:32 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] linux-user: Split safe-syscall macro into its own
 header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b38d4f0b-4adb-ae02-c90a-83cf4b4a21d8@linaro.org>
Date: Sun, 12 Sep 2021 09:23:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> Split the safe-syscall macro from qemu.h into a new safe-syscall.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/qemu.h         | 135 ---------------------------------
>   linux-user/safe-syscall.h | 154 ++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall.c      |   1 +
>   3 files changed, 155 insertions(+), 135 deletions(-)
>   create mode 100644 linux-user/safe-syscall.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#else
> +
> +/*
> + * Fallback for architectures which don't yet provide a safe-syscall assembly
> + * fragment; note that this is racy!
> + * This should go away when all host architectures have been updated.
> + */
> +#define safe_syscall syscall

All native tcg hosts have been updated.  All that is left are those for which we fall back 
to tci.  At what point do we drop the fallback and simply make this a build error?


r~

