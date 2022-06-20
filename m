Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB75521D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:06:51 +0200 (CEST)
Received: from localhost ([::1]:58232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JvO-0007PO-H6
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Jo6-0004Yn-1x
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:59:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Jo4-000051-9H
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:59:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso10704842pjh.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=RZs8/gV6NTeCKkUnHwB0cToNo4U1+j2szoFc6j7z4JA=;
 b=b+7Jp6BJd7Tw1APIIBay4LOk/bPd6RIeOhQBWYfCwsoEi0ZXlQGXPJa08Ec7dPDwc/
 nDpJKCAEAyiKI7v9BlNfKHRTiQHQLfNF4namCvB/V4DIxKRTkdzHOWM6RvyFcvi/Rib2
 a/5ZFtwokeDsyqLYc+qsDXK49EDl/ZSuz3RkFRXTrOtv4zpACL1zSWW71eOfBrpd/+NB
 kPJlYo6mFnzocc5c2NK7WchCdompiIrxCy7fOS1qx6WoOhODwzzkmsC3LXpm+kDHqQFm
 YWgEozj4yhOqdpWUWeQ9emlDU6R22Y8+znm+MFwyQI+lNmF511r+dZvNnJPfVbetyI8x
 O0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RZs8/gV6NTeCKkUnHwB0cToNo4U1+j2szoFc6j7z4JA=;
 b=o3uBsHAzo1f3iVd5qqXLq0Iq1Xrky5McXQGnsved98etPrbDfrQIweqFpJYnznjRjN
 Xnny85wA8trEbXF1YLW5s/KqhyoFOYm+S2wAZqXfe3xLte3ZSECFWTScCBqZplQ4rWTI
 Qddg04QfWJEVfwTzLKdJu2PNruJDESrxk6h7aAEmYPvap1XTv/34oMIT3PEeOo8UwWp4
 CCX9mR3j3m7BbrazBjYPexz8OExaTR+pOz4MqC1Jezhx7M59TLKspWki4rWurgvx4fDt
 CLmqJpag5yWV8fzwnOKWCn5F0I4k/HZF/xcqiJ5A744HwV4fnIEDc8SiOfURp5PEJ+do
 CjlA==
X-Gm-Message-State: AJIora88sUuKXJ2NITRgvZs6XHWIVfW3VpJquL5Og15jBFqRCl8rU5pM
 vZTEmOx/JG1f5g0P2qlkY43pKg==
X-Google-Smtp-Source: AGRyM1ttT7KhCzrl0XWmRrmbkcItZU4UVi1Atky4NC+rkO56pFU/KZ+PWZFasBKXrVkXIN+ueIou4g==
X-Received: by 2002:a17:902:d483:b0:163:e9cf:7cef with SMTP id
 c3-20020a170902d48300b00163e9cf7cefmr24745113plg.82.1655740754640; 
 Mon, 20 Jun 2022 08:59:14 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 jd2-20020a170903260200b0015e8d4eb1f7sm5205229plb.65.2022.06.20.08.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 08:59:14 -0700 (PDT)
Message-ID: <f7375667-4dc3-17f5-987e-a7d3339c6c00@linaro.org>
Date: Mon, 20 Jun 2022 08:59:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20220620142426.15040-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620142426.15040-1-lmichel@kalray.eu>
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

On 6/20/22 07:24, Luc Michel wrote:
> Hi,
> 
> This series implements a clean way for semihosted exit syscalls to
> terminate QEMU with a given return code.
> 
> Until now, exit syscalls implementations consisted in calling exit()
> with the wanted return code. The problem with this approach is that
> other CPUs are not properly stopped, leading to possible crashes in
> MTTCG mode, especially when at_exit callbacks have been registered. This
> can be the case e.g., when plugins are in use. Plugins can register
> at_exit callbacks. Those will be called on the CPU thread the exit
> syscall is comming from, while other CPUs can continue to run and thus
> call other plugin callbacks.
> 
> The semihosting_exit_request function provides a mean to cleanly
> terminate QEMU. It introduces an new exit reason
> (SHUTDOWN_CAUSE_GUEST_SEMI_EXIT) used in this case. The CPU is stopped
> and returns to the main CPU loop so that no more instruction get
> executed (the semihosting_exit_request is declared G_NORETURN).
> 
> All targets are converted to use this new function.

Did you test a complete build?  At a glance I would guess that arm-linux-user will no 
longer link because qemu_set/get_exit_status is missing.


r~

> 
> Thanks,
> Luc
> 
> Luc Michel (7):
>    softmmu: add qemu_[set|get]_exit_status functions
>    semihosting: add the semihosting_exit_request function
>    semihosting/arm-compat-semi: use semihosting_exit_request
>    target/m68k: use semihosting_exit_request on semihosted exit syscall
>    target/mips: use semihosting_exit_request on semihosted exit syscall
>    target/nios2: use semihosting_exit_request on semihosted exit syscall
>    target/xtensa: use semihosting_exit_request on semihosted exit syscall
> 
>   qapi/run-state.json                |  4 +++-
>   include/semihosting/semihost.h     |  4 ++++
>   include/sysemu/sysemu.h            |  2 ++
>   semihosting/arm-compat-semi.c      |  3 +--
>   semihosting/config.c               | 17 +++++++++++++++++
>   softmmu/main.c                     |  2 +-
>   softmmu/runstate.c                 | 11 +++++++++++
>   target/m68k/m68k-semi.c            |  4 ++--
>   target/mips/tcg/sysemu/mips-semi.c |  2 +-
>   target/nios2/nios2-semi.c          |  4 ++--
>   target/xtensa/xtensa-semi.c        |  2 +-
>   11 files changed, 45 insertions(+), 10 deletions(-)
> 


