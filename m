Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23006994F2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdlt-0003JR-KY; Thu, 16 Feb 2023 07:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSdlr-0003JB-Fa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:53:55 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSdlp-0005Uv-OK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:53:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id r2so1739041wrv.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXrX8ZKhK+MgJb9LhXglmYj+VBHFER2ZIbeA00scusQ=;
 b=Bu/pCWPgdK1L05Aus4tbnzjSyLNKvI6L7SfRSrI7QT3g6i3VTInwViV99ZGBbYIM3D
 dFcYFsxtfAEMrXjdMZetimeZpEBW+Xx7Yvloe2drMXNSKGPuYmsf6nL08+NtRZP4tPMI
 sgIKvVwoQ6jVcvJ1CNaHG7q7DFTHvKow5UsPLW9UKd+/ccmtU8EXU87syz8RIAKxRuo3
 IG6HlXh1/RfL7V4XDXXc6oDB8tSiHSit5sZ+RCc42C2U8+Dpt3dO81SN/+ktYv0TNKPi
 jrgCJwdXTup/FfxKSdeI0Qf2D8zPhRydr0SVnDPu/6YF9e92CAD6NysELSHA5osM2gV5
 WvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXrX8ZKhK+MgJb9LhXglmYj+VBHFER2ZIbeA00scusQ=;
 b=07f6oQzVBjxljIcxWAVG21QF3z4gOkwiL9i5pZQCI7f2weU8PihZnG1Zi1GCW0Er1q
 ZfRRlVT1HB47Rs+7zwGu+mUfsMRNmQlH6wN0lkeffLW2+MrbmXx15ezwV8IB4FZbSLvR
 7NMO5Bd6uXUnZJx3VLtlz9Alg6hCbNPP5l/Lby+cLvExqvsLKKIesxnICJi93/gqVzB8
 BNfDmKz4r9d3lkTb9V2eKc5+KJX1orS8Vm+dWKIsMh+qi7tRkpPromsJgdARF6qG7gNG
 131P2yr4F4sKrlVa+MEunXuFlWaaHxoClybZXwLhKjQPgQUQftClPFs6rPtlIxNNzEwp
 nMyg==
X-Gm-Message-State: AO0yUKX2PU4dLYlCBpv+sl9Iuk5EWIib3TVNx1P+V/j2iV4oWd1hfIcf
 Q12YCgdJnmtH/aKg3YtQ4gNjRg==
X-Google-Smtp-Source: AK7set8+Md81o/DcK/gUREdTNEK80iJfHVppkbaYdAwgFowGCG0ZrlFdHYj7/WxcYwRODetdqYHkNA==
X-Received: by 2002:a05:6000:43:b0:2c5:561e:808e with SMTP id
 k3-20020a056000004300b002c5561e808emr4413410wrx.12.1676552031738; 
 Thu, 16 Feb 2023 04:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df7b40f99fsm5409051wma.11.2023.02.16.04.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:53:51 -0800 (PST)
Message-ID: <17055c3f-5513-bd3a-2b2a-ef6142cd76ab@linaro.org>
Date: Thu, 16 Feb 2023 13:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/4] util/cacheflush: fix illegal instruction on
 windows-arm64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-2-pierrick.bouvier@linaro.org>
 <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
 <01e0e1f1-96ea-2294-f8ea-8a36320021e5@linaro.org>
 <bbd1374f-8ffb-720b-f759-aa75dee70f5e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <bbd1374f-8ffb-720b-f759-aa75dee70f5e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

After some investigation on this, I found that even faking ctr_el0 
content does not work. Indeed, "dc cvau" and "ic ivau" both are 
privileged too (and fail with illegal instruction).

I started looking how other projects are handling this. In the case of 
firefox js engine, they simply perform a FlushInstructionCache [1], and 
nothing for data cache. From what I found on various websites, there is 
no way to perform any data cache flush from userspace under Windows.

Out of curiosity, I looked in llvm how __builtin___clear_cache was 
implemented, and for windows-arm64, it's simply a call to the same 
function, FlushInstructionCache [2].

This explains why the generic implementation of flush_idcache_range does 
the correct thing for this platform, and why tests I ran worked. Thus, 
it's probably the best approach we can have for now.

[1] 
https://hg.mozilla.org/mozilla-central/file/tip/js/src/jit/arm64/vixl/MozCpu-vixl.cpp#l110
[2] 
https://github.com/llvm/llvm-project/blob/574e417460cdfebb8157fbe61b6a015e44856f64/compiler-rt/lib/builtins/clear_cache.c#L66

On 2/15/23 19:22, Richard Henderson wrote:
> On 2/15/23 02:49, Pierrick Bouvier wrote:
>> I'm not an expert on this area, but I imagine that booting a full VM will force TCG to
>> emit code at the same address twice (after having generated enough translated blocks),
>> which shows that generic flush_idcache_range works. Is that reasoning correct?
>>
>> Do you think we still need a specialized version for windows-arm64?
> 
> No, I don't think so.  It would be ideal if we were able to read CTR_EL0, because we make
> use of the IDC field, but 0 is a safe default.
> 
> 
> r~

