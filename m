Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B48F3EF57D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:08:36 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7G7-0002Rd-LX
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7Et-0001l0-CP
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:07:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7Er-00005x-Cr
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:07:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id y190so127650pfg.7
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b0oVd5Vdqd4kkV5qz4dk60yG8FbySuOCTVVFJg9mvWA=;
 b=yvmhuI/qNn/4mHbEgEfxAV8SD1YaYGOeXEp5ifiCrDNWKWNEwNNSnAmEaaIlQmPLkO
 rKhnKgGFdj0uqjEj+gCPDJP4JEytLIybxvJ6Upm8SomGy9lRLS8PacqGo0vmo9iY+ACh
 oiihE4QgS16JzvdL0na/Nz+SHJIi+DlAw/ae3AdmQHJbs/QcEDL0wYLo44YojSNzfvl2
 1OwuXKeSo9h1Fdm4wucb3GQA+AWz0B1P8ARWu+ERA1OMF0cR2ws8yFhuSPbFYLW+vdck
 sUedYKfDYI9dId3sYLUXSrZFWPxN0ehR8DWneRVtZzFTG81O2FnhHTlyCGpqQnukjOd9
 7cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b0oVd5Vdqd4kkV5qz4dk60yG8FbySuOCTVVFJg9mvWA=;
 b=fkQZJ+7JBX9TWnwnveC7lL1wPmZ19zW2BtMLPZrxz0OIIwFDlAV9nrKC8SISEybiuu
 1rfpXjUHE/e8+ht5bO5NhKhi6FO7dbZO9iTk5pwTtJ0we86TriYsFN1Wr63EYz+Y4RMg
 RoZzNzwXDdr0TIGirkgKeLFnsEfVSAr3Ozk+OP7oQ2YjJwkf6ljEFKom7KysSIk6ur7s
 TUnqv3bFcqNyViMRIu3E3l3rx0oVoJMwrsz87KcJHtPYttQlCNUmEynyUr82VVi6Hp02
 ryejn7JEdBRDlhN26IZRnxhjpJQarN2vNCfd4cbdbU/DYbxhTosyvDw5N7ssiIos6PZF
 FZ9w==
X-Gm-Message-State: AOAM533eTzx0eYTZYiI13J0SuTr8Ss04NovbxBaC6BsEirrSo/8NRCrZ
 olA1wpbUorlwooUieBe00dDQsw==
X-Google-Smtp-Source: ABdhPJysBoa1MTF7eunPR/nAOBqezKPfs+G7uP2waFKqywr/JKALstaQto/BS/rIjawBwuS6Wtui1w==
X-Received: by 2002:aa7:9186:0:b0:3e2:bb03:4561 with SMTP id
 x6-20020aa79186000000b003e2bb034561mr2251919pfa.43.1629238035346; 
 Tue, 17 Aug 2021 15:07:15 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id m7sm3403210pfc.212.2021.08.17.15.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:07:15 -0700 (PDT)
Subject: Re: [PULL 24/27] accel/tcg: Move breakpoint recognition outside
 translation
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
 <20210721195954.879535-25-richard.henderson@linaro.org>
 <CAFEAcA-nH4xYDG4wh_jYcSZt9ahNrt3WK453tqwD-0mqYekzeg@mail.gmail.com>
 <00aaafa2-74dd-3c19-1d47-93bc2fc0d83c@linaro.org>
Message-ID: <c58a48eb-609c-5c3b-413c-973ec6e2a4b9@linaro.org>
Date: Tue, 17 Aug 2021 12:07:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <00aaafa2-74dd-3c19-1d47-93bc2fc0d83c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 5:39 AM, Richard Henderson wrote:
> Hmm, you're correct that we get this wrong.
> 
>> We probably didn't do these in the right priority
>> order before this series, though, and I dunno whether
>> we get the insn-abort vs swstep ordering right either...
> 
> And you're correct that we got it wrong beforehand.  The reorg did not alter the 
> recognized ordering of the exceptions.
> 
> I'm a bit surprised that insn-abort comes higher than breakpoint.

That would be because I mis-remembered the language.

Going back to the list,

   4 - software step
   6 - pc alignment fault
   7 - instruction abort (address translation!)
   8 - breakpoint exceptions
   9 - illegal execution state
  10 - software breakpoint (brk)
  11 - BTI exceptions
  12 - el2 traps
  13 - undefined exceptions

I thought "insn-abort" was #13, but it's really #7.

Well, behaviour is unchanged, since we check for address match before calling 
arm_ldl_code, before and after the reorg.

So: we need to suppress breakpoints (#8) for any higher-priority condition.  For #7, that 
might require some extra generic work.  I should have a look at the other targets that use 
architectural breakpoints to see what happens for a breakpoint on an unmapped page.

I'll work something out.


r~

