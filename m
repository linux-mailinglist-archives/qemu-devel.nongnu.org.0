Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901884D9575
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:39:47 +0100 (CET)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1mT-0007DK-S2
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:39:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU1kE-0005pG-4b
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU1kA-00009J-IN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647329841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kIvUYniEA2IaNyEXNWZpUMZeV05pXo10cXJfUwSLpc=;
 b=Odg2F9ZpWQvcvqwSO4M3YrDjYFz6EeWy5F+bpjY7o3qojlZummJJFxAnCq4Kfg6x7AdVBp
 Su4v6odkpaGRP/k5gqWXQINNBWyJ+mNsJtxAe8FU3IEwGK+6JY3+5aAN+xuhCRoXVCeLJG
 UehZ/oiUschtXQ5bU/jpKIp4KiE5gBg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-fwsQElq7N-mb5OYi26zQVg-1; Tue, 15 Mar 2022 03:37:17 -0400
X-MC-Unique: fwsQElq7N-mb5OYi26zQVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so849356wma.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 00:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kIvUYniEA2IaNyEXNWZpUMZeV05pXo10cXJfUwSLpc=;
 b=B1pt+HFUcsva6YgDKU1BpM3FqfK0zIs4C6bso1BTKQzKstejtTCaAGq/bGEuj848pJ
 n3Lgozpzfui1tNLSZR4L3x0XiUJ2fi4x8a0uxFi3u9AuasD9BqSHjjfdem7PXJvl/nQy
 JeddHuAzd1YVdslDtIQE7bmfAat5nY9txY13HZXaKN0Vqcf6NMbix5qTJ2KfhNX2jeJA
 /BV7P/2SNj9zALVLQEbDUdrFQ4/b5S9SA74Yw9oirq4L5y+i6gTSQCCEu9IjCgwM0T2x
 4x4/107zkIaWBuzq3k7Z7L12IK58/U1L0V2nBw2dtmi85+fQVyDt8oXWO3ZwDH+hCCTo
 Wgsw==
X-Gm-Message-State: AOAM530+0wVIqMGAVHGKn+OfCuTtvj+6fOrQKiqosM+WkRLUUyk1clhN
 TzOH6vg1FG2l5O2ZW+dPTrx4okfzlXpQOJ/09aNWA4xUp8yg5LnKkiyudZmNxTiKxGm8Tx1a5uY
 vsgDv/XNuQtfYsPU=
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr19122293wrw.93.1647329836365; 
 Tue, 15 Mar 2022 00:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhdiOXsOFIBhhYnem88FmJ+HnhrxWg1o7DLH9Ng29GtTWW9gz1YPaKBMQ/aMynx8oo7FGVyQ==
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr19122283wrw.93.1647329836114; 
 Tue, 15 Mar 2022 00:37:16 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 m2-20020adff382000000b001f022ef0375sm14970410wro.102.2022.03.15.00.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 00:37:15 -0700 (PDT)
Message-ID: <c2aea51c-80f5-61f3-440b-1eb7e7fc59bf@redhat.com>
Date: Tue, 15 Mar 2022 08:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/tcg: Fix cpu_ldq_be_mmu typo
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315002506.152030-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220315002506.152030-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 15/03/2022 01.25, Richard Henderson wrote:
> In the conversion to cpu_ld_*_mmu, the retaddr parameter
> was corrupted in the one case of cpu_ldq_be_mmu.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/902
> Fixes: f83bcecb1 ("accel/tcg: Add cpu_{ld,st}*_mmu interfaces")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This really should have affected all big-endian guests regardless
> of the host.  I have no idea how the referenced test case fails
> on s390x and ppc64le hosts, but passes on x86_64 host.

For me, the tests/avocado/boot_linux.py:BootLinuxS390X test fails on my x86 
laptop as host.

Anyway, your patch fixes the issue for me:

Tested-by: Thomas Huth <thuth@redhat.com>

Thank you very much for the quick fix!

  Thomas


> 
> r~
> 
> ---
>   accel/tcg/cputlb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 3b918fe..2035b2a 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2174,7 +2174,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
>   uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
>                           MemOpIdx oi, uintptr_t ra)
>   {
> -    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
> +    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
>   }
>   
>   uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,


