Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F861A40B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or59o-0000BI-4t; Fri, 04 Nov 2022 18:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or59l-0000Ag-NR
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:27:21 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or59k-0000bl-7H
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:27:21 -0400
Received: by mail-oi1-x229.google.com with SMTP id b124so6604705oia.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+IE+3cfYs9ji8VHw2s23wu1ipBojlS6NPyj/zOJUf2g=;
 b=iU6yRZNVeTEDQNmzl3+BcxGcMIaouqG8zlVk4v70nVEtUP+zwTvUHy6s/x34xHJ2gY
 mP5b6DJTYGcOjmLLooaUzU5SoAZoUCGJIw1TGFzafHxC8G6L9bJp4MOVMo/XMV1AeO3P
 EgCE7jlhN5eKBHFUTduw2zRMd/4R4kB8YXO39fPsBxz/gcRkCz+ZX4WdfLXmyxj+N2ch
 S8wYaW4/weWezVRC0S/EKpMNoHItsyipaRGw9Go9IXiF6WohaCMMnobtbO7w//fP2sGS
 x8eFx/DawEWIeyMKKi3g9iPUAa6Jm6F8dCZitod452m1B4IJmjj7wFrYDrklTm4jJfJh
 /o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IE+3cfYs9ji8VHw2s23wu1ipBojlS6NPyj/zOJUf2g=;
 b=sXoQwPODqvwg3DLDoSFf18AzB/MK5cQZmMZUcO0T736Z/JhptD3mAMCPDC6E6d2iAR
 831NrymrA3g5wxRz697mYh3sdZQR158HL3WNsdy/MuCzBy49ZKnOIZBveFP21P0kv+xt
 gUHGc/mHpqwbHzQbWlrL3CPGU7TOJZsmcIuByp3TmROcnSO/xMKZqZJW8lV5q0PAQPf9
 9VNNttICc9ZbMNhWX/YYUU2VNUeY3EAe+C8IuMiM6giNG19jiSS/anvNBhtf333L3BvW
 UNjwWttil5ix1EWKeCjlWCDBUxtrmgY/TpHEJFliRvg0V+Zk/nvotT3iaD6OclAmHEjj
 d9MA==
X-Gm-Message-State: ACrzQf1oE75R/timjeGOs0cGkLz6h0uXiC+vM05FXcztGa9hFOAr9rcu
 c3mbXDNQWNe4xavvYh+eLBKb74o+XcamQQfx
X-Google-Smtp-Source: AMsMyM4zdH1JfqQRP2PMCUrbzz8wHov3l2ahnIIZFYB6y2//ZlQvsSdQahu+R6sX4PfTaEhzwQXJ3A==
X-Received: by 2002:a05:6808:f09:b0:359:b15d:349c with SMTP id
 m9-20020a0568080f0900b00359b15d349cmr27222397oiw.57.1667600838349; 
 Fri, 04 Nov 2022 15:27:18 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006619f38a686sm215518otg.56.2022.11.04.15.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:27:17 -0700 (PDT)
Message-ID: <a26b177e-6e5b-cc73-0b48-04b3c36eb028@linaro.org>
Date: Sat, 5 Nov 2022 09:27:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 12/26] target/s390x: Move masking of psw.addr to
 cpu_get_tb_cpu_state
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-13-richard.henderson@linaro.org>
 <20221103134213.6h2lcmwcs6hykirt@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221103134213.6h2lcmwcs6hykirt@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 00:42, Ilya Leoshkevich wrote:
> On Wed, Oct 05, 2022 at 08:44:07PM -0700, Richard Henderson wrote:
>> Masking after the fact in s390x_tr_init_disas_context
>> provides incorrect information to tb_lookup.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/cpu.h           | 13 +++++++------
>>   target/s390x/tcg/translate.c |  6 ------
>>   2 files changed, 7 insertions(+), 12 deletions(-)
> 
> How can we end up in a situation where this matters? E.g. if we are in
> 64-bit mode and execute
> 
>      0xa12345678: sam31
> 
> we will get a specification exception, and cpu_get_tb_cpu_state() will
> not run. And for valid 31-bit addresses masking should be a no-op.

Ah, true.  I was mislead by the presence of the code in s390x_tr_init_disas_context. 
Perhaps a tcg_debug_assert or just a comment?


r~

