Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7813D638D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:43:15 +0200 (CEST)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83hC-0001Gv-Re
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83gU-0000bE-Gr
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:42:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83gS-0002WB-RC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:42:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f13so1833268plj.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OmNB5RXGATOlLIiKW/9hNFqMg6QWlwIHlNi502M7MZQ=;
 b=I3/TRNXXqPFCsUPC7QMxibsrF5I+wHFavA8HCvS3B+9xCsmfp1Dds/Fnz82RVVqnjl
 orYMFqzkfcnR2OYdp9Cr0YQuY4P7gbe+XwuLl+k1Tpr002yqCMYl6w631jSfiyL3vvNo
 D11iYYV7rntGuMqozO2mTR+18VrRi3wgl5klci8mZ2lc1s6IZaSAkgS8Z/C28BL5q3LE
 rPw+j5IZfE63uYd+jbBgYUXavTsgQdQO1VdIes+6Y15yCPUXRJ9YTgPP9UIiN5PrDzZu
 rcH5H78KsnaIBdjxodsEdifPO+GadBLpmv4kC2MFwHTOTOtZTyGD67+126JvZ/Pgsq4x
 I8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmNB5RXGATOlLIiKW/9hNFqMg6QWlwIHlNi502M7MZQ=;
 b=bQ/3MD0KkdMQNOm41sIb4GcZDQ5nApsm0beyYPiZKvuiJHL48/vM+/UcMbDfnYhVGn
 SO9T2NGQnhWmG4/vXMIcN+sJE/lkuLxculUIu7RudG34e61FTiJQiPCjIZWbdhhkU68y
 57O/hfnJ2wjjPVgFVlkJYPp5W2eWC4e7DUKVOJyvFMKZlRoWipL8AJIbSfagFTsKU8qI
 443QckYROSw7L3rq0PwWnE2kBJt6QqmNpk6BYvYLrhLotDkZ0yEl/9cU9wF7wAMm3O3u
 I9fZ0vLxW5kC2++Eoi4TSqEDcMyP40eFvwi+6HBduxnrvXP6yzDtoU8Y7d1U/fqS1Ktf
 AZJQ==
X-Gm-Message-State: AOAM532erkViJ9x9+7SiR7eAS5GC6gg9sWKv1kpwxRWJTk2x2qFQHLxe
 VdluU28ho/HSmegaAE93h2Smeg==
X-Google-Smtp-Source: ABdhPJw0pW5b8/Ae3tafoEq/uMa7nNQxw72cNVS4GJW57QjZmajyhPLrfKFNckErIiUmdXxNeWv+Uw==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id
 n12-20020a62e50c0000b02902f9b9b1d44fmr19390755pff.42.1627317747083; 
 Mon, 26 Jul 2021 09:42:27 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id p53sm494887pfw.168.2021.07.26.09.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:42:26 -0700 (PDT)
Subject: Re: [PATCH v2 12/22] target/loongarch: Add fixed point extra
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
 <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
 <a08adb9a-67fe-b8aa-4b72-a3b3548f4945@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67b93a73-466b-cbb6-89ce-1b1908d74898@linaro.org>
Date: Mon, 26 Jul 2021 06:42:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a08adb9a-67fe-b8aa-4b72-a3b3548f4945@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 2:57 AM, Song Gao wrote:
> 
> Hi, Richard.
> 
> On 07/23/2021 01:12 PM, Richard Henderson wrote:
>> On 7/20/21 11:53 PM, Song Gao wrote:
>>> +target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
>>> +{
>>> +    target_ulong r = 0;
>>> +
>>> +    switch (rj) {
>>> +    case 0:
>>> +        r = env->CSR_MCSR0 & 0xffffffff;
>>> +        break;
>>> +    case 1:
>>> +        r = (env->CSR_MCSR0 & 0xffffffff00000000) >> 32;
>>> +        break;
>>
>> Why do you represent all of these as high and low portions of a 64-bit internal value, when the manual describes them as 32-bit values?
>>
> This method can reduce variables on env.

The number of variables may increase, but the memory consumed -- which is the metric that 
is more important -- is still the same.

Also, it is much less confusing to match the description in the manual.


r~

