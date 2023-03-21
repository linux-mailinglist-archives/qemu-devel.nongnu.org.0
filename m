Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5C6C38B7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 18:56:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pegDF-0000X4-Dt; Tue, 21 Mar 2023 13:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pegDC-0000Wn-IN
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:55:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pegD5-0005SS-S4
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:55:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so6159832pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679421345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlQRdqHXEtNMcX28wvDYNDJfGJhofHNrDUripGn97zo=;
 b=AyCpWmvBRhjifV4th0GMODYaQiq4i7wRfIBDBw8X8wGOK5GXfngUws6DuKYBXSY1Ch
 mBExhVc7yEoPDYNZwRhII3vTDXZTlyJ4iks4X4mjQd8wGkaBpqASSHzJsitx9+NgTwUS
 rl895yDpLZ8Co597oelm4sg2WxZ2SDesOyRtq0gHRBnSJYphqYhfHXDAGRfAsTCR5qLY
 3UNqe7Pc2u19M9pda0dFC0NaMfL7gDHx+cbJTP441G/Y3ZHEu90XJ0lF9VwglpkBkvWc
 rAYJwmOxFVG9+i98pjtw0m/Dwba2uWI0lgVOu+GKvFcj8KiTIdGpntZ3+v+2lnldXUfe
 BWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679421345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlQRdqHXEtNMcX28wvDYNDJfGJhofHNrDUripGn97zo=;
 b=LHJuoMmSRG317XHU4UIv6B9Q4QUDXU/37gqJMyngZPVY8L63Enrq/p2186vQcMefKG
 Jwxy1A3ucQYliFYmOMezhmu7LBAuU/BmV8kiHMx9dw9gcD+y2hp0FgsZe1FqS+AFh8qL
 MugQGOd+wjcVwxim4K0Gl2zNtIUXQnFx1bueaD7gQTXjJv7YYCWsC0x+DY/Zt9u2c351
 1CpKfZI7g1aT5P3govhl6o7k1DlPlIN+PZzctiqV1uyO3HV8RCl0CwG872lMrQ4SYOsP
 rTSJn83sNDyAoMhz8NBvJcTGdd3YLD4+KEugxssVSqgeDtXrqwV2+gwZhKTb+lRtCOIx
 4Pyw==
X-Gm-Message-State: AO0yUKWEWqLFsUhbGez4Vxb+BHLzRvGph9sPQvYgrdqwOIb9fQ57TOX3
 rn1AiC8tYyIvDtjJv1f4+JHLdw==
X-Google-Smtp-Source: AK7set/qGwb8YrM7cFht4JveIFXggohPxPZLT3SYeTcxmEPnzQXrti8m5bpnCSjeF0bBOxZY/iGDig==
X-Received: by 2002:a17:902:ec88:b0:1a1:d544:e5ef with SMTP id
 x8-20020a170902ec8800b001a1d544e5efmr4202509plg.33.1679421345388; 
 Tue, 21 Mar 2023 10:55:45 -0700 (PDT)
Received: from [192.168.165.227] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 f17-20020a170902ab9100b001966d94cb2esm8946958plr.288.2023.03.21.10.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 10:55:44 -0700 (PDT)
Message-ID: <b4b65760-c967-0fff-bb51-8e7173faec2f@linaro.org>
Date: Tue, 21 Mar 2023 10:55:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] fix for #285
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230205163758.416992-1-cota@braap.org>
 <Y+92tpDQVytnfvnd@cota-l14> <ZBcY+WL+65D7Zi5F@cota-l14>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZBcY+WL+65D7Zi5F@cota-l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/19/23 07:15, Emilio Cota wrote:
> Ping. Any feedback on these two patches?
> 
> https://patchew.org/QEMU/20230205163758.416992-1-cota@braap.org/
> https://lore.kernel.org/qemu-devel/20230205163758.416992-1-cota@braap.org/

Queued to tcg-next.


r~

> 
> Happy to resend if needed.
> 
> Thanks,
> 		Emilio
> 
> 
> On Fri, Feb 17, 2023 at 07:44:38 -0500, Emilio Cota wrote:
>> Ping.
>>
>> This fixes a bug (admittedly with a big hammer) that affects
>> users with heavily multi-threaded user-mode workloads.
>>
>> Thanks,
>> 		Emilio
>>
>> On Sun, Feb 05, 2023 at 11:37:56 -0500, Emilio Cota wrote:
>>> Changes since v1:
>>>
>>> - Add configure check to only use QTree if Glib still implements gslice.
>>>    If Glib doesn't, then we call Glib directly with inline functions.
>>> - Add TODO's so that in the future (i.e. when the minimum version of
>>>    Glib that we use doesn't implement gslice) we remove QTree.
>>> - Add comment to the top of qtree.h.
>>> - Make qtree-bench results more robust by running longer or more times.
>>> - Drop deprecated API calls (they're unused in QEMU).
>>> - Drop API calls that are too recent (they're unused in QEMU).
>>> - Drop macro benchmark results from the TCG patch since they're too noisy.
>>> - Add test program to the commit log so that we don't lose it in the future
>>>    even if the bug tracker goes away.
>>>
>>> Thanks,
>>> 		Emilio
>>>
>>>


