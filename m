Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B83DAC8A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 22:13:19 +0200 (CEST)
Received: from localhost ([::1]:40662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9CP8-00042q-N9
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 16:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9COH-0003MC-RL
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:12:25 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9COG-0008S5-9X
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:12:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so10018455pjn.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j2A183hfOBJacO/0D9SYxRmx4YQR5EtyixbRFn2qv2Y=;
 b=Tfm5eUFnCOJtOzoJK2t1Rm+PxedBn8jJiDTj4xctYVRqjmM4R5tE35f+kgx1VXqWX5
 oWypdGrH3M1Hk1LDNrWtM245i77z3gPJu3593JW54qgyXkJgNjywFRx6gdWNhPaHY5f7
 EGJQhW028bX/+7iZWR5UyRHAiMzlPsmsEshNIN5pq0VnIKa8NTxAecaDQ2/YPRpxuhkd
 pE9WgvrMBRJcm4eT0HgHReTanjgQgUjzBZvMwfWnlp856oqR/PcQGNO/R/eVbbTO+U2f
 rSr+Q1Gu0PQNeDn5WbipNbRkyARazgxoMPwtHLOg1HoZ1Wn95CMkHb3gujCAMaKbb56/
 mlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j2A183hfOBJacO/0D9SYxRmx4YQR5EtyixbRFn2qv2Y=;
 b=ltMfxfPuxb8o/dnTYP0+AI8+l7t6ZJ8PVWvXaZILKGMWlKNXjiMdsr7ehnAEHG9xOA
 s9J7z6YLRMQIA9jeRPyOzNlUTLa1x4U9Tyjh39XWOBt1djZ/h9ADf4wRrTOD9CaW6+qG
 y0aG+uaHzmrKtWKiMLELrM9gG9SCnMGgw3RXPtSC3tqYGCOXvRb2WNLl7fwKKvFgXRfi
 DF01H/sYtTfUgHw3YXKjfGpJk9n/Xn/T8E4OIPZCbZMZ8CjxER96L9/5gqKe7M7mV2Vs
 hPxMOZoJen/2tE9i2jcpVH4j3+PY4YP1c4xwMIBGBePZuNGHdI+XQrQijdhblDmUhsil
 ORZw==
X-Gm-Message-State: AOAM530jjnfsznBubXp49MpiyRQfDo0Bmx9Q1G+h7kIxQAZzens7Yr8M
 ghSp9ZK/61YzWK1LuZshezxplg==
X-Google-Smtp-Source: ABdhPJzD4PB6Q7VC61Ndhs94GrX+pUamWofMMfvZFsnbUUUGUkCF/v+MsUoCJlkfYZ/oFro8KOhqpw==
X-Received: by 2002:a17:903:4042:b029:12c:8a5c:3d4b with SMTP id
 n2-20020a1709034042b029012c8a5c3d4bmr988907pla.71.1627589542514; 
 Thu, 29 Jul 2021 13:12:22 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id g4sm5106845pgn.45.2021.07.29.13.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:12:21 -0700 (PDT)
Subject: Re: [PATCH-for-6.1? v2] target/nios2: Mark raise_exception() as
 noreturn
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210729101315.2318714-1-f4bug@amsat.org>
 <caba47e2-c139-aae3-d5f1-8a4118c282d8@linaro.org>
Message-ID: <64a78990-8501-5bbb-a26a-56a58d1d3f50@linaro.org>
Date: Thu, 29 Jul 2021 10:12:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <caba47e2-c139-aae3-d5f1-8a4118c282d8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Marek Vasut <marex@denx.de>, Jeff Da Silva <jdasilva@altera.com>,
 Chris Wulff <crwulff@gmail.com>, Sandra Loosemore <sandra@codesourcery.com>,
 Yves Vandervennet <yvanderv@altera.com>, Ley Foon Tan <lftan@altera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 9:13 AM, Richard Henderson wrote:
> On 7/29/21 12:13 AM, Philippe Mathieu-Daudé wrote:
>> Raised exceptions don't return, so mark the helper with
>> noreturn.
>>
>> Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'm going to queue this for 6.1, since I have another bug that wants pulling and this is 
trivial.


r~

