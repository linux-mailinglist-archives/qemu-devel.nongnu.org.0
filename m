Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2E6437CB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:12:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2JgP-0005VW-4z; Mon, 05 Dec 2022 17:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JgL-0005V1-CS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:11:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JgJ-0002BX-7b
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:11:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r10-20020a1c440a000000b003d1e906ca23so52186wma.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSorX8QavFyVYABzytxzh5sXHYZ4hd2RmL8f8Y9Acrw=;
 b=qX9MZrjVVvph44IqpVmRUdkRiqkCm5dDQz7QLOldMayxdo+ICInlw1EDLaXlP3vq3t
 qmTcZ6JByNWGgkRy2uWrbpRiHQHa1zh+8spKfGDtP5Fiej6mKSYnWWmaguSUqek4cRFh
 +/8u/vMSj9Juna1h9nIR5qcsuw2Vs8Nsx0YHi/h+QMvTBRehNM4+BOipSXbH3/vyprOR
 ZsXvZGaMaMOCCALaiNC82f4Xy9ROgiTeG9hpYCAkiWG1mR8cOdTU7tnt8TWG8xdgL8gV
 S0AW3Ya+7Z1eZWOJ/qDrpV3ci3wnM/91g80+sOO14UBTHVUbLSmXlPOak3HxZw2vrLHe
 UECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSorX8QavFyVYABzytxzh5sXHYZ4hd2RmL8f8Y9Acrw=;
 b=6wgAH1gJBFlDYoBWgPnxksVqfqYzCLgEYiD8Wm9GCKvmmCGutFkMnGnW/0e9pD1Kpt
 yrJbm+AWYkdRVqvOq1MR7Llx01l0Ncr/CHOY5PVLKy8+SXa+z5Yxu6PQBGYh5RgCHxzF
 p7w0Db2fjnHqhO8VMaSR6teDoa50fdeA0Tl2RxbrbCcXYnWaNjnbcqWSiILK6m3kB9X0
 UqLqQeBY7AZbJRabPnynzKSrOZyuyKYkgNsriYGxqL5WKcdu0GFJBx2EE89WNuHiag++
 cCS2Smid1EQSzYWEarNfZ+0ehuJrFjYJXYAdHHUGHYyhHXDz+fxCGZObQl6mCeQ3PqOl
 XMhg==
X-Gm-Message-State: ANoB5pn0vqqMypxNKPfOXEZ4Y0l86PHLSbDYTkAYWB2zqcn6GNtWnrqs
 iE6gjDAijvAi2Bixf9/Z/alOeg==
X-Google-Smtp-Source: AA0mqf6PF1PfJyziDj1YQnhkueSrKZuuDMcfFoQXHEneZWjPUbgL3KlaQ3d6IxoCvXXM9BACv7kLsA==
X-Received: by 2002:a05:600c:2213:b0:3cf:a6eb:3290 with SMTP id
 z19-20020a05600c221300b003cfa6eb3290mr55204414wml.116.1670278281335; 
 Mon, 05 Dec 2022 14:11:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm14992213wrw.84.2022.12.05.14.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:11:20 -0800 (PST)
Message-ID: <efef965d-3c9b-abc0-ac5f-c252b10722bd@linaro.org>
Date: Mon, 5 Dec 2022 23:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-11-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This means handling the new exit reason for Xen but still
> crashing on purpose. As we implement each of the hypercalls
> we will then return the right return code.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c    |  5 +++++
>   target/i386/trace-events |  3 +++
>   target/i386/xen.c        | 45 ++++++++++++++++++++++++++++++++++++++++
>   target/i386/xen.h        |  1 +
>   4 files changed, 54 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 4b21d03250..6396d11f1e 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -5468,6 +5468,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>           assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
>           ret = kvm_handle_wrmsr(cpu, run);
>           break;
> +#ifdef CONFIG_XEN

CONFIG_XEN is set when the _host_ has Xen development files available.

IIUC here you want to check if Xen HVM guest support is enabled.

You might want to use a different CONFIG_XEN_xxx key, which itself
depends on CONFIG_XEN.

> +    case KVM_EXIT_XEN:
> +        ret = kvm_xen_handle_exit(cpu, &run->xen);
> +        break;
> +#endif
>       default:
>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>           ret = -1;


> diff --git a/target/i386/xen.h b/target/i386/xen.h
> index d4903ecfa1..3537415d31 100644
> --- a/target/i386/xen.h
> +++ b/target/i386/xen.h
> @@ -23,5 +23,6 @@
>   #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
>   
>   int kvm_xen_init(KVMState *s, uint32_t xen_version);
> +int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
>   
>   #endif /* QEMU_I386_XEN_H */


