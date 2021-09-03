Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225F400272
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:37:28 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBFw-0004Pf-1y
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBEs-0003XP-MD
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:36:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBEq-0000bk-4N
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:36:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g138so3772414wmg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJoWkIFRm9a51JgRLNbr/EXUc+eFEA96SZjYN+aZuR8=;
 b=Tyvy3ALiYtqZ7quWoaIiIkMFTIPHzgDLYG7oTLZ7QALx5TvZiB/JcQyvH0+a8VW7OT
 QEFyPSWNMMLe12cytOo7QCRKQrDZY0M80btpRz75cZBGbfqaqzYoSzWDL5LkvgesQ019
 EtDDR7bO64pp8BShF14jTwJZcMJ3+YYNQRi8GiozmY32n6PeMhlNG6Snf/bMwFQBXYCG
 SC8O2RIvYzeXZS2gU9BtqvVNb7Zo64VpvOyub4nftzdN4ndCXpfvHZOgOSG1gLNEaCdF
 q67uwLBOIzpz/Mrsa/+SZC0IbdydiYwrtHvgWwSdVUWxjtJCe58Gm2CvhY7t31T6Epvz
 9wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJoWkIFRm9a51JgRLNbr/EXUc+eFEA96SZjYN+aZuR8=;
 b=fGwBrl8QZaIQc14ezePsuApJTsSogsvb8Go9jNWNi+a9C7PCUkZII3gxO06FYkS8CJ
 oyfGXRpdTUsjbQZ8txDick8xrLwmziYPshE1w6jd7Bv/8SUj83Kgst+sEyIVEJzirKn+
 5OA0w9HroH4iQSwcwMlCcf3ShZDo7VdTTZcmSRsJ5VpfLXv1wew4PTOcFEvYz1DLnrj1
 0I2JiA6LkOw4wa8RDASv73mkV6oMTdaMWoX0bo4j3DQWjpT/D6I5bR8cShlHdUbuJUFl
 uzGlLM3fGCBJc8KVAUrN+EGD9sOvkWnQLics2aZ4DR+ZmZ6bSq41qaBGEyEFqk8hwpYN
 iRxQ==
X-Gm-Message-State: AOAM531c2cSTXSGiTD0/oVBZ6K04M6mwa+VYtSPPqD2JpgoX7wExdnBy
 /7WUBTWhwYTxmY71CPKG9K5Q9/ZM6gSqQxXYSAg=
X-Google-Smtp-Source: ABdhPJw4JWhH7Ib4teChPYXPL0TwYzcz5RpU99qtrkzph6SgR3Byp+JSfaejTU2ABaVoO+7vNPPoEw==
X-Received: by 2002:a05:600c:898:: with SMTP id
 l24mr1034153wmp.90.1630683378503; 
 Fri, 03 Sep 2021 08:36:18 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r12sm5344839wrv.96.2021.09.03.08.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:36:18 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
 <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afa6d71a-b710-a7ad-43ee-a3764ce85553@linaro.org>
Date: Fri, 3 Sep 2021 17:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:20 PM, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 16:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/2/21 5:09 PM, Peter Maydell wrote:
>>> Richard: if you have time to scan through the MVE insns
>>> and suggest which ones would benefit from a vectorized
>>> version that would be very helpful...
>>
>> VDUP
>> VMOVL (into shifts or and)
>> VMVN (which seems to have gotten separated from the rest of the do_1op)
>> VSHL
>> VSHR
>> VSLI
>> VSRI
>>
>> I think that's about all.
> 
> I guess also VMOV (immediate) (vector) ?

Oh right, yes.  I skipped VMOV because I remembered that the register version is an alias 
for VORR.  Am I correct that there is no mve insn corresponding to the NEON VLD1 (single 
element to all lanes)?


r~

