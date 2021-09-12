Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755BE407D63
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:53:20 +0200 (CEST)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOz0-0004Ii-Fu
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOui-0000O4-O7
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOug-0006nf-8i
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso4571692pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQg34X1NgEQ94kWC+lsTGFxP8rN613KdQye+reZcXeI=;
 b=M2GhHclZOPikTP3PWHnFpiTP7q05R/wIoH7u1xNfH8bOU/8q6OKkE8yebUasd+yRAo
 XDRGDvJZaJZ8Pd6YnrEWiIDmhaWhLNs4yGfUEypjEGVJFOmlREb4i9w9Eh5sreBEktl9
 Tk/tbFOFRA6Nso1Fv1g/JjtM4PUv470CiMDhzIRv1ICflwpGF2ukdIAecj2V7QuGtu8T
 iDiYD9ckdDmCKM6yr6IHhJqw5MMW6H+N3foap5rvcaCIUcLOn75GvdGE3/zN2n4LjCZg
 zxrqAi0OqNRjRHbV2ENx8/IwbxhJAHOyLZiLzH0Iky9qbf2ynwksgGwNa6DSBMQLRWgf
 +sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQg34X1NgEQ94kWC+lsTGFxP8rN613KdQye+reZcXeI=;
 b=bHzgqtQwTaliYRhVsVT9b2JxQmPXLa76WBCkgMzIf0QXYwW8iNKOCe8a59uDwGZOi5
 8ev3uEA7kJJeCawLqP5FNhwrx+KcufFiRcojOJkMd0BXxgD43yDihNu/VvqOe7cNamrg
 LP+maL71sywHF8RyaMOvasoRB6ZDzQet60zKf6CiIZQcFpO4MWEpKiD/C6gHbr2eGPgC
 1n2oWmb6/jSUy2QMoUbggiS8mKDZphSFM+Yvg80XNz9t7LzaxMo2UdL8LW6BKFUq/TCU
 5XjYCwZR+unLo7YYP0FXTzWPAE0qdWojK+MLqKtqzn3f+w3s9H+Clv2WVWRu2e0PIBAd
 KSaA==
X-Gm-Message-State: AOAM531rLwLtvosTWw0x8K5LpDLDY2hZeqjNVWG89z1ZczCHXlbd2wS3
 kY72qqUgnGOnBGn0z+n1FmWm6bJyOsiUHQ==
X-Google-Smtp-Source: ABdhPJxsEUDO/CCKmph09fiFbjsDVF392/spyaXbJwkteaDPha1I4uRWtoOOpF6745IkR3eeW+dsTg==
X-Received: by 2002:a17:90a:192:: with SMTP id
 18mr7543044pjc.119.1631450928565; 
 Sun, 12 Sep 2021 05:48:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d18sm4779180pgk.24.2021.09.12.05.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:48:48 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
 <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
 <CAFEAcA92sxy7bBQBH1A6oM36xVm1mpJMHGaS8KPB_0gW7vk30A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04f9c245-4be8-47a0-6b10-8d753364b94d@linaro.org>
Date: Sun, 12 Sep 2021 05:48:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92sxy7bBQBH1A6oM36xVm1mpJMHGaS8KPB_0gW7vk30A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 9:00 AM, Peter Maydell wrote:
> We actually already have code that sets is_jmp (to DISAS_UPDATE_EXIT)
> from gen_preserve_fp_state() -- we do that if we're using icount,
> setting DISAS_UPDATE_EXIT to force this to be the last insn in the TB.
> 
> Do icount IO instructions need to avoid a possible goto_tb ?
> I suppose we do want them to go back to the main loop.

We do want them to go back to the main loop.  I'd be surprised if many (or any) io 
instructions are also direct branches, but...

> This suggests that we need to make gen_goto_tb() look at
> the is_jmp value anyway, regardless of this series.

Yes.  WLSTP may need to avoid the goto_tb along one path.


r~

