Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4193ADA5A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:18:51 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luboA-0007gS-6C
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lubnO-0006zC-O8
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:18:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lubnN-0002V9-6I
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:18:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e22so10570631wrc.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9CPjC2YRIMJubS9tOqfubP880XobFFD+gIwvQv+1gUM=;
 b=sJUtvXRBaLLrGg0TFF2ABmY+udafKcCO1BVHUOAqVnPrPgUdq3sCU6Pq9HaRW9vpxz
 sNlMxvFSk3hG04ae3jGa5a5SiwMtYJdfsz8HPfOnhp8FbkYsFYCzawvnemuQXgkHuabW
 DOl5sBqaB7aijsm2PUbshy7b3YuggRxYiq/tyPXAlvUuGMMiMRxz3kdyyM88buSY5JC/
 lz0xNHefnI7XPtfyn9FnAYeDlweXSvDyD+4DQ/UhTkxAMLL+7mGlKlUTjrQ/cbhL51SU
 f1RaFdeRstbL2hSwGCgOAH3+h2Z1m5HEsNNzupKob+78ocKMriLhJb3dR4B91Kt6URPD
 8lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9CPjC2YRIMJubS9tOqfubP880XobFFD+gIwvQv+1gUM=;
 b=U4c74JOwXwq3bOfKVNC6yDHetiJ0yGb+6slDY+8/fooWI8lAs3anbCVtD8/ZtC+qyi
 1tBJtpfPw7FpXCqpBsgl1e4zBko1Q4xf/z4QnQsVa22FwhGeDIThwycKdibeYfP8QqEG
 /JqeQHLLS4UpDuw63jN1RvAO4zC8EECRtKIp5Q7bI94vPsTxS9JJ1TgAEp6PTcJzBmBC
 KejIBs9fYEzfjaaLZMEa3KGFED3tYRVO06LhYt4q1tUWdem+u9vSIgL46YMzDzKsTNyn
 Bihp1D/IBtufIx51tHbV3UtYywcBTG4Dg7zsr6StRAJzon3NHKuxg+3mU/RupmaKIxHi
 2TDw==
X-Gm-Message-State: AOAM530t7YbbmPfy5IirePGP0flkKWSACUr3hURsg7ukGSNxC+EX2i02
 Utse2HUOMUBis/DzZJzy5cE=
X-Google-Smtp-Source: ABdhPJylhh4AoMrj7skkEECZU02FKke1ia9hSvRR9xcMvrYrEqfxvALsvIsb4kdhPdbxkoZFm6EapA==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr7203262wrq.269.1624112279315; 
 Sat, 19 Jun 2021 07:17:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm12550652wrb.10.2021.06.19.07.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 07:17:58 -0700 (PDT)
Subject: Re: [PATCH v2 07/23] linux-user/cris: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-8-richard.henderson@linaro.org>
 <5e279c7c-35d6-038c-78d5-19d84489a314@amsat.org>
 <522f9456-307a-e4d0-2006-753c7b795e2e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2b91655a-5295-d3f6-9e04-f134c778469b@amsat.org>
Date: Sat, 19 Jun 2021 16:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <522f9456-307a-e4d0-2006-753c7b795e2e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 2:55 PM, Richard Henderson wrote:
> On 6/19/21 2:33 AM, Philippe Mathieu-Daudé wrote:
>> On 6/18/21 9:29 PM, Richard Henderson wrote:
>>> Split out setup_sigreturn so that we can continue to
>>> initialize the words on the stack, as documented.
>>> However, use the off-stack trampoline.
>>>
>>> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   linux-user/cris/target_signal.h |  2 ++
>>>   linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
>>>   2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> Nitpicking, 6 -> 3 * 2? :)
> 
> Elsewhere I have used <bytes-per-tramp> * 2 if we have two trampolines,
> not <bytes-per-insn> * <n-insns>.

Oh, OK :)

>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

