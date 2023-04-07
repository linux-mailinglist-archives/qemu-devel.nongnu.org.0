Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0C6DB09D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 18:33:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkp0G-00034z-IU; Fri, 07 Apr 2023 12:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp0F-00034Z-8f
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:31:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkp0D-0000vW-Oj
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:31:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so3993271pjl.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxUQwvUev9WLyKs5DiAKY7kh9hFFdRghpzpholhhbwc=;
 b=S9oT6R0mdyZIWSboOQ2FX5sVeupTxhbve/grmZX2eQy2fgKz1zLZ4m/WPtz0XbfXsz
 7VzLFUJBNnuEOOg5cbTdn0CjMAFIb+q4N4s5XvWe/siPoODwhZcuSNKsMyyJe4ILUE9H
 y0pqBeVEMR2V2uQ0u7tyPnlPMUUPBxtakUBB5Dppy5W2Vcm7629V6yD7tAabo4yBgopR
 NlbeXeQay7LRU8LAl5pLWPtNF7OjBZ3+reNiTSskm6I+uXgeAS4BWkOIGRXkv9cyrE1f
 wQCYMRYxPBdKYTvlwWt7icpUqkNL/jGvR6C0oDBWV+jO+NhS7Kr5+irhTujV+LaTYzZ1
 UV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxUQwvUev9WLyKs5DiAKY7kh9hFFdRghpzpholhhbwc=;
 b=6j8WFiE4n3PQhl2KxN7D6nx1la7YM1psWYUdXfNTUB9ly5q0+I/kIrUqXbXOV/gSjy
 aHstXtx7+EV6O0QBiwLsVPYmyAzeO+VLDvBdryuegSItnz3GcO9qvawEedxZD1p8pluU
 qOTZDgI4ioHUUot2QcYsamHe7mQmZ/DxfhtAK68pFCQMNCB+FvDmpocZcN/B4NdeTGe1
 B4xw3xsiU/Dp5eD5sG+23pwxLTgURCjKY4JPIU1ZDj11Pkbuzry46oQd0hKFR8LJhalX
 w2Cl+eMQfcvRB8YW29J67ptXY0meMivQ85Sk5vKmw0rJFCNeaLdzfekrL7igRJ44Zgen
 28sA==
X-Gm-Message-State: AAQBX9cF5Ts746N8FTsz55vI/xFOvOvjbNjEfdZmhUjrYFfVCGfofYNf
 QiENB5QAKMTU85CqQlTSb5zUWA==
X-Google-Smtp-Source: AKy350bCyYRhE+f/Su2IvaSNQ8B6qzyC4IcfOh/gjRLhwPO3n1j9QA5v90fDX+GQEcir1bEOJURglw==
X-Received: by 2002:a17:90b:1e0b:b0:246:6cb1:5134 with SMTP id
 pg11-20020a17090b1e0b00b002466cb15134mr444388pjb.22.1680885112204; 
 Fri, 07 Apr 2023 09:31:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a17090add4100b00230ffcb2e24sm1884468pjv.13.2023.04.07.09.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:31:51 -0700 (PDT)
Message-ID: <55f15422-8778-64fb-8918-8f190de38bea@linaro.org>
Date: Fri, 7 Apr 2023 09:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] target/riscv: Use PRV_RESERVED instead of PRV_H
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
 <20230407014743.18779-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230407014743.18779-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/6/23 18:47, Weiwei Li wrote:
> PRV_H has no real meaning, but just a reserved privilege mode currently.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.h       | 2 +-
>   target/riscv/cpu_bits.h  | 2 +-
>   target/riscv/gdbstub.c   | 2 +-
>   target/riscv/op_helper.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!


r~

