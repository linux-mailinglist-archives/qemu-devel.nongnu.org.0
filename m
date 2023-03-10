Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DF6B50ED
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiQ0-0002Na-2m; Fri, 10 Mar 2023 14:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiPx-0002Ku-L6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:28:41 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiPw-0007tg-4B
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:28:41 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so10917798pjb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSnzDDdkiIpFrd1v1zod53KqzX7xj1Pb+IFhRTb/BFo=;
 b=w62BBoEb3fAR8qfRCifIuCWOPUlnjMI1t7PTEvD2a3yJyP7ix2DTaz8y+p49bwHHxB
 04fHlRnj+QX64o4b5/VUmdKguK3AE/pFJN4Ujwzip17Qbk6rr7DSnkhDMtNKLFUxTLDa
 AhonUu2dw7oRbUSc2fSp2SWr58jDmaPB858K81dM96KreiJqKMuZ/UknQaEybL7yuEcH
 uwXhPla4y7ksSfRnhOdiWxq+57Ty8x/y6qNGeZ5uoihRCO6IN/0s9CGfbm1OtLSRDbiU
 NVh2T7GDOlydjIpXQ4UB8jhOL0KnyQQZNv1QCHSqQJ1AA3okTR+p4psV6C/wIsB4GCUu
 PRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSnzDDdkiIpFrd1v1zod53KqzX7xj1Pb+IFhRTb/BFo=;
 b=6/FhpFRcx49BP6FNo5vFknjSazYluyqSzBbFpVT3980JP2FXY5sHGX1BeybCbkOPYC
 NXleX9AbkSTdVRn6zdzIulXYqvBROZvOBHJJoD9+fb/JhTwXNT5mHyoKfc9mtylTQUy+
 jpimYzdoBZRw81NwMoskJcpSXKK7XOssF0eOBpdUJ68uGLiLvXLYix2Q35uB/czra8xp
 L6At9YzvOPrXzFQ5yClcCF1/PkY0pEIS6iQ2x/m4Ro/W0sgHdL4vRwf7XjGOaeejhXP3
 uVR2nn3fwm8E1alZp8q03la/J8UOvGj5Dx4qfLWLUR6yaIxkCYqOn7s15BIpYoRfUyI9
 AWFA==
X-Gm-Message-State: AO0yUKWZ170jjJZayInESHKwc09PKAGDTwGwCmxLWVqKUOtUvFwqtCVG
 1JSoVRNkxScBPIyOBWqkj929RQ==
X-Google-Smtp-Source: AK7set8ggX+RqpvAVQddNk8rf+enQTjAsPoxxz4UzHFOf8Y7icHHfUyMqHdjv0z9agG8ixppnd0CLQ==
X-Received: by 2002:a17:902:ea0d:b0:19a:f9b5:2f2f with SMTP id
 s13-20020a170902ea0d00b0019af9b52f2fmr33435140plg.55.1678476518899; 
 Fri, 10 Mar 2023 11:28:38 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 li11-20020a170903294b00b0019f0fbefaf5sm382949plb.47.2023.03.10.11.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:28:38 -0800 (PST)
Message-ID: <40659dfb-69d0-09a1-6cc2-e12fe4a005b1@linaro.org>
Date: Fri, 10 Mar 2023 11:28:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/12] target/s390x: Handle LLGFRL from non-aligned
 addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-6-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-6-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 6 +++---
>   target/s390x/tcg/translate.c     | 3 ++-
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

