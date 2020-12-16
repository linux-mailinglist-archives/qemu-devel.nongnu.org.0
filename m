Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E732DC860
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:34:36 +0100 (CET)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpeRP-0001vq-AE
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeNE-000077-M4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:30:16 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeND-0000rv-26
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:30:16 -0500
Received: by mail-oi1-x229.google.com with SMTP id l200so29419785oig.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vwjPiRkkX7sKZibAyjjn6uWB9YO2V2Bf6LaRLw62CT4=;
 b=r+dxJaZeFBkombCBFEYfUfB9XzI/mmpSpCi5EFV25RBoarahRDigG6NVyrT0LhwIOM
 DNwpdnuHe/rPPVuIvCCMg1miTCpwxZZfxGv2jy2kKiDfOKoa9ypUgZg5vUxt5OKcw1cg
 w8qvvzwsmyVENl/I/hLenMpIP74yMiltCGDiV6hEF5sFgmyXKLrWWm+G4WJuonfYKYqA
 qzmGGch1EFIANZwcXCRE4UMF0zPnO3TS568+Mo7+qdn7770Kwnr7ewh71uJIGbOh2i5L
 7VTGaveb/CJBSPyakMfmFF4mlMYAkOF+ZL0Phbfx9DBBGCf+lhGr93Vte5vb4yH19AKM
 KzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwjPiRkkX7sKZibAyjjn6uWB9YO2V2Bf6LaRLw62CT4=;
 b=exzDutNpzMsP2lvCaZuT9jdFJ61YNcgZg9/IWT4E3xhxgbDcTvXuPaej1xJMXEK661
 vyldGLdg6cXKxJlpZjG5h15cidEenkDdaPivBRbNiylXDi0+NqMci2i9BjPimtXneQc1
 el5oM7xUVaiROVHeU7L6DyS60jbD2iymrxHqU34dB5Z2IafxBI0mLReqM7w7iQuQolOP
 xr/DzYK7C/RsXs5/qrQPHJLbyzACB1L3tnTOp5Oy3PvkDR0/Bj+MMga3zp2eEUhfrOt6
 Av6PAQoyVbQS18jYEGoJuNpeDWEblK5OvxMJw86hOhEnvizpTcHp2dWy03pWHcfhxCcd
 D/+Q==
X-Gm-Message-State: AOAM532j733QgWYv14kVk5C0DG8nr1Eck39ZwrFkz8vnw+EFc3Cy9AmS
 /pLSWDDv8u6tI7wJ+1jA1CcGxJmc/OhOsNw/
X-Google-Smtp-Source: ABdhPJzS1KM7WANe80LNtCOyGezHCmReDnKMG8op4uB0odXxk2hFPiRfJRdN7e2drhI86kGeGk3GIA==
X-Received: by 2002:aca:b20a:: with SMTP id b10mr3096510oif.75.1608154213551; 
 Wed, 16 Dec 2020 13:30:13 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h30sm370010ooi.12.2020.12.16.13.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 13:30:12 -0800 (PST)
Subject: Re: [PATCH v3 4/4] target/arm: Implement Cortex-M55 model
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201210201433.26262-1-peter.maydell@linaro.org>
 <20201210201433.26262-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fd22c53-8de2-2d9c-e8b6-5001d4362943@linaro.org>
Date: Wed, 16 Dec 2020 15:30:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210201433.26262-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:14 PM, Peter Maydell wrote:
> Now that we have implemented all the features needed by the v8.1M
> architecture, we can add the model of the Cortex-M55.  This is the
> configuration without MVE support; we'll add MVE later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

