Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01800697A55
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:59:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFV8-0007EK-Sl; Wed, 15 Feb 2023 05:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSFV6-0007E9-Be
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:59:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSFV4-0000d6-5s
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:58:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m10so9774302wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17DwcdAuO186ATYZfHZmxUkSAHTSOHnNI5F7KGwMHro=;
 b=hSkOGC3MANHMzyQhJUt9HvsXwSXmuVEjynUdaDQ/K9a6uWz1DlH60pv7aUWWylORhg
 ENxu4HEjdz1CQm3MEcfYgjCxT1tgw8DLvjw3KvmbQK+KFJ1ETlwVxT43g6AFfn8lmTdS
 XO5oaQpZ6Idn6+sJNkQIB+ImtdC3oGEz9wquD6gygMKeMQ0rgLuMoKaYouGwf2jCEBOw
 q4IjEWm3k9e5km2kjAi6e226oZNuxpsqSuGI7tQ/BqsXroowMTkt1PVSu6tBCCWk+HjM
 nGG0w8pqqXo+dGpD+E2mCf94+jgJ3CRYa6uG3vbfMxKmiYkc9stYaYLtr8WUgmBXj2W8
 WS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17DwcdAuO186ATYZfHZmxUkSAHTSOHnNI5F7KGwMHro=;
 b=mTOtOYL5E2bUIfSOqPxJ1IQ06/jrmQUaqFueqYY9ALCyLx2LH2BhbC5LfrvcAiNEml
 5vwl9AegPYpw/R/KCyk/JHDlZJnshjpfkQbSFGg5WRh2CrHMDSuNb60C79xbE12Ju6qp
 eW0GLnkI5EKCZdnZjIIfLuSfR5Po42FcrCpc3l25Vrk5ab0/CNLFpToceVQ088sSeewo
 5qB8MC2aJ0LoyocFa7vqS97lWW9vbhSICCmXIF8mJw0tQ09wOKaofNyrWtmHRFgQSyUD
 uiWR+G1Gg7RsmYUM7OPZOYL8uHdt6JOBx1b9VcEJIkmCVo+26cEagqOLovq1+EzsejYn
 +9/A==
X-Gm-Message-State: AO0yUKVfQ9YdQo1EQM7qXqJkPOqSWZyRRtnLtR0btkh6G68mz1zygiZZ
 wjI9cmLYjD+c7QUrhOHjyqkHew==
X-Google-Smtp-Source: AK7set8jX/Ga31gLVtsEAwDMENOnghkGqLgp4lDupnpMUbXhZ7K+uRwmTAthZsA2zAv5dooLjlZRIw==
X-Received: by 2002:adf:dc8e:0:b0:2bf:c09a:c60e with SMTP id
 r14-20020adfdc8e000000b002bfc09ac60emr1189926wrj.2.1676458736446; 
 Wed, 15 Feb 2023 02:58:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:29a7:806a:58e3:c738?
 ([2a01:e0a:5cc:caa0:29a7:806a:58e3:c738])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d4e4f000000b002c573cff730sm122747wrt.68.2023.02.15.02.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:58:56 -0800 (PST)
Message-ID: <2e74fa1a-fe6d-8f1e-e607-d18c1b7127e0@linaro.org>
Date: Wed, 15 Feb 2023 11:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/4] target/ppc: fix warning with clang-15
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-5-pierrick.bouvier@linaro.org>
 <fb705dc1-0a15-d265-12af-7729bcb50ead@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <fb705dc1-0a15-d265-12af-7729bcb50ead@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/14/23 19:10, Richard Henderson wrote:
> On 2/13/23 06:13, Pierrick Bouvier wrote:
>> When compiling for windows-arm64 using clang-15, it reports a sometimes
>> uninitialized variable. This seems to be a false positive, as a default
>> case guards switch expressions, preventing to return an uninitialized
>> value, but clang seems unhappy with assert definition.
>>
>> Setting the rnd variable to zero does not hurt anyway.
>>
>> ../target/ppc/dfp_helper.c:141:13: error: variable 'rnd' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]                                                                              assert(0); /* cannot get here */                                                                                                                                                                                    ^~~~~~~~~
>> ../include/qemu/osdep.h:229:20: note: expanded from macro 'assert'                                                                                                                                        #define assert(x)  g_assert(x)                                                                                                                                                                                                         ^~~~~~~~~~~
>> /clangarm64/bin/../include/glib-2.0/glib/gtestutils.h:235:49: note: expanded from macro 'g_assert'                                                                                                                               if G_LIKELY (expr) ; else \
>>                                                   ^~~~~~~~~~~~~~~
>> /clangarm64/bin/../include/glib-2.0/glib/gmacros.h:1186:25: note: expanded from macro 'G_LIKELY'
>>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../target/ppc/dfp_helper.c:144:42: note: uninitialized use occurs here
>>       decContextSetRounding(&dfp->context, rnd);
> 
> I think the problem is with assert(0) not being seen to terminate.
> Replace these with g_assert_not_reached().
> 

Indeed, that solves the issue. Thanks for the suggestion, I'll use this 
instead.

> 
> r~
> 

