Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137E9676421
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 07:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ72B-00086O-HV; Sat, 21 Jan 2023 01:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pJ728-00086G-0m
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 01:07:20 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pJ726-0003Bs-5R
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 01:07:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i65so5506218pfc.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 22:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ej38FfR+gmcizf45YTl04lxagtFciiOqrVO8AZhq0QE=;
 b=O5cBuUkXRae3wHbgKPcFzFD7/sRaIjIKvnjMITPJr1+Wn1OTcZ8R5IMeSo5GwNpfur
 vEIy1nDL50i+adbIw4916J4zXxiW6iMHzbIRW2YGGIsTe69Qt3pViw3qVDCs7LEhaQq5
 rAxMH/wcCKCkzHxmz3k5dMeakEohfC4pxiz8dV3LWkvubS3jXbKawzUfsDowXCz6Zd6g
 +Ru4WjUa7XyFQk/wOuwFgif/MQfVkC2dbwvNqnFspAKn+5J6EYjXDjFI1w6XkGJ1b1Zy
 8mmEc2mwAAkyaD4z+wB3HxOtjybmY8O6CYAobP3E9yWJrsJCJoy0JVRTxbM9bv3RpCIW
 YPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ej38FfR+gmcizf45YTl04lxagtFciiOqrVO8AZhq0QE=;
 b=yZqf+/MEJ2Bfo4r4GUMkwltpdAtjyidVLp6Ydl2WLyfng3usVTuyemwPk/B1IK7yvb
 ItFdfIinB5u5Jjs19quwbF8jaOZP4dPj8aan8leWk7Kv8DBuJGwLsUXMKEC8AVSw8RAE
 QA4YId7reXNl1cOUhPoCKqohqB8CrlsoFVko0tRb7MNm2DMO1dULHliSrulQgHlcZfz2
 psJIKFmzB8ombUGev0Eqw/G97WjIc3hXiUYDd1+c7500ueTzTPvLRX5gn6HlCo+wk3t1
 lW0nVAPGywpEwBdH0YPFLh46x8Ilp9hr3dc43JVzjrRlJFFdFRJ1c3CSPzxfrNJxoIz8
 VVCw==
X-Gm-Message-State: AFqh2kpPOusvUNvwaB4bXL8Jh1KZlQHB4Te7hKkfvVkxf4k9qxQsnPu7
 y40dHh8fXNjnNAgBhbTnTa4bRw==
X-Google-Smtp-Source: AMrXdXtMLELarzYKFOJ2XbbjDk9oADIWK6i/pLnDyVsL+vTRRGjKhtKr/Bj7cguJ2jygL9hRpzCNiA==
X-Received: by 2002:a62:1751:0:b0:56b:3758:a2d9 with SMTP id
 78-20020a621751000000b0056b3758a2d9mr18203105pfx.21.1674281236298; 
 Fri, 20 Jan 2023 22:07:16 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k19-20020aa79733000000b0058d90bc57basm12204668pfg.90.2023.01.20.22.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 22:07:15 -0800 (PST)
Message-ID: <79f006e6-ea1c-37fa-ef1a-90188ee3f24a@linaro.org>
Date: Fri, 20 Jan 2023 20:07:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 0/5] tcg patch queue
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: peter.maydell@linaro.org
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
 <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 1/19/23 23:41, Thomas Huth wrote:
> On 16/01/2023 23.36, Richard Henderson wrote:
>> The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
>>
>>    tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116
>>
>> for you to fetch changes up to 61710a7e23a63546da0071ea32adb96476fa5d07:
>>
>>    accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12 -1000)
>>
>> ----------------------------------------------------------------
>> - Reorg cpu_tb_exec around setjmp.
>> - Use __attribute__((target)) for buffer_is_zero.
>> - Add perfmap and jitdump for perf support.
>>
>> ----------------------------------------------------------------
>> Ilya Leoshkevich (3):
>>        linux-user: Clean up when exiting due to a signal
>>        accel/tcg: Add debuginfo support
>>        tcg: add perfmap and jitdump
>>
>> Richard Henderson (2):
>>        util/bufferiszero: Use __attribute__((target)) for avx2/avx512
>>        accel/tcg: Split out cpu_exec_{setjmp,loop}
> 
>   Hi Richard, hi Ilya,
> 
> with the recent QEMU master branch (commit 701ed34), I'm now seeing failures in Travis:
> 
>   https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411
> 
> Everything was still fine a couple of days ago (commit fb7e799):
> 
>   https://app.travis-ci.com/github/huth/qemu/builds/259755664
> 
> ... so it seems this is likely related to this pull request. Could you please have a look?

Thankfully our s390x.ci.qemu.org has the same version gcc installed, and I was able to 
reproduce this.  But only once -- it's irregular and very low frequency.

The code generated by gcc is correct and easy to inspect, since cpu_exec_setjmp is now 
quite small:

00000000000f3250 <cpu_exec_setjmp.isra.0>:
    f3250:       eb 6f f0 30 00 24       stmg    %r6,%r15,48(%r15)
    f3256:       a7 39 00 00             lghi    %r3,0
    f325a:       e3 f0 ff 58 ff 71       lay     %r15,-168(%r15)

                                         // Save cpu to stack+160.
    f3260:       e3 20 f0 a0 00 24       stg     %r2,160(%r15)
    f3266:       41 20 20 f0             la      %r2,240(%r2)
    f326a:       c0 e5 ff fb 10 eb       brasl   %r14,55440 <__sigsetjmp@plt>
    f3270:       ec 26 00 0d 00 7e       cijne   %r2,0,f328a <cpu_exec_setjmp.isra.0+0x3a>

                                         // Reload cpu for cpu_exec_loop().
    f3276:       e3 20 f0 a0 00 04       lg      %r2,160(%r15)
    f327c:       c0 e5 ff ff fb ee       brasl   %r14,f2a58 <cpu_exec_loop.isra.0>
    f3282:       eb 6f f0 d8 00 04       lmg     %r6,%r15,216(%r15)
    f3288:       07 fe                   br      %r14

                                         // Load tls pointer and current_cpu address.
    f328a:       b2 4f 00 10             ear     %r1,%a0
    f328e:       c0 20 00 0a 35 9d       larl    %r2,239dc8 <current_cpu@@Base+0x239dc8>
    f3294:       eb 11 00 20 00 0d       sllg    %r1,%r1,32
    f329a:       e3 20 20 00 00 04       lg      %r2,0(%r2)
    f32a0:       b2 4f 00 11             ear     %r1,%a1

                                         // Reload cpu for comparison
    f32a4:       e3 30 f0 a0 00 04       lg      %r3,160(%r15)
                                         // cpu == current_cpu
    f32aa:       e3 32 10 00 00 20       cg      %r3,0(%r2,%r1)
    f32b0:       a7 84 00 12             je      f32d4 <cpu_exec_setjmp.isra.0+0x84>
    ...

The only way I can imagine that this comparison fails is if we have corrupted the stack in 
some way.  I have not been able to induce failure under any sort of debugging, and I can't 
imagine where irregular corruption would have come from.


r~

r~

