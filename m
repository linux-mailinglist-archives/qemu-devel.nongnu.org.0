Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE46DE809
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 01:31:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmNRA-0001kt-Un; Tue, 11 Apr 2023 19:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmNR3-0001kO-HE
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 19:30:03 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmNR0-0005o2-D4
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 19:30:01 -0400
Received: by mail-oi1-x231.google.com with SMTP id f14so24981585oiw.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681255797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQ1Y6uZOjeIxwEgIwEBvY5MW6SoPg89AU7hXt4cl2pU=;
 b=JAIiLFvFYftw+RRAh2YS+6ORKDogfm57bzS6Ko+t9JgOZJAzJgVveYaqbYo3tweVrV
 oT9e5Tb8XGpOCwULMxiTBIlgy+jeEF9Z7emvygNadf2tXA7H2RDKJ5oljNyRmgK+4QLf
 SzWAd+zwIS+ISJ0Ef8yox75K49W0tSFqn4SjCkeNd7xMNaIhim7RElsAaz/We9w4WYq4
 l34bNLilJyN3Mo4w1h+3HnlEX+DlaK/BkdF6v4n7OU5pIXBsiVE6D6b+IOyKyqYfFr1R
 Y/rJt+CiMgMGxAEeQ9MLAx7Z2NdjTrItlVnEW6V1inlyoulYRjfDm6Og2QvekRjr2Dgu
 zZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681255797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQ1Y6uZOjeIxwEgIwEBvY5MW6SoPg89AU7hXt4cl2pU=;
 b=QqP3d7t5nZLswKx+PSUowalBrCUfd0iiGlCiSxIcbECgJsprTOe6l68aVrwr2D5CzI
 1SLLACRo8nM94o3a3Ctm6iExDBw8SP9+QbKM0XtAeI6mqZJmmkcydvKIlELXd/HKnpMV
 3TOoNuEF7mVcfyJaEIOCM7p9kwivDzDiq3SUTXqzb1YCSOE6jNUfVDxI6UpIHqPkmRuG
 x2zhPoeqfvG3Fvi5BFBloHRSRNAdEhqBUM2eqNWgt3h+PVEDc2kvmEfixIY0AwjDesRZ
 UclL1lnemelwmML+BbvMCcq2Mkcos487ewXOILh0SwpUXpByhJzPMgZ2GrQ3q3ygSVu0
 uR4w==
X-Gm-Message-State: AAQBX9dyk+EOVa9UoRWooqXQW9ZKD8e1H+qjibwmxMWr+TOAzFrmvQZV
 HfhsJXK3LC+L7DVCKvAZeoStDg==
X-Google-Smtp-Source: AKy350YRyRBZWY8Wa5JWdq4+Mhcjqj2/oSEmx3UuCly7+vS7wJYDKQerrjoMvySmIaRpRStptv5g2Q==
X-Received: by 2002:aca:180f:0:b0:387:cfb5:98f1 with SMTP id
 h15-20020aca180f000000b00387cfb598f1mr4979813oih.27.1681255796957; 
 Tue, 11 Apr 2023 16:29:56 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a056808069200b0038afbe9db42sm6091100oig.44.2023.04.11.16.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 16:29:56 -0700 (PDT)
Message-ID: <da4e2e80-f1be-4e46-059b-0c11f140efd1@ventanamicro.com>
Date: Tue, 11 Apr 2023 20:29:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Restore the predicate() NULL check behavior
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <alistair.francis@wdc.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>
References: <20230411090211.3039186-1-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411090211.3039186-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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



On 4/11/23 06:02, Bin Meng wrote:
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
> 
> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.
> 
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
>   target/riscv/csr.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..736ab64275 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3797,6 +3797,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* ensure CSR is implemented by checking predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>       /* privileged spec version check */
>       if (env->priv_ver < csr_min_priv) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -3814,7 +3819,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>        * illegal instruction exception should be triggered instead of virtual
>        * instruction exception. Hence this comes after the read / write check.
>        */
> -    g_assert(csr_ops[csrno].predicate != NULL);
>       RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;
> @@ -3991,7 +3995,10 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
>       return ret;
>   }
>   
> -/* Control and Status Register function table */
> +/*
> + * Control and Status Register function table
> + * riscv_csr_operations::predicate() must be provided for an implemented CSR
> + */
>   riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       /* User Floating-Point CSRs */
>       [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },

