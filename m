Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5313057DC36
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 10:21:52 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEnuw-0005Fj-3b
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 04:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEnnt-0002lU-O2
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEnno-0001UJ-NE
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658477667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7viiFkjnpHpL2tkBF1jkVyWauHLKjXO9FNAh3FNpGqI=;
 b=QfmZZMcKQIEngrISntbdmU4XjeMBxEMhzZYViBJkkC4tjWVNHHQ/ned+w8YKgS+++JPzDm
 HKAmADyXPoQQugF0eBMf3ABIrNjZL/coeXfpqF3A7A0TTPwDMWJ8Xwl++1Wawy3ZzQSnhm
 +MgVAwcQlACdGDNCzTm7l777C+ktJzU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-zpiNSbklMsG8bbMvSltf5A-1; Fri, 22 Jul 2022 04:14:26 -0400
X-MC-Unique: zpiNSbklMsG8bbMvSltf5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso735340wrg.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 01:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7viiFkjnpHpL2tkBF1jkVyWauHLKjXO9FNAh3FNpGqI=;
 b=KAzyEuw/YmT00QRkdj+QKVgKAPlwupB2Ok4qabEkzGH+jMa+mFtEqJ/ZbYTz5SPkRC
 5oer3qF98kNexX0RvoBH/SRxkk4jAALBhF9Gl8oBChonWKuhlhLMRxEljsFfNBbvxrlZ
 qqmFoybl1zN0GDZyasZ7KgI9KIFeTmuYoFm5zp2UrOa0mEwoS7jgLpn5MpOofYc9sXvK
 /HBD9UXXg8WvG4EFgJn2qFAfZg6Gnf2q9oqKLMgr2HVIJQ3t4p9DZlwvDgPQp4QXRrAe
 dZIFyV+JFmCfUhjDYqXpMWCbxOJUpqtceSXGCizhM1B2vVasgS7zg49muhOJer2trmL+
 nA+Q==
X-Gm-Message-State: AJIora/Dght74LBhMwNhctDb6DXZzmLUabFTmaWJ0gUfreUEi8uu7RaT
 6Hbr4K2QfjbKMwsi0fA5wmZuxp6WSKuyrto22TaS/E89ug/KwREN0AmGJ21eHkktQ5z1g6iQl8t
 ch9/JR+8AmJBzZpY=
X-Received: by 2002:a5d:6848:0:b0:21e:5e37:b2e4 with SMTP id
 o8-20020a5d6848000000b0021e5e37b2e4mr1657809wrw.530.1658477664761; 
 Fri, 22 Jul 2022 01:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s62FhE994zc1eJB5ikD8W2EVyblPJvB1f+O6tXMTl3oG3UYG0IlljxGJbiydoTxwLdHwZdtQ==
X-Received: by 2002:a5d:6848:0:b0:21e:5e37:b2e4 with SMTP id
 o8-20020a5d6848000000b0021e5e37b2e4mr1657780wrw.530.1658477664251; 
 Fri, 22 Jul 2022 01:14:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b0021e4829d359sm3932202wrx.39.2022.07.22.01.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 01:14:23 -0700 (PDT)
Message-ID: <e54aa500-352f-6624-5858-7716d7ad7387@redhat.com>
Date: Fri, 22 Jul 2022 10:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com>
 <9240083d-ef58-466a-14c1-1c858f67e1d4@redhat.com>
 <YtgR9LL2znac2dsQ@redhat.com> <YtmZ58pcnuZvrYxF@xz-m1.local>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YtmZ58pcnuZvrYxF@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2022 20.24, Peter Xu wrote:
> On Wed, Jul 20, 2022 at 03:32:20PM +0100, Daniel P. Berrangé wrote:
>> On Wed, Jul 20, 2022 at 04:11:43PM +0200, Thomas Huth wrote:
>>> On 19/07/2022 12.37, Daniel P. Berrangé wrote:
>>>> On Tue, Jul 19, 2022 at 12:28:24PM +0200, Thomas Huth wrote:
>>>>> On 18/07/2022 21.14, Peter Xu wrote:
>>>>>> Hi, Thomas,
>>>>>>
>>>>>> On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
>>>>>>> On 07/07/2022 20.46, Peter Xu wrote:
>>>>>>>> We used to stop running all tests if uffd is not detected.  However
>>>>>>>> logically that's only needed for postcopy not the rest of tests.
>>>>>>>>
>>>>>>>> Keep running the rest when still possible.
>>>>>>>>
>>>>>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>>>>>>> ---
>>>>>>>>      tests/qtest/migration-test.c | 11 +++++------
>>>>>>>>      1 file changed, 5 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> Did you test your patch in the gitlab-CI? I just added it to my testing-next
>>>>>>> branch and the the test is failing reproducibly on macOS here:
>>>>>>>
>>>>>>>     https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
>>>>>>>     https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
>>>>>>>
>>>>>>> (without your patch the whole test is skipped instead)
>>>>>>
>>>>>> Thanks for reporting this.
>>>>>>
>>>>>> Is it easy to figure out which test was failing on your side?  I cannot
>>>>>> easily reproduce this here on a MacOS with M1.
>>>>>
>>>>> I've modified the yml file to only run the migration test in verbose mode
>>>>> and got this:
>>>>>
>>>>> ...
>>>>> ok 5 /x86_64/migration/validate_uuid_src_not_set
>>>>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>>>>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>>>>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>>>>> source,debug-threads=on -m 150M -serial
>>>>> file:/tmp/migration-test-ef2fMr/src_serial -drive
>>>>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid
>>>>> 11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
>>>>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>>>>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>>>>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>>>>> target,debug-threads=on -m 150M -serial
>>>>> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
>>>>> unix:/tmp/migration-test-ef2fMr/migsocket -drive
>>>>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel
>>>>> qtest
>>>>> ok 6 /x86_64/migration/validate_uuid_dst_not_set
>>>>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>>>>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>>>>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>>>>> source,debug-threads=on -m 150M -serial
>>>>> file:/tmp/migration-test-ef2fMr/src_serial -drive
>>>>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
>>>>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>>>>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>>>>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>>>>> target,debug-threads=on -m 150M -serial
>>>>> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
>>>>> unix:/tmp/migration-test-ef2fMr/migsocket -drive
>>>>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
>>>>> **
>>>>> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
>>>>> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
>>>>> Bail out!
>>>>> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
>>>>> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
>>>>
>>>> This is the safety net we put it to catch case where the test has
>>>> got stuck. It is set at 2 minutes.
>>>>
>>>> There's a chance that is too short, so one first step might be to
>>>> increase to 10 minutes and see if the tests pass. If it still fails,
>>>> then its likely a genuine bug
>>>
>>> I tried to increase it to 5 minutes first, but that did not help. In a
>>> second try, I increased it to 10 minutes, and then the test was passing,
>>> indeed:
>>>
>>> https://cirrus-ci.com/task/5819072351830016?logs=build#L7208
>>>
>>> Could it maybe be accelerated, e.g. by tweaking the downtime limit again?
>>
>> Oh when I tweaked convergance tunables i missed the auto-converge
>> case as its code looks a bit different.
>>
>> Possibly change test_migrate_auto_converge
>>
>>      /* Now, when we tested that throttling works, let it converge */
>>      migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
>>      migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
>>
>> to
>>
>>      migrate_ensure_converge(from);
> 
> Sounds good to me.
> 
> Thomas, would that work for you too?  I'm wondering whether you'd like to
> post a patch for that.
> 
> I could have reposted both patches (including what Dan suggested) but I
> still have no good way to kick that macos test so I cannot verify it.  Let
> me know if you want me to post those, I can do it (and test as much as I
> could) but I may need some help on kicking a test to verify it.

Please go ahead and post the patches - I'll then try to provide a Tested-by 
as soon as possible.

  Thomas


