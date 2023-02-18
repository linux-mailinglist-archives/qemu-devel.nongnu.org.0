Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68B69B7F6
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 04:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTE9w-0000Pc-J0; Fri, 17 Feb 2023 22:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTE9r-0000P5-UI
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 22:45:07 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTE9q-0007i3-8a
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 22:45:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id ja17so539784plb.13
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 19:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sf9athrlZ9RdQSQYsNsHOLfJc9Vc0DwGeKda5qEEZvI=;
 b=ppHU/sc8jPZXfOmj5769raswq8LWXwjO1o6kUAlyAXzGOoSUl+7m4q0ZiEfuFSYPib
 c3HY/qC5tWeb1finrSmWxSt1xbXkJ5VF0lF3RXBqeRVWU+CMl8c+RFbKU+iiaRnAbH1H
 B7bt17o6BZBoVVlH5iG+A54MFgaEP1SNstgK2TRZESwxVgYXSQnu5mFtwvl+8JhBboVM
 cOxtP3GfND/P33StDHnPMUgojgzQJZQJIx2oS+BZlIF74Tby0rVGQ02Hr0OdDLsHv9pC
 yBXdCMwqDvDxxRBglSskdd/g757SV6ngqryd2BvLV8flxoCsFRBpL/7UANIZWHBOOUFu
 bp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sf9athrlZ9RdQSQYsNsHOLfJc9Vc0DwGeKda5qEEZvI=;
 b=LpfPaQZS8tTklCKtiFqIifUKeUCR3NsCiXG3KJP99yaSSburOfiuSWjnl0Cb2g1Bec
 xVEP/RPjwigkxVpnYLOSBEdj1S7CQrSp6inZwy4g5Op8dzHr2OPu5KKV2XPTFlvhfh5u
 KmT8kaOOBmr9dC6gqev0tACaFILDFx0EIZ5SEc/gUPqrfttaficXl+mBIl1+7zuQypla
 Yr6nP9WIon/Sj48FvFEkYxQizRPMbxSkwrKupuAgR+mqpPFwxM0cOi2s3eUrv0St8odE
 NYRMXXFvM7AvqlT2Zn4qmPaTfw6Z0s0xETg42tQEeyu4WHleZjiABkGR5wc/eNkpfmx9
 bHDQ==
X-Gm-Message-State: AO0yUKW1thgbr3BVU2tmakRVRxiM25RnOAGXE9AttTNbYXi3Eq61Qkp0
 WO1SjPENmPY7j+9ttu5wroA7Sw==
X-Google-Smtp-Source: AK7set/LbH9Luf8KE3mRNS7xC0s72+/z0sqtm5jNj9rubMdO9ll0HubGv/JLN7sXfwapQxq0iVjbRA==
X-Received: by 2002:a05:6a20:c701:b0:be:8c7e:4dfc with SMTP id
 hi1-20020a056a20c70100b000be8c7e4dfcmr1925859pzb.20.1676691903542; 
 Fri, 17 Feb 2023 19:45:03 -0800 (PST)
Received: from [172.20.100.240] ([173.198.77.219])
 by smtp.gmail.com with ESMTPSA id
 e22-20020aa78256000000b00575d1ba0ecfsm3764495pfn.133.2023.02.17.19.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 19:45:03 -0800 (PST)
Message-ID: <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
Date: Fri, 17 Feb 2023 17:44:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217203445.51077-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 10:34, Daniel Henrique Barboza wrote:
> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uintptr_t ra = GETPC();
> +    uint16_t cbozlen;
> +    void *mem;
> +
> +    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> +
> +    /* Get the size of the cache block for zero instructions. */
> +    cbozlen = cpu->cfg.cboz_blocksize;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbozlen - 1);
> +
> +    mem = tlb_vaddr_to_host(env, address, MMU_DATA_STORE,
> +                            cpu_mmu_index(env, false));
> +
> +    if (likely(mem)) {
> +        /* Zero the block */
> +        memset(mem, 0, cbozlen);
> +    }
> +}

Not correct.  This fails to zero the block at all under a number of conditions.
Please have a closer look at the feedback on v5.


r~

