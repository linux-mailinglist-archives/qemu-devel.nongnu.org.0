Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D96C82D9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:06:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfkr4-0002d3-1V; Fri, 24 Mar 2023 13:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkr0-0002cX-Lc
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:05:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkqx-0008Rj-Vh
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:05:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso6179927pjf.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AUcB2uIJGflArJH0ZjnGpW49Lq8MbXvQKF59hToSvbg=;
 b=PrSQvNIeWNfoIrNZGzdfxCOpGTpOjYPpfFxD9F03QMHhmeP9ncwC5L9uUvAOFV+ZaD
 dJzyx+Cu2NwTIJmw3Pp7HFJA/g1DDzOE/pgRmSEj5jZh3wrd/je2/1XnNBui3ybL+bWs
 yuQevLOR09t6MxXy6gSYYtXXfOhY9Nx1bwjC9MktUE5ZBhn1kONfkYDER4ViJ7kdAFsK
 jcgGqTI003xJ4//c3i/TKETxUt5mBbnY9SYcXSQQO3p9QDj0qnUeTCDbWCF3Pgd103AR
 mlij97araWAALu1LZlxOy/hTiNmuKopE5JkRQXdeWoYsJ3wOlNaHfXknatk4vyiwhSlH
 9+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AUcB2uIJGflArJH0ZjnGpW49Lq8MbXvQKF59hToSvbg=;
 b=36Y9EzIhZowAOmRmPoIs5soIIRN4CN9fDV0dHGR6MRiiCChmUnay8dGU1w61byM8Kz
 tLYcgZRrDIU2e6g65l6Keczxky8QJJ9LHK0sb17e2cLlqqK6CEf5RCaHr9elebLS1uGF
 bOJCYkTyUtbWgbc9o9njdfUFqHYUAq7xnkuyyQv8ygnPhslFM9vcA5I6NDWyJ0JKP0I9
 ZtHWIClc7GV+LDEVk5K0CsZQROfcefOWe0JsSwuXYqtwvnolnUxkuCSsi7AlAShWgbFb
 2hmvotURmP/ED76kFytIF7NBiwCT6uwAbZxbeWUnql8jKUiCcY5BfUUdRqybOhUmsp5n
 +42g==
X-Gm-Message-State: AAQBX9fs+MLaCvHsodDXvQKdFiSHYy8mzsGcNzLRzsjoyNW/HmL2wLzN
 nvX7/z8e0Xf9FgYtVkQsCFtdQA==
X-Google-Smtp-Source: AKy350ZdopybBoEUK/ev3oEnXOH8HVZwkDjjo3+tAWu01FtWHs5AcZOPLgSCKFyCYsWjhNw0NAuzEg==
X-Received: by 2002:a17:90b:3b42:b0:23f:81de:6a74 with SMTP id
 ot2-20020a17090b3b4200b0023f81de6a74mr3414323pjb.39.1679677522449; 
 Fri, 24 Mar 2023 10:05:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902900300b001a060007fcbsm14425023plp.213.2023.03.24.10.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:05:22 -0700 (PDT)
Message-ID: <4ae27732-2fc7-8f36-f169-34e8e9bc4e77@linaro.org>
Date: Fri, 24 Mar 2023 10:05:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] target/riscv: Add a tb flags field for vstart
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/23/23 22:59, LIU Zhiwei wrote:
> Once we mistook the vstart directly from the env->vstart. As env->vstart is not
> a constant, we should record it in the tb flags if we want to use
> it in translation.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h                      | 21 +++++++++++----------
>   target/riscv/cpu_helper.c               |  1 +
>   target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
>   target/riscv/translate.c                |  4 ++--
>   4 files changed, 21 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

