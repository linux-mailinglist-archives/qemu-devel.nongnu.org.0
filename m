Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4571A6F24C0
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 15:03:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pskDF-0000gW-Pm; Sat, 29 Apr 2023 09:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pskDB-0000eh-66
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 09:02:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pskD8-0004dA-2X
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 09:02:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so719294f8f.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682773316; x=1685365316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KkdIPBlRLJhRWozD1DV3DzaxHqKsbk+9L2y8wj7pxU4=;
 b=yZrWigN8d3+lJ9qztSgEjgYtLMCj55F66i0VSgVJHp/ByxyCZB4jqn8QyY2oiT8oRB
 Ku9wtPZg+Oq1euOopRT4fRLx7xxlekxGVJTtfVL/2Kh8E/H1QWl2UHjO7EeFfdy0usx8
 a+1rNZuNFqnboskgF60Inwf8c3Kh9K4rP+pf3mQJ0DtQ+0LwEQ2PxXvXfAEfQ8lqcDvI
 Q6fvHzVtSl+Cd55XDW+Vxm2c1sL6pXk2tqCMflJsZeF/XH2MEGDDGW2fzlbTc5pQkyBO
 w4MVOYSoE5LC78JziV+JInWCr3P6/sxA3wpCymkK33s6J700MHnj9+ZYV1E0PCx+Bfts
 fnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682773316; x=1685365316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KkdIPBlRLJhRWozD1DV3DzaxHqKsbk+9L2y8wj7pxU4=;
 b=LRu9z60WwEDg9CrxO04qMQLM9WBUKfARMx7brz15ZluS4xYXKQ3JBYWTH7SMLAYxde
 /tjNo2DygBLfEKeiWoIFWzuOW42sb8enb1v3JXAQXcR6b4LF/RNhv2okJ50rDeNmsqrz
 +WZnOm8Kcn+3s6PE/9uxDuxi8N5WK1bZpOzjQQvzieIxuoxJQlcCQSTJgInNN0TolugN
 qhKThbu77D5SjJIzmKfCCSs5P1/bjIjR8JGUZ24X+T3/NufhXdafGXEAr/jdiO5uR8z8
 QY5mFfx3mqZmkR1MP3Fl+J+L8b80aYImxAR6gPMKYbD4kc3BBzMGbc7RvK9OMth6aPDI
 e0Fg==
X-Gm-Message-State: AC+VfDxLbeErL/GJfF9XiGzSyhP13JZXLprX2ixQgIBS460+gDpall3d
 awrzkPiPTcq0gCqRRbkL5T6pNA==
X-Google-Smtp-Source: ACHHUZ5ExYsCsQoCfD5wrs620G/sxBIe+1s2aLvyIlgMFan1gnKqOyQQqnnlT5CJu0dhOa+U0phjRA==
X-Received: by 2002:adf:fdc6:0:b0:306:2767:4959 with SMTP id
 i6-20020adffdc6000000b0030627674959mr266986wrs.27.1682773316231; 
 Sat, 29 Apr 2023 06:01:56 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 e22-20020a5d5956000000b003012030a0c6sm23503528wri.18.2023.04.29.06.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 06:01:55 -0700 (PDT)
Message-ID: <92b3252a-fd8a-91c6-c90a-3a858fd126fe@linaro.org>
Date: Sat, 29 Apr 2023 14:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 06/57] tcg/i386: Generalize multi-part load overlap test
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
> Test for both base and index; use datahi as a temporary, overwritten
> by the final load.  Always perform the loads in ascending order, so
> that any (user-only) fault sees the correct address.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index b986109d77..794d440a9e 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -2223,23 +2223,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>           if (TCG_TARGET_REG_BITS == 64) {
>               tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
>                                        base, index, 0, ofs);
> +            break;
> +        }
> +        if (use_movbe) {
> +            TCGReg t = datalo;
> +            datalo = datahi;
> +            datahi = t;
> +        }
> +        if (base == datalo || index == datalo) {
> +            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
> +            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
> +            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);

LGTM but I'd rather have someone fluent with x86 review this one...

>           } else {
> -            if (use_movbe) {
> -                TCGReg t = datalo;
> -                datalo = datahi;
> -                datahi = t;
> -            }
> -            if (base != datalo) {
> -                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
> -                                         base, index, 0, ofs);
> -                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
> -                                         base, index, 0, ofs + 4);
> -            } else {
> -                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
> -                                         base, index, 0, ofs + 4);
> -                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
> -                                         base, index, 0, ofs);
> -            }
> +            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
> +                                     base, index, 0, ofs);
> +            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
> +                                     base, index, 0, ofs + 4);
>           }
>           break;
>       default:


