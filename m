Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8E6D2D70
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 03:54:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piQQk-0003tT-61; Fri, 31 Mar 2023 21:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQh-0003sZ-9w
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:53:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQf-0002XP-Gs
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:53:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so27334626pjp.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680313996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dvQdYQm60kdC0woncVYX8KkpM+a1FEo8clZV8tamiek=;
 b=W7qGU3nqladuZg7uq/xAJai+yupv+1bcNb9mW9B33aD1WgXH+LnyOJcm8telOrS0wZ
 rAG3LcQq7k3jOUT4Fv6/F6CQqSlP2ZdTquNQIaxgfcFCf7rnq+KOy8Rdr+x+Z5LbPF73
 VHv4+TtPwXPwGn/mLy2oEres7dhMk82EZCCVY6vRqFd0XMZDjSvcIu5bz7bzdix22MVr
 kVDmLCOANyT2elBWNW7NkAJCWYZfvPC5wjjtVM1h4FO9kWKXgayKF9zVvA8DxjnNOzb7
 zC4CC0CGceAB8q7h1+FJdqQn8VM6uirOzoNfcFa6QjN4ZzfOuuovoq4E5W5NltP8UPR1
 9NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680313996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvQdYQm60kdC0woncVYX8KkpM+a1FEo8clZV8tamiek=;
 b=DLmpjwUhnmUJfYtMbkzWGWtS5mYxPuR84Z63/SNr6vY0BoRPBf5DhC5ztwdhz1uGsW
 k8+25eA0d+1drXr0iYt/KUEcIdIrlaG3SZ38BCXjSzb4GhQ9ktZ1Au2lRmu3gQWKNa0c
 PsZf1oouYlB0v+eBcugxG6QM34moqpHsK5HoTXr9v9udOOA/P1AkE2+mmiYJ9WweJCl0
 5X8OsFsdVSZd0q6gEbo/gf/7HMa/OxtghHPXAMeoPiOchj7imSWLER28tgD3KQndny6U
 XO9MMG28UIS46phJYF3hFjGPGRWasv4zn232j8KS6qw3VZUQqfjSpWWz9wG+sW0zyS7c
 U1Zg==
X-Gm-Message-State: AAQBX9cAYq1jY3w2TUF/h9XkKb5GLDrfCxzCpe9M76Q+DL2cNlABzxvw
 K+Zl/vPMaDr2Weu+6fbwiSgCSg==
X-Google-Smtp-Source: AKy350beTUHI4qGg8TEJUFLfoYYLcjmzOqlcLsq85P6FANqCqBh7Hk+5MwO3VmfYwocXkLMkS66RVQ==
X-Received: by 2002:a17:902:daca:b0:19f:3d59:e0ac with SMTP id
 q10-20020a170902daca00b0019f3d59e0acmr35948865plx.44.1680313995849; 
 Fri, 31 Mar 2023 18:53:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902ea8600b0019aa5e0aadesm2185463plb.110.2023.03.31.18.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:53:15 -0700 (PDT)
Message-ID: <a7ad22bf-5b21-1941-0317-e2228cfd53f5@linaro.org>
Date: Fri, 31 Mar 2023 18:53:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 7/8] target/riscv: Enable PC-relative translation in
 system mode
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/31/23 08:06, Weiwei Li wrote:
> The existence of CF_PCREL can improve performance with the guest
> kernel's address space randomization.  Each guest process maps
> libc.so (et al) at a different virtual address, and this allows
> those translations to be shared.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

