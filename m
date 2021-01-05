Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81E2EB2C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:49:37 +0100 (CET)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrOi-0003mC-Dn
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrMr-0002lg-T5
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:47:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrMo-0000Ul-IV
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:47:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so195447wrv.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J4A2slR9m5k7Po4iKUdAnCexWamPGLk7r29IbOTzl3M=;
 b=QZvMiqOgq2V9TYPb1d6K0j2iLDMUgrHPHh1XVGZFIpHjeJ/rg5PYB0MJ6HkyBCxpdT
 CPvYSY/yo6i2lGXOzB9cMx1DNdBolFPjCS24KKzVIPv3/EWSshyu3o/cJJbb7yJrPkRN
 VgUUFELOdAmmhQbiguSivvcNlxV7zwlUcptVmxsnm6njfzDM8cBRj29OR9/VVN3MjNEE
 j1wVABfQTDzC2wG1cUDp/fc0Lx85R3Ll/048/3LVqKohlk3orehg9q90J+Shz8Hrdgmo
 dG88XRp2SVPsPXUCx/9NEeneSvusFKst92mH5Qete5pe9XaEMvNwdP9kC3e+m1aD0WW6
 cIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4A2slR9m5k7Po4iKUdAnCexWamPGLk7r29IbOTzl3M=;
 b=FcBRTmHBSS1ZLubM3tkhrPq+JzwMXgS9ddks9D896mPBRVPPrV0AeT1knwSf7ha+yj
 t4U7c4580f5euCgq70BJkgF1IbcX7ibDndW45zZQ2Irfu//BgZ+MxqkcPa0yVMj1thoD
 VqNfCa81Ppc/qDMuorzdoySSpF/0wMdEwJS7N8+nHx8d5To4dORSfNVV+4iloZrHsWhG
 ilYsksGF3EKVSKkurx6LYP+kaiCML1LbDUU3/t5OFRfXywUFPAditzqPletdHOLw7Hie
 OrN3OW4ZSr/qBlIY3aVTib09wzUYtwzpSZj6aQBtzFchzXRv2qIrjZgo15lhELqkywDp
 WwYQ==
X-Gm-Message-State: AOAM530CkOFcjM0gU+RBn77RJUsQEE3Rt80eXmmK3QjrqWvlG+NbQx5Y
 CclCM8Q2kvQZK8P3GaSF68U=
X-Google-Smtp-Source: ABdhPJz42vMIIHiJLMSVk81DvPo/RVwZHQUzeismqNQfwy4rjMrcsIajSbz6dbHgaBsB+3gLCNp5qg==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr870019wra.426.1609872457027; 
 Tue, 05 Jan 2021 10:47:37 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id f77sm39694wmf.42.2021.01.05.10.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:47:36 -0800 (PST)
Subject: Re: [PATCH v5 43/43] tcg: Constify TCGLabelQemuLdst.raddr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210105171950.415486-1-richard.henderson@linaro.org>
 <20210105171950.415486-44-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72144231-b3aa-cb8e-ec7a-5aafe717d18e@amsat.org>
Date: Tue, 5 Jan 2021 19:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105171950.415486-44-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 6:19 PM, Richard Henderson wrote:
> Now that all native tcg hosts support splitwx,
> make this pointer const.
> 
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 3 +--
>  tcg/arm/tcg-target.c.inc     | 3 +--
>  tcg/i386/tcg-target.c.inc    | 3 +--
>  tcg/mips/tcg-target.c.inc    | 3 +--
>  tcg/ppc/tcg-target.c.inc     | 3 +--
>  tcg/riscv/tcg-target.c.inc   | 3 +--
>  tcg/s390/tcg-target.c.inc    | 3 +--
>  tcg/tcg-ldst.c.inc           | 2 +-
>  8 files changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

