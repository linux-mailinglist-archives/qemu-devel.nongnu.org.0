Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E736B9BF8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7kn-0002Mh-6V; Tue, 14 Mar 2023 12:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7kl-0002MG-Et
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:43:59 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7kj-0001eb-Cy
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:43:59 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 bd3-20020a4aee03000000b00517affa07c0so2403097oob.7
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678812236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W9OUmJqUseaeYuxV3L1EovD1NCvRNQo0zAMJE2oWhyM=;
 b=eoRFShILl5Hie3JGtvh/bWXhetcJ3OU4aofkikeX74KE8obk69SfHLwww00eSAWYJL
 oC6QNgtPluHwxrfpC13RbFqZT0hzdCqbP3SRLD6bI4t9nXSAt1KnRcSp4Oe8WCWM0wIG
 XKQCtlVC8hpONrmdM/YI3OnA8RhAO5tYnLN0PoShrGEHa1p4X+SikdgS2RnhS/uSaglv
 /Ij2l5TUEpOUOejZz80U8sILHbSpUjy9i0isMprLPSWVvmYJ4igIqfaNa3VXmqqd+paZ
 O+64iuGMWPwwoPzJSuXnJ86gsIRTGGe81iRiFVtI/CTSBJrs/FzE8MXGGK81CPtlODEs
 cMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W9OUmJqUseaeYuxV3L1EovD1NCvRNQo0zAMJE2oWhyM=;
 b=V7WIbZdnLAAfq/xnJZ10reO981Lmstx279YQYY6cVN8OErgwlEEFY0zc0p8RnjJ36s
 M9mcBMEpNdGCumXls1W5pbikKibFPqaaXnfaWpmqu/5I70af93cSDiq2dQO5G+0lcIHb
 C+j9H6d4WFVdvhKA8+e/FyR+wfhf4jT2USOkT/2u/zPfPNN5aczosx2AGdR2Hunuw7D2
 CYD+sIoin+9FNGdJ/v5rtcXX35zWalBMhVL+ubqjACKlHCBKctcbAXoDNuJriIItueOw
 z17+qgmzakV/yNnWuPu/Gs0kXpzXk6BdI2pTtoKs1qB/XojNlBKRRFac00WGTazoE2JV
 z65Q==
X-Gm-Message-State: AO0yUKVfM8YeFwGjrLnmPZ1KEAMli6iD4VnNqOSAOuE5SM2s7E4rM8LA
 2IvfLm2NtrHQsa5h4g/KZ1lCpg==
X-Google-Smtp-Source: AK7set/Yy5S9Q1pbIlPn+QDoM1FDclcIwRYe/PMP+lPqrRrgPJ0TIfs/jOrpVYxaRsXFNikNarRyDA==
X-Received: by 2002:a05:6820:1013:b0:525:2bf3:d69b with SMTP id
 v19-20020a056820101300b005252bf3d69bmr17314391oor.1.1678812235967; 
 Tue, 14 Mar 2023 09:43:55 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a4a3943000000b0051a669290e8sm1251800oog.5.2023.03.14.09.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 09:43:55 -0700 (PDT)
Message-ID: <9d6229fe-26e2-ed8a-3fd2-18bfbf59d08b@linaro.org>
Date: Tue, 14 Mar 2023 09:43:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/s390x: Implement Early Exception Recognition
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230314110022.184717-1-iii@linux.ibm.com>
 <20230314110022.184717-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230314110022.184717-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/14/23 04:00, Ilya Leoshkevich wrote:
> Generate specification exception if a reserved bit is set in the PSW
> mask or if the PSW address is out of bounds dictated by the addresing
> mode.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
>   target/s390x/cpu.h             |  1 +
>   target/s390x/tcg/excp_helper.c |  3 ++-
>   3 files changed, 29 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

