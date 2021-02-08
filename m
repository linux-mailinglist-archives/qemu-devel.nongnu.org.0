Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540553142BB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:19:38 +0100 (CET)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Esb-00014R-Ap
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AW6-0004qL-S1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:40:07 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AW0-0006Ok-QN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:40:06 -0500
Received: by mail-pl1-x629.google.com with SMTP id a16so8196675plh.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2sVJZp73AGcD2KmD25FwTa4R4Pb6J2TyrrhFo1TpVds=;
 b=Fkxt/KRi3y42MS4kTnvr1Ur/7JyD5/q8Y3vCn/vjiVG7bE8dVLrr+EPZlJYO5IeHJ/
 rMmIyi0LIxz9Zz3CC+wkt38HSXAOGeXZaYCszDSK/2TViZsoWIxWW3Jmrpt1biiuzflq
 2r6j9kQG/epQpe6b7/U15MPi/pgmztngMykJaMxUbVWNBP7DPTbh2t62xvDU2amVJ3m8
 PGNtztxRBJIKl0rijsw7ONF4gx7kmG6Wmr78XdFYBBUB4pmO6WoCrtO8epFyIGvHKkkG
 MeWLYpy+XOvALL2Ci5tz7ZY8IHRWdb9p5oRYJeErWeVY/BBCXvRMZ8XGhx08RXncS4h1
 rKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2sVJZp73AGcD2KmD25FwTa4R4Pb6J2TyrrhFo1TpVds=;
 b=tQr4vLiKKpHLipNLo/HsGuZZHv4EYMmc5hYqktntP7/bhNrjsCs3xq/keDIp7jyX6X
 fZYvmpDHts1l99IMJDVMvKmuCm8iqH/CGYPTD4aSaTAdEX/0SXl21ZPcpPVwMHAwu+lm
 VXxAMybLD9M0nduTxVBcuUPc3fKS9x81YGXCBhxuYbGpNwjINPtIwlcYz9f9EqSHP8cr
 r3vo3qiYHzdJkgSsWnNv41O7zF0koS8jE/ryuddUAQTA2z54ql/p1MVuHYQY2eAuFYz2
 S+Hs6B7Zv6/UgajzlrdImmPpWuKkVNO0NoWC09hduwL2TeXIlgSeahQp1xwBwcxmTHH/
 t8gQ==
X-Gm-Message-State: AOAM530rNLqx56SNmQvsCrT8gsAd5Ma4jclR8/WjHWG1BU9y/qygoU1W
 mvg9r3deGkd21gzmkCxrjHnxMg1HnTs1fg==
X-Google-Smtp-Source: ABdhPJxPCDJTPgjcoYKr6Va+020b34B7fI4hmzIXNE78zN+M23LxIzmKyhpRMniDzhtfa2492KVlNQ==
X-Received: by 2002:a17:90a:fd01:: with SMTP id
 cv1mr17697442pjb.77.1612805998412; 
 Mon, 08 Feb 2021 09:39:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 hi15sm16905999pjb.19.2021.02.08.09.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:39:57 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
 <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61a56eac-8afc-fa52-1681-21607b5294fd@linaro.org>
Date: Mon, 8 Feb 2021 09:39:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 2/8/21 5:07 AM, Stefan Weil wrote:
> Richard, this commit is also the one which breaks qemu-system-i386 on sparc64
> for me:

You'll have to give me more details than that, because qemu-system-i386 works
for me on a niagara5 w/ debian sid.


r~

