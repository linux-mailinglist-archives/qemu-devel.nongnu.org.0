Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2BB6F2049
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 23:53:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psW1A-0006x9-3K; Fri, 28 Apr 2023 17:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psW16-0006vM-AT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 17:52:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psW13-0007EZ-Ac
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 17:52:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so139450f8f.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682718751; x=1685310751;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yvuVYHUqjYLWzBlOiuGJAr1Btnb1BOzpTnyqtBWrwKk=;
 b=mqowyVbNQXLkxbQ1pSLJ9BQ7XDwWXnwZwsfSA0nP9UnioTZQofx4mgs6kPrG2NvCnh
 T0pZMHP20da+88tqNHKQd+Sj9DfYe51nVuN6OQITXR8HyzofsY659KEJ1ITmzdcsYvcc
 ROPjzv8Rn0au+lZxzNL6JihzvCrToP8gqSEka8GlN5pRofs4SLMdShmsvynOXohHKLu8
 9Qcpfz4RIdNp3VT0jwlX0fM8WKa15z2u45/mC5/MpWalzQSsSqiO2bevIaEDnRTjpb0N
 DLM9chZjCzN8gVFQgUO+doQ41YTkERGenlbq4VldrbsP3v1PvS99EQxwqPFKXTkAjQm2
 WFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682718751; x=1685310751;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvuVYHUqjYLWzBlOiuGJAr1Btnb1BOzpTnyqtBWrwKk=;
 b=GhmIlR8N1n2MZ+qmXqPgMk10lYjY6ZkDi6MdrJZcDKlgVMx+g6cYdln76nQCzzlYm5
 Vr60bXClaLv/BR0KouPJ9bkn46oN/BFx/2veDuT9Z0STsa3tMfCJWUxIR/YcN1ZWtcg9
 /d7cZCDzSBVlw3K97RhVCM/iCPGUxH3XwpDSeFeerY9O3sVTEBc/kDe/VrfzHp7gdnGX
 Qxswrl+JgrUPQe7TWhlKU8DjT2FTgFkhMbFvbACucgXcwgsCYrywCLGpnrAOA6IkgGP+
 VljmqkD+dLaC4F0tlIWF87NeCsQCDfLDn3y7Qq/EHCOebkkO5qNRng+1oMwmF2hreDBg
 5Ibg==
X-Gm-Message-State: AC+VfDyDNbrDHusFKZxdS4vB8vz/uFfyaEmYFu3kKz7D3ojP3mkHwl0g
 wH+Y/YOq4f430V/nPDZwkpZJaw==
X-Google-Smtp-Source: ACHHUZ6Ed3x6SwGMRz7xtFTIAEE2vY109q4Kjnq8rkuIV2EWu+uq4Sxc9OSXAiSfrCKM76cMlcSu3Q==
X-Received: by 2002:adf:f80d:0:b0:2f4:cfb4:57f7 with SMTP id
 s13-20020adff80d000000b002f4cfb457f7mr5313723wrp.61.1682718751599; 
 Fri, 28 Apr 2023 14:52:31 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm22010370wru.56.2023.04.28.14.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 14:52:31 -0700 (PDT)
Message-ID: <b1e8ee14-4d79-1291-491d-ddeb4e180058@linaro.org>
Date: Fri, 28 Apr 2023 22:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] cpus-common: stop using mb_set/mb_read
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230428101735.130779-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428101735.130779-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/28/23 11:17, Paolo Bonzini wrote:
> Use a store-release at the end of the work item, and a load-acquire when
> waiting for the item to be completed.  This is the standard message passing
> pattern and is both enough and clearer than mb_read/mb_set.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

>   cpus-common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index b0047e456f93..a53716deb437 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -157,7 +157,7 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
>       wi.exclusive = false;
>   
>       queue_work_on_cpu(cpu, &wi);
> -    while (!qatomic_mb_read(&wi.done)) {
> +    while (!qatomic_load_acquire(&wi.done)) {
>           CPUState *self_cpu = current_cpu;
>   
>           qemu_cond_wait(&qemu_work_cond, mutex);
> @@ -363,7 +363,7 @@ void process_queued_cpu_work(CPUState *cpu)
>           if (wi->free) {
>               g_free(wi);
>           } else {
> -            qatomic_mb_set(&wi->done, true);
> +            qatomic_store_release(&wi->done, true);
>           }
>       }
>       qemu_mutex_unlock(&cpu->work_mutex);


