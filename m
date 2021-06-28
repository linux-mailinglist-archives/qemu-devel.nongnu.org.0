Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3A3B67E7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:43:56 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvIZ-0006Fa-49
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvGg-0004OZ-Pj
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:41:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvGf-0003ND-5D
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:41:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id d12so7067385pfj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=M9Oh9JMR//+67nL+aMpz33WuPlp34CiNB/HqtBCG6jk=;
 b=Ql5a4xnj4z8qTPsSuOWhGZz/Q5QUbPKdgJIN/L9oWW5EchQhp2OXK94uywa8HZ7IuD
 0zDU6fKtPQS78YcJTA6rhz/G6IB2i3VxhJcECE7pOR29e5u8P61Q1jiTbtIvdLsw2vDW
 YE9BQXmFasBXihtzBlCCpzKonIYbcZTtukb6FweLyJo1IGQJhTbnXFQTR9edvikbCstY
 1eZ2BzWNPqhAvwF1p/qY9w1ZGe415nvFhIEcdTj25quIFO9XionyobooHOCK0DxjK8xX
 cbEH7eHwLQKqOoRk5f/DNw08sWnaLsTlIS8xrCjZ5LMzAm2Zb9Pvs2L3FgbyVrjPMQ+o
 PRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M9Oh9JMR//+67nL+aMpz33WuPlp34CiNB/HqtBCG6jk=;
 b=jpbCz6znLBzl+SzWm/DyeLJ6zvUv6v7ol0DOzw+SkEFVEPYdWal7om+a0NJaXHe7Vv
 FDjJVEyazf7MFY+WZ5FIMbvRU2RUeulkty76i+mJS6Mnpt/Dsq5csEQoah+JGO2Iht13
 pVfnRRWog4PaSaoBEh+fn07z3yxfXdLl9kDOFf2Oy+PSWMeuU/C0lbrvNx8QaOkE/RUx
 kly16LN8EYpuvaZcxU+5CEtbTmWgZs60vp73mmevpRw5MB7MeDx+/3nuQpgezU0F3Hyh
 7vOE8rPPXv6HQuon8q+mky3r6yAB6e4K6KRz2Z822iJrsqga85phd/5cWIwY5jutCw91
 uBhQ==
X-Gm-Message-State: AOAM533x2X41aRAQklWGUA28a6Sn52NyysrVb0fuk9IGExbId0pXCfS9
 I7/lXwpkhMjBvZ2ZRlqRf6PE+UFgXST3bA==
X-Google-Smtp-Source: ABdhPJxxTXshTmJmJYBE3iz2zwviuVVC4scEUX8WLna/06iR467BRnw4DGIbLzWtFZJK0/qXFOmP8A==
X-Received: by 2002:a62:2646:0:b029:2fe:f613:5e39 with SMTP id
 m67-20020a6226460000b02902fef6135e39mr25539161pfm.78.1624902115811; 
 Mon, 28 Jun 2021 10:41:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a9sm14713660pfo.69.2021.06.28.10.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:41:55 -0700 (PDT)
Subject: Re: [PATCH 18/18] target/arm: Implement MVE shifts by register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ade0f00e-f59b-bda9-d929-d645261df9bb@linaro.org>
Date: Mon, 28 Jun 2021 10:41:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE shifts by register, which perform
> shifts on a single general-purpose register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h |  2 ++
>   target/arm/translate.h  |  1 +
>   target/arm/t32.decode   |  5 +++++
>   target/arm/mve_helper.c | 10 ++++++++++
>   target/arm/translate.c  | 30 ++++++++++++++++++++++++++++++
>   5 files changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

