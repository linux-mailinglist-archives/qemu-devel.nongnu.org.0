Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D252B6DB0E7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 18:50:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkpHz-0008P5-4W; Fri, 07 Apr 2023 12:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkpHx-0008Oo-HX
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:50:13 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkpHt-0000m3-8n
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:50:12 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q15-20020a17090a2dcf00b0023efab0e3bfso1849156pjm.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680886203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0qPHXI2PYbP4rIpGrnftMGJAX/Ur22gtP6WXTBgy1oU=;
 b=AIAIuefLl710oVF1qskWBBIc+Hn6wskms79VDLkm08QoV/xK00XzTmm84Xnzge0m/V
 b+gHihxAuA70cus2F9i6v4hZXf0kOiscl9Tqiea999OETRKIFCnDVjKfHNaWIv2whH/V
 pwC7PV4hfEhAkjrqWOZX6H71h/2UuxqxE02CEFdm7KauV1HlcDoAyh4Gsdy2GgcXoiF4
 tKlH6YQ1mJ5qFzFNMMwWNdaY4yA4XudPIOc8WK8ZcqyfhoyyHRndjX/QRjtS3qt67nyl
 pMLj/fIcWP99sfF53PlQfztg6CoDQLKRyQ45F8cvPwyuxInK2J2OQUZS91ApvbF4vaKR
 1v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680886203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qPHXI2PYbP4rIpGrnftMGJAX/Ur22gtP6WXTBgy1oU=;
 b=efXs5QXQSy/LLN5adJVIMqA8SV4JXXU2slZ1z3G3YmqVFZ2gTZFm0/NjXc+MUK2Mcw
 TV2Q7MSiwzV3fJQ54CvpTsmMrf6rv18Pmh6mp+ApP9Wku0SAhh2L3Dqdyc5w7UUvYetL
 hcWRf8lStKEeLqv+AB/LkwpqMPt7K+EZC04HCw5s9Y51xOoOtboURIIzfCu3sr9Ycqag
 j8Z8/bhz9xwRXbLfugZG4wRBynyIRfLmH3v2lLlvNVqK0N3rYnMj88gWa2dnEmCWWbBt
 S9bZxcjDHnwDi+IYrvYl9in3siEGBHYF51Jk7Ulh1ll5iEsPQ2pvPMluQjrLpIYhCxzL
 1a7A==
X-Gm-Message-State: AAQBX9cklyW7fXoWWYnj/M0O1xpnCQghaXjLuyHoSWZzyLCl/xw7mM3k
 /GBw4wUWffkXIU49cW+2Zhhimg==
X-Google-Smtp-Source: AKy350bzn6ju/kVmnBMA0tyIj1/rLg2EEjXwunIZgEq+8JanraksUE++T1sIeuBSeMJaEMtI5aw6ag==
X-Received: by 2002:a05:6a20:c329:b0:da:2dc:5642 with SMTP id
 dk41-20020a056a20c32900b000da02dc5642mr2765820pzb.58.1680886202715; 
 Fri, 07 Apr 2023 09:50:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a63e307000000b004fc1d91e695sm2803593pgh.79.2023.04.07.09.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:50:02 -0700 (PDT)
Message-ID: <09705f7c-87ee-4bc2-f9d5-9045f272c4a7@linaro.org>
Date: Fri, 7 Apr 2023 09:50:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: assert !temp_readonly(ts) in tcg_reg_alloc_op
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <CRQEHNGPTSUM.34NYFP2RDLQA6@wheely>
 <CRQG87D3J96O.2610UOHM3V36V@wheely>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CRQG87D3J96O.2610UOHM3V36V@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/7/23 03:24, Nicholas Piggin wrote:
> On Fri Apr 7, 2023 at 7:02 PM AEST, Nicholas Piggin wrote:
>> I get a crash running a powerpc64 TCG machine on x86.
>>
>> It can be triggered by booting a custom vmlinux patched to use powerpc
>> prefix instructions and pcrel addressing, I don't know if that's related
>> or coincidence. I can give Linux patches or a vmlinux file to reproduce
>> if needed, or I can test patches quickly.
>>
>> The first bad commit is 7058ff5231a0 ("target/ppc: Avoid tcg_const_* in
>> translate.c")
> 
> This seems to do the trick:
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9d05357d03..23869fe6cb 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
>           TCGv_i32 t2 = tcg_constant_i32(1);
>           TCGv_i32 t3 = tcg_constant_i32(0);
>           tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
> -        tcg_gen_remu_i32(t3, t0, t1);
> -        tcg_gen_extu_i32_tl(ret, t3);
> +        tcg_gen_remu_i32(t1, t0, t1);
> +        tcg_gen_extu_i32_tl(ret, t1);

Yes, that's the correct sort of fix.
Nit: slightly better as

     tcg_gen_remu_i32(ret, t0, t1);
     tcg_gen_extu_i32_tl(ret, ret);

where the no-op extu will not be emitted at all for ppc32.


r~

