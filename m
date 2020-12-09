Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F182D480D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:38:12 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3Pm-0005O5-DT
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn3MI-0003WV-Mz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:34:36 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn3MD-0004VX-QP
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:34:34 -0500
Received: by mail-oi1-x243.google.com with SMTP id d189so2526903oig.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hS0dF72W6aMUI7Vs2McJgbCBGF8+gUWo0lXKWrnQfJc=;
 b=RZ2KuljczcIC3fLhhRHV2MwluM0sQpbvWCJhKTEhUXn+wJag4M3+SVCK2PVGDbE8xU
 bTn8qp7OPqajbRdVtEQ4BhJYtst6fEsLBZj3CHdkCV5KqPDTpIJy9r600wGBqzw9c45z
 NA5DhAnfY/PHADhfu48IeC/SJ4jnLBTzAGQU3NEfgeMozRdGC5NHfe9IaA3AfIVVJQT/
 bc1IMl3EozsoBY01xhYbMHqNxlzis3MdqOn9hwNygl9c6pBeRMobHyg+nIFV5RWd6B+t
 LuO8l1P91F82jp5la8dMWa68nDorueI7S1Mxgx+042sZ1X4xsxq3Pj8Rw6YulPmqMSnJ
 F6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hS0dF72W6aMUI7Vs2McJgbCBGF8+gUWo0lXKWrnQfJc=;
 b=ogkdTodp/8I+QW55xGfn5Wt37jRuXVdoF8WN6ORrSug3g5cU2DwPauCDQQqrtJ9Clx
 ThRRoRGyFIyUPRmsrq2m+ka1CY3reWvOTpm6TV+LGcSSeTNV4fpgzz08+m08aUB/SKiu
 4I0wRmtb0l9bPtsGiEFxPuIsuo5qwg8RSfLy4SH5j3L5GdRKzG18+YWBO2OhlEUaDDFx
 iZlvuz3WePwbSuj9UanpghUaQ8L9GMQQljdkRLGcedRAlprmpHxKgrOkYvQ0OGyBOF92
 w01L/GhLPgfDdHPgPUabjCmjOYp6LeHBcvW4A7tevGdzrIZB7PPoNng2aF4QT2Z9epjE
 JuhA==
X-Gm-Message-State: AOAM53289NS7I4QdAm3gPb8gQPMyb+QUmNkLq3c/kum3FGAafSQmobsV
 NeP7FfgYky2N2ariwGs086bhPg==
X-Google-Smtp-Source: ABdhPJyMtcFwVo6hfwsLlawklRUQum1n4A0ttJmOi9at73yWnef2GgteESrEi3AUs6EwrmD/f84vbw==
X-Received: by 2002:aca:dd0b:: with SMTP id u11mr2561429oig.47.1607535267973; 
 Wed, 09 Dec 2020 09:34:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m81sm422344oib.37.2020.12.09.09.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 09:34:27 -0800 (PST)
Subject: Re: [PATCH v2 14/15] target/riscv: csr: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0dcaf5f-a41d-d578-273a-34de2da034d3@linaro.org>
Date: Wed, 9 Dec 2020 11:34:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> @@ -1053,11 +1077,11 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>  
> -#if defined(TARGET_RISCV32)
> -    *val = env->htimedelta & 0xffffffff;
> -#else
> -    *val = env->htimedelta;
> -#endif
> +    if (riscv_cpu_is_32bit(env)) {
> +        *val = env->htimedelta & 0xffffffff;
> +    } else {
> +        *val = env->htimedelta;
> +    }
>      return 0;
>  }

Certainly this mask was useless before the patch, because of the ifdef and
target_ulong.

Afterward, target_ulong may be larger than uint32_t... but what does the rest
of the value, and the register into which it is stored, represent?

Are you going to keep the register values sign-extended, as-if by addw et al,
in which case casting to int32_t would be better.  Are you going to simply
ignore the upper 32 bits, in which case dropping the masking entirely would be
better.


r~

