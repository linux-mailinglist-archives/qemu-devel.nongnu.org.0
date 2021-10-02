Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436BA41FE22
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 22:56:47 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWm3q-0003gp-Bs
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 16:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWm2F-0002xa-Fz
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:55:07 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWm2D-0001cD-TD
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:55:07 -0400
Received: by mail-qt1-x832.google.com with SMTP id j13so12407859qtq.6
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GmB3pwAZVPExNuMq572k3/YYOzaxxNAhUdDAL5vdlpM=;
 b=DKGI7F90BrZLwCrsUgeuErUABTL+X2Iu+nLTYMluNscBQLA5ar5jo+zV1KT0tCjIBC
 alo+txKfKIGvrrTWayWw6/oFRXnawLGWNoOFfGfIUh3k43zz4Weo2dC+Vpfs/R0BeZiG
 zNmIzqqeyDVnNyO3gcB7BBAozSaVCpzetGkUPiC42F9uy3QNFhiBf9d2XGmy5Tsj6Ln0
 VcDsHnzOp8osxL3nsn8E9f8knyfkW5Q8E2hBtTKCX7jcsevSbhZrF8weCUqbO+SdoGIV
 pExfSCaa25uB5p0i74YYzsI+iRDps81p92QXaqF8Sbq3DiqKlptTscyMpntko1Qkdr3i
 B0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GmB3pwAZVPExNuMq572k3/YYOzaxxNAhUdDAL5vdlpM=;
 b=28l9Kdt4rND/FxP2XSVI/4+QW879cuEqPYEkZaCHSzIhsK45aDWc1QaXseswUcsrfz
 lzqQ0xR3QPrkKmie5yqcqjWODS+to9KcKpfDdyMFYyAuWlSuUN72/SfT01D4psiMffAE
 QXlA2p18g9UI9G24SqPOXrrrPab5qCka5YlqazBdUDmncKauZB1/fgy/b5bv+ew0mV4Y
 wvuXVaSnRknaeZ/NpsPntDpFGxLCSzpgKChyV0hIwMEGlS0AZ6xtsOpRZXsd6/l5Za+1
 wx1A7Y/l6RMKarGnWYSQVnhP8n+ufMlTfzZ5O4LnoK1Nw82P53UGee0y+jmPGSR/I+9w
 L/ag==
X-Gm-Message-State: AOAM532N5V+SmA79UQy/+erZPn5E6MMkW6T82PgiDUZmxDDGCLiLzHaL
 zw7Y86AzFUhGE3kOGa194gs4Fg==
X-Google-Smtp-Source: ABdhPJxNXJxth2JlPcoaz/ooKhukPn0weAHpDpBpYXeFGSRxzF6s3gIpjJE0Y9uoGxsm56LaI5uIrg==
X-Received: by 2002:a05:622a:1cd:: with SMTP id
 t13mr5419753qtw.283.1633208104815; 
 Sat, 02 Oct 2021 13:55:04 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id v3sm5096353qkd.20.2021.10.02.13.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:55:04 -0700 (PDT)
Subject: Re: [PATCH] target/mips: remove gen_mfc0_load64() and use
 tcg_gen_ld32s_tl()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002133753.3432668-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6dfd4e5d-2d46-4e43-af6a-ba388a9a8a24@linaro.org>
Date: Sat, 2 Oct 2021 16:55:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002133753.3432668-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
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
 Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 9:37 AM, Philippe Mathieu-Daudé wrote:
> -static inline void gen_mfc0_load64(TCGv arg, target_ulong off)
> -{
> -    tcg_gen_ld_tl(arg, cpu_env, off);
> -    tcg_gen_ext32s_tl(arg, arg);
> -}
> -
>   static inline void gen_mtc0_store32(TCGv arg, target_ulong off)
>   {
>       TCGv_i32 t0 = tcg_temp_new_i32();
> @@ -5679,17 +5673,19 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>               break;
>           case CP0_REG01__YQMASK:
>               CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_YQMask));
> +            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMask));

Oh, actually, this replacement only works for little-endian host.
For big-endian host you'd need to adjust the offset by

   sizeof(target_ulong) - 4


r~

