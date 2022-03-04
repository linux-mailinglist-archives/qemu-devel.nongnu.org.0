Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936414CE048
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:39:05 +0100 (CET)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGZk-0002Bg-4O
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGXT-00009w-0V
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:36:44 -0500
Received: from [2607:f8b0:4864:20::636] (port=33759
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGXR-0007rW-Gl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:36:42 -0500
Received: by mail-pl1-x636.google.com with SMTP id m2so3004449pll.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lxv8P1kjdj19TGTwQCMT9+LjeWEUkwma0Ff7v1bfyYk=;
 b=ePHxWFrmLLXtrHUkYAGdtBbGu/VHOJdQs//7UWYed2mceRgMzPXJeUk5PQ8VtzImdb
 xyJ4MAUNCv5M7daAlho4E5Q6QXuVjh36u/S1S42jIeHIOds4uAXKbO38XO0AKDOHRJXb
 nEH9EBMUp2iAdliQgCPXfHesYvY5yprzPdHZPbeEmWmAc2A0h4s10gA2dB+41aGR4Bc+
 ZNabVojNoAv+RzbHB6YubxSlBcG8Vm+AMMBQP+tYMepNHA2fWjqo4QsLJ9TjB2GtMT0M
 hi3nukIvlNV7xQugkm2c6zpmFcZbtF+etWvjq1TRJCijiIIAJ7Xy3gWpr/vKLRupjnPy
 m/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lxv8P1kjdj19TGTwQCMT9+LjeWEUkwma0Ff7v1bfyYk=;
 b=5Gnd1jx6UXWlIM0OtrUOi2X73KxpTsBDD4iEuB9kNuJMuKSLpVr/hSyK0nVi792DdC
 eRaCuCb+LZjLnuPykph2Inc7nBvKnqoG/ojw6rAfQ0pRx/GifUIsrqSWQeVsZCt08XJI
 nTxNTAPdpAabHQG4cf/SvHt25tEpB6ne3Zkd1t4VyBCMlrR27NXC2e79COA4kfNe8HL3
 CeODfH6UoelsiIj/zE4MzSf1R6BRpZB0oZgcrCOiKcCN81ei22WUfleljsbhd1sp0nOr
 QkL5FOO7nGGOtk/bo05vK7g+Rwjxb3JAN5mSeP20d0yVnU+Ikbm32PpjxnQ5aXs20vt7
 k9iw==
X-Gm-Message-State: AOAM532i50aMaYBJwNupg6Wv1MjFJBD19YZD1SL9pUj+iTm+f9pKdaFW
 OsjqNl9soe4FPwS9z9xqECtaIw==
X-Google-Smtp-Source: ABdhPJxTbNvSinxulYCWUlPPliHcl2YUqeGrUvDgGvtfjpTw6VrJEQulaSuO/5kNuycek+Nso6cIjQ==
X-Received: by 2002:a17:90b:3b81:b0:1bc:d92f:d359 with SMTP id
 pc1-20020a17090b3b8100b001bcd92fd359mr12944581pjb.36.1646433400087; 
 Fri, 04 Mar 2022 14:36:40 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f669806cd9sm7039901pfo.87.2022.03.04.14.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:36:39 -0800 (PST)
Message-ID: <c72f61c9-d16b-60ff-ce11-85f6eba964e8@linaro.org>
Date: Fri, 4 Mar 2022 12:36:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/7] target/ppc: use ext32u and deposit in do_vx_vmulhw_i64
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Fixes: 29e9dfcf755e ("target/ppc: vmulh* instructions without helpers")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

