Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5C5B58E7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:59:21 +0200 (CEST)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXh9s-0002Qu-Tl
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXh28-0003aA-Oj
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:51:20 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:47083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXh26-0003A2-Ot
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:51:20 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so12474489fac.13
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2HaN8+8iBIMeTc1ew1dlELPcOr/kuCfH1fGnYvP3zeg=;
 b=fvEzHcVeHHGtJz3fpeQmrGl9jkPEPY1BitnMtCu4K1haZopykmycALJAnXuNrDv9/q
 LUL2DDsFNoxfVGcvoGOyBsdiWE5hMrSJUTDENHI7nsVGtPH2RH13xnDdw49DJG3SiVYu
 1QtLytSVhCqWh0aCAukR+7sRLV4EgAvot8KXgfluz5MHDi503NSg/riHkkxK/MXb24Si
 Hrabr/qZbDXg7bTeteVVqOofCInbVyOOuivWqnsFmiBL/083Y6RfMoWtpRWO9PyFbbfK
 cTi35AF92Q78+p/hB82c+7BS9b3/GeXphLUWvd1NCq9ATzU/KPdhfDTKBb9LbFfxN59c
 MdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2HaN8+8iBIMeTc1ew1dlELPcOr/kuCfH1fGnYvP3zeg=;
 b=Pp/kKck9Ph9PVNn7TQLPCIQcdoh5HFHbwESA4ukz/vEppKdnK/KRN3Rqz4GbDsUoOH
 tLhhEKbum62qvBM6FHaVYekcUHFwW8b9sSRxLzDb3I5zhwH4reP1P8CDhwTDPx1g/boB
 xXQi2EZHL5h8k6YeCkXrUjqTtWMwrUGPVkWyDD0VtCTei6BsHaqomfQjOTbutv5QL4/3
 oW1BhRRXkydHRxSuP55OUDQezZBZ8cRvuLvIfdMFP9cM8LU6QjQmIrSmdSF2WeQfh99w
 8lj+y+cvy36HPsJolI3r5RcwWINx4FSyAFHEG2rUHHm0CSnllqzGPGqaNKpBay4MBlet
 dgFw==
X-Gm-Message-State: ACgBeo2BTIDRK24UxkBOONvwmN6lJK2oHoNcCw+f4CyjQCLtCE4TiL87
 6oGz17I80sQdwh+LI3m0QiSzaQ==
X-Google-Smtp-Source: AA6agR4Uf7T9AXIWha0Z9SJezzj4zNlmz5U+HhoxBLfZMqdL2CA/0NgQcW/QRchRa9kP0f8qOy6TWQ==
X-Received: by 2002:a05:6808:1412:b0:342:ff44:6e5d with SMTP id
 w18-20020a056808141200b00342ff446e5dmr9472221oiv.160.1662979877357; 
 Mon, 12 Sep 2022 03:51:17 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056870418900b001267a921ae5sm5253121oac.34.2022.09.12.03.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:51:16 -0700 (PDT)
Message-ID: <bced38fb-6c5e-b906-6b9f-4bcbe7518e1f@linaro.org>
Date: Mon, 12 Sep 2022 11:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/37] target/i386: validate SSE prefixes directly in the
 decoding table
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-12-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-12-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> Many SSE and AVX instructions are only valid with specific prefixes
> (none, 66, F3, F2).  Introduce a direct way to encode this in the
> decoding table to avoid using decode groups too much.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 37 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/decode-new.h     |  1 +
>   2 files changed, 38 insertions(+)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index f6c032c694..7b4fd9fb54 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -108,6 +108,22 @@
>   
>   #define avx2_256 .vex_special = X86_VEX_AVX2_256,
>   
> +#define P_00          1
> +#define P_66          (1 << PREFIX_DATA)
> +#define P_F3          (1 << PREFIX_REPZ)
> +#define P_F2          (1 << PREFIX_REPNZ)

These prefixes are already flags.  Do you really need to shift the shifted value?
I guess you need to choose a value for "no prefix", but I think you could also (ab,re)use 
PREFIX_LOCK or something...

> @@ -212,6 +212,7 @@ struct X86OpEntry {
>       X86CPUIDFeature cpuid : 8;
>       uint8_t      vex_class : 8;
>       X86VEXSpecial vex_special : 8;
> +    uint16_t     valid_prefix : 16;

Anyway, if you did, you'd only need 4 bits instead of 16.

That said, the logic is sound, and saving a few bits doesn't matter much.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

