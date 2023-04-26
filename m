Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7186EF55A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:17:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prf0I-0001YO-3i; Wed, 26 Apr 2023 09:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prezs-0001Qx-49
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 09:15:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prezo-0001ix-On
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 09:15:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so31000805e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682514942; x=1685106942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94Hu3JnWEPy5fSiNl0I04YxcbZFHXGb3kVNTlqBFTcs=;
 b=Y4xexoOBgQwjZY2Yxx5WMSwUNu/1pxxYGaIm8axdK3IIL3IBUcLvBXNDoYMsvuBhX8
 7DKxFNkDqnvPabmDk7n7CNwPYxv4Y7mjHdGKjelZpclriHym17BStQWjWz/f+KuK6nf5
 /oJTK2mNnWuTv0uJE9uhEryRAx9LGl0s3PQBYr4mJo7Zcwxb0oxXBiEHN4EluarZcryM
 ukEhnX9vsysiTryyvABu33k49NZBFebCVDs8xCSki+D7NcNv0LeSbwqTvdAv/qhVwOvV
 W/Uv9XlaatTfSvkkLJuEHY+pnY3jHi/P57sEUBaT3QyTsMgZPDQEZubEh74pOeje+rVO
 qMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682514942; x=1685106942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94Hu3JnWEPy5fSiNl0I04YxcbZFHXGb3kVNTlqBFTcs=;
 b=iu2JZeTa+wky5Gdkhi9qrfvRwbAPSj1ULKp4FNugsV275tvsdXQyZgcpRJNNQDf72+
 jbz4w+OcOGOemmt0P6PsviIiM40WXpq+iS5epGjAHk8iVsnFtJ5ZmnjEyktFTYQsfDpe
 e+gh1TsBmWgf7Nz9b8cgatKdgfO/PeICyg4oPI8hpt1Ui+0//lUaeVJIqdv0S2d2rczg
 +SjRPDVM7Ot6VBrO9Oc2Ph95yAnccU19a7Av3z3r9llcQ0kYXj76MqGW+KpUhDVnY5si
 AujviETFjVFZpjiKSh+9J82jnGVNzPK1oysnHGeJUHzkO0RxplfiNP56tZKVDJEe/DkL
 CR3w==
X-Gm-Message-State: AAQBX9emvQ+dbM4nnuvVUqSihwmMWj8ZO0WEcOIC/sFM51Eu/vg9NM7r
 7ba1GJMZQ19geHxNenZKJZ1xEw==
X-Google-Smtp-Source: AKy350a4z+ykPkrlOgi2x+oYWujMpjPQ+3L9Yh+K/c97SkjmMKXv/dM1NKsVLDU8bvAKknWIXtZUUg==
X-Received: by 2002:a05:600c:213:b0:3ef:df3:1693 with SMTP id
 19-20020a05600c021300b003ef0df31693mr12221834wmi.32.1682514942533; 
 Wed, 26 Apr 2023 06:15:42 -0700 (PDT)
Received: from [172.23.2.237] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm21584661wms.23.2023.04.26.06.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 06:15:42 -0700 (PDT)
Message-ID: <3adac335-c518-0a7a-8c79-9187933b0599@linaro.org>
Date: Wed, 26 Apr 2023 14:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 21/57] tcg/mips: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 07:40, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.  There are
> several places where we already convert back from bool to type.
> Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 186 +++++++++++++++++++-------------------
>   1 file changed, 95 insertions(+), 91 deletions(-)


> -static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
> +static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
> +                            TCGReg addrlo, TCGReg addrhi,
> +                            MemOpIdx oi, TCGType data_type)
>   {
> -    TCGReg addr_regl, addr_regh __attribute__((unused));
> -    TCGReg data_regl, data_regh;
> -    MemOpIdx oi;
> -    MemOp opc;
> -#if defined(CONFIG_SOFTMMU)
> -    tcg_insn_unit *label_ptr[2];
> -#else
> -#endif
> -    unsigned a_bits, s_bits;
> -    TCGReg base = TCG_REG_A0;
> -
> -    data_regl = *args++;
> -    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> -    addr_regl = *args++;
> -    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
> -    oi = *args++;
> -    opc = get_memop(oi);
> -    a_bits = get_alignment_bits(opc);
> -    s_bits = opc & MO_SIZE;
> +    MemOp opc = get_memop(oi);
> +    unsigned a_bits = get_alignment_bits(opc);
> +    unsigned s_bits = opc & MO_SIZE;
> +    TCGReg base;
>   
>       /*
>        * R6 removes the left/right instructions but requires the
>        * system to support misaligned memory accesses.
>        */
>   #if defined(CONFIG_SOFTMMU)
> -    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
> +    tcg_insn_unit *label_ptr[2];
> +
> +    base = TCG_REG_A0;
> +    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);

s/1/true/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


