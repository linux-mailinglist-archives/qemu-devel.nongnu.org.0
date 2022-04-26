Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5E510C62
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:02:12 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUCB-0007dR-QY
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njU9u-0005zb-93
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 18:59:51 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njU9s-0007OK-GH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 18:59:49 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so279155pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6PXAxt7gMY1XeFJmkdFEJxN3+IZICl72JiIq07LpRj8=;
 b=aOOjsC8g7ePDuP2DvllnmD4MBRQg5hSU43LECMjD0cuX+Eg0h5BACi0Tk8qSZXskGF
 KqVxsqe8VaHH6ORQUn1KlnUGWsDi2kHUFBBBMOkKymxqFdeP9As2eGaCKFaPuOD1D5CM
 BgAlHn5E7o3CY5daiyWYyXhrHYn8H0G27q+9KiBNJo46rHl+WOHE6MqJdAfjxuVtKn6a
 WZXr4APM9HwzrfvTYZet/eu8wBs1MI9524j1SIE3QI4/GSwxZZHGheIm3xH1i9Qgv/kN
 UdmfZTOigufiZRWf5I1+NUn8Tz7I1Wmu70mydX26kAfdAd8wFe09Pa8uJnuGUAzb8N57
 RxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6PXAxt7gMY1XeFJmkdFEJxN3+IZICl72JiIq07LpRj8=;
 b=5XherASubCUhJg+zc7YthjgqL1keBEj/WlovP6tuN30+CZL5kGKjCVVwKAqKFSDpl2
 dZgkXwj+2rNyALaz45+ZUoUWt9+NyzqcvoA1BAadSaOSNbpL8AxBptWJ0B94ZLbSxr+4
 QqoD9P6mwWpmhw9uEDrlfjl4D0+3vzoeCjUI4GOS00bgVd7QItJuNIHZhOOy2bvlGHFD
 28+ozul0wefK6mrpWYYgiJDlnaQZyOpQJxhBJ49ZXPlVzvWJqjxU91S7P08CqOnGh+xY
 DX5b3soOW7OC+oAZGA7cWdrDETGcfaqBNC8ClTDg2VGSh8+MpQymOA/GVTot0lmhXk3n
 edtQ==
X-Gm-Message-State: AOAM531uIzBSAZp7AgDm9hWvKdYheooPk4EVvDhH8AAm9UvTRgLeGv1y
 o3i1G7Evo+YSyJH00w53G734FQ==
X-Google-Smtp-Source: ABdhPJzRff1wgsDSuyU8+eEutxOdyNNEVGDv/P/lizKdJfhaEoS2qOa3u3SXXsWEcsakwMMj7+grTg==
X-Received: by 2002:a17:903:110c:b0:153:1293:5624 with SMTP id
 n12-20020a170903110c00b0015312935624mr25627760plh.149.1651013986931; 
 Tue, 26 Apr 2022 15:59:46 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm17903039pfi.93.2022.04.26.15.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 15:59:46 -0700 (PDT)
Message-ID: <54854d2c-aab2-0f85-4099-65dd1621b940@linaro.org>
Date: Tue, 26 Apr 2022 15:59:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/7] target/ppc: Implement xxm[tf]acc and xxsetaccz
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426125028.18844-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xxmfacc: VSX Move From Accumulator
> xxmtacc: VSX Move To Accumulator
> xxsetaccz: VSX Set Accumulator to Zero
> 
> The PowerISA 3.1 mentions that for the current version of the
> architecture, "the hardware implementation provides the effect of ACC[i]
> and VSRs 4*i to 4*i + 3 logically containing the same data" and "The
> Accumulators introduce no new logical state at this time" (page 501).
> For now it seems unnecessary to create new structures, so this patch
> just uses ACC[i] as VSRs 4*i to 4*i+3 and therefore move to and from
> accumulators are no-ops.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  9 ++++++++
>   target/ppc/translate/vsx-impl.c.inc | 36 +++++++++++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +    TCGv_i64 zero = tcg_constant_i64(0);
> +    for (i = 0; i < 4; i++) {
> +        set_cpu_vsr(a->ra * 4 + i, zero, false);
> +        set_cpu_vsr(a->ra * 4 + i, zero, true);
> +    }

or

   tcg_gen_gvec_dup_imm(MO_64, acc_full_offset(a->ra), 64, 64, 0);


r~

