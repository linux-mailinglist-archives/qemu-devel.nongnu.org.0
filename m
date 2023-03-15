Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990606BB61B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSBx-0002rJ-HD; Wed, 15 Mar 2023 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSBv-0002q6-4T
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:33:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSBs-00073X-Hj
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:33:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k18-20020a17090a591200b0023d36e30cb5so2035480pji.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678890795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/3LurLhVhSUNserNWdhGWag0weoB5e/dR2VHVSpszgk=;
 b=RBhlADSQh383L5TCV61Uir2u98yp0e5yQjKQSXAW64VAyz0/p27BdtiKT8l2rhZmsq
 KrUDh0w4/Ea1oLbjyWXdDLuWslhQmqgS8PlPLP/iCfJSARgTkrUFv1WLVcTO9uAgl/9d
 K2wI5ZrHRf6E0t9ua3LibdfMqnSjAgL1k9hbv4Eh7pWP886S0bf52dURQMJh1vqNZe9n
 HHMklIGqZeKu2OCV1jH4EJfKDtImLRP8A7N8yG9i21YtFbeveBOokWBUzHT67PHvGR4A
 a30cqulKRflZ52gRMT1NR2aX6RNx4FM/UgMRd3JNTweKSTA048MALS1eT8c+EfQrmFh4
 NoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678890795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/3LurLhVhSUNserNWdhGWag0weoB5e/dR2VHVSpszgk=;
 b=hVy+UVyo9ADFRVbSH05eqGXkB8uLy8kUcKdJdyVJf4lhVTxEfX5gU3m21Jg2+eKlJ7
 crRbJk7gDbqvA8CIvAQgj0SuXItCIoTnk1bS4JnQSK+J4lEO4NZbBlRQZROPpbcOsNMD
 qZHVOZsh8RjEwlhVVMsNzBvtYTs1CjKz2ny6DTRP7cyEz472HlBTVsKWVu/Bofovmb8h
 3lHmIOhSLgaYw9zxbEmuROmhBDHBSzrWqNQje1gEEMRHMK/ep4CkPBIWb1I4b/xBPXR4
 CxGGan2rLzu6Esj+74rzK/CTw1DybYDaCy2FNZ/colDgfzNrSDoG3J4J4N/RmA0QYcNX
 194g==
X-Gm-Message-State: AO0yUKUqWGwWkfGyucb8L34R/Z6CQ6IBtVUVz8AHX/I6JUmL4kF8/owh
 7GjDzZuP0JYiiJTh8fBBh25bfA==
X-Google-Smtp-Source: AK7set875O/UlztEud3JXETAq3nA3EZnORjCUSrzGcEfsOiKlRsjfY6slFJRShO1fLUfQIIMioOBcA==
X-Received: by 2002:a17:902:ce88:b0:1a1:7bd7:cc06 with SMTP id
 f8-20020a170902ce8800b001a17bd7cc06mr2090959plg.43.1678890795288; 
 Wed, 15 Mar 2023 07:33:15 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 ld5-20020a170902fac500b0019f789cddccsm3766339plb.19.2023.03.15.07.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 07:33:14 -0700 (PDT)
Message-ID: <e712abf1-d5f6-9fcb-5ca5-6adbab83e4ba@linaro.org>
Date: Wed, 15 Mar 2023 07:33:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] target/s390x: Fix EXECUTE of relative long
 instructions
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230315001117.337128-1-iii@linux.ibm.com>
 <20230315001117.337128-2-iii@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315001117.337128-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/14/23 17:11, Ilya Leoshkevich wrote:
> The code uses the wrong base for relative addressing: it should use the
> target instruction address and not the EXECUTE's address.
> 
> Fix by storing the target instruction address in the new CPUS390XState
> member and loading it from the code generated by gen_ri2().
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/cpu.h            |  1 +
>   target/s390x/tcg/mem_helper.c |  1 +
>   target/s390x/tcg/translate.c  | 13 ++++++++++++-
>   3 files chang

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

