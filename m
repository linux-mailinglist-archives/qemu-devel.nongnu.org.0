Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545B47E92F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:47:21 +0100 (CET)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vvk-0007TJ-HD
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VtI-0005GZ-4D
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:44:48 -0500
Received: from [2607:f8b0:4864:20::532] (port=37654
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VtG-00057S-MK
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:44:47 -0500
Received: by mail-pg1-x532.google.com with SMTP id a23so5999067pgm.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m+vzTb82U56zypK4pqdoZw5SA547/ZpmyvppxdQJmHE=;
 b=ET++gSY3UB/zOUHRrF0NdPsC5VmIXf59NzcGIuuJT7YOZgtu21MVEnmINAD6Un6M0x
 2/CWho3Oe1/vp3nZPh1vEWn+DNneURfn6+wERCRMDHOMOq/ZCjq4FGIjzz1kEKvHeKzL
 Veb/+j/KVNy/ltPIlbAHT0mlqJPdjukDDBL8MY0+iAXvB8Zf/41CMEj/iKXknicH71a+
 7zuWX5dTPGSgpNtmM1GlLnARUtL583eMIaGcyRw64MoTBT+vmkCRm1Fy4cWwNaQA10sW
 Ubj+7GiYiapQcMFUw2uf6SqAECoL/bCWgl6mTnFRewX0rcl9Mv1XYMZTCCVq5pB8FuOM
 VGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m+vzTb82U56zypK4pqdoZw5SA547/ZpmyvppxdQJmHE=;
 b=4Kmmaw1WbLZbh80PWLIV7R4mhiWTVarZzOELkxdpnaPNco61CSCdylMB2gj52c45S/
 s4am2ju9PGcSPtCUmcqsVb9SX732u+XuUEDDwg5NLPZVUgQO842waYEetL51OzPeM+vE
 o9UMuGdi071IW8mzleA5OJ/RUI3IgtzDql0ovgg72P1ekupp5CzdN2AGLBmh0p6skhzo
 /Q61547pWXNVXmzZHDfNIRHfqMnZTMKGv8pSKNTohGLpndpdT4YYosJoNwY4vxzriwKT
 lWKFTf963btdJW8hh0YeEvrdtskja1/hU7en8EYHIf1BlW777ukhg9+t8Q6JTy47UcXw
 05rg==
X-Gm-Message-State: AOAM5303a+kr6ya1QRDF+MFqeDa/RsuJEZm+I/ErzPTHRTY72SDNw++g
 ZPXmKhvmyWUy6s5HzkPSL4Dp2w==
X-Google-Smtp-Source: ABdhPJy1Dj1uwb+uGuw49vMoP1+udfcPUzKlz2JXIJpZsEnsHsHZKZHnf7PnLk5KnqYcVSBxOdUohA==
X-Received: by 2002:a63:6b42:: with SMTP id g63mr3544198pgc.345.1640295884353; 
 Thu, 23 Dec 2021 13:44:44 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d9sm8431660pjs.2.2021.12.23.13.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:44:44 -0800 (PST)
Subject: Re: [PATCH 7/8] ppc/ppc405: Introduce a store helper for SPR_40x_PID
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-8-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f744dba6-358e-cfac-0795-fdf1224f3da0@linaro.org>
Date: Thu, 23 Dec 2021 13:44:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-8-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> The PID SPR of the 405 CPU contains the translation ID of the TLB
> which is a 8-bit field. Enforce the mask with a store helper.
> 
> Cc: Christophe Leroy<christophe.leroy@c-s.fr>
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/spr_tcg.h   | 1 +
>   target/ppc/cpu_init.c  | 2 +-
>   target/ppc/translate.c | 8 ++++++++
>   3 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

