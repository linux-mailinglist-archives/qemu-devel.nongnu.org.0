Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75134D4744
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:51:06 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIG1-00027y-Bd
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:51:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH4X-0006ef-J0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:35:14 -0500
Received: from [2607:f8b0:4864:20::435] (port=37584
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH4S-0000ik-M2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:35:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id t5so4860756pfg.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dnWPfvYQWTECeFdwG30qWgGj3Ee4uFcIGLk6E1GPTjk=;
 b=u7kPK8oInqeTFRc7RSmcLWecnzwIGMTauRDkWVyq9IYMONNsZdBYZ8qYnp072ELDl4
 SnJDDKMzpcaSfUwUDKJHVMyDr+f032uZO1MV2ONGq5/UkalVC223PIhb18f5SW/+j0tY
 J5lbu2obkY8o/K75vb86uX21lrI+MRYeHUEjIoJWMFKdce/yTWtDiAQ752GCx0Ola1W+
 SA6/NbgGXSQd3mQkbF4Dqr7qkmcGrThJoLDSmRgFaFNxKvnjHvlJOQ+Xt27dzm2yikm3
 NuO+O9u/N/EHoT3hd8RzwG6xrdm21A26n7uGzxVrGQbOvSbl0mlrjIo87MgUmMmjfvdT
 /AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dnWPfvYQWTECeFdwG30qWgGj3Ee4uFcIGLk6E1GPTjk=;
 b=GkTBjmhZ8gKdQHfb7TS7v0iUWIo+81mvrZCxQGcIhuP9SWs3RG7lThAMkHs3tINN67
 gnKeeyuD1gq3lq+E40M+PCyLnzXVP2c/1jrSW+F10GWtkegew9j1GrmvUvx77HoHYf5Y
 Rs9rZzyOZ2vJS28bJYQGwkFAL/nKc/2XYW0A6A2nY88BKCXnELhdFOa4UEOrO3Fy9qDx
 eS4dS/Fpk3yTOtvfUyS8p8DLnpUO05i8e+2Pt0ln8ZvKRIFKKKyytqqIIShLoloTIPlP
 vJU4WqT2SHIiBZYrtpjamoN6D5E9sJ1W/WGy3e0YOSBHxC9MX0BrJsb0VCbltXgJgOSU
 HVkg==
X-Gm-Message-State: AOAM531ZQLBtwzOicxJcGyP8d18A65LUHmS+T2k8IXKhj+780CejrTUf
 6gIqe83l3bUSGTrK2uZbCi7/BQ==
X-Google-Smtp-Source: ABdhPJxM5HYiIMtzdCRanFhJrjaTpW5o4f5aTJQGR8S0A/GB/TH7gMPhRmH8neayMFlLEvVOAqbHaA==
X-Received: by 2002:a63:8ac9:0:b0:380:8d8b:d01a with SMTP id
 y192-20020a638ac9000000b003808d8bd01amr3558323pgd.572.1646912102754; 
 Thu, 10 Mar 2022 03:35:02 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d32-20020a631d60000000b003650a9d8f9asm5262234pgm.33.2022.03.10.03.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 03:35:02 -0800 (PST)
Message-ID: <f036a033-fca7-0125-b90c-0e840d79a59e@linaro.org>
Date: Thu, 10 Mar 2022 03:35:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
 <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
 <9a47f844-85a3-25ff-38e2-1c6d079cd18d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9a47f844-85a3-25ff-38e2-1c6d079cd18d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 02:21, Thomas Huth wrote:
> On 10/03/2022 09.36, Thomas Huth wrote:
>> On 09/03/2022 12.22, Alex Bennée wrote:
>>> With -cpu max we get a warning:
>>>
>>>    qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
>>>
>>> But dropping the -cpu max and it still runs fine.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   tests/tcg/s390x/Makefile.target | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
>>> index 257c568c58..7aa502a557 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
>>>   sha512-mvx: sha512.c
>>>       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>>> -run-sha512-mvx: QEMU_OPTS+=-cpu max
>>> -
>>>   TESTS+=sha512-mvx
>>
>> Ok, this helps to get rid of the warnings, thus feel free to add:
>>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>>
>> However, the error still persists. I now had a closer look by running the test with 
>> "qemu-s390x" on my z15 machine directly, and all tests are failing! The problem happens 
>> with both, gcc v11.2.1 and clang v13.0.1. The problem goes away (i.e. test works fine) 
>> if I compile the code with -O1 instead of -O3, or if I use GCC v8.5 instead. I'll try to 
>> find out more, but as a temporary workaround, we could also switch to -O1 instead of -O3.
> 
> I noticed that the problem does not occur when running the test natively
> on my s390x box, or via qemu-s390x on my x86 laptop, or when running it
> via qemu-s390x v6.1.0 on my s390x box. So it's something wrong in the TCG
> backend, I think, and I was able to bisect the issue down to this commit
> here:
> 
> $ git bisect bad
> 9bca986df88b8ea46b100e3d21cc9e653c83e0b3 is the first bad commit
> commit 9bca986df88b8ea46b100e3d21cc9e653c83e0b3
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Mon Sep 14 20:36:36 2020 -0700
> 
>      tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
> 
> Richard, could you please have a look? I've uploaded my statically linked
> binary that shows the problem here:
> 
>   http://people.redhat.com/~thuth/data/sha512
> 
> When running on a z15 s390x host with current QEMU master, the test fails:
> 
> $ ./qemu-s390x -cpu max ~/sha512
> qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> 1..1
> h    : 0000:  38 31 a6 a6  15 5e 50 9d  ee 59 a7 f4  51 eb 35 32 81...^P..Y..Q.52
> h    : 0010:  4d 8f 8f 2d  f6 e3 70 88  94 74 0f 98  fd ee 23 88 M..-..p..t....#.
> h    : 0020:  9f 4d e5 ad  b0 c5 01 0d  fb 55 5c da  77 c8 ab 5d .M.......U\.w..]
> h    : 0030:  c9 02 09 4c  52 de 32 78  f3 5a 75 eb  c2 5f 09 3a ...LR.2x.Zu.._.:
> got  : 0000:  7b 47 7b 48  1a 49 1a 49  79 48 7d 7f  7d 47 79 7d {G{H.I.IyH}.}Gy}
> got  : 0010:  1a 7f 7d 40  1a 48 19 4b  7d 48 1a 7b  7b 48 7b 49 ..}@.H.K}H.{{H{I
> got  : 0020:  7f 7d 7f 7f  7f 7f 7b 7d  19 49 1a 48  7f 47 7f 47 .}....{}.I.H.G.G
> got  : 0030:  79 4b 7f 4b  77 7f 79 47  19 7d 1a 7f  7b 48 7f 47 yK.Kw.yG.}..{H.G
> got  : 0040:  79 7f 7f 7d  1a 48 1a 7d  19 47 1c 48  77 48 77 7d y..}.H.}.G.HwHw}
> got  : 0050:  19 7b 7d 48  7d 7f 19 7b  7f 48 1c 47  1a 7b 7d 7d .{}H}..{.H.G.{}}
> got  : 0060:  1c 40 77 49  77 40 7f 7f  7d 49 19 7f  7b 49 7f 47 .@wIw@..}I..{I.G
> got  : 0070:  19 48 7d 7b  7f 48 1a 7b  1c 49 7d 7f  77 40 7b 7b .H}{.H.{.I}.w@{{
> got  : 0080:  00                                                 .
> not ok 1 - do_test(&tests[0])
> #     Failed test (sha512.c:main() at line 1046)
> # Looks like you failed 1 tests of 1.
> 
> When running on my x86 laptop, the test succeeds:
> 
> $ ./qemu-s390x -cpu max ~/sha512
> qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> 1..1
> h    : 0000:  38 31 a6 a6  15 5e 50 9d  ee 59 a7 f4  51 eb 35 32 81...^P..Y..Q.52
> h    : 0010:  4d 8f 8f 2d  f6 e3 70 88  94 74 0f 98  fd ee 23 88 M..-..p..t....#.
> h    : 0020:  9f 4d e5 ad  b0 c5 01 0d  fb 55 5c da  77 c8 ab 5d .M.......U\.w..]
> h    : 0030:  c9 02 09 4c  52 de 32 78  f3 5a 75 eb  c2 5f 09 3a ...LR.2x.Zu.._.:
> got  : 0000:  33 38 33 31  61 36 61 36  31 35 35 65  35 30 39 64 3831a6a6155e509d
> got  : 0010:  65 65 35 39  61 37 66 34  35 31 65 62  33 35 33 32 ee59a7f451eb3532
> got  : 0020:  34 64 38 66  38 66 32 64  66 36 65 33  37 30 38 38 4d8f8f2df6e37088
> got  : 0030:  39 34 37 34  30 66 39 38  66 64 65 65  32 33 38 38 94740f98fdee2388
> got  : 0040:  39 66 34 64  65 35 61 64  62 30 63 35  30 31 30 64 9f4de5adb0c5010d
> got  : 0050:  66 62 35 35  35 63 64 61  37 37 63 38  61 62 35 64 fb555cda77c8ab5d
> got  : 0060:  63 39 30 32  30 39 34 63  35 32 64 65  33 32 37 38 c902094c52de3278
> got  : 0070:  66 33 35 61  37 35 65 62  63 32 35 66  30 39 33 61 f35a75ebc25f093a
> got  : 0080:  00                                                 .
> ok 1 - do_test(&tests[0])
> 
> BTW, we recently also saw some issues with the migration qtest on a s390x
> host, maybe that's related:
> 
>   https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/562674331#L7834
>   https://app.travis-ci.com/github/huth/qemu/jobs/562290832#L7783
> 
> ?

Ok, will look soon.
Would you pop this into an issue so I don't forget, please?


r~


