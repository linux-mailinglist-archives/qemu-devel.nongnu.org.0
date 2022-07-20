Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E157B845
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:15:09 +0200 (CEST)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEATj-00025B-UI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEAQi-0007Vz-5n
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEAQb-000144-ON
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658326309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+MFLd5htELC8zBob/uFIRIcNnY8g0l/LCWY2gHWDQ4=;
 b=QvsL+1rdClt+sYt/1EgEVzFziERhTvZdKUJybQxlw6UYgxaz+0Z278NfEERdOEoyRkCc9/
 4a4P8ZeDm62MnY3e4KzV1p/o8i4ziTkDkKr0BVGrvU3S+rX6BouopvBjjTkty/jZT5oAa4
 my+czhNe9qr2A5iGa31GSsF1Wp/f30U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-kP94J4OEN3Kc46GFJc3xqg-1; Wed, 20 Jul 2022 10:11:46 -0400
X-MC-Unique: kP94J4OEN3Kc46GFJc3xqg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b0021e3c8834a3so978520wrb.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R+MFLd5htELC8zBob/uFIRIcNnY8g0l/LCWY2gHWDQ4=;
 b=Fpsvx0hfhjJlQ6ugMB6gdcumRWZ+ICVj/rCg2MNoVV5vD6zq0xJpXBtGEkPtgJhRxR
 XLBPgZ1M4yqAO6he6UtAaIcCG6PlsPhVuTT/CHMk4zIqps4As4Pw/u9DjknZInI3flFC
 VGNfO3il7dWexff52HizaoMN5MY/DCKyHh/aC23zOHV/5tyXhu0uAup6ailC+PR/KzRS
 e324SfIWkjio94+EPO+LSm2N7iy5zulrXlYdeyTYskWKbhDYxHGjtcOgTrsPmoZ32c0r
 xntBZNtJv4YW58XJP2XuqcuWwbEIiR+O0q+klS24ZCLuX5DaTaQBtDXcVBOcXTO8p31N
 zifw==
X-Gm-Message-State: AJIora9Cq1TZCFjOBVS5VF3ussu0as5A+R8AyoX86hCWsLb2Vpmtvk2x
 /MeCLsYLPDKoTAJawUNv62eY7pa4K3fTfZ+Qmi/WNjoD6HH+ouSXbjo4voK2two/qOcWStHLoTv
 pmsPvPxq48iNEeYI=
X-Received: by 2002:adf:db51:0:b0:21e:41c2:c2e8 with SMTP id
 f17-20020adfdb51000000b0021e41c2c2e8mr5519726wrj.452.1658326305630; 
 Wed, 20 Jul 2022 07:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3ygXa0NsOvTFpHKpUa3FxHzpGRZWUiEBokLC791yezF8a2OW06EwzxGJ3J327y85IB/eIEQ==
X-Received: by 2002:adf:db51:0:b0:21e:41c2:c2e8 with SMTP id
 f17-20020adfdb51000000b0021e41c2c2e8mr5519703wrj.452.1658326305399; 
 Wed, 20 Jul 2022 07:11:45 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b003a2f2bb72d5sm3793529wmq.45.2022.07.20.07.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 07:11:44 -0700 (PDT)
Message-ID: <9240083d-ef58-466a-14c1-1c858f67e1d4@redhat.com>
Date: Wed, 20 Jul 2022 16:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YtaJg0zU8Fo3p2NB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/07/2022 12.37, Daniel P. Berrangé wrote:
> On Tue, Jul 19, 2022 at 12:28:24PM +0200, Thomas Huth wrote:
>> On 18/07/2022 21.14, Peter Xu wrote:
>>> Hi, Thomas,
>>>
>>> On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
>>>> On 07/07/2022 20.46, Peter Xu wrote:
>>>>> We used to stop running all tests if uffd is not detected.  However
>>>>> logically that's only needed for postcopy not the rest of tests.
>>>>>
>>>>> Keep running the rest when still possible.
>>>>>
>>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>>>> ---
>>>>>     tests/qtest/migration-test.c | 11 +++++------
>>>>>     1 file changed, 5 insertions(+), 6 deletions(-)
>>>>
>>>> Did you test your patch in the gitlab-CI? I just added it to my testing-next
>>>> branch and the the test is failing reproducibly on macOS here:
>>>>
>>>>    https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
>>>>    https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
>>>>
>>>> (without your patch the whole test is skipped instead)
>>>
>>> Thanks for reporting this.
>>>
>>> Is it easy to figure out which test was failing on your side?  I cannot
>>> easily reproduce this here on a MacOS with M1.
>>
>> I've modified the yml file to only run the migration test in verbose mode
>> and got this:
>>
>> ...
>> ok 5 /x86_64/migration/validate_uuid_src_not_set
>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> source,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-ef2fMr/src_serial -drive
>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid
>> 11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> target,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
>> unix:/tmp/migration-test-ef2fMr/migsocket -drive
>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel
>> qtest
>> ok 6 /x86_64/migration/validate_uuid_dst_not_set
>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> source,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-ef2fMr/src_serial -drive
>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
>> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> target,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
>> unix:/tmp/migration-test-ef2fMr/migsocket -drive
>> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
>> **
>> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
>> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
>> Bail out!
>> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
>> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> 
> This is the safety net we put it to catch case where the test has
> got stuck. It is set at 2 minutes.
> 
> There's a chance that is too short, so one first step might be to
> increase to 10 minutes and see if the tests pass. If it still fails,
> then its likely a genuine bug

I tried to increase it to 5 minutes first, but that did not help. In a 
second try, I increased it to 10 minutes, and then the test was passing, indeed:

https://cirrus-ci.com/task/5819072351830016?logs=build#L7208

Could it maybe be accelerated, e.g. by tweaking the downtime limit again?

  Thomas


