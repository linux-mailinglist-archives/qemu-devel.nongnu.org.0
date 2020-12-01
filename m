Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACE2CA5BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:35:30 +0100 (CET)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6kb-0001i4-Dm
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6is-0000q9-3r
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:33:42 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6iq-0004DF-Fh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:33:41 -0500
Received: by mail-oi1-x244.google.com with SMTP id j15so1932751oih.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Oeb2wEf1cCqoJ6KVFmcxGhhuFV6B7TW6ZoHG88Vh1h4=;
 b=jfW+l/NNKTlNKA018j1BCq//P/aMEszrk3ts4iXnpbc6J+jOCPY5k+VDYi5Q2rD4b5
 zjuqzpP2Xd19g7rF2mTd7g/0+n/FV3Z3WW7cGL5H7za/pzCCPZKY4GFASEQg1aL9NOTZ
 uddP8gjKhhVkYkjmoEZHWRoaVwDgBLgda/bzfohz8GL4aopAF+cD7Qey/x0XdVh/CBne
 hLOVkNarznhvVGNCb0asfWQG+AqnY+CNWk5ljTlp2uXxtOKiHF9s5kQUqJqGFPQqW2cv
 NpFgj/YQAtrGj03BD7jPPv9rCebYlRRaBq7MVTNtHoy2TatH/bHP6cjeQ8pPCYNt6WIr
 fFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oeb2wEf1cCqoJ6KVFmcxGhhuFV6B7TW6ZoHG88Vh1h4=;
 b=lIKRGOOmTAL+2/Zhg4hU/FvQesgCz+gEkkA7J/GJmQsmxvBHm4Om0vLfUijGH8jIuP
 ZUsrvaS2cJyj4C4yfzYBQ4tWkFOdgnUk1fTpzm0FFESmWzqTFlPqNZyPOk5qdfr1lIXX
 51cY6ODZXF2cJXjuH5NcdxzxwxvpEnWTqqTxH9nQcEJMiTcW1WflzqlaanplOEqcKaKq
 l8a/OzrAYS1DOfs+6Cjy97mo38eUCfk7k1mY4ewPT2adA26YC0rBMwpQxNelc0tFZUDR
 t5KzU6UBFwaDpIx0Qmpw35L+lqkr3xIEGUFBlkTCSNJx44L1vTYoqeLqJ1aTboGDqRKc
 mTdw==
X-Gm-Message-State: AOAM533X5/xuBykJH0lwE+2BAzyLk3Mnm01TFMOhbmJt5TbsvPup66r1
 DCkN5nuCxYjKJBalmhtaUUNtu+9v+0b8Hgdc
X-Google-Smtp-Source: ABdhPJxoNkvU9gWNM3ly/T4n5ZsyGPGKHg2FuMhezYtINjSsT5d1d9DJ5dT5yZmTQutFxKRbs58ryg==
X-Received: by 2002:aca:bc84:: with SMTP id m126mr1782360oif.169.1606833217940; 
 Tue, 01 Dec 2020 06:33:37 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j18sm401616otn.23.2020.12.01.06.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:33:36 -0800 (PST)
Subject: Re: [PATCH v2 16/28] target/arm: For v8.1M, always clear R0-R3, R12, 
 APSR, EPSR on exception entry
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33ee05d8-7c54-e137-eb47-c9a7fccc4e2d@linaro.org>
Date: Tue, 1 Dec 2020 08:33:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.0M, on exception entry the registers R0-R3, R12, APSR and EPSR
> are zeroed for an exception taken to Non-secure state; for an
> exception taken to Secure state they become UNKNOWN, and we chose to
> leave them at their previous values.
> 
> In v8.1M the behaviour is specified more tightly and these registers
> are always zeroed regardless of the security state that the exception
> targets (see rule R_KPZV).  Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


