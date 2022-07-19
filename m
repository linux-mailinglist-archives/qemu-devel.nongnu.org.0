Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC425797AE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:30:01 +0200 (CEST)
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkUK-0000rg-7A
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkSv-0007vA-4F
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkSr-0002Mz-8Y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658226508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ba0lOhSoXdx8wHXb8bpVk2OhnPMb/euVl+/eyZ1My4=;
 b=WlyhSEaqUZMo+dbaaUfXluzSmu5qrxZQ+rA9IcHPumr2CWU5QpWrvNcH7JLpe8e4oGf11X
 R9rKXYR4DfT0FF4QTAjUYnLacNdKI9hJL6VweTHWP17HjWVjS+H4qK6C7TumIHXj9i0L8j
 IxqUxnFqP8E28Fgs4ZE5NMV8MtuL2jo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-xGQGvAbEMhKhjE_COlRj_Q-1; Tue, 19 Jul 2022 06:28:27 -0400
X-MC-Unique: xGQGvAbEMhKhjE_COlRj_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 g9-20020adfa489000000b0021d6e786099so2430656wrb.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ba0lOhSoXdx8wHXb8bpVk2OhnPMb/euVl+/eyZ1My4=;
 b=PFyu3iYYZVeSnqDbQbemHN7Vnt+yTtHsTFR7M4o/wbarg3Aam50Kho+lhqkB8g5Rvr
 bZeajlQAax/ROdro9IxWvktfClq+bOAdDC50cuX1XHZKOseYkksj/xRtwUhNronCGqQ6
 cVb2fAu7aRBiq8FfkmSNt8Y73Tl6YxGy9Lz3sqCckoBsFR2/54kgmBbNlyakyw9/e4Ws
 WvV9x6/JUAbwegeOVKMZ+dKDFP5g/Pcy6PED+WOwHeCVRR366Xr5M2EALNDbo93tfiHh
 O5Nj9rWpL+lvoIEUULJPYgcqX06EDPpqkDaE2+mcEsa743TMXHr7n9dANHCR041Wrp+/
 0XRA==
X-Gm-Message-State: AJIora8SD7kbchq7LpWx0ILIZecfepgVJ6gEc8ndKtS38wn6PL4u8U62
 l3JYUIn8/1f9g8ogDkvhIGJ8Ieatw32vvI9WkvB512wOSEtOPrO+1S6jqTYy5O5cNugv9gMmO8C
 3MXm1JP9XZ6lQGjk=
X-Received: by 2002:a7b:cc14:0:b0:3a3:2213:e653 with SMTP id
 f20-20020a7bcc14000000b003a32213e653mr2852072wmh.52.1658226505798; 
 Tue, 19 Jul 2022 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7Q+ANx8e4koQ536MarxltTh1rFpAXyxfrDomFl3bZ+da4Cm0xlwuXuhW08+OZxLvYSbcHBA==
X-Received: by 2002:a7b:cc14:0:b0:3a3:2213:e653 with SMTP id
 f20-20020a7bcc14000000b003a32213e653mr2852054wmh.52.1658226505576; 
 Tue, 19 Jul 2022 03:28:25 -0700 (PDT)
Received: from [10.33.198.128] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 y11-20020adfc7cb000000b0021d6924b777sm13636485wrg.115.2022.07.19.03.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 03:28:25 -0700 (PDT)
Message-ID: <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
Date: Tue, 19 Jul 2022 12:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YtWxHSjpORK31aLs@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 18/07/2022 21.14, Peter Xu wrote:
> Hi, Thomas,
> 
> On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
>> On 07/07/2022 20.46, Peter Xu wrote:
>>> We used to stop running all tests if uffd is not detected.  However
>>> logically that's only needed for postcopy not the rest of tests.
>>>
>>> Keep running the rest when still possible.
>>>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>    tests/qtest/migration-test.c | 11 +++++------
>>>    1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> Did you test your patch in the gitlab-CI? I just added it to my testing-next
>> branch and the the test is failing reproducibly on macOS here:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
>>   https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
>>
>> (without your patch the whole test is skipped instead)
> 
> Thanks for reporting this.
> 
> Is it easy to figure out which test was failing on your side?  I cannot
> easily reproduce this here on a MacOS with M1.

I've modified the yml file to only run the migration test in verbose mode 
and got this:

...
ok 5 /x86_64/migration/validate_uuid_src_not_set
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock 
-qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon 
chardev=char0,mode=control -display none -accel kvm -accel tcg -name 
source,debug-threads=on -m 150M -serial 
file:/tmp/migration-test-ef2fMr/src_serial -drive 
file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid 
11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock 
-qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon 
chardev=char0,mode=control -display none -accel kvm -accel tcg -name 
target,debug-threads=on -m 150M -serial 
file:/tmp/migration-test-ef2fMr/dest_serial -incoming 
unix:/tmp/migration-test-ef2fMr/migsocket -drive 
file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel qtest
ok 6 /x86_64/migration/validate_uuid_dst_not_set
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock 
-qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon 
chardev=char0,mode=control -display none -accel kvm -accel tcg -name 
source,debug-threads=on -m 150M -serial 
file:/tmp/migration-test-ef2fMr/src_serial -drive 
file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
# starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock 
-qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon 
chardev=char0,mode=control -display none -accel kvm -accel tcg -name 
target,debug-threads=on -m 150M -serial 
file:/tmp/migration-test-ef2fMr/dest_serial -incoming 
unix:/tmp/migration-test-ef2fMr/migsocket -drive 
file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
**
ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status: 
assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
Bail out! 
ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status: 
assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
qemu-system-x86_64: failed to save SaveStateEntry with id(name): 2(ram): -5
qemu-system-x86_64: Unable to write to socket: Broken pipe
/var/folders/tn/f_9sf1xx5t14qm_6f83q3b840000gn/T/scripts81855ad8681d0d86d1e91e00167939cb.sh: 
line 9: 58011 Abort trap: 6           QTEST_QEMU_BINARY=./qemu-system-x86_64 
tests/qtest/migration-test

(see: https://cirrus-ci.com/task/5719789887815680?logs=build#L7205 )

So it seems like validate_uuid_dst_not_set was the last successful test, and 
it's likely failing with test_migrate_auto_converge ?

> Or any hint on how I could kick the same CI as you do would help too.  I
> remembered I used to kick the test after any push with .gitlab-ci.yml but
> it seems it's not triggering for some reason here.

As Daniel already said, you need to set up Cirrus-CI according to 
.gitlab-ci.d/cirrus/README.rst to get the macOS jobs in your CI.

  Thomas


