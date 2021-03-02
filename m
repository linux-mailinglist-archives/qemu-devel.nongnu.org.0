Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A209E32A9B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:51:04 +0100 (CET)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHA6m-0000ta-T2
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHA5L-0007eV-R3
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:49:31 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHA5K-0006gS-38
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:49:31 -0500
Received: by mail-pf1-x432.google.com with SMTP id j12so14378309pfj.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 10:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0hNI9Je9/PFnj4rNNqpwF5fhTTAFke5ISTvvljGLRfE=;
 b=LNsxQUC1sEDwEs6afXAOmulJ5DsVNqi395C3FfV7eCshKC1dW58pn5Mel6TED0947N
 fxiqtpyYCgE4q3jGPvCyf6B03Vdp8ik4jkDlgp7yhBUxf909n6E5DIrAA25T6BVU0XCs
 D5SBqHQGSswvbNsmGFp4JM0Skrk/6BIMCCLhyq2X0VL58FC7MOci2Vl1WVjQCA9cn+kz
 eDN6JzaiiLcNw6zSLPYEH5oESJ1RATp6yT8h+lPb+2ggTeJEojG7sjWDVqZ7yBYOwhGr
 pFSSrLoTMYa0qpxes78g9LVvHr/4hE0jfcNeHTG1wY2IzrTY0QVtPrnB/hMPtWuti58P
 Td1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0hNI9Je9/PFnj4rNNqpwF5fhTTAFke5ISTvvljGLRfE=;
 b=Y7VmUiCBpBFseMbvDQstY4XvOrpU1hrxOjnYMnYF8R+cThUUIeAM4UH0gJSnSBxgnb
 +qbQqkmBGRNrWNpI3/e/MaQEpYAthjFpgu0K9cIhNFXQ20JuCXpGSyzn6OWLr79Y0K2u
 c8AB5BM4M+/QbafiCquwRTK7NjN85OtauD20uXcnhQavNAwZmrA9imXvwXWJwP+rPX03
 1zAb9lfnYQnwqY8ZxM4xo6DrKohzWZj8S8O3vttTHSsS8j/5TwYwHh5ac6Zc9m8SicLm
 33GmIgv9d9ulUdtnxTLK7J45B6vbo+eF0fctGTH2n8Oytj8tW0AUSe/jQULTo42AJnxF
 yaaA==
X-Gm-Message-State: AOAM531c8lrFO5ircgm/R+cj1QWjPl67sSlbGBWx3dSrV7Wef6HpOCxy
 EXDCDUCDWWvhVpm3NTAdg4xjZQ==
X-Google-Smtp-Source: ABdhPJzdjPeCMB1wQQrw5h3zuDwjxejl4rWpZGzaisxD6ZuguqCy2BwLobq3oaiZq3c+Fb4THsXXkA==
X-Received: by 2002:a62:8051:0:b029:1ed:d704:1f11 with SMTP id
 j78-20020a6280510000b02901edd7041f11mr4525862pfd.41.1614710968449; 
 Tue, 02 Mar 2021 10:49:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i66sm6714518pfe.31.2021.03.02.10.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 10:49:28 -0800 (PST)
Subject: Re: [RFC v2 21/24] target/arm: cpu64: wrap TCG-only parts of
 aarch64_cpu_dump_state
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-22-cfontana@suse.de>
 <6d8ff697-aff9-0f56-6f68-1deb428e0ee5@linaro.org>
 <cd93478c-00d3-c6b7-1529-7e52c33b2446@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f8e5f5c-efd9-4206-f4c4-459ddc138643@linaro.org>
Date: Tue, 2 Mar 2021 10:49:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cd93478c-00d3-c6b7-1529-7e52c33b2446@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:01 AM, Claudio Fontana wrote:
> On 3/2/21 5:56 PM, Richard Henderson wrote:
>> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>>> -    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
>>> +    if (tcg_enabled() &&
>>> +        cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
>>
>> There's nothing tcg-only about this -- kvm supports sve.
>>
>> r~
>>
> 
> Indeed, on my box I am using probably just the cpu_isar_feature check fails.

Yes, sve-enabled cpus are quite rare so far.

> This is basically an open question: do we need an sve_exception_el helper stub that always returns 0?

Hmm.  I think not -- this is checking first that sve is present in the cpu, and 
second that sve is actually enabled at runtime.  There's nothing tcg-specific 
in either test.

I think we'd want to keep the sve_exception_el check as-is.  Just document the 
use path.


r~

