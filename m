Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994DB438B0B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:43:00 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehWN-00032U-7u
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehRZ-0001nM-7r
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:38:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehRW-0006Br-Sm
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:38:00 -0400
Received: by mail-pl1-x633.google.com with SMTP id v20so6323932plo.7
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LKys37rOfp7QXhAP2U8WUEFeNr6bVc3pfbhb+xgf5Cs=;
 b=gxrTI8lMDCz/zkwNbkoCNh4KcJIg7I1SbaNMq2YWzi7AFPWu0NnveeK8/f+SxDvFSX
 2PNVBFC2a8w972YVEpgsU8Yw6F8lOC5NI5ir508X0xRTMyunFtb7RSjN9+23CvZrJnEh
 RV9OzAPqzIfXaCd/W/n0sJWlcHpXf/cWd49g6v+S1R+rdc9gGtgLgAEdXuDQGmvWnRtX
 GXf9TLIoWRFcW552Ey51gAi6lySfRCcH7Uz/7nsTdldMv9FcMNa8CX/lJTDlyPA86ued
 wCjYaMClnLYobI/dDYkFEjoM4XTT/9NfoTiYypeavGxRl3b9XDM4s7ZxkzwmAOJsEIzs
 MUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LKys37rOfp7QXhAP2U8WUEFeNr6bVc3pfbhb+xgf5Cs=;
 b=UN98QfOT7Mf0s5aUC6zMb7FdKePIXGAuHuphlEvBfvp46kNOAt9MrFPyYNXQYhYq8Z
 SYNCUc2SXqgNmntwl6exwOp1ZW40mTrLPcywiKh2JkNTbSyp0fNlDBlTULpKldxWUExh
 XOfsyeMDOJkjhNoCvLDRHbk7P4+GOluSNNWwpA3p1lr7wTIa75tFouRBACev7Enav9ym
 AuN8rrObLNVW7J6nDjIIa/uTwTTe82wv9d2GHV1Nhbc1CUp75my8wQfK7aNAhIx1pwyu
 u5niNNuMBklf4W7hp0tUZqyn4Yaxnd1E4uMcKdeyAnXnvPu5PCktAGApwArdY5fOjX1y
 P8ag==
X-Gm-Message-State: AOAM531mFs2MhdH17zXd6wjsAx2aVr8VdwN/g+3Y17ZRY+6lLJcuhe7D
 TMFtnV6Nig7VGfh6Pb18B/9ZRA==
X-Google-Smtp-Source: ABdhPJxeg48zvHrblOrz4L8tEcdeKMO17sEdlqJ3ArGID9kaqM8I0z1bOwXVRAtuq/Ta6rSxXMc9qA==
X-Received: by 2002:a17:902:dac4:b0:13e:fcb8:eaf1 with SMTP id
 q4-20020a170902dac400b0013efcb8eaf1mr11822488plx.50.1635097076975; 
 Sun, 24 Oct 2021 10:37:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lr18sm3349531pjb.39.2021.10.24.10.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:37:56 -0700 (PDT)
Subject: Re: [PATCH 20/33] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_HALF)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38e966f8-68d1-e444-e4be-2d19edffb603@linaro.org>
Date: Sun, 24 Oct 2021 10:37:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
> +                          enum CPUMIPSMSADataFormat df_base,
> +                          void (*gen_msa_3rf)(TCGv_ptr, TCGv_i32, TCGv_i32,
> +                                              TCGv_i32, TCGv_i32))
> +{
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 twt = tcg_const_i32(a->wt);
> +    /* adjust df value for floating-point instruction */
> +    TCGv_i32 tdf = tcg_constant_i32(a->df + df_base);

I think it would be better to decode df completely in decodetree.
E.g.

%df_hw        21:1 !function=plus_1
@3rf_hw       ...... .... . wt:5 ws:5 wd:5 ......  &msa_r df=%df_hw

%df_wd        21:1 !function=plus_2
@3rf_wd       ...... .... . wt:5 ws:5 wd:5 ......  &msa_r df=%df_wd

Maybe I should get that !expression=(x+1) syntax going soon...

r~

