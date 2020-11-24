Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33992C2E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:31:09 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc9k-0001QJ-MV
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khc6x-0000iT-5C
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:28:15 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khc6u-0003j5-0q
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:28:14 -0500
Received: by mail-pf1-x441.google.com with SMTP id x24so6889140pfn.6
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/bZNVJmiOOlWWoLFTEj3YQnFcrNuYFP7SCICjq28JFI=;
 b=LWHAeBeDCUEE9YeT2lmxJILBNdLuThS4TxVaCUw7S/sP7lTV2VrtuoqfThXltr08bZ
 cI2O397dM93MRJVi5qS0NodoiTU1zcKD2aQ5Pyf/5PDHmTVTSV8uDIk0kSr+yQxTwnoK
 9O1thVjVvthWE5GFiPhBSD88jaArT/zo3TdfrM/kWA2AT/C1ATrYk2ZOx/wK2l3Sueql
 qW4wIjzQphASJJqlTf8TSYw0uCgtRLDCBu2rJ+PaFdguJ6Kf1PH9et1Sn85LFNBkcUPU
 xPc/qGN6/ny2PClPrIoLmSMi0rySsdK/W23S08qgezcu8o/uKrOe7vODLI1ujgamr6kQ
 LrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/bZNVJmiOOlWWoLFTEj3YQnFcrNuYFP7SCICjq28JFI=;
 b=DoxNN5ShRAirVsVby2gvi6YEyQG/06diNU2xl/UhMAx1Lrl4vmKy0bPzPHK+Rn8ono
 7dG+CykMzrlrYSy7wi22N9S/gyEEJXDGOCZ7LMdD7UXoGEZThIJCVfTageM86leTQcDF
 cD89OzJp470MqMr0HSaD8vbB1WRvxn9XYUCXowru6VitbucDkadQWRBiSaaNdOX1KIfP
 ZlrLUV2PTZyqKkB4VwY806NIzVWRT8lv1/yj6WHrKDipaVwfH4OAMH6y2Bv/rsYG8612
 lhtTaX+nZF9+69UFMNMAZy/YGO9rxMiiZtgos0D7haxaKidYXLhtmSa8io4IzRvu4PVY
 QcVg==
X-Gm-Message-State: AOAM532Wtf++bitwMQagsHCbgKYjEQSJ43BuCVZuxYoOxSSZ0A1Zsjen
 KDBzGAyxw6828pBf81OkBc592Q==
X-Google-Smtp-Source: ABdhPJwUmts9h77G6TUtPGS0+5JLg4SkhtNXY0NKJJkBEfh9U8kwJH27xD+ZSmIsasjFX/6avn0KTA==
X-Received: by 2002:a17:90a:8b8c:: with SMTP id
 z12mr5912313pjn.233.1606238890268; 
 Tue, 24 Nov 2020 09:28:10 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t12sm15293488pfq.79.2020.11.24.09.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 09:28:09 -0800 (PST)
Subject: Re: [PATCH] target/mips/translate: Simplify PCPYH using
 deposit/extract
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201124103808.499948-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a1587a0-708b-b537-3065-e9a7a845b326@linaro.org>
Date: Tue, 24 Nov 2020 09:28:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124103808.499948-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 2:38 AM, Philippe Mathieu-Daudé wrote:
> Simplify (and optimize) the Parallel Copy Halfword
> instruction using deposit() / extract() helpers.
> 
> Ref: C790-Specific Instruction Set, Appendix B-63.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 35 ++++++++++-------------------------
>  1 file changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index c64a1bc42e1..17a28557c2c 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -25220,34 +25220,19 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
>          tcg_gen_movi_i64(cpu_mmr[rd], 0);
>      } else {
>          TCGv_i64 t0 = tcg_temp_new();
> -        TCGv_i64 t1 = tcg_temp_new();
> -        uint64_t mask = (1ULL << 16) - 1;
>  
> -        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
> -        tcg_gen_movi_i64(t1, 0);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> +        tcg_gen_extract_i64(t0, cpu_gpr[a->rt], 0, 16);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 0, 16);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 16, 16);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 32, 16);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 48, 16);

Actually, this would be better as

   tcg_gen_ext16u_i64(t0, cpu_gpr[rt]);
   tcg_gen_muli_i64(cpu_gpr[a->rd], t0, dup_const(1, MO_16));


r~

