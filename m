Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E95AD133
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:11:04 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVA0N-0005ia-R3
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9mr-00088b-Dn
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:57:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9mo-0002mi-U5
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:57:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so5450391wms.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3tLmf34l8Hg8axvZKTFs4l+kCzDucyIEOvqXsYxzMG8=;
 b=nHc/gJl/Ve/I+AM3dcW9dFYnqm2CEtVv/PThKQNHRCV/ZO1ui0KOa6P/M+rorESVL0
 iEOCgTdW4AktEtjUAQtXqqiIq5vupqZiA1nAD6loay4zWVpSK4d2LpGHaRRZxGKNqSSn
 5GJfHoBvQZDRxyBZcIVHKDGa36BZ0xiyTMmgytDjkxf+bbqM6alpZHtrQCIpdX0NQNPT
 083yRwJwFES+8hs5SOXxouMKWHfLhKV/k41PND2f6YuSobK2W4yeM3J6qNA5WC7mojBr
 GjTdt54qd0aScbK9HWDXB9U4MszgkLYGCUKtbSso/1aIWX8sies2pbEoHKRWjsbkxZBd
 53gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3tLmf34l8Hg8axvZKTFs4l+kCzDucyIEOvqXsYxzMG8=;
 b=0yH3Gop2IxrbyWjGLJeWOYHnYTETlclmt887zloBUkxXrcZHHmGMn5pNjpUdyyv95j
 s/a3MpOJfbkUiIYW597lCqcAg4xDKrsqHZ2fd7Kq0dalvj2edriha6pIYIH9LofAyw7b
 P4a6kD0quIk3mFvY6sFCkinBrZPiK5+q8Cl5Vc9OVEV5co6chfPcU/LqXjcCHafTNN+/
 EtsfOoZdfXZ3Dux4+UFbgjgkwQ7a1U5UEk8TCGubUIfgzEwAQ6VsGuWzJIStxGtuXEIK
 AnPwkXQCThxpNNi1rU1YMtK3qY6ByWbOIAsM7xL3EHhva49PjAefExQ+fwBtbSsM9faa
 bZow==
X-Gm-Message-State: ACgBeo3kmZhCCOup2QJzBRBeKJ9UXOOPZx2jl7N1ChHd9cdKDSMww9CK
 B828KDcGoXDHp3A+bLZfZhL0YA==
X-Google-Smtp-Source: AA6agR6pVueFESCSUlp6XYwvhz0aGOEuEHKmfXfAPLqD1zTH6X6K0Xtg4jtLb2t5dRZiolEDkd2RKA==
X-Received: by 2002:a05:600c:ad4:b0:3a5:50b2:f991 with SMTP id
 c20-20020a05600c0ad400b003a550b2f991mr9941425wmr.146.1662375421061; 
 Mon, 05 Sep 2022 03:57:01 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 bd17-20020a05600c1f1100b003a540fef440sm17753536wmb.1.2022.09.05.03.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 03:57:00 -0700 (PDT)
Message-ID: <1554c88e-f4a7-b1ef-636e-31f77146b9f3@linaro.org>
Date: Mon, 5 Sep 2022 11:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] kvm: fix memory leak on failure to read stats descriptors
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220905100621.18289-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905100621.18289-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 11:06, Paolo Bonzini wrote:
> Reported by Coverity as CID 1490142.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 7c8ce18bdd..208b0c74e3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3962,6 +3962,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>                      size_desc * kvm_stats_header->num_desc, ret);
>           g_free(descriptors);
>           g_free(kvm_stats_desc);
> +        g_free(kvm_stats_header);
>           return NULL;
>       }

kvm_stats_header should also be freed just above, in the other read failure if block.

Alternately, can StatsDescriptors be reorg'ed as

   typedef struct StatsDescriptors {

       const char *ident; /* cache key, currently the StatsTarget */

       struct kvm_stats_desc *kvm_stats_desc;

-     struct kvm_stats_header *kvm_stats_header;
+     struct kvm_stats_header kvm_stats_header;
       QTAILQ_ENTRY(StatsDescriptors) next;

   } StatsDescriptors;


since it appears that kvm_stats_header has the same lifetime as the descriptor, and is not 
variable sized, like kvm_stats_desc.


r~

