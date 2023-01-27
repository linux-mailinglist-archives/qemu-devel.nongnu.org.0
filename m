Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C967DD34
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 06:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLHXh-0000jP-4q; Fri, 27 Jan 2023 00:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLHXf-0000j0-M4
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 00:44:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLHXd-0003Jq-3n
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 00:44:51 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so7611497pjq.0
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 21:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnnaWcXKSjqSCmfAC54VGbd+t0p9Rjn7KcnhAi0yR8I=;
 b=hXNoliyxlgk/btKWyiXf4LLMg/BN00vOrrbdDza52Hx9do8fdsQGVdvOkmeTp3Vvvg
 co6/qEdsjchSSzzxoniwl29Xxgl2UVYKzOaG4Vtei0dYVIrsCmSKkCUOYf9twn94LitV
 mlsQ1IstmVjtFBj/B1BOFoya0GoRCpuFi1TOteCimJvjNFAQlYsJTS7zkOAgVhSSZ2uu
 mlVPAKuQMexbJAMV9uvD3/uJaCBMTC6Hrmqj0b28/7yIR8CGb09f0Va9Xt9NzVugil2R
 jX5uWg1gVzshZtlIYlaOSGZ9EEMyFv8Rb/xYE6DEMhIiALGj/X60Mlg8lSUz83yPX95G
 6xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnnaWcXKSjqSCmfAC54VGbd+t0p9Rjn7KcnhAi0yR8I=;
 b=waowex+A//X1DNORk2BPiBPARkK5ItBkERLQUsNmzbGKMSy/6uAO0g7ZQ2lMH205vj
 mYsgBB0vlNBDfMaHmrodNrwZFs8envwpFPUim3wA/OhRYBE0tqsmjavGOKVCcmUYKj9j
 MMOCTXBJecvabbmwri8ct7g+/IyNHo5N+H0RwyhSRFF/hF3aVkwzV1M2CBxWLmoDo/fs
 8y1+8WA1DqoMvaKQY8G4hg2pZcj/W/4gLS9nMqNriqeE31HYIbguAwLXHMKPb4lqWqz1
 XhyEAbQlFewU4UtQz254ATC66NjGjo59E5cJ977qRNSsCwCXCm4SGK/HDK04tmn5vv1c
 7shA==
X-Gm-Message-State: AO0yUKXKciFNgE5k/sDYTMXl0h/LidE/nGKV0I6ZHNE3A5mAGuE1Ja/q
 OQcIJbNV96P2YNooNji5PjERsQ==
X-Google-Smtp-Source: AK7set+kFxIXkUR7rLF6W7yi6YpouzmXvl0W+9y7hIAqjU3dR3qruo9FWcILpKFjLbvGbf5/eC8PSg==
X-Received: by 2002:a17:902:ce82:b0:196:4328:a02c with SMTP id
 f2-20020a170902ce8200b001964328a02cmr5258863plg.69.1674798286846; 
 Thu, 26 Jan 2023 21:44:46 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b00196065e8d78sm1928239pln.50.2023.01.26.21.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 21:44:46 -0800 (PST)
Message-ID: <89d91085-1f57-17cf-5046-834f94b114f8@linaro.org>
Date: Thu, 26 Jan 2023 19:44:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 eric.auger@redhat.com
References: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/16/23 05:37, Evgeny Iakovlev wrote:
> Hi!
> 
> 
> We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for arm. Besides some 
> minor fixes that i have submitted over the last couple of weeks, one big compatibility 
> item for us is SMMUv3 2-stage translations support. We can do fine without it right now, 
> but having it would also allow us to test nested arm guests with SMMUv3, which is great.
> 
> One idea we have floating around is implementing 2-stage translations in SMMUv3 in Qemu. 
> We can't make a commitment yet, but before we consider it i think it would be wise to ask 
> the community about it, specifically:
> 
> * Do 2-stage translations sound like something qemu-arm would be keen on accepting? Are 
> there any other use-cases for it besides an arguably wild corner case of nesting an EL2 
> hypervisor on software-emulated arm64?

I've recently been looking at the requirements for the full ARM Confidential Computing 
Architecture stack, outside of the core cpu architecture extension just posted.

While it appears as if Hyp (and therefore stage2) is not explicitly required, it certainly 
looks like the Realm Management Monitor should be using it (since the guest OS running 
underneath in Realm EL1 is not necessarily trusted), and I would be surprised if real 
hardware lacks any of this support.

I would be delighted to review any patches for missing smmu features, and coordinate 
filling in all of SMMUv3.3 plus RME.


r~

