Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17C2CF721
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:56:16 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJzq-0006D9-Uy
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJxb-0005d9-84
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:53:55 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJxZ-0008Ud-8J
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:53:54 -0500
Received: by mail-ed1-x542.google.com with SMTP id c7so7481578edv.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fOou7mK0Qu+I/f018YEWl9EP2eVxzfmaBKE/XryaKjY=;
 b=G+K8eXpA50NShrNQc4lccUPRZhDp0mYelupp0t2TfGcuHpg/qrFsf6+l4mJd5N04GB
 qbH15GnH0Cldt4kK2GhqR8PA2Dpz8qaIFWcTzhDF8YLADgvoRYmdK4mBSXvx3cSgFJue
 d+POD7QD/Ptnxpo5nBnIG2v+LUOP/QJLTNGaha4WAwvvkQ+Rfxi62nF0DDWDozYfVyWh
 ydvPsESRVD3C4WgonbwndEmEwOimENEdtvrjTwfiifwfZiGRT2sbyAkhaLhBM9cYnw83
 56Cpgg1zVlwBU29CKt/amEKwtVd6zFCJXy2YGz+NKcRE6z2/T2EJFgGreY9/KZwu8+qE
 C84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fOou7mK0Qu+I/f018YEWl9EP2eVxzfmaBKE/XryaKjY=;
 b=ry9nuacKl7MQB9Ik31ZRpCsQTZhCV3uIVh5b+QpASua71zjs4WURgxCZRiA8hQ2Kal
 WTyQIjgwBOTAzxqKHFI5Bhovh8Lyk2LVjdsVjH3kDeShAC/0FtxG+niIAUseXcFgaNt6
 YyLqBbOu5H+aeRckTaooN7mOPHEwNWJndmzfNoPDkYTPSxGBlyPdh08+M3j3dk16c4gN
 wche0zJldZIPehSJEgI1AV4xKf3atObDexR+FJdGSQUgN1mEzpSnNC7OtLutTc5MPaj5
 f7mHJNWMaO1lRskaOKFrjJrDbg/y6VM1BUFqirKhrxX3pmtThevRitwpfb945mh1Dy/P
 6oZg==
X-Gm-Message-State: AOAM53286ItoKRSslIMf6xdycbwbrU+g0QbZgswNrkHOvlOm+BPpweHv
 iq/aEEjAstx/bboLfzTqqT4=
X-Google-Smtp-Source: ABdhPJyCtMG2T2tN8qF3DYlnpL+hWgn7L0rkCPDCteBfBJDnp1X+8kPOuQUECEjgruurm/Oro+8kGQ==
X-Received: by 2002:aa7:d354:: with SMTP id m20mr9567371edr.195.1607122431282; 
 Fri, 04 Dec 2020 14:53:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id qh23sm3761184ejb.71.2020.12.04.14.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 14:53:50 -0800 (PST)
Subject: Re: [PATCH 9/9] target/mips: Explode gen_msa_branch() as
 gen_msa_BxZ_V/BxZ()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-10-f4bug@amsat.org>
 <42cae1ae-46aa-1207-dac7-1076b3422a7f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c314aed2-9f39-89f7-c4f7-6b3e7c094996@amsat.org>
Date: Fri, 4 Dec 2020 23:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <42cae1ae-46aa-1207-dac7-1076b3422a7f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 6:04 PM, Richard Henderson wrote:
> On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
>> +static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
>> +{
>> +    check_msa_access(ctx);
>> +
>> +    if (ctx->hflags & MIPS_HFLAG_BMASK) {
>> +        generate_exception_end(ctx, EXCP_RI);
>> +        return true;
>> +    }
>> +
>> +    gen_check_zero_element(bcond, df, wt);
>> +    if (if_not) {
>> +        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
>> +    }
> 
> Since gen_check_zero_element already produces a boolean, this is better as
> 
>   tcg_gen_xori_tl(bcond, bcond, if_not);
> 
> where tcg_gen_xori_tl already contains the if.

Ah, got it.

> 
>>      case OPC_BNZ_D:
>> -        gen_check_zero_element(bcond, df, wt);
>> -        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
>> +        gen_msa_BxZ(ctx, df, wt, s16, true);
> 
> ... oops, that'd be for a follow-up patch, to make this patch just code movement.

Yes, will follow. I'm tempted to inline gen_check_zero_element (actually
move gen_msa_BxZ as gen_check_zero_element prologue/epilogue). Not sure
gen_check_zero_element() can be reused later though.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

> 
> r~
> 

