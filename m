Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B092D8538
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 08:12:11 +0100 (CET)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knz4c-0001aN-1c
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 02:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knz2m-000131-QA
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:10:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knz2k-0001Vo-HI
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607757012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dv8pTqkGIlDBFeUv7qIgdpv9MUIOQpOpOMG8qLAv5gE=;
 b=OucLI/NcaY7CNiNJ15qNbvw/ClE2gQ3Pb5Pfudenq5A/u6Y7bpDRzpnTtD0nNreu8Uolh7
 PJp/bntFaWvjlQCept6SB298vrbTipTwMKmL2+ACNt0nJEgqcNbuI8z+bb6+cOprlqGU4E
 nvKXPA6Ar704pXaBG6Uo5liK7je/4e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-JMXDyW6wPSOHmRyEILvnWg-1; Sat, 12 Dec 2020 02:10:09 -0500
X-MC-Unique: JMXDyW6wPSOHmRyEILvnWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF08107ACE3;
 Sat, 12 Dec 2020 07:10:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9730460C04;
 Sat, 12 Dec 2020 07:10:02 +0000 (UTC)
Subject: Re: [PATCH 2/3] tests/acceptance/machine_s390_ccw_virtio: Test
 virtio-rng via /dev/hwrng
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <20201211173134.376078-3-thuth@redhat.com>
 <7f2adbee-49e0-94f7-fcd7-7e012cc36bfa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5764fbf7-6c78-fc4f-47ce-74ddd1c64110@redhat.com>
Date: Sat, 12 Dec 2020 08:10:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7f2adbee-49e0-94f7-fcd7-7e012cc36bfa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 21.30, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 12/11/20 2:31 PM, Thomas Huth wrote:
>> /dev/hwrng is only functional if virtio-rng is working right, so let's
>> add a sanity check for this device node.
> 
> Good idea.
> 
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/acceptance/machine_s390_ccw_virtio.py | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py
>> b/tests/acceptance/machine_s390_ccw_virtio.py
>> index 733a7ca24a..7d0a78139b 100644
>> --- a/tests/acceptance/machine_s390_ccw_virtio.py
>> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
>> @@ -64,9 +64,9 @@ class S390CCWVirtioMachine(Test):
>>                            '-append', kernel_command_line,
>>                            '-device', 'virtio-net-ccw,devno=fe.1.1111',
>>                            '-device',
>> -                         'virtio-rng-ccw,devno=fe.2.0000,max_revision=0',
>> +                        
>> 'virtio-rng-ccw,devno=fe.2.0000,max_revision=0,id=rn1',
>>                            '-device',
>> -                         'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
>> +                        
>> 'virtio-rng-ccw,devno=fe.3.1234,max_revision=2,id=rn2',
>>                            '-device', 'zpci,uid=5,target=zzz',
>>                            '-device', 'virtio-net-pci,id=zzz',
>>                            '-device', 'zpci,uid=0xa,fid=12,target=serial',
>> @@ -96,6 +96,19 @@ class S390CCWVirtioMachine(Test):
>>           exec_command_and_wait_for_pattern(self,
>>                           'cat
>> /sys/bus/ccw/devices/0.3.1234/virtio?/features',
>>                           virtio_rng_features)
>> +        # check that /dev/hwrng works - and that it's gone after ejecting
>> +        exec_command_and_wait_for_pattern(self,
>> +                        'dd if=/dev/hwrng of=/tmp/out.dat bs=1k count=10',
>> +                        '10+0 records out')
>> +        self.clear_guests_dmesg()
>> +        self.vm.command('device_del', id='rn1')
>> +        self.wait_for_crw_reports()
>> +        self.clear_guests_dmesg()
>> +        self.vm.command('device_del', id='rn2')
>> +        self.wait_for_crw_reports()
>> +        exec_command_and_wait_for_pattern(self,
>> +                        'dd if=/dev/hwrng of=/tmp/out.dat bs=1k count=10',
>> +                        'dd: /dev/hwrng: No such device')
> 
> Maybe the expected pattern is too fragile. On my Fedora 33 system, 'dd' will
> print a different message.

We are running this test with a well-defined kernel + initrd, so I don't
think we have to care of other versions of dd here.

> What if it checks for the presence of the device file, e.g:
> 
> ... self, 'test -c /dev/hwrng; echo $?', '1')

That doesn't work, the /dev/hwrng is still there (so test -c succeeds),
since this initrd uses static device nodes for this in /dev. /dev/hwrng just
can not be opened anymore after the device has been removed.

 Thomas


