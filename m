Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF114CE046
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:38:54 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGZZ-0001ku-DF
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:38:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGWq-0008Dr-G2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:36:04 -0500
Received: from [2607:f8b0:4864:20::42c] (port=34333
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGWp-0007mY-0x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:36:04 -0500
Received: by mail-pf1-x42c.google.com with SMTP id g1so8800649pfv.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ezI/NFZvRcP0ttDgpdQH4c5ahq2szBu8wcJsb+Xul7c=;
 b=cm21F9enbhHUsk35/9XCTFozuE6/GgkLlaWl5dDjuGibyDu/F3l5dcgrmioGvyyDIH
 aDn8A/9Xid9J0S3JaDGfGB4/krqmqN986Iql8jrmHVHb1x7rCznWho9yYMF68C/mF4g3
 FPPQlnaqI3O9t2WQ2tzHOrLdP2QAN+fvNZJuKll5u3yp4bhhCsCfGbyQXvzou6p8BhHy
 dn5JWRIcGUqyncI8XAww5pcMm4dDDCw9+RPFc/PqlHHS3u14RLkaqVLrhvVbEUlh7BsC
 7tgreT8ro2UBppnrR1J3eayaMGRmACUL598hm+vW5owVmMt5YNOMXdFQLkQq6HFrxaa4
 jpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ezI/NFZvRcP0ttDgpdQH4c5ahq2szBu8wcJsb+Xul7c=;
 b=FY8FCmsp4Kd24bG9Y+VMsHVXVaa70nw+BjhZhaTZwIJP8ok18Zjm2ZDUgwuvtcIso0
 aGunLct9EPaxOTFU7x5ln2OewNOADUEXzOPoDD1jQI9AX1SDhnFHSYS9qFII7Kujr6/S
 cnaueVU15+prGLNflSCbx5zRdSV+sc/2FgTMsdoG3a/mw/faCTuQS6TUaKu94EYRH4NN
 m5fU7YoFXGdJaAknOmb55VdtSgROFEi1eF8Ri3JpxScqNHxu5QnAWPIKZp4SVms6DnqP
 uRYhmBk22QZojf4VjmctS6uDJtym89AWaJ3Eb4vqoSXAuP9+nrIEWNqtYENUexF6NXU4
 H4Ug==
X-Gm-Message-State: AOAM530vOiNevY2rqNecGTa7sHUp715wsfMM2yHyVqRdC1MOTx7Z/5z2
 y77Tzk3OUzRo5rA6xGLR03NASA==
X-Google-Smtp-Source: ABdhPJx2SYqczJXNv1vKRpSzcv2t+vnc8aebBMjgfU4OMQIX0j9Fn3/OxufyJkbsA3uIlrbP29BH7g==
X-Received: by 2002:a63:a84f:0:b0:374:3bb7:6d7d with SMTP id
 i15-20020a63a84f000000b003743bb76d7dmr467741pgp.608.1646433361486; 
 Fri, 04 Mar 2022 14:36:01 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 nm14-20020a17090b19ce00b001bf2404fd9dsm2936621pjb.31.2022.03.04.14.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:36:01 -0800 (PST)
Message-ID: <f42d1db8-a6b8-a4e3-6176-69a77387fbb3@linaro.org>
Date: Fri, 4 Mar 2022 12:35:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/7] target/ppc: Fix vmul[eo]* instructions marked 2.07
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 groug@kaod.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Howard Spoelstra <hsp.cat7@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Some ISA v2.03 Vector Multiply instructions marked to be ISA v2.07 only.
> This patch fixes it.
> 
> Fixes: 80eca687c851 ("target/ppc: moved vector even and odd multiplication to decodetree")
> Reported-by: Howard Spoelstra<hsp.cat7@gmail.com>
> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

