Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8675F243A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:18:18 +0200 (CEST)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2bY-0006rZ-J5
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2Yj-0004wO-37
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:15:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2Yh-0003n7-AM
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:15:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso9829973pjq.1
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FyHUgDBhlLDWgnXY9Beo62gk9Nta4hZgoYUl/4rjL90=;
 b=d5f1WDKzR2Ng0nNftcWLrfgg1IZA7+1BHCWPaQCwjBf1DpfmKbCQ4M0doFztF6ApEp
 zCWwppRmwhH6EEAmVRywObwBdRMY4OTnMSNlLzWS3uWI+3fdjYU5NHmUDID+CLY6euvB
 lbevQseREtPGRh955oAB7A2gCifsJjdYf5pSFVtFrpx36DGSRZFEvNfxXfd0uqilMS0a
 /sXkWSyF8NCrDnktiycUy84Nl6TuutLL1U98UY326DMjGhXIEhWfNh9ZGZZZf5bbElD3
 5yp8LlycMFSyyKKWyBj95cTJnV/5Sb4NyUwzK3pywgagMKexRL0njCWy4fibEUFgX71O
 SC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FyHUgDBhlLDWgnXY9Beo62gk9Nta4hZgoYUl/4rjL90=;
 b=0qPxd7HFgfgULFdByqazswfpNW6BkT23EwcqMXALbO/NcDF/ERhy7pPWt/tiTI2wQ8
 rGZHYtUdn1NS4vnzoZY5KyfiT3VH1Z3v1L3/A3RINoOCgbs9kadYxvalyO+tRFJFo9Iz
 +l+HAX/wCE0rl4hDqm7zvXPjcd/pW4gchB+Z6jdWRlKuTVYFcECDDuDW/gAR34YMUgH+
 l+dcjcbjOPhg6RszUV9t2nWfclS3UpXak2yjO4PJC2EU8+nxIxVNNbgDOmPxd7464Oo1
 nuDxWbBgH08Kcoc6BTuvoIv2lIw/LqP5p0U5MEHLPW83F0fxccGKAhfPHtThMLqc0/qz
 xDyQ==
X-Gm-Message-State: ACrzQf0QK8MCkFPSBxqfAVOH/EpT5X3c1cBoNaDlGPKEGB7s7wXDiFOz
 oT4dVe8J6Ly6++VwP4hXUPPOBw==
X-Google-Smtp-Source: AMsMyM7Uy0NT/TMiQzO1wYAu4KqxoNxb8RB8926GloLUuOVzVetiUHF6/HgpTGNyflv7TgSYyNE48A==
X-Received: by 2002:a17:90b:3909:b0:202:c879:51a9 with SMTP id
 ob9-20020a17090b390900b00202c87951a9mr8001983pjb.83.1664730917571; 
 Sun, 02 Oct 2022 10:15:17 -0700 (PDT)
Received: from [192.168.235.227]
 (50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a170902e89200b00176b3d7db49sm5672601plg.0.2022.10.02.10.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 10:15:16 -0700 (PDT)
Message-ID: <c8555644-200b-5e89-ae04-90530fe16077@linaro.org>
Date: Sun, 2 Oct 2022 10:13:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: access guest address from within instruction
Content-Language: en-US
To: BitFriends <commandspider12@gmail.com>, qemu-devel@nongnu.org
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
 <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
 <e1538b70-8e32-a6b7-4132-77a7ea6a60fa@linaro.org>
 <CABVhSWPQnDCCBhCtSUFVBkyFBzPjGyvk1wixpHW0GNooQ7b32g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABVhSWPQnDCCBhCtSUFVBkyFBzPjGyvk1wixpHW0GNooQ7b32g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.086,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/22 07:52, BitFriends wrote:
> my bad, then I was mislead by "Which is, in general, what you want for implementing a 
> custom instruction". Also the code around me is full of gen instructions, so I thought 
> that's what I should use.
> 
> So, when reading the doc I found out about the cpu_{ld,st}*_mmu functions. That sounds 
> more what I want for a direct action, No?

That all depends on where you're putting the code.  Based on what you've written so far, 
I'd guess the answer is still no.  But you haven't been overly verbose about what you're 
trying to do.


r~

> 
> Regards
> 
> BitFriends
> 
> Richard Henderson <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> 
> schrieb am So., 2. Okt. 2022, 16:40:
> 
>     On 10/2/22 02:20, BitFriends wrote:
>      > I now came up with this code:
>      >
>      > TCGv_i64 res = 0;
>      > TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);
>      >
>      > tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);
>      >
>      > env->regs[R_EAX] = (target_ulong)res;
>      >
>      > However this crashes afterwards in test_bit. Maybe this is caused by an invalid
>     access?
>      > Anything wrong about the code? This still gives some warnings, like TCGv_i32
>     expected (and
>      > when you use TCGv_i32, it says TCGv_i64 expected) plus some casting warnings.
> 
>     It is as if you did not read the second paragraph of my response at all.
>     tcg_gen_qemu_ld_i64 is for generating code, not performing a direct action.
>     Can you see how your code differs from *all* of the code around it?
> 
>     r~
> 
>      >
>      > Am Sa., 1. Okt. 2022 um 22:23 Uhr schrieb Richard Henderson
>     <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>
>      > <mailto:richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>>>:
>      >
>      >     On 10/1/22 13:10, BitFriends wrote:
>      >      > Hello,
>      >      >
>      >      > I am trying to create a custom instruction that accesses guest memory
>     specified by an
>      >      > address in a register. I specifically want to read from that address. So I
>     tried to do
>      >      > that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0, MO_LEUQ);", but that
>      >     doesn't
>      >      > save any result in res.
>      >
>      >     This statement should have given you compilation errors, so I don't know what
>     you mean by
>      >     "doesn't save any result".  There's clearly a disconnect between what you
>     describe and
>      >     what you actually attempted.
>      >
>      >     Anyway, by the name you can see that function "gen"erates a "tcg" operation,
>     which is
>      >     then
>      >     later compiled by the jit, the output of which is later executed to produce a
>     result.
>      >     Which is, in general, what you want for implementing a custom instruction.
>      >
>      >
>      >     r~
>      >
> 


