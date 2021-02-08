Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975A3130EE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:33:46 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l94nZ-0001fx-Dt
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90PN-0004gS-Dj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:52:35 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Ov-0002nn-Pi
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:52:17 -0500
Received: by mail-io1-xd2b.google.com with SMTP id s24so13883886iob.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o/KAEfbT6q4OL/zSUSQCJwnpNtmwWSy2X+3bKboHvQs=;
 b=O1rN+YgOcYA1GKHKwNCNqq4e5g07W3smr2pgRhCsYZJl0gEx3RUp2JhuRr0uKRch+G
 qiCIQy5yBk1FhCGOOFhbtkgHZ7cHX+3SZv6hMZaOqhg9ua0fCZ6YvRyvBCfeb2jDh2KX
 Q2ryKuS7J65UAzX9rLWROQgMz+knvvijrRWTw28oM1lVA9i1gCT1kXuAdP5jGprtDLbT
 qjS0ywFy0TDALExzWkysBltgZoYZcgNljoDETp0BLpgGlfMYYWfdN0GJAz+hpLKuficZ
 7APprtiIYYy/EhZPgD5XK6K0YpvmXPmg+bqWwI/hfB+TGnBPKdsLiU7A66I+AGKsTeKz
 9uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o/KAEfbT6q4OL/zSUSQCJwnpNtmwWSy2X+3bKboHvQs=;
 b=l6S/OwJTln4aaXvuT1rb0ZvsHQ+do6uepbF7+9A35WBEU2cmeQcGTg/00sSGY1gfrO
 x55ZoCdwJ3FrRu8hCcGoy7L58TxjatpThOZIqlfBmVkSde1BQ/5AxK6MDAGovJGex/9H
 bdo+mVnfHmtnGz/Qc+AWWSxcQ2q4ZacGX/PpfYYfhNQmLPJrw7dUO2MWNDpMwku8N7Y4
 L/yZx/FZOEzR6DPKTCIlUfkB9Anc4xOhY6ALFunxt7LMJaiDssojsEsx7+0/esiW5W0T
 GWYzvOo1smLzp9ocIZZSQ6+XLtuKywYxkwdTjKQwUUIQpQL0SblNNutON61oPPFat5oK
 wDaw==
X-Gm-Message-State: AOAM531W5zbPQ0cjHcJ4Jq9kvL7x6rxSSAnfpficnvu9yYFfs5Rj9A/7
 s0RpCZtn9uAj9RP94QIKHecpjg==
X-Google-Smtp-Source: ABdhPJymwldYtI6ISDYiYHMM+jIp1Hj2wFbLOyc0hOELEyUDWjowrbOdaCJVYz32LAHkygO76YEU+g==
X-Received: by 2002:a05:6638:3c6:: with SMTP id
 r6mr16082021jaq.115.1612767050569; 
 Sun, 07 Feb 2021 22:50:50 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id s9sm8490576ilt.2.2021.02.07.22.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 22:50:49 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210203045816.10953-1-rebecca@nuviainc.com>
 <20210203045816.10953-3-rebecca@nuviainc.com>
 <a85fa6f0-d6ee-5811-4c7f-d2830b8eafb9@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <3134cfab-7455-dbdf-29e0-11643340efde@nuviainc.com>
Date: Sun, 7 Feb 2021 23:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a85fa6f0-d6ee-5811-4c7f-d2830b8eafb9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 10:19 AM, Richard Henderson wrote:
> On 2/2/21 6:58 PM, Rebecca Cran wrote:
>> @@ -9433,8 +9448,9 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>>        * For exceptions taken to AArch32 we must clear the SS bit in both
>>        * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
>>        */
>> -    env->uncached_cpsr &= ~PSTATE_SS;
>> -    env->spsr = cpsr_read(env);
>> +    env->pstate &= ~PSTATE_SS;
>> +    env->spsr = cpsr_read_for_spsr_elx(env);
>> +
> 
> Again, this is the aarch32 exception path, and should not use
> cpsr_read_for_spsr_elx.

Yeah, sorry I'm not sure why/how that got in.
I'm hoping the v5 series that I'm sending out in a few minutes fixes 
these issues.

-- 
Rebecca Cran

