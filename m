Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB416ECC95
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:07:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvti-0006Bu-Ri; Mon, 24 Apr 2023 09:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvtf-0006Bi-VC
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:06:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvte-0005QJ-AL
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:06:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2643603f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682341581; x=1684933581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MseWT1VFmIHg0gsOW+N+ndAlfMSx11wyJhOheFcbfdo=;
 b=eq9C14hH97IgrSNv6StTmZywUQ8hVzB1kRTJGJpuljJS9TxkWe+djbstJsARzXhGEz
 Yl4ehmYDobo7xSnfF01L7a9WdRDKETGxb9pKFeFZ5ckea5MCMrKlDuGYOq34h6FoxoHo
 Zo9G7PCY8IzQVpG8J13UKx0LTTq1LZbTBr6wO37otSMjx4n1lv85/sPqG44GurMC33TN
 XEDt1W8RqkDioVgGwjvt4R18H8iyG2Bx99NFQO5aCcVmZ2bDQsUQosRJIIO79jtYVtle
 Kp2HVcdNjkg396zBetds10WEzQqaZG7JRQLCMVjuM1+uyt+SDJyoClciR51lIB8skUhA
 Yv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682341581; x=1684933581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MseWT1VFmIHg0gsOW+N+ndAlfMSx11wyJhOheFcbfdo=;
 b=lAKOb4DNGkP/cbJYBsTza6jMasuFV2OZW0Q2FZKECaMlD7tZR1YTS3umNDfKAkJgbB
 IbjW4UqIkFUWWj5j42kVSao1XwL3Xmg11s5WxYNcSOF/L0w2JCT8m2Ly+X+efwpusMB/
 uNJhZBM4A3Lj4lKWc3Jc0DX5C7xexNa/LxTBMAcGOmdRda/WmcmMP+rH1zaS/X5t4W4K
 d56KzG1H33Dry82bduJazVSHfT7xd3IpNOR1kSHhWzrIbkKtKW0943qK1++bP1hAWQ/W
 XOYFmd6RF+WXw3axcqctB2k7gLhTStCM4DnxFOlQaoCh4gerDUcePe6MdW/4LEnwyrky
 ObeA==
X-Gm-Message-State: AAQBX9e32lYov9wp/EcafYa1CoaLNnSakI7h9fLncXGyjuWaq1iIgZmy
 ELK1c9E11K9B0z8CcBaNqXnw/A==
X-Google-Smtp-Source: AKy350bCH3MXsYIpZ9hWNzhCiyVzi9HciRNRk7p0FHMZi5+9NWH2Vgbwx5B72lM2noFRmPYce+TNeA==
X-Received: by 2002:adf:dccc:0:b0:2ff:a6c5:2809 with SMTP id
 x12-20020adfdccc000000b002ffa6c52809mr10170275wrm.28.1682341580691; 
 Mon, 24 Apr 2023 06:06:20 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm10731652wrm.65.2023.04.24.06.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:06:20 -0700 (PDT)
Message-ID: <e612395f-ade3-6ceb-a611-8c9c41caeb31@linaro.org>
Date: Mon, 24 Apr 2023 14:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230424112907.26832-1-quic_jiles@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424112907.26832-1-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/24/23 12:29, Jamie Iles wrote:
> +/*
> + * Calculate the number of CPUs that we will process in a single iteration of
> + * the main CPU thread loop so that we can fairly distribute the instruction
> + * count across CPUs.
> + *
> + * The CPU count is cached based on the CPU list generation ID to avoid
> + * iterating the list every time.
> + */
> +static int rr_cpu_count(void)
> +{
> +    static unsigned int last_gen_id = ~0;
> +    static int cpu_count;
> +    CPUState *cpu;
> +
> +    cpu_list_lock();
> +    if (cpu_list_generation_id_get() != last_gen_id) {
> +        cpu_count = 0;
> +        CPU_FOREACH(cpu) {
> +            ++cpu_count;
> +        }
> +        last_gen_id = cpu_list_generation_id_get();
> +    }
> +    cpu_list_unlock();
> +
> +    return cpu_count;
> +}

The read of cpu_count should be in the lock.

(Ideally we'd expose QEMU_LOCK_GUARD(&qemu_cpu_list_lock) which would make the read+return 
trivial.)


>   /*
>    * In the single-threaded case each vCPU is simulated in turn. If
>    * there is more than a single vCPU we create a simple timer to kick
> @@ -185,6 +212,9 @@ static void *rr_cpu_thread_fn(void *arg)
>       cpu->exit_request = 1;
>   
>       while (1) {
> +        int cpu_count = rr_cpu_count();
> +        int64_t cpu_budget = INT64_MAX;
> +
>           qemu_mutex_unlock_iothread();
>           replay_mutex_lock();
>           qemu_mutex_lock_iothread();
> @@ -197,6 +227,8 @@ static void *rr_cpu_thread_fn(void *arg)
>                * waking up the I/O thread and waiting for completion.
>                */
>               icount_handle_deadline();
> +
> +            cpu_budget = icount_percpu_budget(cpu_count);

I think you can move the call to rr_cpu_count() here, so that it only happens if icount is 
in use.

Why cpu_budget = INT64_MAX as opposed to 0 or 0xdeadbeef?  It's not set or used except for 
icount_enabled.


r~

