Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0075A32CB
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:52:14 +0200 (CEST)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRj7V-00077k-4a
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRj6D-0005hV-O4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:50:53 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRj6B-0005IH-Sw
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:50:53 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r69so2718228pgr.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=CFAKn10GVjXs6K4pcjd+fSdn2XdNJop1lqf042EJlsY=;
 b=yBK539BnogJlBW8FL1N49V7R+/swzPfAy2N63o6GGcSTYCArMVrhPwQvD3bojav1Xe
 blbHIBUoVL30k5dlaEUMuqqzfZmAA6PDEl9hsYPh+fyyEeEy4fJ9eJBJKTQiXsY/Vfxl
 ZvXRfMYkjOjz/l0H4kXFXONChlPpYBpjKIXy428gfZtRh9EFOdedBPKS+b7ta8ZBVFQw
 V8NKz82OkRIFzOBeQhoCo3800PbmA+CPModhfScX0H8Isyh7hrpOf8RF/eHPyTKNpWiq
 SC5/97059jndDnWyOhprwKXm9U7eHDQqTIzmihWIZ34UenFl6+n46ZkDfyGOrHTi62w6
 vOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CFAKn10GVjXs6K4pcjd+fSdn2XdNJop1lqf042EJlsY=;
 b=6bBV9Qs3gtxB6Z37Ybp498nKtSD9Y6zNda3qxhjoVIKURWaj04fmY1FqssxO/5SCHE
 o38A6RLT8pk1T0Iu3+lpNVRzWQB59YT17vuCZ/ZIXYResnF/pqv329ZQXOvXcqlS4ER6
 O38AkJ5RjeAntq2UD8SeZ8foLiRaf6kb0JoAuRyUg30GtsxjJVIcpFOMlvNaEF+bBUeN
 7IEQu/WfjoUdt1qLws1g01Rk7ikX0xWJu+bJQ0scKwlmtBRXACSpDT96flTChSqIliLL
 HQfpY5llNydOR5XziMgMrpxNDX2XztQFh65onNpx7I5nQDl2VPCNGuHHC8l+GsrutL0S
 GBsQ==
X-Gm-Message-State: ACgBeo3SSf2+N5+uO6OEcjTUU9d99i+fEN6pIm4gNnqhvSHQMw0nyiPj
 8NPKcSCNHka914hQK6Bn/JCetw==
X-Google-Smtp-Source: AA6agR5PM85Uj3ZfhAVJx1c2bUsz2hKb768x0kWt4pLIvnaAye9YrahUjri4b5lu0a2zkibzfeLJLA==
X-Received: by 2002:a63:1e5c:0:b0:41d:b225:9ee1 with SMTP id
 p28-20020a631e5c000000b0041db2259ee1mr4994893pgm.245.1661557850478; 
 Fri, 26 Aug 2022 16:50:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 ix19-20020a170902f81300b0017301c7a9fesm2164822plb.173.2022.08.26.16.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:50:49 -0700 (PDT)
Message-ID: <692641fb-654b-2615-18f9-64b8d489635a@linaro.org>
Date: Fri, 26 Aug 2022 16:50:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/23] i386: AVX+AES helpers prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-24-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-24-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/26/22 16:12, Paolo Bonzini wrote:
> From: Paul Brook <paul@nowt.org>
> 
> Make the AES vector helpers AVX ready
> 
> No functional changes to existing helpers
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> Message-Id: <20220424220204.2493824-22-paul@nowt.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 49 +++++++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 2b35b6e533..a42d7b26ba 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2289,64 +2289,66 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
>   void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
>   {
>       int i;
> -    Reg st = *d;
> +    Reg st = *d; // v

No c++ comments.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

