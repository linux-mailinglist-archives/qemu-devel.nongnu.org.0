Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F0438005
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:53:31 +0200 (CEST)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2Ti-0004GW-NI
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2SH-0003TG-Uf
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:52:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2SG-0004wT-CY
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:52:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so3943597pjb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QFBsfgsFxC96o+OjK1bKeSK4+KBzKDS0Jdgyx3Wp15w=;
 b=JU/UBf4/BOIcVjtHmxoOQXlqXcmVmZ/b+/sa4tiphykL3BYxrssqdxRIoKcNQgsRCk
 nmVEv0MDnMQnmCd1NZdXHts9tySMefc3JDRBq1YRE4A3CI7xoCruG0F39bHPlvcpKEQp
 FF94qpJ9GK+U+80uXszlcKqmKUoNZmNwNQxt4BoUm7VbaaDzFAvI3Y4Q9AH8/O3eMq2n
 qoRAA1NLvl9L23Y9BuEvqkRMjGcEh+aQi1V2gpCOmw+ceOKc66rdAbvcTI6SX+re5NAX
 huG9NlMNR6YTu5O0G/vizpMGrXzh37jfFLpoh2AE1qf4nWlkKX1OAlGBrPouDcGInrTf
 sG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFBsfgsFxC96o+OjK1bKeSK4+KBzKDS0Jdgyx3Wp15w=;
 b=649P3zhqv5hjdP0J6FAhhP0Sm6IXca8EN4azEh5MFl85SqX5OSEaUKVTR1ktVtn+Al
 NciWc5EuvNkQiknOSSeqEXiE3bp6I3nG2oknI35EIOsh3kQ2tj8zly/VJbTGausUiV7R
 Zmu7YxR0eos0YjOg5apz3HVdbjyPmG9K/TzgdvITyi3hzZ+WyJAMJkxoRm6qj2Qia94y
 CaRihDioAJ4IyNvH6frhaF2C7PuWJgTxWM3AuBwi2n5A8iqEHI8p9oeYm9FTIDZSlOSz
 xHiiaFLCu1OxKaeFx+BaUiA/1PyIKLXeJg6lzMHoMt5CPskFz1SD2OgMx8ugVfJf0ohJ
 nAOQ==
X-Gm-Message-State: AOAM53092Jzjp4F6ic35zRcjSwWKhSQUcpZ3bTeBPvsc/b7+f2D/NvqC
 hMtH9aDnfhBxprnFn4Y33KPNbQ==
X-Google-Smtp-Source: ABdhPJzosSca/RFK/k+eLBkVk6gzdeVSD9CUAWZJRrTK5PMkB8vaah6TRaRv6fRlHYRSwfNQtOK/VA==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr16338129pjb.185.1634939518633; 
 Fri, 22 Oct 2021 14:51:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e2sm10570039pfd.137.2021.10.22.14.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:51:58 -0700 (PDT)
Subject: Re: [PATCH 01/33] target/ppc: introduce do_ea_calc
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99166925-540a-0922-9f7a-6c1df264fb6e@linaro.org>
Date: Fri, 22 Oct 2021 14:51:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br,
 pherde <phervalle@gmail.com>, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +static inline void do_ea_calc(DisasContext *ctx, int ra, TCGv displ, TCGv ea)
> +{
> +    if (ra) {
> +        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
> +    } else {
> +        tcg_gen_mov_tl(ea, displ);
> +    }
> +    if (NARROW_MODE(ctx)) {
> +        tcg_gen_ext32u_tl(ea, ea);
> +    }
> +}

Drop the inline.

Allocate ea locally and return it?
All uses do the allocate immediately beforehand...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

