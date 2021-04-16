Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898243623E0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:27:18 +0200 (CEST)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQNJ-0003z9-LJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXQM7-0002n1-MI
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:26:03 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXQM4-00062H-Qw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:26:03 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z16so19418195pga.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NnuoOxPPrHMSCIm4Zej+9wfvlkfgebd1GmyNbptrKCk=;
 b=hOKJhL2YKrcucXA3tAuJ+F1usvMZoIFZe75RHTIU4J2MbYF2/byyVOGFO/TsOtkLw1
 wbzqLPv9XVO3d/3DNfjL/xQjQmuR4Bu9GHCxMXKheN3sqbkPxD/Z2x4tncG10OLv0dFe
 X0w9hig2FoyMr88nQg/sZ2b2SBD5bH/VKALXJWML6tfOkkE28wcg8CiSGJhSZvx9X/TH
 eKm044ywALTRAjqFUg4YuIx3nhttOZzY0qGfSDDPQ0iw4UxcV6Kg0Gb3nC0k+Sl7iSmu
 DnJIhm6Ztdwug4H+jTOal3vzNADm8HSU52RYWhHvpMflxrR9X1zjk9MgwLWi1qXGXGkj
 vfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NnuoOxPPrHMSCIm4Zej+9wfvlkfgebd1GmyNbptrKCk=;
 b=FoIgmB6YyVHG2H/Yn6mCtG/hMMujl14JK7kuyiSF441vqDY8Z+wbnXS9ey/syGeKLT
 hl/S0wWJ9+9/364uvDPHGj7ZH5WieLRBkPxzKL0dR6KcD34i+NqbfZGlsUCqsbocyxfU
 t7zal9Q+cjaCBYI3yGxJdcKFpNX85vsGaq/R9aVkbavBOwooa+LikZDDMBvefrcL0k44
 km6dxd4yMWzFuFpLPlzgdJz15WFjmWOP0dMIWb/pKJ/O9qaHgBZEJsr/Tnz7KMyZ2/aY
 R8V4Lu46dHyxHm2mJE1Ig+s8OtyFJyBWNuDso9G7idZHHZQjsNhfqSXuGun/eDNw5dRF
 IP/Q==
X-Gm-Message-State: AOAM532XOzfDg841Zik9lm91GWUmrqBhiYinVHeoPBfYyLlZrn4cv4zs
 vgo2Gj4rQyc1KWNklFzR6dxkP7OZ4V9aJA==
X-Google-Smtp-Source: ABdhPJwsvP2WvoZral7oYAIn7eHkbjlY75B0DndYdDF7bTTJ4K58XlbGoqHGejn1LTDzykPXGqzX0Q==
X-Received: by 2002:a63:5301:: with SMTP id h1mr8402956pgb.109.1618586759408; 
 Fri, 16 Apr 2021 08:25:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c5sm5012941pfp.183.2021.04.16.08.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 08:25:58 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210416104010.13228-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bf90c87-fb1e-c7bf-5a2f-dfc5d56eaa00@linaro.org>
Date: Fri, 16 Apr 2021 08:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416104010.13228-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 3:40 AM, Peter Maydell wrote:
> The SSE-300 has a Cortex-M55 (which was the whole reason for us
> modelling it), but we forgot to actually update the code to let it
> have a different CPU type from the IoTKit and SSE-200.  Add CPU type
> as a field for ARMSSEInfo instead of hardcoding it to always use a
> Cortex-M33.
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a rather embarrassing bug. None of the test code I ran
> on the a547 model actually cared about the CPU specifically being
> an M55... Another one for the "maybe in rc4" bucket.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

