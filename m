Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D2701547
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 10:38:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxkkW-0006kG-Hw; Sat, 13 May 2023 04:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxkkU-0006k3-D6
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:37:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxkkO-0001a5-KL
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:37:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso40439885e9.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683967018; x=1686559018;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=umdUgbg0kuK18rhXCJ6IzFKoPJmvLzmcD/R3n/1U4Cw=;
 b=q477icXD9LO9+pLFMeRFQc7AWjnVqSE3EzM1WojRuTHpw4SpaTR1DbD5qoH7yjnTbt
 0498luGxAbTUK9wBU2TgijVfVnWrAaQ/x/HLdpJQZ6Yb+VQBN1j7Pk416T122Eo/a3H5
 pgOOeSkWOMBi5Lp5iBzurOqDsdLDpUdoYAcarCBEODBKrmpJNC/XUfRqIvHQnt3A3Pfj
 LUSJcTx/pmkF8iMpCcCbPW8d+57536+xKCpL6+XIGavHITe9TqmjkLXNJiRLlJeUoZiD
 c1UjP5hxxtRMzkPL79JbbFQRACkSpReqQQ9IQ+Km//rJuoNYBP93Iyhgd2nB3bmPNsXl
 Dh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683967018; x=1686559018;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=umdUgbg0kuK18rhXCJ6IzFKoPJmvLzmcD/R3n/1U4Cw=;
 b=bzYRq4ReRgVJsv/nGY40QCoXB0AHlSooOAv+F+D3iLVxZr610qacwwsO10e/kjuEg1
 Q+Cayp3LSsGeOx4+0IkGAOW1pkTumIYrRdQsxqk6/Sc/yQpw3wOh5gXRX4GtxLHec7CW
 nDR4bEiHm8WpI51l6aU8dio4Cxbgou40B+XX7w7DAYn0DWmCkWD3Wc5/NnS2Nv29kQMD
 mAL5ezyFhpS3+NrT9SWwgaDLV4jUWSF7UJYE084Hw/XF7HWCxr9aL5FSxQtav1pExGo9
 gF+qdqAZAfzmo1YZn0G63zfQKciOShI20Qhng+mDnToHW0loO//xDayulYXaZUlFEMsp
 jzfA==
X-Gm-Message-State: AC+VfDyRkiLCZRDIldC9AUUg8j9uWOKz85cNxGhsvw3Is6SLRg98Py31
 lcFUDfWODHaXJQVwWsxk2LBB3CoDjpbgi9pz4fVayQ==
X-Google-Smtp-Source: ACHHUZ6wuGg+RHe2btD9sSxuHWPYxCys/HhJIM+NJfOUw35uvXHqSd8asBtq+6sOnWhax6YlqIiJcA==
X-Received: by 2002:a1c:cc11:0:b0:3f4:86:33b with SMTP id
 h17-20020a1ccc11000000b003f40086033bmr18747036wmb.26.1683967018485; 
 Sat, 13 May 2023 01:36:58 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm31103350wmh.27.2023.05.13.01.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 01:36:58 -0700 (PDT)
Message-ID: <f51917ab-6b82-a7ef-5869-8578399f287a@linaro.org>
Date: Sat, 13 May 2023 09:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/12] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/12/23 16:34, Peter Maydell wrote:
> Hi; here's a relatively small target-arm queue, pretty much all
> bug fixes. (There are a few non-arm patches that I've thrown in
> there too for my convenience :-))
> 
> thanks
> -- PMM
> 
> The following changes since commit 278238505d28d292927bff7683f39fb4fbca7fd1:
> 
>    Merge tag 'pull-tcg-20230511-2' ofhttps://gitlab.com/rth7680/qemu  into staging (2023-05-11 11:44:23 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git  tags/pull-target-arm-20230512
> 
> for you to fetch changes up to 478dccbb99db0bf8f00537dd0b4d0de88d5cb537:
> 
>    target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size check (2023-05-12 16:01:25 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * More refactoring of files into tcg/
>   * Don't allow stage 2 page table walks to downgrade to NS
>   * Fix handling of SW and NSW bits for stage 2 walks
>   * MAINTAINERS: Update Akihiko Odaki's email address
>   * ui: Fix pixel colour channel order for PNG screenshots
>   * docs: Remove unused weirdly-named cross-reference targets
>   * hw/mips/malta: Fix minor dead code issue
>   * Fixes for the "allow CONFIG_TCG=n" changes
>   * tests/qtest: Don't run cdrom boot tests if no accelerator is present
>   * target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size check

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


