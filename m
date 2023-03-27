Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A26CA47C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:48:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmGM-0004qI-Mp; Mon, 27 Mar 2023 08:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgmGL-0004pU-3R
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:47:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgmGJ-0005zh-Eh
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:47:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so1985925wmq.3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679921264;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVXVFhWDw+XanhIiKU1dnKSf4wlpVyeyhVTcCYZNHYc=;
 b=NFcFxyx0614zHQRFKL13vuyruCZOJWwqOz62JcjG2ySr48L36wy7VYM4nQ/QJixt8e
 6j/ortHCUmBTss6fuT0oCkghrPs5jYxQ9ziyziuw4rsOVZUtflLxsV9NMVTpVQODaiSS
 UFhmZ4olsmlbfmmQWmnqG5uaQf+1aPYDjrhUoo9C2n0ytFvOIrWbrIiU6GN8er8tdGA3
 4/JS67PsSSUFOv3zRe0u29dTOh57NnmqsZI1KOrHixduBTQcBgtYUanegW4eV3bXCTpH
 obZCV8Mk8Lc/bYdvGcr8PgXATS5DVAOC3WGyFi8xqwl/JQIWzI5IOEWxc1M8yfOcb/gM
 LQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921264;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVXVFhWDw+XanhIiKU1dnKSf4wlpVyeyhVTcCYZNHYc=;
 b=LYNGJGjP4yVCLKPj9i4AyPNyBP1HLOs/R38TtLsRXbSKiGuXiwIWZP3KLaUtFh0FHX
 SAUm7gjRyEU7iXddGDpjBupwrp3T1eGvoApdbwheQ7ovSIK6KyDD0cj+/IUZeI4L1vkb
 7FZmk4CiprK7lnMCRhNgh6uSPfXQsaJ3fHH2cAA3Bw5GkxcpaTItJGqKUNOp0gBtYU+L
 ousZbyXeFhRa/k+KTIHVWFufdOWRtCS0Z0wYdPmxe0hkZuGc25q8hlfRuweWROCXcrcx
 KN26djlBzEMgXLsaRIAg4+2dkMnBDUnHtLxmQXv93XN71UmuMcVBa5XBHvTkH7TCv19s
 qEXQ==
X-Gm-Message-State: AO0yUKV3QtZeYEZXp+OLKAGzbcj96gMYyIEquFOsr+98+TXJk0DmnkmE
 GX/1J1Q08UqlqJ0KMVUkz5c8yg==
X-Google-Smtp-Source: AK7set9ehw2iR3Y/u3MaSCE5isRxkQA4fDyKqoY5D9Ue4FhQr+QsonzQXpuzvGwkfLOBNL/Wt+0aMQ==
X-Received: by 2002:a05:600c:2182:b0:3ef:128d:7151 with SMTP id
 e2-20020a05600c218200b003ef128d7151mr9239329wme.9.1679921264508; 
 Mon, 27 Mar 2023 05:47:44 -0700 (PDT)
Received: from [192.168.69.115] (4be54-h02-176-184-9-157.dsl.sta.abo.bbox.fr.
 [176.184.9.157]) by smtp.gmail.com with ESMTPSA id
 s12-20020a1cf20c000000b003ed1f111fdesm13491118wmc.20.2023.03.27.05.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 05:47:44 -0700 (PDT)
Message-ID: <cd6f0fbe-d30d-b548-31ce-533a154402aa@linaro.org>
Date: Mon, 27 Mar 2023 14:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: cota@braap.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20230322150744.175010-1-richard.henderson@linaro.org>
 <20230322150744.175010-12-richard.henderson@linaro.org>
 <87zg7ysi4y.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87zg7ysi4y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 27/3/23 10:38, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> User setting of -R reserved_va can lead to an assertion
>> failure in page_set_flags.  Sanity check the value of
>> reserved_va and print an error message instead.  Do not
>> allocate a commpage at all for m-profile cpus.
> 
> I see this:
> 
>    TEST    convd on i386
> qemu-i386: Unable to reserve 0x100000000 bytes of virtual address space
> at 0x8000 (File exists) for use as guest address space (check your
> virtual memory ulimit setting, min_mmap_addr or reserve less using -R
> option)

Maybe revealing some pre-existing issue?
https://gitlab.com/qemu-project/qemu/-/issues/447

> 
> on the ubuntu aarch64 static build:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/4003523064
> 
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/elfload.c | 37 +++++++++++++++++++++++++++----------
>>   1 file changed, 27 insertions(+), 10 deletions(-)


