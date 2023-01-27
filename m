Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC367F143
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXNW-00013J-Q3; Fri, 27 Jan 2023 17:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXNU-00012h-H0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:39:24 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXNS-0007jk-VG
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:39:24 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so6082979pjb.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJfjOCBR2weiobZbRi8a9pBWI2ZeDbdPtKO5bPq8dK8=;
 b=qKGEkf3hOEAElN3qU0edKmd5IB1CpRxPvrQAI4Vj4t+KQW5vuWxySeflKrJCWkRhvR
 aluvZTwwlQiUhQxFAVplxbxSqlE5u+HzJOleGdJjwTqxUa6WVdG6qaYM0KNiJxXrPjvK
 Nh2DzKSCpNax3inpJSy/KWHY1zLlIYyQFKdafDrzlx+c3XIIf66Ki9F83ej1t0Cw5aYF
 yF6Pw9dVgYtesnlxAsl5+LgNpJQLIJdK8Mykf7auQ8bAiUtm/olmxdcpKdC5tw3rLxtP
 PlyBOH9H3TLgC3RzptMsub859c0HVuJs2H0ESGiK+w0gUnrCyXIuusaH7p4VTP2viRK3
 KV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJfjOCBR2weiobZbRi8a9pBWI2ZeDbdPtKO5bPq8dK8=;
 b=c8GrSSM5UjfEgLe1PvULWKK6VzW7oGrCvucOVmAX/drLGXMZquWHV40fkkP8gvUwSk
 w/v0irj86SXgZ0EVNZiH9ZzY6m7EvXA8+6Eeg+uUreRdPT7FXavcKaQkCttba0ExerC1
 PmOPrSSwR3WcFQcX2UqplSHx6x7UYN+JWHHfmAt/AWh1vEnohmXgPE5xo21KItNzxaWP
 CWdgTQNpQ/0/bflYAYK9/YEv6YdKhl+ZNj9nDfp1JqWwxiJfLc/pSmPYp12bnkZnN8ZA
 m1d1zdt817rYcOfj5hUpRfUuTdQW3wYV3PqRturfg9+8/oBvabbPXKcZ+J6G/ss9zMbu
 NU7A==
X-Gm-Message-State: AO0yUKX77mPC2w5gJXT26mBOd0irWjCAm/EKpHSI4OOzBbsRcsfPyNfU
 rpeitUnPfvcilnpf71Lrh87ohg==
X-Google-Smtp-Source: AK7set9q/T36n9+gHxR+9ej97Fach3pTHYSu+Gik6JNpI4JZvUmWxEobULEjA4nprLLZ40QlL8rSGA==
X-Received: by 2002:a17:902:e0d1:b0:196:450f:d89e with SMTP id
 e17-20020a170902e0d100b00196450fd89emr4784881pla.18.1674859161519; 
 Fri, 27 Jan 2023 14:39:21 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 bf6-20020a170902b90600b00176b84eb29asm3305267plb.301.2023.01.27.14.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:39:20 -0800 (PST)
Message-ID: <e772258e-1493-734f-f8c8-0ea5fe4d65c4@linaro.org>
Date: Fri, 27 Jan 2023 12:39:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 07/16] target/arm/kvm: Select RME VM type for the
 scratch VM
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-8-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-8-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Although the VM type does not affect values probed from the scratch vCPU
> at the moment, it could later. Ensure we specify the right type when
> creating the temporary VM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Does the PA size need changing as well?
> ---
>   target/arm/kvm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index fcddead4fe..d8655d9041 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -70,6 +70,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>   {
>       int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>       int max_vm_pa_size;
> +    int vm_type;
>   
>       kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>       if (kvmfd < 0) {
> @@ -79,8 +80,10 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>       if (max_vm_pa_size < 0) {
>           max_vm_pa_size = 0;
>       }
> +
> +    vm_type = kvm_arm_rme_vm_type(MACHINE(qdev_get_machine()));
>       do {
> -        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, vm_type | max_vm_pa_size);

Given the restrictions on register transfer for RME guests, this seems incorrect.  We 
won't be able to probe what we wanted at all.


r~


