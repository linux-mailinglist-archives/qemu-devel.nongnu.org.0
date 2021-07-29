Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2C3D9F21
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:05:44 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9131-0008LH-5Q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m911M-0007TI-Er
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:04:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m911H-0003Gd-2N
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsQBpclyKJR+wMQT6OrI1zvMRM6Hp57kqX6dGiW4J40=;
 b=G2J4ZfCZ/ep/i1JFf7raDDvePHhd1vl3jHf/xaRMo2G9ZZSBwnECTYFEoBBeNn57MmV6Mk
 7I8zk4NBkS8H1VorbIW1GoXxQLSnWy5ErdO849ENg95yKZ0YV+/Oofi2EsSImkawVqx55H
 AR8PHDWhaAhp0EaFIU/n4wNgV4Ybnb4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-D7pzsD4DOQatidqgHJRLNg-1; Thu, 29 Jul 2021 04:03:52 -0400
X-MC-Unique: D7pzsD4DOQatidqgHJRLNg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so1738920wmj.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fsQBpclyKJR+wMQT6OrI1zvMRM6Hp57kqX6dGiW4J40=;
 b=b8FWta1lwSQzoS5j4kyF9awccL1oKmJFEzKyrTWAaHRaVPJmKnpOVP1Blq1qp7qT9m
 XLTp8giVWHLMq4Su94DhiDzEHcXSMmbziTKSDY75oNxKAGDx36qjS6Udn87N5PNz9uCw
 K8J0MaOzTjqSKQ1LUpgOyORSTTjd+24aweIUaaKRfUuq2d28ThSucDOfjUyWtaP3LRoy
 j5J6GS6jZfXcnBTWuuNq/LviEYib2BP6JnRPA1eL29FXDsHbIiOLnLCTUJRtujZihkRT
 ExghkcKHagot89nVHCyPu6wd7mZPnUsHeo/AoTaNXh9aU0WYNqlK904+ztjtpdW9156w
 JLLg==
X-Gm-Message-State: AOAM5311jTG2sOlAWgoIdl66dCptxojK8Ng4bzNnVGX/vPVFvWrauaLo
 acRN8+hlNGS7kCLvl33VpPqjaUgy7b81BVDbb5jD2KoEt3UJ08f3jY8LXX6a2wAGZUlTTyP97Eu
 9eKnzikoZpPMid18=
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr3326463wry.116.1627545831400; 
 Thu, 29 Jul 2021 01:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8A1SgAjBgmF4iFIbODuq6VPhyJnmldV2ONN3S06rafycIdgwsVvoQGTKOOktmZ8tzou76Hw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr3326439wry.116.1627545831178; 
 Thu, 29 Jul 2021 01:03:51 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id d203sm2246016wmd.38.2021.07.29.01.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:03:50 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/43] target/s390x: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-11-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <03c5dd62-44cb-24fd-1a34-48b9fcc896fa@redhat.com>
Date: Thu, 29 Jul 2021 10:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-11-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 02:46, Richard Henderson wrote:
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/cpu.c             |  2 +-
>   target/s390x/tcg/excp_helper.c | 28 +++++++++++++++-------------
>   2 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 7b7b05f1d3..9d8cfb37cd 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -267,12 +267,12 @@ static void s390_cpu_reset_full(DeviceState *dev)
>   static const struct TCGCPUOps s390_tcg_ops = {
>       .initialize = s390x_translate_init,
>       .tlb_fill = s390_cpu_tlb_fill,
> +    .do_unaligned_access = s390x_cpu_do_unaligned_access,
>   
>   #if !defined(CONFIG_USER_ONLY)
>       .cpu_exec_interrupt = s390_cpu_exec_interrupt,
>       .do_interrupt = s390_cpu_do_interrupt,
>       .debug_excp_handler = s390x_cpu_debug_excp_handler,
> -    .do_unaligned_access = s390x_cpu_do_unaligned_access,
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   #endif /* CONFIG_TCG */
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index a61917d04f..9cbe160f66 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -82,6 +82,21 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
>       tcg_s390_data_exception(env, dxc, GETPC());
>   }
>   
> +/*
> + * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
> + * this is only for the atomic operations, for which we want to raise a
> + * specification exception.
> + */
> +void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                   MMUAccessType access_type,
> +                                   int mmu_idx, uintptr_t retaddr)
> +{
> +    S390CPU *cpu = S390_CPU(cs);
> +    CPUS390XState *env = &cpu->env;
> +
> +    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
> +}
> +
>   #if defined(CONFIG_USER_ONLY)
>   
>   void s390_cpu_do_interrupt(CPUState *cs)
> @@ -602,19 +617,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
>       }
>   }
>   
> -/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
> -   this is only for the atomic operations, for which we want to raise a
> -   specification exception.  */
> -void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr)
> -{
> -    S390CPU *cpu = S390_CPU(cs);
> -    CPUS390XState *env = &cpu->env;
> -
> -    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
> -}
> -
>   static void QEMU_NORETURN monitor_event(CPUS390XState *env,
>                                           uint64_t monitor_code,
>                                           uint8_t monitor_class, uintptr_t ra)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


