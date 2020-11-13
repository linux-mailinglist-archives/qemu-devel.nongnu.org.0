Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A32B2684
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:23:49 +0100 (CET)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgXs-0005RF-4d
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgTU-0003Ul-IA
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:19:16 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgTR-0005aB-ER
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:19:16 -0500
Received: by mail-pf1-x442.google.com with SMTP id a18so8700646pfl.3
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ARakbEpfTjlW/CporQaHNDjMDIpvCNcE5Rvst0G22LY=;
 b=jWtKmhFCRYC7lJokws95Z+sWZU5DQciqpK2/CwxYH8K2SUaIHej6IRxAe2CR+MD25X
 B7nGY/Lt+K1nJcyS0m/x/s8KQEwccIOu26N5yF4K1v3U4PmHhBtI6HxJn0KXz1hhnGL5
 /viA3fph9d3H0w2xTU8iRh43Dt+dPiHzsajKW04KeFEUI2H374Y4FP99Gtr5Pa6/3yE7
 i+2bbx8HfXcSa07bcJj2quSFAcejNcnDzyYb+IJYq30j9KQKvd8SsTXEoLN1bpaIH0E7
 u8Cddd/gTgDs3wyuSnGSD5trRSdxlo3hO0ylbUlvXybSGWE+4MraYVPwPqBzC/XEQZXe
 +pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ARakbEpfTjlW/CporQaHNDjMDIpvCNcE5Rvst0G22LY=;
 b=RQ6RtgPNADxwOVAG3UcdmT21uGUYopqa6pnRMjBrG3YzIS8gQ6JjSF2Qof9d7B3e/H
 8j8w4Up7XEiq1ruHzmgrgzzb0vzJ1eltBL82DFOkkSUdqq0HQ20utUTaRB7Gikovb23U
 pQmj5ms5zPkNdBGnoHcXaOzD4ezYoNcU4EBtBPC1tH3B2+fvOVS2GLbvtAg7rKMe2fDj
 aCdz92OtQXioRzeCnK1OPt/dGF3TEaiW5pX6jh6EkHdQuyeObzZnjilcio15/Qz3MmMn
 hsxARfaSAu6wSkUm5C8xvhj1GbhRTSetBBx7W9JXT8d5zQFOak906nTyPB6Aduimwuw/
 yEjw==
X-Gm-Message-State: AOAM530ZblRodIZ1Wot/y2a+Xxz9aIrrMnWZYTER5bxB4BdmHR/OIz7v
 2vKi750/9an3yIUQYIwjgbHb2Cb4EFxvWw==
X-Google-Smtp-Source: ABdhPJwoQQ727DbW7ofWjHj4JzTG2nz79/9R6w4rxIkxBewbvHhP0jsDaxK6iem7p6Q8cV630UQ2Kg==
X-Received: by 2002:aa7:80c9:0:b029:164:4ca1:fff with SMTP id
 a9-20020aa780c90000b02901644ca10fffmr3777522pfn.11.1605302351823; 
 Fri, 13 Nov 2020 13:19:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t32sm10156626pgl.0.2020.11.13.13.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:19:11 -0800 (PST)
Subject: Re: [PATCH 02/17] target/arm: add arm_is_el2_enabled() helper
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-2-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e9b9ec7-b9ed-e9fa-7b6c-4e1e72eb88ad@linaro.org>
Date: Fri, 13 Nov 2020 13:19:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-2-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This checks if EL2 is enabled (meaning EL2 registers take effects) in
> the current security context.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

