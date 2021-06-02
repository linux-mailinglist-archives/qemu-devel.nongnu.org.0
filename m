Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D9398F46
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:51:50 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loT9o-0005zm-RW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loT8c-00054r-Jt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:50:34 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loT8Z-0000v8-Uy
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:50:34 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u18so2493165pfk.11
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gw+wFUZUTey9qK260UYq6cEZEmQaRV36lrtgIe5s720=;
 b=k8wEXVqur3tHcLmc8fMZJIK1KC+PIj0xqpyqrA2DK2KMouVJLcCzi25UABr9qlfpHj
 +1auQgJbRPzjx4pIQ9XrKPoRkwDfedsrUxxIu28IT4xeM2rHVPMj3rDK/z8y6Q5ThZ+I
 MJMkPicn3a7oE0b9acEGXGjhwLiJ42Obd2Z2kL1fbGDnONYqAnv8ZosWm/p01sJxlxsb
 WaB/Txw2Tlbi8N3eGfuG0E1NxYNfsJkMU3AM1UXqEZ5cjuoxikNxIk7Recf/cxgZbR70
 GQoq1HoCnDBj7zlvtKf9weYlXpaB60uXE0VBE2+c32kP6lejTbP2uT/ceWR8pEt//hCy
 2Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gw+wFUZUTey9qK260UYq6cEZEmQaRV36lrtgIe5s720=;
 b=Jx/wL8pVH//C+sxtKQZQY7SrSOmnFgTy/GrhEgqRpAQlwgzskegkEgHqbkB2DpYB3N
 JH+urciqX0GgLehwiVnx2nWJDkfS4l44X0VbK0dyj+/l1EMkduDKov9ksV/Gt5LiuCBq
 Ye8YSj78EM71imPWi5V2ozsFr/uMOxya3yB1BoPCVhkpFmREM5bUDBNQnIzmib7QAUh5
 mTxYrf9MUYx8vX7pz5JKlztPkcBoBBkGqr4Que7EtAyEdC8+bhojJgnCv84LP85qa1x9
 UYU0oR/ADthJXUOrlEdJWXcF4+akBodMZh4qelQK6caLbIW2g00lrltlSLYYG2t1mn2F
 e7Og==
X-Gm-Message-State: AOAM533sgB+wWEx58xjniBopw9Fhh8H+TjFZFmMHxUzabmN4SEwCa+KC
 8sL7AFHZGyL3C+OxehDisOb/OA==
X-Google-Smtp-Source: ABdhPJwHwjNYukZvlVScq6sMXKCZvg4ZE2H3Jla6hlytirXOdn9LYsJdFRgY0s/Yb5ACX9ya823mGQ==
X-Received: by 2002:a63:1b04:: with SMTP id b4mr15374613pgb.224.1622649029775; 
 Wed, 02 Jun 2021 08:50:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m18sm86449pff.88.2021.06.02.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 08:50:29 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: fix single-step exception regression
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210601180237.296402-1-luis.pires@eldorado.org.br>
 <aa0c8f49-38d3-4ca0-89b8-0807cb57558f@linaro.org> <YLdHZuIlK4VEBlWf@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05523c8f-e564-2f61-5a39-eccac11c4f53@linaro.org>
Date: Wed, 2 Jun 2021 08:50:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLdHZuIlK4VEBlWf@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: matheus.ferst@eldorado.org.br, Luis Pires <luis.pires@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 1:55 AM, David Gibson wrote:
> On Tue, Jun 01, 2021 at 01:27:20PM -0700, Richard Henderson wrote:
>> On 6/1/21 11:02 AM, Luis Pires wrote:
>>> +            if (is_jmp == DISAS_EXIT || is_jmp == DISAS_CHAIN) {
>>> +                /* We have not updated nip yet, so do it now */
>>> +                gen_update_nip(ctx, nip);
>>> +            }
>>
>> This is incorrect.  Both EXIT and CHAIN *have* updated nip, but to something
>> that isn't the next instruction.  E.g. return from interrupt.
> 
> Any theories on what's actually causing the regression, then?
> 

I would have thought the first hunk would have some effect.  But otherwise this 
is the first I've heard of the problem.  Description?  Reproduction instruction?


r~

