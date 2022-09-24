Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E55E8D5E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:40:24 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6KN-0005rs-C7
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Hc-00034I-VH
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:37:32 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Hb-00030z-Fz
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:37:32 -0400
Received: by mail-qv1-xf31.google.com with SMTP id z9so1738166qvn.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=llrKuAn4N/wvtvPQn7H7bMUTnF+/lytC2mWfeuTNSFE=;
 b=B33VkW7c3Y34HXilyp0niAKT9CxqFJXm4REYZgoN4Wf4RMq4+6SWdH/fbSZIB39E82
 dUhKWDDIyeRSoQew4Hz6MJDlzARVfJhNx0KQbul/JkPPzVNL6Mh9UwRgkS9cYt98wojR
 LgSV7uf51AHcIm8BSY+3MisKyqBSBD8TvQtsGOUC/+2LOcVU76KsxPROoK/lKJfW5Cty
 GExs8jKe1Rvg+fbFJZT2BvjfLmUt7U+KNA1Wa97Jp3it9mh1ly13EuyFcEgMVzXQFog1
 zXEtnXdPhV1RZJmF1CCzl4QRIjqUQFkqlTiHCRV6wCXTRi8sWi2igO8YkDrTKTWPqY+F
 Z28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=llrKuAn4N/wvtvPQn7H7bMUTnF+/lytC2mWfeuTNSFE=;
 b=GvuaMRLj+IKnjWTMx8F8JuaryPSOOxUGeQHH6mm2Fh0DENEvwtMQMmNLCK35o9upLi
 7BH4czC2OLYVcmMY7uj/VSmC7X8+OUHvX5HRjYcdOaZroEFZ6QyoGyYi8rC6GhRIwANP
 bDKj4KG1tpWXwuDwGTzDz5JHAiUgccH32sphxd2sIpSvBeVdvFOUwbY/mADR+XJBoOm0
 szPwO32RgZEbRvDZQliNUAP64sW4lhvuTV6Y3Bsx/SiNy/aNUpC2q1p/EEyRZgZIBJdS
 tS1fbaFveDNQs+Ugk6DnkFiBVKe54uNNI/+kWA4KGuJN6DwtrekKi1YHcieCYpdSKB18
 hFGg==
X-Gm-Message-State: ACrzQf2gMBKBNMDkzzZvG8zwvXtSvuZGszRnfYWRnzMxYpBR/FD07mrB
 7FZ3A21KyFCjgZ1Tvg1e71r9Xg==
X-Google-Smtp-Source: AMsMyM5wGN83lzQKNVJUUT/OOTe1OOhae3xgjUDYbwqp45SXam2CZdsBH7pL8tWOwo4vjhL4jFJlkQ==
X-Received: by 2002:a05:6214:4102:b0:4a8:940b:b752 with SMTP id
 kc2-20020a056214410200b004a8940bb752mr11446502qvb.68.1664030250424; 
 Sat, 24 Sep 2022 07:37:30 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 g3-20020ac81243000000b00342f8984348sm7400107qtj.87.2022.09.24.07.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:37:29 -0700 (PDT)
Message-ID: <25f95946-9029-13ba-8171-f8c46ea5d77c@linaro.org>
Date: Sat, 24 Sep 2022 14:37:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/12] target/ppc: Move VABSDU[BHW] to decodetree and use
 gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-8-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-8-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Moved VABSDUB, VABSDUH and VABSDUW to decodetree and use gvec to
> translate them.
> 
> vabsdub:
> rept    loop    master             patch
> 8       12500   0,03601600         0,00688500 (-80.9%)
> 25      4000    0,03651000         0,00532100 (-85.4%)
> 100     1000    0,03666900         0,00595300 (-83.8%)
> 500     200     0,04305800         0,01244600 (-71.1%)
> 2500    40      0,06893300         0,04273700 (-38.0%)
> 8000    12      0,14633200         0,12660300 (-13.5%)
> 
> vabsduh:
> rept    loop    master             patch
> 8       12500   0,02172400         0,00687500 (-68.4%)
> 25      4000    0,02154100         0,00531500 (-75.3%)
> 100     1000    0,02235400         0,00596300 (-73.3%)
> 500     200     0,02827500         0,01245100 (-56.0%)
> 2500    40      0,05638400         0,04285500 (-24.0%)
> 8000    12      0,13166000         0,12641400 (-4.0%)
> 
> vabsduw:
> rept    loop    master             patch
> 8       12500   0,01646400         0,00688300 (-58.2%)
> 25      4000    0,01454500         0,00475500 (-67.3%)
> 100     1000    0,01545800         0,00511800 (-66.9%)
> 500     200     0,02168200         0,01114300 (-48.6%)
> 2500    40      0,04571300         0,04138800 (-9.5%)
> 8000    12      0,12209500         0,12178500 (-0.3%)
> 
> Same as VADDCUW and VSUBCUW, overall performance gain but it uses more
> TCGop (4 before the patch, 6 after).
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  6 ++--
>   target/ppc/insn32.decode            |  6 ++++
>   target/ppc/int_helper.c             | 13 +++-----
>   target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  3 --
>   5 files changed, 60 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

