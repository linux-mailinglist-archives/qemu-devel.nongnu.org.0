Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BD364AD8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:56:10 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa0A-0002X3-1r
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZVs-0005I5-8a
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:24:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZVq-0003oE-MM
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:24:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id y1so2658955plg.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H+F2tg60gt1jnwrgUQxbFckjakOCoyuWK9JfX5LVYMA=;
 b=nldsGLnMnchHCG/n9LTI3XGvnYu2v4zz7G9wkUefSaEZrqehYKgymFL2ObX45Asr+b
 vFXZ1rJo3Yz5+Pnjicj0ZdU+t+xgNeaF9sdu6KFIEh/cPNuSIAgKVJGTuWwrv4Ti4EZr
 bJuCi5BF4d2GcF+6YYFw4Fg2HeDJw+DA3ApyiqRXit5iGBdu60UvXuogoId4T4pwPaLC
 7tw1INxmsybdB1OQscaiFQmcqLxMLAYPHtt+npVBspVP7KAyJgEOXb6Tm09Cv3icrisW
 QlA773OfFdxQ+5vHdTmE1Ja74yOhMZx5ghLCbbwCmbxGt/8AM02S3z1SeNmTMYydM+yc
 aOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+F2tg60gt1jnwrgUQxbFckjakOCoyuWK9JfX5LVYMA=;
 b=WmaYL+NgwRotlmJqpk7HfxCCqWe5TVJUcnjprG17cpaeQJcvTewcgAONq3gdZdQqWH
 HD+G0SdJL3q/8uZF1lggrdsjTBU9BxGT2JMPVwb5IDMK0dxRzrf3+rmnRReRKeA9Mbf1
 W6nb72veZ/QTWCIL3ng+41BgHuyEInMystDWAC8LpgbTJk2OxOaNmEcV1ln+f5Uc0BRV
 Xr/kmWhIszRutVU7ZB2M0tS4z7ag+SwQjqRx0pbiRI/7X6vyUNIfQr99Bpr+qCc3i1zN
 pUmAqM9VkKkxd0ykbgh35rEPyEX7MzcSPQGVnNk1dENj1pywFfhJ4zSpArZOQ5/53RxX
 2xzg==
X-Gm-Message-State: AOAM5300DmFTliQ9PB5bWd/tnfsiWxfmnnQ5pQG3xOE8qDUAdHXxSqqt
 CZYU4BFomsNLRQWC6VCjWTsyAg==
X-Google-Smtp-Source: ABdhPJxzwFDNUJ9WYSh8M7RzyebuSN99smObEuPHPMfOPugHN3Y3/v6JcJNFLd4WtN57WMuPZXlzVw==
X-Received: by 2002:a17:902:b08a:b029:ec:af20:5602 with SMTP id
 p10-20020a170902b08ab02900ecaf205602mr3487429plr.71.1618860289238; 
 Mon, 19 Apr 2021 12:24:49 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id z8sm7678803pfq.30.2021.04.19.12.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:24:48 -0700 (PDT)
Subject: Re: [PATCH v3 07/30] target/mips: Turn printfpr() macro into a proper
 function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d993afbb-6977-b4d2-e594-1731faad2eb5@linaro.org>
Date: Mon, 19 Apr 2021 12:24:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
> +static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)

If you're going to use bool here,

>   static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
>   {
>       int i;
>       int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);

... you should probably use it here too.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



