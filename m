Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350739E99E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 00:29:41 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqNka-0004I7-Km
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 18:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqNjX-0003Er-PR
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:28:37 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqNjV-0006r4-Tr
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:28:35 -0400
Received: by mail-pg1-x530.google.com with SMTP id y11so6812362pgp.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mTAneNeedfm1uGaVjj26rdeGIk1K/eAP05nx/fPFUPA=;
 b=Uojmb9dHYWkVFy43oC38HcGq/xCxkuGlLt/pUhyI/Tb8MSm2dbV0huxtDiNvi8xmNH
 136WUZJungE+49l0RBULoKdG2ufN/P82Wh04Cn3Lib5d/iMcKOXEWGMNq3pLVdxINwCX
 Yq5t0kIHsJekpMdzge861FO7hdrKIfAWESe0IKh/JmebMC0c+JHRqBqxuFPPzo8rtwU8
 6QCeS7DCUA3vndt0dfyrig+T/xLLLUAXncGQO+av1kwGzG5LDOZD7fOs+rk567LXbRWr
 85HLY0HRiVPJG77hfSZaH7Yg9ppavfVS7zpGOfIxLjw7Jzavlsd8Ilo2+Ym2FsoJrPTA
 CUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTAneNeedfm1uGaVjj26rdeGIk1K/eAP05nx/fPFUPA=;
 b=kk+ELlIsxeWFLvptukaVuy2/pMpuiHQYc1Yld7aJEZvwLyyEi3pgXQy7gHxKm6LahV
 KD0ogVf5nLGQWe7t5UZfgAXO5nEgcRqd1tdqha//Z2h15NK2WfyQzgqJOKJE4OpMr1n8
 YZr+jTVErS73wvE8Ars3qdOr4X7fDbrzt0vNnMgLoYh/39Joc2GCpugAcV0U4Im/dcd1
 103+30t14rwxA12GM+hUJd5LoJxeVXpkRRP7menXBucuTc9Va5khEiY2zy+v8Zd4qRvD
 OtLtm0CQJe0t8f82J78CxCUeBrbDqQ2YSBJOms3Act1wCEgNBitihsu6MQ8dyipGxAfT
 a8SA==
X-Gm-Message-State: AOAM531cU8nJORT3gyeGgBhbLMImIdxDofvxOIbRAr0lRMDFYPESJtOE
 YCgz7YfIFlgKIsY5KyZjBZrQKQ==
X-Google-Smtp-Source: ABdhPJwCpChl3IcYVQ/Qjc9HNkC1vm8VdxKDQcVTdtGT7QppTl0Ol0dZSJoSvl/YAuBj69TAZ671HQ==
X-Received: by 2002:a05:6a00:23c2:b029:2f1:b41b:21ca with SMTP id
 g2-20020a056a0023c2b02902f1b41b21camr3037932pfc.13.1623104911731; 
 Mon, 07 Jun 2021 15:28:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p36sm9637157pgm.74.2021.06.07.15.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 15:28:31 -0700 (PDT)
Subject: Re: [PULL 25/29] softfloat: Convert float32_exp2 to FloatParts
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-26-richard.henderson@linaro.org>
 <CAFEAcA9Ufm3hkfawYQz45N2ekRxRJhMOzN3+fD-5gtRshQQj5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22c1d82b-7c86-3b69-0a28-df77a63f95c3@linaro.org>
Date: Mon, 7 Jun 2021 15:28:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ufm3hkfawYQz45N2ekRxRJhMOzN3+fD-5gtRshQQj5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 2:07 PM, Peter Maydell wrote:
>> +    FloatParts64 xp, xnp, tp, rp;
> 
> Coverity points out that we declare tp here without initializing it...
...
>> +    float64_unpack_canonical(&xnp, float64_ln2, status);
>> +    xp = *parts_mul(&xp, &tp, status);
> 
> ...and then here we pass &tp to parts_mul() which looks at
> its various fields. Missing initializer of some sort ?

Typo in the unpack; should have been tp.


r~

