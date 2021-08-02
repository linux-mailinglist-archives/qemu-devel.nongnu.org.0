Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32E3DE30D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:28:21 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhM4-0005Gx-Fx
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhK6-0004Yd-1Q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:26:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhK4-0003rL-GX
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:26:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id b128so11345392wmb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zUN7juGv96dKJnoGKFCTp+7ajlQviVbQa5zxNOxaNXM=;
 b=XHLzkJj5Vx1kT+OcuoNzxjM1DiYvzks0O1cCRl1VPv04lFzDFrg/6ZSUXnkXGB8JUE
 eGG5R2D38pmt4xgf/dJsT0heZCI3Rg/qsds5L8Eb25ZYvbAOlOW3mn273sxiPGzp7qJF
 8dpUMPYqFRdudQw7vkxm6AN2KhfUZEtNWYgu3JQ8KKMlelIFidVXQGb4S08OqVu51WUd
 Z/azYK6T0PrfDiSIBs0zFeGvSxEwTJgk9PsPcF4RCHbxC8t4w1rguz2N6cmCbLnkimHq
 W6DmRiUNqDvVf6AEMEvv2Z7qF2vmnYpl32+gzmUZni4rf9pZ89rtiMuiKqhATPDCbIZa
 5rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUN7juGv96dKJnoGKFCTp+7ajlQviVbQa5zxNOxaNXM=;
 b=BIiYT/uV8JaVF/YLvESig0EjfaVwAgmTLuL47QIwUWn0Vi84VjcGmJ59OoDUMddZcj
 upx9/8NO++4OSczVx2d3r5LDrfiTiqo8b9DyGGaYj8bUL7AY/SE7P9iXzqO3cVVNFN+5
 V+e1tkH83kGZdLA8hf3IBdH8sEB0wVeZB606oci/xnQN2gnDxOfXHOO6ZCSNyKMmqnTx
 goPzbIj0oh+6TUD1CJkSch61npIF80aub/T84ct2DoYcpSeMLfIdiUiuApXywXHVFbRS
 +/udkA6X0YKepVNRh5CpDvObXJcCQLftuhQDRa1whuXXGlKO1s3h30pPoZbDmeDIgxAS
 2Lpg==
X-Gm-Message-State: AOAM53398LPqEh6OMLGnM+IXWye7bEH64mib2X/3Y8wqqB4X40xNLUU+
 5XatZm++sdtqs4AwC69P/6U=
X-Google-Smtp-Source: ABdhPJy+uDS6mhDJWOCQ33dtrb6sFJ86h+R/cLcd4f162Kj1xYpXiC5cX38f22kAoUSnTtzkALb3+g==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr1205499wmk.50.1627946774566; 
 Mon, 02 Aug 2021 16:26:14 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p4sm12163906wre.83.2021.08.02.16.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 16:26:13 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 3/5] target/mips: Convert Vr54xx MACC* opcodes to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210801235926.3178085-1-f4bug@amsat.org>
 <20210801235926.3178085-4-f4bug@amsat.org>
 <6b8cf681-08e9-4e6b-c037-aec831dd6221@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5638e430-ef6a-4141-1670-e2b9af3ca714@amsat.org>
Date: Tue, 3 Aug 2021 01:26:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6b8cf681-08e9-4e6b-c037-aec831dd6221@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 9:50 PM, Richard Henderson wrote:
> On 8/1/21 1:59 PM, Philippe Mathieu-Daudé wrote:
>> Convert the following Integer Multiply-Accumulate opcodes:
>>
>>   * MACC         Multiply, accumulate, and move LO
>>   * MACCHI       Multiply, accumulate, and move HI
>>   * MACCHIU      Unsigned multiply, accumulate, and move HI
>>   * MACCU        Unsigned multiply, accumulate, and move LO
>>
>> Since all opcodes are generated using the same pattern, we
>> add the gen_helper_mult_acc_t typedef and MULT_ACC() macro
>> to remove boilerplate code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/mips/tcg/vr54xx.decode      |  9 +++++++
>>   target/mips/tcg/translate.c        | 16 ------------
>>   target/mips/tcg/vr54xx_translate.c | 40 ++++++++++++++++++++++++++++++
>>   3 files changed, 49 insertions(+), 16 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +#define MULT_ACC(opcode, gen_helper) \
>> +static bool trans_##opcode(DisasContext *ctx, arg_r *a) \
>> +{ \
>> +    return trans_mult_acc(ctx, a, gen_helper); \
>> +}
> 
> Perhaps copy the TRANS macro from ppc/translate.c, so we don't have to
> have so many single-use macros like this?

TIL the recent changes in ppc/translate.c, thanks, I will see what I
can reuse :)

