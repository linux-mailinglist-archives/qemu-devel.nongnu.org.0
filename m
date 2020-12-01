Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC692CAB9A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:18:20 +0100 (CET)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBAJ-0002yF-5G
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kkB7j-0001qf-9f
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kkB7h-0002Bl-3w
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606850135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVXHBTb++bNIbpli1tKR7vj+tfu3MVqblKiz8Yy8Kpk=;
 b=SlNjIKZxMs+SH+bkie5kTO2oHeFWLv8Tl7euOC4sMYSS7R+T7EgeRs+uZ24ySOzb+tv0Fr
 5DDtNvoE80uRoHOyVwQPReLXYqEkh1yc2dCYVjv2A9hoPyopz0MlJJNK29DBnyQsshTg9j
 j2hZwI4/NWuwth7f6K+rFgZmdFZACPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-iEAgRLV7PbyWvFdI_-dYCg-1; Tue, 01 Dec 2020 14:15:29 -0500
X-MC-Unique: iEAgRLV7PbyWvFdI_-dYCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 075EA425C8;
 Tue,  1 Dec 2020 19:15:28 +0000 (UTC)
Received: from [10.10.119.122] (ovpn-119-122.rdu2.redhat.com [10.10.119.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47C0218996;
 Tue,  1 Dec 2020 19:15:27 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
 <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
Date: Tue, 1 Dec 2020 14:15:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 6:13 AM, Philippe Mathieu-Daudé wrote:
> Cc'ing John.
> 
> On Mon, Nov 16, 2020 at 11:08 AM Pavel Dovgalyuk
> <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> This patch adds timeout parameter to vm.wait() calls, because the default
>> value is just 30 seconds, and tests may last for more time.
>>

This doesn't sound right -- the timeout isn't meant to be for the entire 
duration of the test, the timeout is from the time of issuing a shutdown 
command until the time the VM actually shuts down. Ideally, that should 
not take a particularly long time in a well-behaved test.

Why is it lasting longer than 30 seconds?
How long is it actually taking, do we know?

And, are you SURE you want to have *no* timeout for all of these calls? 
(Will something else kill them if they take too long? Ideally before 
gitlab itself kills the job for running too long?)

Cleber?

>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> ---
>>   tests/acceptance/boot_linux_console.py |    8 ++++----
>>   tests/acceptance/replay_kernel.py      |    2 +-
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index cb6086ca6f..1cb8cb7a2a 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -208,7 +208,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>                                                   'reboot: Restarting system')
>>           # Wait for VM to shut down gracefully
>> -        self.vm.wait()
>> +        self.vm.wait(None)
>>
>>       @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>>       def test_mips64el_malta_5KEc_cpio(self):
>> @@ -250,7 +250,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>                                                   'reboot: Restarting system')
>>           # Wait for VM to shut down gracefully
>> -        self.vm.wait()
>> +        self.vm.wait(None)
>>
>>       def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
>>           kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>> @@ -725,7 +725,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>                                                   'reboot: Restarting system')
>>           # Wait for VM to shut down gracefully
>> -        self.vm.wait()
>> +        self.vm.wait(None)
>>
>>       @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>                   'Test artifacts fetched from unreliable apt.armbian.com')
>> @@ -778,7 +778,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>                                                   'reboot: Restarting system')
>>           # Wait for VM to shut down gracefully
>> -        self.vm.wait()
>> +        self.vm.wait(None)
>>
>>       @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>                   'Test artifacts fetched from unreliable dl.armbian.com')
>> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
>> index c8b043ac31..02a52b1d72 100644
>> --- a/tests/acceptance/replay_kernel.py
>> +++ b/tests/acceptance/replay_kernel.py
>> @@ -60,7 +60,7 @@ class ReplayKernelBase(LinuxKernelTest):
>>               logger.info('finished the recording with log size %s bytes'
>>                           % os.path.getsize(replay_path))
>>           else:
>> -            vm.wait()
>> +            vm.wait(None)
>>               logger.info('successfully finished the replay')
>>           elapsed = time.time() - start_time
>>           logger.info('elapsed time %.2f sec' % elapsed)
>>
> 


