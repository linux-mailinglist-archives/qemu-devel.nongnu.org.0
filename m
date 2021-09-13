Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B684097F6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:55:01 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoIO-0005oC-8V
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoHA-0004pq-Rr
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:53:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoH9-0003nV-4U
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:53:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id k23so6679750pji.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+z3EExJbRiXHHo4RCGPl4cSeH4apr0WZRd4aNSuJRwM=;
 b=tOFbpl3uLbXxANYXckAFsvvXFhKhbQcrWCmskx51e6ViKxlGHf3XmGELPmt7Yv5ZLS
 l3P3GauYdZtJM2Z82jwMhJUU4t103MU+gLvY84jHfgEK+uZwzLwXsFKOihc9kCzROwRc
 dbZANzOq5P/It307/+gCp4IRgSrJ5mqnw+4Do4woSIBqvVgbMhAxCtUwuvX6cWg7pkj3
 rR9nDesCjizwHmQXM72Ywcbg6HpMMuAe0T/R2kgmiOq7de5sUqcstvzzxYtq+/r5kudy
 0E33QdB2M10LZ7nJkG37vILpWB7qRm0badal6eiCZXt6H0Ayenn+Xtaj/oY4PGzxPqrP
 Z3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+z3EExJbRiXHHo4RCGPl4cSeH4apr0WZRd4aNSuJRwM=;
 b=1/Tkek+kzF4WSHt9Vp2YK4gOxRcXu5nfegHnLH4lXcdZ0067qlu6kT9PGS7ti2vUZm
 GL2MFrwpt+SgFIJsUUi7OZGkDOrVt4/+yYAkWnkBzWoHIoEn2IYPfSUVJkaWqsTT7/6w
 2Qh7fGjpLDHBEpjkMXE787cfOU6Fp8iVkqPyPGylWPd9SZKeT4GuT32KTZlH5wxxgM6o
 /DdYL2fRiusmIg6KSQ08YcA9fN6eCU15S93vxJaqjO+fFKzTPS5azsW3DRjLW+dPhmTb
 wE7czmGGFL6RAPfaw8gzWUEKAl8EXxTmxqqx9iSQqk8yQ7PkgwMCsHCzTX8R3HMU/ejv
 9R4w==
X-Gm-Message-State: AOAM531aCe3XoFNbz4N9HABy4UeZ9IFIhNr/5AYXjrsvx3oJYEyJk0rj
 Lnx00ULb07NA1U6xSWcVc5tG6w==
X-Google-Smtp-Source: ABdhPJykUEl0dBskbvwGvWrrftR9x7zPm5o/y5Pokl8/mjQZORpH+aYsbohqf4O3GI/0/OUWIkXqGg==
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr254707pjb.15.1631548421254; 
 Mon, 13 Sep 2021 08:53:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j5sm7227900pjv.56.2021.09.13.08.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:53:40 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate
 forms
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
Date: Mon, 13 Sep 2021 08:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 9/13/21 7:21 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 14:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
>>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
>>> +{
>>> +    /*
>>> +     * We get here with a negated shift count, and we must handle
>>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
>>> +     */
>>> +    shift = -shift;
>>
>> You've already performed the negation in do_2shift_vec.
> 
> Here we are undoing the negation we did there, so as to get a
> "positive means shift right" shift count back again, which is what
> the instruction encoding has and what tcg_gen_gvic_shri() wants.

Ah, I misinterpreted.

>> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
>> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
> 
> I'm not convinced the resemblance is close enough to be worth the
> effort...

Yeah, not with the negation bit above.


r~

