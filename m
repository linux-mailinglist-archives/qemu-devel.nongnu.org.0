Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102A320EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 01:23:13 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDz0K-0006Tk-07
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 19:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDyyw-0005kl-W0
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 19:21:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDyyu-0006OL-NU
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 19:21:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id d2so7856153pjs.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 16:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Trj010zDHQ4xSMLrkRdHvH6ENnGnvAFM0+aitMWz2VY=;
 b=ZUivhzG7bOsnMdoa0fA+X5Lfw7SwEZP1skRnCfE4O/lkaTobtolqlMDSCOQFgHB9mJ
 KdwzQF9W8hcQ1bDOQUH0uMS4K7/P7uyzNk2Dd1aQqbH19m1fufa4X5JVq0f1HiZLVLkU
 ylS9vX67Gih3R0UXA2Mo/8V6/Z/CxS9urprQmJP2mlbxmrmZGHF115G4dfD8+FPmZvmm
 0RXaZFZ2iAlxu+mC7A3yh//GBoe16nVOIYKg69K6njp3UPsT/2PySyfG2/+llipj6+xn
 TmdnU6KK4/jLSPqd+gOWaNvatSpNJ4mBtqmPc9wLjw+XahW9RFKX1hTWvhE3gxUik0hj
 itgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Trj010zDHQ4xSMLrkRdHvH6ENnGnvAFM0+aitMWz2VY=;
 b=qPB6YiBfNAPF0qzaQ2KRj/k0o0wr696s2QZdcVdXf70+wA2SOQ22wPRwnA90jKHLT1
 TjdFqbJAaejmNkciAHDn2hfxngaVdIrxJ9ZWctvbMlL1Y0pSQAC/ERNFmAb+mBf9Q8zR
 nE2d09T5hHlqbOV8yae8IQy0jyh6dAxld6OZrXKTy4slaH5MMI2ZOJZuaUA/cEFWO+HG
 rgbFUKBoEr/hz21LZqhXgiM7xtszISqJwtJXbpizzL/IuLqCn76A0Rv9sHF/4a1WnJVQ
 ruq0l9aHZFaigOjGeTsgZtyuB7tPQUdLf7oeHQ7OFLcS82qvX85Y4/N8TcDkLKhaqo6A
 ZISg==
X-Gm-Message-State: AOAM532AMbtZvXEIGuuBVrirR3NwPe4rZdZyDgexUrzphK7HE059ACGP
 cY73SQHSURp4vlkZ9RoMnln37g==
X-Google-Smtp-Source: ABdhPJy95LxKzgbRAOpIGxNM2j1bdXO0TIDyJ5bGDsSbDXYJtX480VoVApF6yUSOH5M5TpTNcc4PtQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr20430284pjb.83.1613953302774; 
 Sun, 21 Feb 2021 16:21:42 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x188sm15210392pfc.209.2021.02.21.16.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 16:21:42 -0800 (PST)
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210220212903.20944-1-richard.henderson@linaro.org>
 <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a23bd52-be7d-96db-26e9-af1da9fc116c@linaro.org>
Date: Sun, 21 Feb 2021 16:21:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 4:12 AM, Peter Maydell wrote:
> On Sat, 20 Feb 2021 at 21:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> I guess it has been a while since I've run aa32 risu on aa64 host.
>>
>> The launchpad bug is something that should have been seen from the
>> beginning, but the similar aa64 operations are expanded as integer
>> code, not vector code.  The aa32 neon code has only recently been
>> converted to use gvecs.
>>
>> The cmle0 (zero) bug has been exposed by the recent constant
>> propagation improvements; previously we saw a reg/reg compare.
> 
> Idle thought: would it be possible to have a test framework that
> exercised the TCG backend without being dependent on a particular
> guest frontend?

*shrug* The question has been asked before.  It might be possible, but it's not
trivial.

In order to actually test something, there has to be enough board-level stuff
to do something.  Which means we have to at least define a virt board, the "tcg
guest" front end that can read the tcg input, etc.

It's not unlike gcc, for which similar "can we 'just' test rtl" questions were
mooted for years, to no effect.

What we haven't been doing with tcg, which did happen for gcc, is the regular
and consistent addition of regression tests. But even that runs afoul of the
fact that we've only got docker cross-compilers for x86_64.

Also, it'd be nice to actually run risu regularly, on all of the tcg hosts,
which I think is the main failure here.  We did all of the recent NEON testing
on x86_64 and (apparently) none at all on aarch64.


r~

