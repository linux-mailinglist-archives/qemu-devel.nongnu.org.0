Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC9688AD1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 00:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNj2M-0000jf-6n; Thu, 02 Feb 2023 18:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNj2I-0000jL-93
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 18:30:34 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNj2G-0000p3-NY
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 18:30:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso7187089pjj.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 15:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZUQ9gh60Lu4bebqaat17mGsKDdGn/Zj/wbiXCisdK8U=;
 b=izEg0P8sF1SjFRi9wCwT7SxYSerAdbu4SZhpcWefKMv50YPS84oYtIlJKx3KMdgQWv
 l4UYwZL4hP+cjK9d14WOcFfzVF4SE6ovPwFM6PIvnNLsBJoyXitrWNdpDhPvT1pBYQst
 LdHzybZjkwIbnLHwyVRLB0YLCRKOu+1vHdCqSpcawBUl6mf+Oagq9R0iZNCwxCSPtWOW
 jmuUNcF5RT0CSeT3gLD7k/5LuTlpHabtCFfVWNSv/OcLraF710MNGY0twyg20w48cc19
 +T3GI31MD2bxh1KiHsgiQdNJKxXaelJ1mQGge1MfT+E3mIVXzqunQiF9/brIRFwzilmu
 5gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUQ9gh60Lu4bebqaat17mGsKDdGn/Zj/wbiXCisdK8U=;
 b=ou92zApvP961sDd/j5GwUX89QaZyLF8qYMNrAp4KMtPGT4dpq4Pf6UOb+dKs3cDCOp
 cqgt6KGOOlBapoB4RNLf5N/QxUSZpwpI5oHQWVdQUCstIB0eTqydFb00iF8ba3zDCxo2
 Wlj2GTFN07s5Eh9qAchmruva0p0zCah8ayd+kHlFnFH7u3uFSlI1NcKO0vCjNPauqW70
 nup1frIy637fsytIUpoDjReczdQdLSc2B848mjv6CCgp5VhyKpPhaYQ7Cx55OTwbSdsu
 kZ2GROiexOlwO4dmsaxlpTMGhkVHAMrxk/mMrVxk0oskgsl4Zaho+I2rRkd9bdRhapg6
 QdSQ==
X-Gm-Message-State: AO0yUKW1GtMyp1PBUPWdkMG7TchRfn928i7lUzi0aN8IhMRwNZFS/p8j
 M7KpmVE8MdDnBW+BdlVpU3dpsQ==
X-Google-Smtp-Source: AK7set+Qh8cmxDT7LBJkhtos0TZgvuwYtQtzI2ZhPBv/5z4RUZgpuIHkKbzOBmNBJaFoZXykjeKLvA==
X-Received: by 2002:a17:902:cac9:b0:194:4503:947 with SMTP id
 y9-20020a170902cac900b0019445030947mr6559876pld.37.1675380631090; 
 Thu, 02 Feb 2023 15:30:31 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 k9-20020a170902ce0900b001978e84753asm222249plg.65.2023.02.02.15.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 15:30:30 -0800 (PST)
Message-ID: <478e4940-ba22-6b70-119a-b7416680db97@linaro.org>
Date: Thu, 2 Feb 2023 13:30:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
 <875ycjlwo8.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <875ycjlwo8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 08:59, Alex Bennée wrote:
>> +    - env NINJA_STATUS="[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>>       - if test -n "$MAKE_CHECK_ARGS";
>>         then
>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
> 
> 
> This is too much for gitlab as it trips up on no output at all. What we
> really need is something that filters ninja output, counts the lines and
> outputs a dot every 10? 20? lines to keep gitlab happy.
> 
> Shonky shell script? Very clever sed?

NINJA_STATUS='ninja %f: ' ninja | grep 'ninja.*[02468]0:'


r~

