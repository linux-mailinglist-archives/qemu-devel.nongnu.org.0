Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E36B1624
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 00:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2rk-0003mC-PH; Wed, 08 Mar 2023 18:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2rf-0003lM-Gf
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:06:31 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2rd-0004FG-Vb
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:06:31 -0500
Received: by mail-pl1-x631.google.com with SMTP id p20so86940plw.13
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 15:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678316786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bd4BzWQsHJv+4TNT/Cqczg2VHAlUnzuciPa4YFj+Cg0=;
 b=iUl5hiGl7K9wupClv+clgz3uX7XuZo8Z5PioTr8bTXpDpQNED1ld40Vef94xF+LVwR
 GixcfJqPgtUQnX6MiZGvIxcVivQWaZYWcJaLOUfGu/zT2cyEnqLOVC+IqUxuEOwZZuU8
 JVovz36InBin3mB1Zdlv8pk+k1LGejJAGQR4C0i9IAioNsaMNmxk6dtk25WjX1sqhruX
 uj3wNkyUaakfSSP/tlsTw8ZpIntsl2UZbvZ6C/xzlXRFZCEQcqGSPldCG4X5YGgbPtxn
 jvXq14gPH2wfBfPaXvUehEgC/lsQO9DGiovJHoCOd8iACEhDSaEdPVJFNja5Fh6Tbpdd
 CUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678316786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bd4BzWQsHJv+4TNT/Cqczg2VHAlUnzuciPa4YFj+Cg0=;
 b=onu6ZG7/E6WTDxmP6hcWIpUtiLdAH7xARP1NU2heRjzsDXKyPrZbKbUQgeS+Ypr3D/
 X4hE0QRpyJWXSScNjV4PeDuKW/CgAHjSsGfDX/nXJTfu0MRxs9Nq9d070EsrAiwbcBmY
 BC3zDrvfGf0olgdF6JMx4NpZ1A6RpllprSLSctwtNWQzXAPodoPUF29ucgihIXEmpiDX
 VGxqDFLJGwT3lozG61zdJ2GoqMG1Drrjc7FDPJvgIx9r35uQHJs0JUvfsv9BH+FZB3IX
 sBBtwIwT6ySGAQZABT4GhW0hxPY9zM3h4+O/spwcaY7XCk8mUVkDw5ziLafSommVuVwt
 R1OQ==
X-Gm-Message-State: AO0yUKUMxtjAD9bEhP4782vqfdBObLN6l1dTLLK1TEod9d6YlzAQQf+U
 OOcTqWJE0n8+hGBqHJ4sEqaA4A==
X-Google-Smtp-Source: AK7set8ubm/jSiWfT0J0qF+h302kwnjC8Ht1cxlahWd09yrv84S6jSDPKyf9iBFoRBvhwTx5cXidBA==
X-Received: by 2002:a17:90b:4f8a:b0:234:889f:c35d with SMTP id
 qe10-20020a17090b4f8a00b00234889fc35dmr19737390pjb.3.1678316786483; 
 Wed, 08 Mar 2023 15:06:26 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a628200b00234b785af1dsm262593pjj.26.2023.03.08.15.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 15:06:26 -0800 (PST)
Message-ID: <cedb3a6d-e9d5-993e-f879-6b60a8e30dc2@linaro.org>
Date: Wed, 8 Mar 2023 15:06:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.1 05/17] target/riscv/cpu.c: add
 riscv_cpu_validate_priv_spec()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-6-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230308201925.258223-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 3/8/23 12:19, Daniel Henrique Barboza wrote:
> +static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    int i, priv_version = -1;
> +
> +    if (cpu->cfg.priv_spec) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +            priv_version = PRIV_VERSION_1_11_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> +            priv_version = PRIV_VERSION_1_10_0;
> +        } else {
> +            error_setg(errp,
> +                       "Unsupported privilege spec version '%s'",
> +                       cpu->cfg.priv_spec);
> +            return;
> +        }
> +    }
> +
> +    if (priv_version >= PRIV_VERSION_1_10_0) {
> +        env->priv_ver = priv_version;
> +    }

Merge these two if bodies, as the second condition is completely dependent on the first.


r~

