Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D944BE06
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:49:03 +0100 (CET)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkE1-0002Uf-Lw
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkCz-0001N4-QH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:47:57 -0500
Received: from [2a00:1450:4864:20::336] (port=46029
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkCy-00079q-A4
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:47:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1473961wme.4
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JguZQVKsYEll5GUvaUPz1KaNIBc1zWoY8cT30MZU/TM=;
 b=WPLWb8yH2a1RjQ/RyCYCXDoUqRXUYgjt35almvdKAY/g2Y/d+6HXDr2h3IDS/joRWG
 9+Zj801BCmj7uR2jb7yrJkrpvYoTSq7AGWWVDBpM0GyU0xZcI8GNoEAZQXf2rfOXFfQ5
 pa33T4xoq4fUqhkakt6emv+BPs/gz4bn8Yk1JePaeffVbAvvN0B7qJA0yh/eOqwBEpLN
 1V2eZgcZ+DAmkEO81HBiqK57AgB2ATib7mKYbrpxrgjpA4HhLzqGmwof9lXUJ56Z/so/
 ZkCXTa89nu2qK8Bh/NnYRSA4Rr8nKGcIQDAZLX7iuFpSB5Fo0okOwTUKxNNFIji2RDHt
 ga/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JguZQVKsYEll5GUvaUPz1KaNIBc1zWoY8cT30MZU/TM=;
 b=yw/L7Yy707vP8Ng0stvhjsG4IBwO0sM1uCELE+Iud9Fu1RZz+94ZIHBqEYWamUkLRV
 ONy/Oe+e/XEjOlRf9lBz7S7h35t81tUNeyl6Yyotv/I4D9UsLmmkAE0Oq/4gmTF4mr+8
 zUberF1N8Gvp9/7mgpC4ewSDtchaFxiwDYNQ/SoFq0+Q8FlIXquEqY1V3IrKP47P9bAp
 EB4j/qBtJM7rYrarSvFliGAw6J/laO8XgW2kHV2wqJTaZcNprRn+xE1erlJDaDiFDC4T
 ghRYhbeqnVtxUa2fIYtLFI8Du9F04XYq2zfL5OKnWPmEzRnR2rTGz5gcG5L9fXG1NJ2q
 OMUw==
X-Gm-Message-State: AOAM530UM2Ev2nFuYboGZsKII14YydDsbxPsEg6XZe/r8RjNNqkVndRE
 gs11MqDkv5irl6qf866xIQKIkg==
X-Google-Smtp-Source: ABdhPJwL0xz6Q8jP/Wb6JyMA9BUb0ONBtsH3es+xMGl1GgdZeQRcR5Ix/xNZ2xc3XwH6RhmAtingig==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr14589274wmb.150.1636537674802; 
 Wed, 10 Nov 2021 01:47:54 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id m22sm5614039wmq.38.2021.11.10.01.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:47:54 -0800 (PST)
Subject: Re: [PATCH v4 2/2] accel/tcg: Register a force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211109183523.47726-1-groug@kaod.org>
 <20211109183523.47726-3-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87c8f97e-4952-5cf6-d8cb-e465d06f85b3@linaro.org>
Date: Wed, 10 Nov 2021 10:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109183523.47726-3-groug@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 7:35 PM, Greg Kurz wrote:
> A TCG vCPU doing a busy loop systematicaly hangs the QEMU monitor
> if the user passes 'device_add' without argument. This is because
> drain_cpu_all() which is called from qmp_device_add() cannot return
> if readers don't exit read-side critical sections. That is typically
> what busy-looping TCG vCPUs do:
> 
> int cpu_exec(CPUState *cpu)
> {
> [...]
>      rcu_read_lock();
> [...]
>      while (!cpu_handle_exception(cpu, &ret)) {
>          // Busy loop keeps vCPU here
>      }
> [...]
>      rcu_read_unlock();
> 
>      return ret;
> }
> 
> For MTTCG, have all vCPU threads register a force_rcu notifier that will
> kick them out of the loop using async_run_on_cpu(). The notifier is called
> with the rcu_registry_lock mutex held, using async_run_on_cpu() ensures
> there are no deadlocks.
> 
> For RR, a single thread runs all vCPUs. Just register a single notifier
> that kicks the current vCPU to the next one.
> 
> For MTTCG:
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> For RR:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Fixes: 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/650
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 26 ++++++++++++++++++++++++++
>   accel/tcg/tcg-accel-ops-rr.c    | 10 ++++++++++
>   2 files changed, 36 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

