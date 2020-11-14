Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F582B2ECC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 18:14:54 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdz8X-0006Hk-9N
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 12:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdz7L-0005hi-E6
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 12:13:39 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdz7J-0007sL-D8
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 12:13:38 -0500
Received: by mail-pf1-x444.google.com with SMTP id v12so9933429pfm.13
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 09:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E6w9hLysiIoXvBo1RY9hLsRKe/YpQ2w7XeY9fcTkyBU=;
 b=FQ33+fUZCdCxAtNv+mUPRKL9f+YrZLd1M/V8RNM4mM7GHbBUf9BDyqa2flAkY4PoCq
 ceTLYKZk3uinEwW2L4GtQSwXZexZ3q6P5x/6DNgj542e9ZXUfedQ+JCYSMSmd/BlAiXv
 cHWKhLCKtiX05G7cHKNX9rcs1vgKglbGusUyuvUoUhz2lZY5y1ufmdiBrWECUJCuYbpq
 IJuMboLn+hmRYtQOycUvwtCsNj4+A/h5dc7TSu+B1ObgoHYsm9m5qei7wy7F3DRCJaO9
 KwOD96z083TXgwwIMTHObxG3/jOvLMFWFGpGwXNiTpbIXWEoKWKJ1PX+Hmruvw27kCvm
 +tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6w9hLysiIoXvBo1RY9hLsRKe/YpQ2w7XeY9fcTkyBU=;
 b=DVNFAEhebBBeqgzLH68Rm47U11ec9aYDMpwrIWQoG3t1FocpRPVctgMlv+GMK7piFb
 jYP0wn7zJVhndoIJf4D/fx3TRDFCfeiQTTIPCRWN9ta4gi43bkLChhtG+cqhtNeTndpX
 wrDWMGb9cRiyKvAJH/7ZSwOOMWQsPOV5tOt4zkiSkhl1GH/GAQN2bYjPJc4961pF4p/s
 7vMCXjgrwYXkxDDl66omxwr0r3jD8tu+0dfSg8L+IAq6PBF50VEGhL/HV+lnV6wLpG6e
 nBMbC8QvBjbe1kuIO3p3jP5j4X0QNdxbrsFvN335HFBBMvZhx9Og26vPufUSivkOLJua
 4eGg==
X-Gm-Message-State: AOAM532tQArQ1Amu7Ngyp+jiHLQJMSUn7PLpJz3RujOI9z6b0VekfwJf
 u0nfvXVqJ6PHntd/O6h7KdLU+w==
X-Google-Smtp-Source: ABdhPJymhtt1NsvnyMp9E/iFhkgTInmy1WzRjtA5eUN2Qz6sKF0HZnh3Mguqlc60iYMTKbMWToMaEg==
X-Received: by 2002:a65:41c4:: with SMTP id b4mr6556955pgq.223.1605374015808; 
 Sat, 14 Nov 2020 09:13:35 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t85sm11337456pgb.29.2020.11.14.09.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Nov 2020 09:13:35 -0800 (PST)
Subject: Re: [PATCH 1/2] ppc/translate: Implement lxvwsx opcode
To: David Gibson <david@gibson.dropbear.id.au>, LemonBoy <thatlemon@gmail.com>
References: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
 <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
 <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
 <20201111062232.GC396466@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d106b7fd-6a76-ba91-d11a-3611b0f070c8@linaro.org>
Date: Sat, 14 Nov 2020 09:13:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111062232.GC396466@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 10:22 PM, David Gibson wrote:
> On Tue, Nov 10, 2020 at 10:14:23AM +0100, LemonBoy wrote:
>> Is there any chance for this patch series to be merged for 5.2?
> 
> No.  We are now in hard freeze, and this is not a bugfix.

Actually, patch 1/2 is a bugfix -- a missing instruction from an ISA that we
claim to implement.


r~

> 
>>
>> On 09/11/20 18:39, Richard Henderson wrote:
>>> On 11/9/20 1:17 AM, LemonBoy wrote:
>>>> Implement the "Load VSX Vector Word & Splat Indexed" opcode, introduced
>>>> in Power ISA v3.0.
>>>>
>>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
>>>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
>>>> ---
>>>>  target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++++++
>>>>  target/ppc/translate/vsx-ops.c.inc  |  1 +
>>>>  2 files changed, 31 insertions(+)
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> r~
>>>
>>
> 


