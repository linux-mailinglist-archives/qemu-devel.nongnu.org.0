Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA3438651
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 04:12:56 +0200 (CEST)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meT0K-00030V-1o
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 22:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meSxc-000104-4P
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:10:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meSxa-0000sm-GL
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:10:07 -0400
Received: by mail-pg1-x534.google.com with SMTP id 75so7200168pga.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 19:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lU8an41LZ45wdCggQTbt3/i3RP3APT9uun3ZDPguv4w=;
 b=BPIdTVbFeUF596cYoi99x05s6vswhl/4WF4AP/ngZj8Z5nJXSLxxHrZvKtnpAEGqp9
 76fazQ/dcpN9lp0kxORy9LojM6SjJvdXyyXWX23V/+2hFPELaz5f2fuv7//9zjVTEoln
 vgaV4ILpTSa2wxyLD9lAbvbT1M65VOpLWRrcgV64merGnMZifMeywhG1bWrEdUmEpGd5
 JdXdjItG0l5r8eixH99DkzyyjfKA8dps/Ikw0E62XLEhiIMqCOJ/lYFt1LAYM8XBgJFI
 oXj+w7QZs2jQXV5kMm1ucaCdusxrFHtPBkMmZsQ14DCCQ/r6+0y99oIxzGaVejPSbBx9
 Rp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lU8an41LZ45wdCggQTbt3/i3RP3APT9uun3ZDPguv4w=;
 b=68aToYFlGCmGvz1kEbqlN/OLpBiM7UhcZYM01Ez7viYAPmtE2eYh+H3831F69Y9hkH
 53Qzx8IRrTb/YcBlvW0apiSMWsuCDJvYEfe7cTMh11p8fRCXnFluUhPGZnOkzT7SDSt6
 gZpKO4p5VRyCQRtR8kcvG/bcBPc6/SKZzghOK7Zd48Au7vfAUSQDR4J/9MWzJZV4TJH9
 fAbDv4rJBkTDagI55BVMBVwodc0dBRLh5oIw0YYpXsP78/MqJhNagte7aiILpZGepfCq
 IoM7g/vOIx3uad8+ouOz7n5z6ithRsrY0rCGndMptvP+Aq5ULN6ihEAn9RCl+bbkPVoR
 LOrw==
X-Gm-Message-State: AOAM5319xhK5frPrHXJpZEEqjZEq3F02AJjKyUAwPCvZf9dscW5Zorrd
 k9hm5uPIwSELId7/vp+AyZjz6w==
X-Google-Smtp-Source: ABdhPJyqOI9jutNmM504x8q5NVwZumjyZ+sTLuS74QyuW5i7STQCGNCnR2t3Co++96K2FI768+UQFA==
X-Received: by 2002:a05:6a00:2484:b0:44d:ce87:3627 with SMTP id
 c4-20020a056a00248400b0044dce873627mr9755030pfv.48.1635041404618; 
 Sat, 23 Oct 2021 19:10:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s17sm12156395pge.50.2021.10.23.19.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 19:10:04 -0700 (PDT)
Subject: Re: [PATCH 11/33] target/mips: Convert MSA I5 instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <184aa170-12ec-3633-9ae5-74480e22ba62@linaro.org>
Date: Sat, 23 Oct 2021 19:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
> +static bool trans_msa_i5(DisasContext *ctx, arg_msa_ldst *a,
> +                         void (*gen_msa_i5)(TCGv_ptr, TCGv_i32, TCGv_i32,
> +                                            TCGv_i32, TCGv_i32))
>   {
> +    TCGv_i32 tdf = tcg_constant_i32(a->df);
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 timm = tcg_const_i32(a->sa);

tcg_constant_i32.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

