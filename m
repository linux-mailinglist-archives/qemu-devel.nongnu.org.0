Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7EF6F8597
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:25:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxHc-0003m5-3Y; Fri, 05 May 2023 11:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxHY-0003lT-Hz
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:23:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxHW-0004HC-Qi
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:23:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so19520405e9.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683300217; x=1685892217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nULmwqRArJVOlCdKn+vIWt2XipVLnQQrH7mkW2UUhJc=;
 b=rbWlHY1uCt/Itni7TDf/wr9FHOkpQhBLCjlnVSUCPVuo8/mJInlbd4zegLSBfpLekq
 VReGpLFCX3hc+PhW9AbNCd2/woIW2WmrS4x6XTsn9pTLIV8zQ+/14yu91xzNmezNOPsq
 0iqVpsHCPkR/xBT2qjaKRDcI8h1xjAVeRMvLP9vbsuagjJSD0amJJEKZp84TSKeo8r+J
 IfMIfiTUqTdB7jK42p20H7U/+tU+7xrr+bRDIp4QtYBamLngRdW0iF/5P7FmuHrc3tak
 Dxbnp2XDIZ5zDH810t1DsuIewytBRuOnNIs9iVNM3U6HUulmP8QydY/ZM+dOxdEPehGH
 0oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683300217; x=1685892217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nULmwqRArJVOlCdKn+vIWt2XipVLnQQrH7mkW2UUhJc=;
 b=UxEyoPKfA7/URD7xo3RDptJFHT29arIQqrQTxD3WKhp+MJzd76HcFbkxSgfLHvj0Ow
 1lqf+0E2jaLRdw9A/NvmpWXbOCCdcZBSvnNoFHRDjYYNhPD3e12VBCwu1pwpusVBsOwp
 E22Cckxq78CIkFqs0GAkmP4Vi7hR7xycNtLHWehFS2vUTPM84QlCTGlCG6QlE0ntGMyC
 dpT/OtKHc/ihJ5eHUGBXYKOJIs/WUUK1OcX4Ewmput17WkNygxWZvAVqWIvxF/jexNkr
 ht6hXZH09Trj7QNVKYjA4EZjvsbk8Ocl4NuaMLWgcOlPD6Puj3YVviHMU9bd3LWDwzU0
 wqDA==
X-Gm-Message-State: AC+VfDzXq8ETLpPunvxyq/K8fnRqhAPZluLPG7guf9UdampHjMte4yRx
 HADPWG33zGhsU+YE0CfVWqAyCQ==
X-Google-Smtp-Source: ACHHUZ7JQt9EqgQZwEKkuubRyF4DMy6nEqLH+McbTD8T8s4CHRNvc/Vti9RSLCl21e5hMHYPNQ/eAw==
X-Received: by 2002:a1c:ed13:0:b0:3f1:662a:93c4 with SMTP id
 l19-20020a1ced13000000b003f1662a93c4mr1475711wmh.36.1683300216982; 
 Fri, 05 May 2023 08:23:36 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm2679834wrn.58.2023.05.05.08.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 08:23:36 -0700 (PDT)
Message-ID: <bac2a436-c071-0716-c699-21a6a7b59d73@linaro.org>
Date: Fri, 5 May 2023 16:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/ppc: Fix fallback to MFSS for MFFSCRN, MFFSCRNI,
 MFFSCE and MFFSL
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230504110150.3044402-1-richard.purdie@linuxfoundation.org>
 <1f22eb31-7573-cbca-bc9a-6d4ef5d1b71d@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1f22eb31-7573-cbca-bc9a-6d4ef5d1b71d@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/23 18:17, Matheus K. Ferst wrote:
> On 04/05/2023 08:01, Richard Purdie wrote:
>> The following commits changed the code such that these instructions became invalid
>> on pre 3.0 ISAs:
>>
>>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
>>
>> The hardware will handle them as a MFFS instruction as the code did previously.
>> Restore that behaviour. This means applications that were segfaulting under qemu
>> when encountering these instructions now operate correctly. The instruction
>> is used in glibc libm functions for example.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   target/ppc/translate/fp-impl.c.inc | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
>> index 57d8437851..cb86381c3f 100644
>> --- a/target/ppc/translate/fp-impl.c.inc
>> +++ b/target/ppc/translate/fp-impl.c.inc
>> @@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
>>   {
>>       TCGv_i64 fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
>> +        return trans_MFFS(ctx, a);
>> +    }
>> +
> 
> Hi Richard, nice catch!
> 
> I believe this may be better addressed by decodetree pattern groups, e.g.:
> 
> On insns32.decode:
> {
>    # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
>    MFFS_ISA207   111111 ..... ----- ----- 1001000111 .   @X_t_rc
>    [
>      MFFS        111111 ..... 00000 ----- 1001000111 .   @X_t_rc
>      MFFSCE      111111 ..... 00001 ----- 1001000111 -   @X_t
>      MFFSCRN     111111 ..... 10110 ..... 1001000111 -   @X_tb
>      MFFSCDRN    111111 ..... 10100 ..... 1001000111 -   @X_tb
>      MFFSCRNI    111111 ..... 10111 ---.. 1001000111 -   @X_imm2
>      MFFSCDRNI   111111 ..... 10101 --... 1001000111 -   @X_imm3
>      MFFSL       111111 ..... 11000 ----- 1001000111 -   @X_t
>    ]
> }
> 
> And on fp-impl.c.inc:
> static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
> {
>      if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>          /*
>           * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any instruction
>           * with OPCD=63 and XO=583 should be decoded as MFFS.
>           */
>          return trans_MFFS(ctx, a);
>      }
>      /*
>       * For Power ISA v3.0+, return false and let the pattern group
>       * select the correct instruction.
>       */
>      return false;
> }

Not quite.  Should be

{
   [
     MFFSCE  111111 ..... 00001 ----- 1001000111 -  @X_t
     ...
     MFFSL   111111 ..... 11000 ----- 1001000111 -  @X_t
   ]
   MFFS      111111 ..... ----- ----- 1001000111 .  @X_t_rc
}

where all of the 3.0 insns do

     if (!(ctx->insns_flags2 & PPC2_ISA300)) {
         return false;
     }

I do not believe that v3.0 rejects bits [11:15] = 00010, for example, which would have 
been accepted and ignored with v2.07.  It should simply treat it as the full MFFS insn.


r~

