Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1D696C87
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzlP-0003fN-DN; Tue, 14 Feb 2023 13:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRzlN-0003f6-VI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:10:45 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRzlJ-0002td-Ug
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:10:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d2so15845753pjd.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZ6VQ/VIr+pd0WSx8K8JDRtfZw3h/AhTOGmkK8Y0Fx0=;
 b=j4d/vIHEWajCFZO5d5/rn6pVZKX45Jde5QSiDRa23cifQgIcJ8BEi5yYulyYkDPJPV
 3l5h4IPGcsHVhsrkq82BFCDWC7Vdn9iKzfHuhu1MP1GIgNYJfZobidZNjjkj5dvX3edc
 wjsaq864j9mZnUIAee8r+u/yh4iEoEnvg7kmyYSnI5u4Kg9Q6gTX1k2Jy0kmPo7QDH24
 B51SsoEORs0h5WnHBwaxjWc6+G3p6fNhSgKmhUsAQLvI6QGs5b0BgOUiTTzONAe+2zJx
 o5DzoTkP77F3Dx4bWvC7wF2ECL7Ls1vDvFOPlbcOpGNE5cnNLC79IeinBDBsbz2H1+S/
 Cz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ6VQ/VIr+pd0WSx8K8JDRtfZw3h/AhTOGmkK8Y0Fx0=;
 b=ol68BpAOzmuX2jicWWATB8hK6s/7Hb0TV1PbpablCDvbdolivvX6e/NsCksXaqv2cy
 /DnbU9PyIxwhrM5//QSY0Psb/m6kZ860yKcXp3ZkG8d3KAFvFMGdIKL7kG7EM/BSeiqE
 M5fvm92v+FTPR7COqHF048TtM7+n/gc+4talenAAFBq3OqEDRLClieddRI+0m5gMMscq
 HS6zxGbcd+QY78kXDEgNSPnWWeEmf5ELdJJu8jws6WtfZjoPRSUKP/mJMWdSr+au9kJD
 yP8jcEGvqUZ+gqQ5nHbAcqcSaVxAjKf5gKyl+y/mHkR8qNedladFV1fkblNTxitREBzT
 bXQA==
X-Gm-Message-State: AO0yUKXSv23XIlSbUi3hl1uCu9ZaRr//YmEoD8PX1FbJD098kY+ywDWD
 Ux0eTBc/+WlBdmRPhGlnSrtYNA==
X-Google-Smtp-Source: AK7set8F/tpCWYJNx/LTR7n6AM5aCeemgdy5IGw2TZUljM2By7bAS0ub4BlDb4OY1I0NY8p8/ZTAqQ==
X-Received: by 2002:a17:903:1ca:b0:19a:97e0:60e8 with SMTP id
 e10-20020a17090301ca00b0019a97e060e8mr4296519plh.29.1676398240332; 
 Tue, 14 Feb 2023 10:10:40 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jb6-20020a170903258600b0019a983f0119sm5066392plb.307.2023.02.14.10.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:10:39 -0800 (PST)
Message-ID: <fb705dc1-0a15-d265-12af-7729bcb50ead@linaro.org>
Date: Tue, 14 Feb 2023 08:10:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230213161352.17199-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 2/13/23 06:13, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert definition.
> 
> Setting the rnd variable to zero does not hurt anyway.
> 
> ../target/ppc/dfp_helper.c:141:13: error: variable 'rnd' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]                                                                              assert(0); /* cannot get here */                                                                                                                                                                                    ^~~~~~~~~
> ../include/qemu/osdep.h:229:20: note: expanded from macro 'assert'                                                                                                                                        #define assert(x)  g_assert(x)                                                                                                                                                                                                         ^~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gtestutils.h:235:49: note: expanded from macro 'g_assert'                                                                                                                               if G_LIKELY (expr) ; else \
>                                                  ^~~~~~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gmacros.h:1186:25: note: expanded from macro 'G_LIKELY'
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/ppc/dfp_helper.c:144:42: note: uninitialized use occurs here
>      decContextSetRounding(&dfp->context, rnd);

I think the problem is with assert(0) not being seen to terminate.
Replace these with g_assert_not_reached().


r~


