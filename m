Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04F4C51BF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:52:09 +0100 (CET)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjRU-0005CS-Hy
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNitr-0008Dh-D9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:17:19 -0500
Received: from [2607:f8b0:4864:20::1030] (port=44738
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNitp-0001du-2c
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:17:18 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so6052878pjb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0bc4Qf96hEudF7BwtPBA0RFw4OOkdlqXJnpHL3uCA3s=;
 b=pw1hxtrg4FVJsQ98Dse71FDamDbVJKrdgQMm+9vyMD9gWlJfCZWNf6Z5GeDfBEBWmE
 Txgd/JJX6EFG9wC1e5NM5hBoRdxD6gDSoiQ/+0+w1nT/E0HYC/As4aMc0uv5OQxxn7N7
 1ZaZCTj+iY3jA0KzRYz6Cx+tJsG0XUt+6yS2spR9t/sB3NFH/RwP5BcAyQWU4fQYr/6j
 JhEYwddWtv57zJP0pxNaKKThYvQO7MISC3k739C2yduLV4VeUpnSXQPwVl5ZYet+wbov
 0+8OFkA83ebvFgcE1gXBnSeasyU08eRv+6EiiR/YS3CUBzfFioXRiKwAoFb+UfCTvkxy
 PaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0bc4Qf96hEudF7BwtPBA0RFw4OOkdlqXJnpHL3uCA3s=;
 b=sXppxJoLhGH3p/kx3Dqcpb2OGXZSMASO9xEyr6i9Mc3XrNA+um/tMSJpl6nQkbcZMW
 qYmZKY+8sla1fCf1lj1Hx5ZBFDnz3WjA3xcErOzVISYsUAntkOisiygLLA4EbrCMWIAR
 QWsEEhaGwDdqdPYc+69URnIe94vSrXWeHH5XnWUJaSuUEysVWa+WhumgIEFY2bkbJV8O
 Zq4GoKZTp1MVR1Uq/V6Dn4bj9/aaDuayCU4I32Mq/5kBj5b6U8B4U7I8mOOJz8OBAPkE
 86EgwcTp/D57xPBYNluGVkghLZHAW6J9D1O8TbBCBWUF7HQOzVVcF7zly6GlflkbSqXU
 W82A==
X-Gm-Message-State: AOAM533ksVm2n0rffHstHnqBRoOvINDSPlPw4bqIeb27SroXr6dv5clY
 6IOcIZcKoE75/2HhbJbsOFoqtg==
X-Google-Smtp-Source: ABdhPJyKE2qDZy4x0SAAJ8mTqtc+FY3V24fXZqW5M2Bcy8Z021OUtYg20ugL1TcsKXQKMXInVxjMHw==
X-Received: by 2002:a17:902:8ec9:b0:14f:11f7:db77 with SMTP id
 x9-20020a1709028ec900b0014f11f7db77mr9194844plo.136.1645827434993; 
 Fri, 25 Feb 2022 14:17:14 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00180500b004e1bea9c587sm4521936pfa.67.2022.02.25.14.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:17:14 -0800 (PST)
Message-ID: <d53ae7ea-83bd-f26b-28ce-20e22930a7f3@linaro.org>
Date: Fri, 25 Feb 2022 12:17:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 46/49] target/ppc: Implement xvcvbf16spn and xvcvspbf16
 instructions
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-47-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-47-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> +void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
> +{
> +    ppc_vsr_t t = { };
> +    int i, status;
> +
> +    for (i = 0; i < 4; i++) {
> +        t.VsrH(2 * i + 1) = float32_to_bfloat16(xb->VsrW(i), &env->fp_status);
> +    }
> +
> +    status = get_float_exception_flags(&env->fp_status);
> +    if (unlikely(status & float_flag_invalid_snan)) {
> +        float_invalid_op_vxsnan(env, GETPC());
> +    }
> +
> +    *xt = t;
> +    do_float_check_status(env, GETPC());
> +}

Missing reset_fpstatus.  Otherwise.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


PS: Which is reminding me that cleaning that up has been on the to-do list for a long 
time. We should be able to rely on env->fp_status.float_exception_flags being 0 between 
and at the start of each fp operation. In do_float_check_status, we would reset 
float_exception_flags in the expected unlikely case that it is ever non-zero.

