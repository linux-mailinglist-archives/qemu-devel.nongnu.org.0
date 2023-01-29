Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53067FBEE
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 01:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLvET-0005vv-S7; Sat, 28 Jan 2023 19:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvES-0005qq-BA
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:07:40 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvEQ-0000eT-Ev
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:07:39 -0500
Received: by mail-pg1-x530.google.com with SMTP id 7so523216pgh.7
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 16:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k3FdDi8WJySA7s5UETVGBXB8zN9tMg58CyYsTHaFCDw=;
 b=egK85id0wYEIAHROH7WWvfSXjoEXxOJkTCQDG7zTomXpcdvZ5z33immChF9+phS5P+
 gbyNqve21kL4VbMJU6YajX7AHeV48l8krachsR6T01/vYFBgOmrsaHsSJ7gRHRBvbLbV
 ZsO+T3YztHPRJBeiqK+2pB+FCtKua4a6mc3OCGnUkn11v0VPGSjx5WLRw9NoLabo+aTp
 KH3haqHgI0I7SD3f1m3cz6bPvtV2aRd4P2KjprD4IlkdCYpO0nDWBc5fTq9pTpNQi9d6
 mZEIGfr1alwBh1aeizxtYJyxD6+MmJxg3p4XFdIz+y9kdNND156bXOJQwEamEcopzK4N
 KbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k3FdDi8WJySA7s5UETVGBXB8zN9tMg58CyYsTHaFCDw=;
 b=z+wRfSV4M7c/EdKy3npgfKUkcDKkSfnORzHE+5rUgcPXpdVZfdnjJaPitOWksv5+En
 H7Imfve6ryyl4HHBE5tFc24zga7SOeh+AEhP+solVx6/9IpQqRz2WAI+GLmOAdJPoZz1
 p8INUqL3IQxlUK5y+HZNteUg6CDYcCjDR7O6l+qunresxX6XzbWasbLl4VQI9s0+fBtj
 dOD5K/1RFabMsFpzQELFTjM0IngO2CredSX3Z3disjSkav45R7fxLRlVGtLMa/GAj3YB
 ynvDEQZspvk3Q7Dd0eRr2YMd/8okGAy5ySDUxBeWXjGIUKYJ68L1MWVrp/8DIinkOXC2
 U1TQ==
X-Gm-Message-State: AO0yUKVoaOaUeqVqR/X+5/+fLod/lZTo/NOZwGkEqNy1jA/7j8uoMA+1
 H8EW/snWY/yji/PnY9kw6YMwkg==
X-Google-Smtp-Source: AK7set9BcEN9b+MF/D8LNcS9Rz4UCwUxqS2Z/9GtP/vKulrf8Ffrq+NFCozCvKe6JZorpXM35TOCGQ==
X-Received: by 2002:a62:7b08:0:b0:590:74f1:8c8a with SMTP id
 w8-20020a627b08000000b0059074f18c8amr12957930pfc.15.1674950856522; 
 Sat, 28 Jan 2023 16:07:36 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 t13-20020a056a00138d00b0058d9730ede0sm4779021pfg.210.2023.01.28.16.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 16:07:36 -0800 (PST)
Message-ID: <233cfd61-75ea-b0c4-bf48-8b632d4d85d9@linaro.org>
Date: Sat, 28 Jan 2023 14:07:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:55, Peter Maydell wrote:
> Update the ID registers for TCG's '-cpu max' to report the
> presence of FEAT_FGT Fine-Grained Traps support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu64.c            | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

