Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83974E5B2E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:18:56 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9Jf-0001hd-Nd
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:18:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Gu-0000ck-QH
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:16:07 -0400
Received: from [2607:f8b0:4864:20::102f] (port=41652
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9Gq-0002rM-0R
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:16:01 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so3273075pjm.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=CH8Fewifvhgyj4ZMmX1qunmVfTc6kRbpuPgKu+oDPhw=;
 b=hDu9K6CUAH+EKnxSBvDZ0igN+YI5IoVX+S8joMjLqhLOML7W8WCiEHvBv0rEUhJfcc
 mb9yDIJrufaTwLGuSq5/Js79JkPCAL9LFPz+ukmGnBsm82p1LR23QPZalhzQkwORMOnD
 w8n8RU0yJqjO3DOfSAcc4p3XXdE125Qx1H5Ox0APgpphWi1lwlk+T2n79YMJY5xcg27M
 zCdSWjm13xgUM/VpTuO8Au59QEu6k5sL31QjIIHkaoYnVaQTvg6vKGTT3vyZk7IbphBf
 xxKofrWdghJGv0dn/RMH4bHdNOA6d5lSQBIl3T9oBzDs9l2pdkvaeGZYUfQAGtfbaNG/
 dLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CH8Fewifvhgyj4ZMmX1qunmVfTc6kRbpuPgKu+oDPhw=;
 b=sjrP6007DZBL/l4wo+FarIKkjukjqZ2vJr2dCZ0mLStTg+YG9PDyKuB5wZ0aojwB+k
 giw3nBSHDKWw35wMeYAYUw4J04W4gq5Hie11h/4/YNuFMCvYHFGivDjj2dpeiWzgVhzc
 UtzAc+pz28OmWeNwcLMUdpO4E8LF5dKsxgCEhY0VfEuOhBX+S+EQcgTEqQLfRsKhWSmN
 xeMg4JF8bTuoQdIHoNlOGzeUnv47PRlVQ2Yd+7gmy/ri4lcFU30bYEeh8KyQkYHOn7Ca
 jvQIaZJrM8SV4PdllJaRJYmTifMvsBDkh3XA/SwL+cDYrTW/NNS60Ow+KPUaN+AYm/G2
 fDsQ==
X-Gm-Message-State: AOAM531HI6EPkHuqSAdYrcnj4NFhv8HGAlASw1g9ARaalj/OMVpmEdeK
 QkSQkvENROfK0nWMuuvYpchKdQ==
X-Google-Smtp-Source: ABdhPJxTIRxJtkMmBMSPom3upuzKPhvwdO7q7INxnut1yGPMybZ3kIH9UYGTT+Slcwiwi6a+xybj7A==
X-Received: by 2002:a17:90b:3447:b0:1c6:fe01:675c with SMTP id
 lj7-20020a17090b344700b001c6fe01675cmr14089880pjb.59.1648073758540; 
 Wed, 23 Mar 2022 15:15:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm645682pjj.20.2022.03.23.15.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:15:58 -0700 (PDT)
Message-ID: <c9bb65cb-f439-e0bc-d2cd-b631e6831673@linaro.org>
Date: Wed, 23 Mar 2022 15:15:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 09/13] accel/all: Extract common_vcpu_thread_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-10-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-10-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> +void rr_create_vcpu_thread_postcheck(CPUState *cpu)
>   {
> -    char thread_name[VCPU_THREAD_NAME_SIZE];
>       static QemuCond *single_tcg_halt_cond;
> -    static QemuThread *single_tcg_cpu_thread;
> -
> -    if (!single_tcg_cpu_thread) {
> -        cpu->thread = g_new0(QemuThread, 1);
> -        cpu->halt_cond = g_new0(QemuCond, 1);
> -        qemu_cond_init(cpu->halt_cond);
> -
> -        /* share a single thread for all cpus with TCG */
> -        snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
> -        qemu_thread_create(cpu->thread, thread_name,
> -                           rr_cpu_thread_fn,
> -                           cpu, QEMU_THREAD_JOINABLE);
>   
> +    if (! single_tcg_cpu_thread) {
>           single_tcg_halt_cond = cpu->halt_cond;
>           single_tcg_cpu_thread = cpu->thread;
> -#ifdef _WIN32
> -        cpu->hThread = qemu_thread_get_handle(cpu->thread);
> -#endif
>       } else {
>           /* we share the thread */
>           cpu->thread = single_tcg_cpu_thread;

This doesn't treat cpu->halt_cond correctly for other than the first cpu.


r~

