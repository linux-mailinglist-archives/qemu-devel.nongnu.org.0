Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A03011AF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 01:29:39 +0100 (CET)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l36o7-00080U-0q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 19:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l36n9-0007XN-PQ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:28:39 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:40306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l36n8-0000hA-89
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:28:39 -0500
Received: by mail-oi1-x22a.google.com with SMTP id p5so8018049oif.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 16:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WILz/Xu3qYij9v6cFcOxZMczca9WOI19FVI7iUCQJIY=;
 b=nBNwgJtzlPvqtUKsnUHbV/R6XgdYXSmtVAG4kud3CrvxWry9Y7lff/0Lot/KRbZA8K
 BxJphCcoyC2rdAZRXD6i99QluntQfkmpPr37SuV7rdbznBDqk293iXbF+jVli6HKasKZ
 McQlxDx2TWet08eTPybn0YxqCRQgihwlhA0kSmyWBQnLZ5kGuj7Ko7Qg0ngVzAyQvtov
 oFswfHazOGYUkLnbAAA9dSKyRJ7XnuyuOTalnmn0+pUR4nl5iJidXJjrcD8mR/dpwP/c
 BuZ9n9XN4hEO4txtbpHenNbfYBcgTr7fwePpJ9GEnregbEzGDeQL1ll3ZV9ZVHe/Q/w1
 tQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WILz/Xu3qYij9v6cFcOxZMczca9WOI19FVI7iUCQJIY=;
 b=mFBrDPJu84tnLaB6IsaGAtl5aF7M3fTHficsSw7UEDCHBXPHLthJHbo4lUSCbV3LQt
 COKVCxx+MqhTYkzkOrqSSEl5JQkOwPaIe6yLfnk/2kq3Y4Uf3l3Lvz1l3M+R3ini63I2
 4weKmGFCOr2Hk3xHkkKpN1I/uDgubJFkX5JAxwaul04Ej7+fuqxSxJpLjLlcqVCLlAZe
 7/dxrH71CW21+a5p71woFokyfUSwd1Rzofu0l8Q5mj3rApIRQ2bUFt3HQ6QoLDfSyS5e
 SH4ikih3/22CthViZyFLuOTvSansy+Gu+qqFl7tKNBQf2HwbZuHlEczLFCD1ldC8cZbn
 Wj9g==
X-Gm-Message-State: AOAM532Gcgxya713IzIm/hGjHOoCLt8llSUsKbyq52tWzLlYGOuOL/vd
 Id3huAuvRGA/zr/u6PjEcuBU6Q==
X-Google-Smtp-Source: ABdhPJwcGs325Id6xZloZ86GKntsHSRXdmzJwsBDOuSfnR9hIWP+F2dU5uN1rwCpqbApxYUipuePgw==
X-Received: by 2002:aca:180b:: with SMTP id h11mr5042727oih.18.1611361716930; 
 Fri, 22 Jan 2021 16:28:36 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id r5sm745343otd.24.2021.01.22.16.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 16:28:36 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Remove PSTATE_SS from cpsr and move it
 into env->pstate.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210122044537.1823-1-rebecca@nuviainc.com>
 <20210122044537.1823-2-rebecca@nuviainc.com>
 <d2a1c4ed-cac9-4bb9-9c13-e47132df3af9@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <fcf91a71-f023-f4ce-adc4-d8925be3970f@nuviainc.com>
Date: Fri, 22 Jan 2021 17:28:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d2a1c4ed-cac9-4bb9-9c13-e47132df3af9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 2:03 PM, Richard Henderson wrote:
> On 1/21/21 6:45 PM, Rebecca Cran wrote:

>>           cpsr_write(env, spsr, mask, CPSRWriteRaw);
>> -        if (!arm_singlestep_active(env)) {
>> -            env->uncached_cpsr &= ~PSTATE_SS;
>> -        }
>> +        env->pstate &= ~PSTATE_SS;
> 
> Why are you removing the singlestep check?

>> -    env->uncached_cpsr &= ~PSTATE_SS;
>> -    env->spsr = cpsr_read(env);
>> +    env->pstate &= ~PSTATE_SS;
>> +    env->spsr &= ~PSTATE_SS;
> 
> This loses the saving of cpsr into spsr.

Oh, right. I've fixed both this and the above issue in the next revision 
which I'll send out early next week (giving a chance for any extra 
feedback).

Thanks.
-- 
Rebecca Cran

