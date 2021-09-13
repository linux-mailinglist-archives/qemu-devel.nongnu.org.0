Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEE40983A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:02:32 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoPf-0004mG-QG
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoKK-0000Kx-Cm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:57:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoKI-0006K9-OU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:57:00 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g14so9286518pfm.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Mi82NMluACGQ1bbAzrX/lfzTTMuYRPmWTKxIG3EexU=;
 b=P2CA2mytWrcKYPuuE3CxPZ/Ccwz15i22zY9iXvXGYRYxrXau5irZMtGTcjmIqI/hEa
 G3LpM7/SuADCM/Z5w4URZx5H1QqLU3LVsZpHzm+XP9JSCjOlRkyIr2RJKVb3mLJVLLty
 nmPnsyy076/eyniDTaXk9JHKlEydsEZBUGrFRYo0RdVs/ObdHFQpY2W3p1SxuDSPZ+6D
 b9OuUgYCKtCa01W2heKrTG4eSKmZEGh3epb1ZHx49tUO39gZbGU4mGOQSssf74vnlgff
 aewljmV19DH/eMswimCS4ahHLSRnmOs7UkW8KR+n3v+n0Hf9SVYCj0g6DH9raBK5LPVr
 8cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Mi82NMluACGQ1bbAzrX/lfzTTMuYRPmWTKxIG3EexU=;
 b=Z1x+SbFhcS/mRX7SW7vun92Ha+pKnWEIyVGqvYkw+jRubk/eUVPMVbNG5lQ/I/BI4W
 lG7wN/acA5rXAnZIZYGaoWlWC/evk2cMLhDrxSG12J2C6Fr7isDpw3w6vn+diNdj6CLh
 0R81oyIKkXF/rPuq4su27KobwTK/n6GUM2Esf/NFygY0Jo9l41NhpA9jP6gd7tBCh4Y/
 dk/XqPSokmLMDFX2gBZ6nHl9aDxy9hwFwKfEjZ3vWtjQYwsnbs1bo09xIl664IZlPE/K
 /EmgUtQgko1T37q/Xv9pn0X1sJAJbzv90Em6mwSfN35Lh4g/2cAZhDwApSSNX5ZK/vQJ
 FbEg==
X-Gm-Message-State: AOAM530oPXjWxjvsXoCDsARFLcOC+R5CLeJ/Nt2mcZgXlxzLfY5lY3Ld
 JPh3FG3xXbTwcp2QUX5PEXf+RkPxqMK4Fg==
X-Google-Smtp-Source: ABdhPJznKP/ChpmIOIQKpphE4DXSE0zSP5AmRJaMNna4AdDVaYf8KczJ46pOB81aRiacooZQyinAAw==
X-Received: by 2002:aa7:98c1:0:b0:3f5:e53e:119a with SMTP id
 e1-20020aa798c1000000b003f5e53e119amr222277pfm.43.1631548617289; 
 Mon, 13 Sep 2021 08:56:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q2sm7376271pjo.27.2021.09.13.08.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:56:56 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] target/arm: Optimize MVE VSHLL and VMOVL
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-11-peter.maydell@linaro.org>
 <0bcbd02d-abb6-de1c-efc3-d0ba465cdb9b@linaro.org>
 <CAFEAcA8q1Uo_79geDF3SGXt04RUSmo90+UumLxjOCAPX4HLb9g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <275b7dc6-45ed-ed32-a130-0c30a22b4960@linaro.org>
Date: Mon, 13 Sep 2021 08:56:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8q1Uo_79geDF3SGXt04RUSmo90+UumLxjOCAPX4HLb9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 7:22 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 15:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>> Optimize the MVE VSHLL insns by using TCG vector ops when possible.
>>> This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
>>> with zero shift count".
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The cases here that I've implemented with ANDI then shift
>>> could also be implemented as shift-then-shift. Is one better
>>> than another?
>>
>> I would expect and + shift to be preferred over shift + shift.
> 
> OK. (I wasn't sure, because and + shift requires another insn
> to assemble the immediate constant, I think.)

Yea, though Arm itself is good about not requiring one.  But there's generally only one 
shifter across multiple pipelines.  Not that we're doing any sort of compute resource 
allocation and scheduling...


r~

