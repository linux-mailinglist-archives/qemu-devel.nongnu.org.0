Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABC2DC3C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:12:56 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZQ7-0001zt-NU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZNm-0000Tu-3S
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:10:30 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZNh-0004lX-RF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:10:29 -0500
Received: by mail-qt1-x834.google.com with SMTP id u21so17528098qtw.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R6n474+xsrljIhxiLI+jMB346FKry3m8jrkOmpjCcyA=;
 b=wdiGdmQYlpBktrLHFktfhEIxY2xi/OOasz0PbRDZv5mXLqpy+BfMolgEH0Ca/w6+L3
 kLuAbFpP3c7muDIvdgkMjy6ABVOftPBfeag5weL6XEo9k50+Dp3PxdXkXXdAUhS0EjpA
 BFn5nQImIEDxtYxt26SlwmCz+gMy+UtnyWJVRbCCBoGGqtHadslYHEOfulP3IBn8mLiM
 V/5ct4xkiXoMeJTmP1f0YEHdBJmdduXG4zN/ErII6trXeXht/jCwgCMcEr5UeHDWAPM8
 g3FRFWzn77L4GkvID2thr71JrXq82YnS8ZzedqKzYTqJ5BkcDgNqf9e+s40Btd8AEmDB
 aEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6n474+xsrljIhxiLI+jMB346FKry3m8jrkOmpjCcyA=;
 b=dVlmLTRTBCQnX4Gm99cfcHrJNE+54DTqneA/SZUb+DV3W/3nCBhCOpRSKS5yv+QERw
 MwpDlAdBKDn4bl9b1+RXOjx49jpFlVabnDMMnB5wZ91WaSo65HuKZ4EP54xOtSkhejoL
 1Si1V8Msiisf0IGOX+ZYsp7LILaVXIs5492jkB4qoJV9ew98IklU82DWn5/o6+Wamuoo
 OW42Y9VkfK99gYDD4qp8cX4zPrNPL9GYAJ+TpblDVClADf65jcgRv8tNPhIJjOR2L4kv
 1OZRsoam6/K6yJib9b1YjkrrvRrBANBkcfMNbZlGcrTYFzRUfCfMfy0c//HkErWwwXG+
 ARpQ==
X-Gm-Message-State: AOAM5334VVP5lEYI7JkOGegUoReAEn96iMokrm5inESr4pTqauLPRvj5
 qusH0fDnZ+MfG2XsfWGs/hefVLi16TAkuekv
X-Google-Smtp-Source: ABdhPJwTRbi6t9hJLMYREoj3AamZTMU2ii39GcGnLO0JpQTkOkY+ECsjn7yaZCTqlVIBkB7LG5NL8Q==
X-Received: by 2002:ac8:3987:: with SMTP id v7mr36860756qte.144.1608135024447; 
 Wed, 16 Dec 2020 08:10:24 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id g26sm1334760qkl.60.2020.12.16.08.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:10:23 -0800 (PST)
Subject: Re: [PATCH] tcg,riscv: Fix illegal shift instructions
To: Zihao Yu <yuzihao@ict.ac.cn>, qemu-riscv@nongnu.org
References: <20201216081206.9628-1-yuzihao@ict.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab311e75-0689-03aa-adb0-6fe826473511@linaro.org>
Date: Wed, 16 Dec 2020 10:10:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216081206.9628-1-yuzihao@ict.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 2:12 AM, Zihao Yu wrote:
> * This bug can be reproduced by running the following guest instructions
>   on a RISC-V host.
> 
>   (1) xor %ecx,%ecx
>   (2) sar %cl,%eax
>   (3) cmovne %edi,%eax
> 
>   After optimization, the tcg instructions of (2) are
> 
>   movi_i32 tmp3,$0xffffffffffffffff  pref=all
>   sar_i32 tmp3,eax,tmp3              dead: 2  pref=all
>   mov_i32 cc_dst,eax                 sync: 0  dead: 1 pref=0xffc0300
>   mov_i32 cc_src,tmp3                sync: 0  dead: 0 1  pref=all
>   movi_i32 cc_op,$0x31               sync: 0  dead: 0  pref=all
> 
>   And the target assembly instructions of (2) are
> 
>   0x200808d618:  fffa5b9b          illegal
>   0x200808d61c:  03442423          sw              s4,40(s0)
>   0x200808d620:  03742623          sw              s7,44(s0)
>   0x200808d624:  03100b93          addi            s7,zero,49
>   0x200808d628:  03742a23          sw              s7,52(s0)
> 
> * Note that the `illegal` target instruction above should be
>   `sraiw s7,s4,0x1f` (41fa5b9b).

More precisely, the 'illegal' instruction should be *anything*, except for
'illegal'.  The result of the out-of-range shift is undefined, but TCG requires
that it not trap.  The undefined result should be unused.

In this particular case this is so, because cc_op == 0x31 == CC_OP_CLR, which
does not use either of cc_dst or cc_src.

We have make the same patch for other hosts, e.g. 1fd959466574 for tcg/sparc/.

I have queued the patch to tcg-next.


r~

