Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75D3F3E56
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 09:49:26 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHiEJ-0000lN-NO
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 03:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHiDL-0007xx-8m
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 03:48:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHiDJ-0001YB-N0
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 03:48:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a5so8378868plh.5
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jTL3j0fLXA7I7vrj5M9WawQ//nJatagWVWQEKK7Vb+8=;
 b=oiS0ZZ9LTP4rR2CodQlvcZs15+qTLAo7GC4e7cseoUbhD/5Q/uAkV/ODSsADxlTSCf
 IRA7XOD/iNZdquBAidJjXnk1Pm3ke8EZ8DRPY7YR5J3oF5It16iHSfAB7uJwmEButZzI
 ILtg3HzRc9Tw+Px5zzspJAG8uEwdIZSFM+ek7CBEzmTXGVgOcOH1SdzhQmSCuEH95lAM
 rxSL5xvDHH15mgyGk5WD72grf+25nQ0gja9QDmM7lJqPlr2FIgFsSb8lLv31XrrXhlYV
 Vo11FpXOGXKhuZkjbLIzDGu1O7uOHb/JKa/TBlQj5vZ8Uq1Q9tjszNBIepHWmdV4qXej
 R5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jTL3j0fLXA7I7vrj5M9WawQ//nJatagWVWQEKK7Vb+8=;
 b=VrgTcH68vpXcmxtcrp9TyXCCxe2iOoxmHgcTD600Z7OMjCPHrApSuL/UubxYIZhkbE
 fd8m6BFUERbHX3SFrE+cSAkJHW9kyXJVNBO6lhm+nDZN/3dAqeOy5WQu81ZaVjoFdaUT
 QUkOBnjqXQeC41M8DZxdAOCOabpFeWFJMrpnEYl3NuFdG0J/1lpNW4J4d2nFitGHz154
 cy/QQtzZ8TKODAb1sCG1QvfsRTGsQdyR8N31mPJRaO/YChftPKHTAMPh4LYWBcAnn37C
 xnXjVtMUAb/wjKMj867mC2dux61ZfKuDTM7qBbfEH2vVvHC5NkRR+ut/+0PS6dYNG/no
 umoQ==
X-Gm-Message-State: AOAM533atdKH5uXos4lMa69XQ+7QFXQuuKRzCNGbIYg9cXrnyVjiPT0R
 WKHoQnVt3d0PgNo3291bdQR2MgnbpLl+xg==
X-Google-Smtp-Source: ABdhPJyXBJtSjLmXNvCf2hjTBCxTC2xsYI3sZGpzZD6gfzEt4ujd6E2m/K0sQwJx2seVqb/M4GSV9A==
X-Received: by 2002:a17:90a:940e:: with SMTP id
 r14mr13668453pjo.41.1629618495752; 
 Sun, 22 Aug 2021 00:48:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s5sm14646527pgp.81.2021.08.22.00.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 00:48:15 -0700 (PDT)
Subject: Re: [PATCH v3 59/66] accel/tcg: Handle SIGBUS in handle_cpu_signal
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-60-richard.henderson@linaro.org>
 <CAFEAcA-dFoksfoZ0Ngr9xjyAsTyHq+NzaRjiY-2LTZBs9QMSsQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85cba917-3b5b-8a8d-088a-1dfeb8787ef0@linaro.org>
Date: Sun, 22 Aug 2021 00:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-dFoksfoZ0Ngr9xjyAsTyHq+NzaRjiY-2LTZBs9QMSsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 2:34 AM, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 21:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We've been registering host SIGBUS, but then treating it
>> exactly like SIGSEGV.
>>
>> Handle BUS_ADRALN via cpu_unaligned_access, but allow other
>> SIGBUS si_codes to continue into the host-to-guest signal
>> coversion code in host_signal_handler.  Unwind the guest
>> state so that we report the correct guest PC for the fault.
> 
> You can't rely on alignment faults being marked by BUS_ADRALN:
> eg MIPS doesn't give you that si_code. How much does that matter
> for our use of it here ?

Aside from whatever tcg/foo relies upon, it doesn't matter.

But: silly mips. I was going to rely on it there -- oh well, I'll undo that section of the 
follow-on tcg/mips patch set.  And it's got a different syscall for disabling the 
unaligned fixup.


r~

