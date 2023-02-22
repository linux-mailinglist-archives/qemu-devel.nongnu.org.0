Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF369EBF6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcyR-0005aF-8a; Tue, 21 Feb 2023 19:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcyP-0005Zm-HV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:27:05 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcyN-0007vE-RS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:27:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id pt11so7634372pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sIAfs8a7zSLWG5BXj2wyC+bWUOCfnOoYK7hF1TRwmRw=;
 b=RkuFM29pz1C7eM3WrHsub1ORy9rV9duYv9GpxenIRvAXHqB7zYuFMAvFihMePKbnnE
 H2Fi4GRZJuyepgphNmsGqmJYFjHz5qj/vsh4VRH8MVWxJ6EI5b9C7LW4s+4B6xjb3df2
 mWduYv8H0rFu4YEo6YZbqQhDkVZPvH1YuQ0OhdKw2VkjW8vCJp2usZLZ7q9FM7AZWqMS
 dKuplqd0xKiHDB2i/wl3a6Y3vjPOtJuH0vmTIzQSsSTV7qd9sm8Fh4QNg3/g7eY5/YhO
 dHrMZYx3acdp4XV3PRMrBGZoKEGJUhyfGjd9kc6tUguo0mVS+zdxIgyDzOCackoj1W8i
 BoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sIAfs8a7zSLWG5BXj2wyC+bWUOCfnOoYK7hF1TRwmRw=;
 b=Seon56TVuKjCVW82Lc70EgDq7RrVxJhqgBWLk0G0daZGUzM2CyC7VVSqh/R9S5dq6/
 KQS0zd7K7N1N7bdfiGZejsWoCS4i9Ffc9u+1gapmvISRPv5sUQKR5ii3USwscV52C2gy
 mUs1zh6OM2rYGqA6gGjTq2q/yT7jr4PFHWDWmHxvCfnMIzlvmojdia7GG8jnMOckFnTr
 5kfWb8Fi65fWg/POOqHmADrCXlA4qUr9JKAcM0wI7dCWAyTrdMtOoRkI1OpzrU2ROIYR
 9o6My0eR2ucGfm5BD7daV4q2zHpoi0ZPtP6kiQa9RnrbwOq3sCQThR2mFaxo5Asa9FnX
 LSPA==
X-Gm-Message-State: AO0yUKXE9g0dm2WdUM6OFJyrADdDmHuci8NfD4VAbET0LVHfjwZPRuks
 fgiAAuYsIXrZpcXvV9aGp9rjIA==
X-Google-Smtp-Source: AK7set+u1nTqRwjR75EkMeZLSQCHkoVfU46cnPwaNSA6bmHbZwhWAQaenxLXcZEwFacuDqUWygfkCw==
X-Received: by 2002:a05:6a21:3292:b0:cb:95fb:85e with SMTP id
 yt18-20020a056a21329200b000cb95fb085emr3256443pzb.3.1677025622146; 
 Tue, 21 Feb 2023 16:27:02 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c17-20020aa78c11000000b0056d7cc80ea4sm3921973pfd.110.2023.02.21.16.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:27:01 -0800 (PST)
Message-ID: <c0eeb1e3-3c79-99df-e0a7-f4dc59c1d096@linaro.org>
Date: Tue, 21 Feb 2023 14:26:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 09/24] gdbstub: move chunk of softmmu functionality to
 own file
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:52, Alex Bennée wrote:
> This is mostly code motion but a number of things needed to be done
> for this minimal patch set:
> 
>    - move shared structures to internals.h
>    - splitting some functions into user and softmmu versions
>    - fixing a few casting issues to keep softmmu common
> 
> More CONFIG_USER_ONLY stuff will be handled in a following patches.
> 
> Reviewed-by: Fabiano Rosas<farosas@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v3
>    - rebase fixes
>    - move extern to internals.h
> ---
>   gdbstub/internals.h  |  43 ++++-
>   gdbstub/gdbstub.c    | 421 +------------------------------------------
>   gdbstub/softmmu.c    | 415 ++++++++++++++++++++++++++++++++++++++++++
>   gdbstub/trace-events |   4 +-
>   4 files changed, 470 insertions(+), 413 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

