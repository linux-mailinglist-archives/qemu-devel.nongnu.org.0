Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B22B9C17
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:33:09 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqc8-0000si-5a
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqBg-0002yK-S1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:05:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqBP-0003aG-Vb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:05:48 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c66so5539483pfa.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rr3KyYun0yWZZjrfv3IXWZILVlFgjI/okwl6enfSSMI=;
 b=o43dHapopcE2RJGUZonxN87iQSeM3Xf+N1lQEQ+V8+6Mh0qb9dYqpqPCm6acnuc49S
 yPWypGkqRXbffndZvpfZOQwsT2NMhWK8TV77o1xHYj1TyZWCh41y28dp3fpdRsUEsrTx
 cQ92XeaL2DioDD0zrewp17E9jnnu883DhToS3T3XD+HBDCyxplVS8pIn0/7FJhZ0a/Ad
 fLd0+hdYkR2wnIBoWKOl5KSc3Bfy1ukJylkK4Dlhd1cFkts/H1SOKNIFfzr04FwRYIgS
 poEJBA7thpGMw9WPyn6At3JlToRBg3sxan2/tfylD5BK4HsyzV+TIsY8AWyXP7jen6eY
 JWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rr3KyYun0yWZZjrfv3IXWZILVlFgjI/okwl6enfSSMI=;
 b=ueY19qldbIXy5H9FxATzW86cZdecJYjD/+ynEfnYsmI+4Q7ItOLXPJ+2QcrnWag/zi
 ediED6O3rYz8iymrZ8IRz5teuwYEHD1Ct8jPFoc0/AnwEHRYqLgI37k9hMRtDqmYct1P
 ej11Rqjgcui3MH6eB0IrL/lYOqxSsh5NgZoStsOMtJa/9mYi1ar9MLXZ5iOGZbrFKsKW
 iS49Kcx/L984PQN6FegCrGI0ou0+CbJZE9XL6T024jXsoxhYxjIx71S50he6EFNv5ytW
 dYGT3xgIHd1IIdy3X9TcTBIhVvi/NwDoq5lkCUL1dtip8mZzbBmpQmPuzqgAKgR+4HTN
 ePjQ==
X-Gm-Message-State: AOAM532FPwB7wjF+v2/pR01Uh3BETPLDBzmdvSDdr6eiV3HBTxOuUa65
 BmccBUNPnXEGKnmSdzwKtba1aA==
X-Google-Smtp-Source: ABdhPJxOul1IqDoCZDtYVvM6S5nUqa5/H0JV/IvU17sbLCTIZD7efhyPBrRO8G4g5Y1/oGywdROsRw==
X-Received: by 2002:a17:90a:7ac2:: with SMTP id
 b2mr6358093pjl.226.1605816328058; 
 Thu, 19 Nov 2020 12:05:28 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v19sm525922pgi.2.2020.11.19.12.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 12:05:27 -0800 (PST)
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f90ec2e-3862-a90d-453b-374806e00d39@linaro.org>
Date: Thu, 19 Nov 2020 12:05:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static void gen_sbop_shamt(TCGv ret, TCGv shamt)
> +{
> +    tcg_gen_andi_tl(ret, shamt, TARGET_LONG_BITS - 1);
> +}
> +
> +static void gen_sbop_common(TCGv ret, TCGv shamt)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();

All of the places where you declare then initialize on the next line, please
merge them:

   TCGv t = tcg_temp_new();

It would be nice to share more code between the normal and *w versions.  As it
is, there's a *lot* of repetition with only TARGET_LONG_BITS vs 32 separating them.

> +    tcg_gen_not_tl(mask, mask);
> +    tcg_gen_and_tl(ret, arg1, mask);

andc.


r~

