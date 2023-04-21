Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB96EAB2C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqO3-0001J1-IL; Fri, 21 Apr 2023 09:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqNG-0000xQ-3X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqNE-0006mk-1R
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682082021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2bgz6FOQl+RAG2ciO8BwsgLmFP+1ubCUq0360WSxBU=;
 b=XMN1IiRUhJU4f573wQ5/uSXIw2p4DY7l/ic3KlHeKsWWreF8hYBX+kdqx1a6+yezP+m/yz
 k9aXP/UlSILBl0g0GXFHe4ep/lzt7oGmqoB3ixPINqAjuFAmuAqt108C2r2SUbk8vb8MBR
 7hTQiI36sweltQtmQOnkN+NQxsK3QdA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-_KB_zv0rOCanX4d7H1c08g-1; Fri, 21 Apr 2023 09:00:19 -0400
X-MC-Unique: _KB_zv0rOCanX4d7H1c08g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f55f0626a6so669374f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082016; x=1684674016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2bgz6FOQl+RAG2ciO8BwsgLmFP+1ubCUq0360WSxBU=;
 b=bg5MaUSz5UwcB0/u+86KfzvmDbMq34Ma14JEEpWjtPlTzfN0eS7DZntmFvGFLDueO4
 D7Y2BFePUOBlqQld8vqVkbR3y6GCKRD8Qk5yUhNcrGSgMdeEIBXB+QUONOnQPXn9dIWf
 DVE8itoobKbovvLU6PXMn1Fn5OaEcChpsB6TNpmPJyRaKhtjGhUSnBY3bdWJBOsgCF7V
 JaM9GZyvXGz4rd1/uR8U/Z/EECFaJPMSIovoC0fuveegDXCa/knxSrpwlXc2tD87+nEU
 jYKFVIKhr+tU9og6Yb3SFcrekYXk7p9hGk7FtMGPnW+TtfAo4i/6spjjXffg3RoLyo8o
 INZQ==
X-Gm-Message-State: AAQBX9e/y5QUZrUiMzP9w6AqfxwueVMam/LQNQmfQABFxS2KGkUufykQ
 nmR+0bMX175PlBVfUulnL6tciKiGAU+voCTm/P7mg6sOb8ktFVwXbcIX1HF4/I0y3RJBsegPB+C
 JgKKl7KvYg/YlgOg=
X-Received: by 2002:adf:ee86:0:b0:2f2:7a7e:6ac with SMTP id
 b6-20020adfee86000000b002f27a7e06acmr4280036wro.48.1682082016589; 
 Fri, 21 Apr 2023 06:00:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQqVzU7xkvBhuZy3H3gda8vCjq4LtUWZ8186PKQYj0Ej3ft6s/AAZGCf/1qv+MgrQGDhVfcg==
X-Received: by 2002:adf:ee86:0:b0:2f2:7a7e:6ac with SMTP id
 b6-20020adfee86000000b002f27a7e06acmr4280018wro.48.1682082016263; 
 Fri, 21 Apr 2023 06:00:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm4417815wrm.15.2023.04.21.06.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 06:00:15 -0700 (PDT)
Message-ID: <2025fa7c-766e-5a91-0774-740dceadc6e0@redhat.com>
Date: Fri, 21 Apr 2023 15:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-3-thuth@redhat.com>
 <23d8e66e-7306-2e56-7a20-047904ec751a@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <23d8e66e-7306-2e56-7a20-047904ec751a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21/04/2023 14.54, Cédric Le Goater wrote:
> On 4/21/23 13:03, Thomas Huth wrote:
>> test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
>> failing. The problem is that they are trying to look for the login
>> prompt that does not have a newline at the end - but the logic in
>> _console_interaction() only handles full lines. It used to work by
>> accident in the past since there were sometimes kernel (warning and
>> error) messages popping up that finally provided a newline character
>> in the output, but since the tests have been changed to run with the
>> "quiet" kernel parameter, this is not working anymore.
>>
>> To make this work reliably, we must not look for the "login:" prompt,
>> but have to use some text ending with a newline instead. And in the
>> ast2600 test, switch to ssh instead of trying to log into the serial
>> console - this works much more reliable and also has the benefit of
> 
> Yes. The test ran ~100 times without a failure. The 'dmesg -c' call is
> inelegant but there is not much other solutions.
> 
>> excercising the network interface here a little bit, too.
> 
> exercising
> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> (one little typo below)
> 
> Thanks,
> 
> C.
> 
>> ---
>>   tests/avocado/machine_aspeed.py | 31 ++++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aspeed.py 
>> b/tests/avocado/machine_aspeed.py
>> index d2c57ccb7e..c9515bafa1 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -8,6 +8,7 @@
>>   import time
>>   import os
>> +from avocado_qemu import LinuxSSHMixIn
>>   from avocado_qemu import QemuSystemTest
>>   from avocado_qemu import wait_for_console_pattern
>>   from avocado_qemu import exec_command
>> @@ -230,7 +231,7 @@ def test_arm_ast2600_evb_buildroot(self):
>>           self.do_test_arm_aspeed_buildroot_poweroff()
>> -class AST2x00MachineSDK(QemuSystemTest):
>> +class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
>>       EXTRA_BOOTARGS = (
>>           'quiet '
>> @@ -257,7 +258,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
>>           self.require_netdev('user')
>>           self.vm.set_console()
>>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> -                         '-net', 'nic', '-net', 'user')
>> +                         '-net', 'nic', '-net', 
>> 'user,hostfwd=:127.0.0.1:0-:22')
>>           self.vm.launch()
>>           self.wait_for_console_pattern('U-Boot 2019.04')
>> @@ -285,7 +286,7 @@ def test_arm_ast2500_evb_sdk(self):
>>           self.do_test_arm_aspeed_sdk_start(
>>               self.workdir + '/ast2500-default/image-bmc')
>> -        self.wait_for_console_pattern('ast2500-default login:')
>> +        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
>>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>       def test_arm_ast2600_evb_sdk(self):
>> @@ -305,24 +306,28 @@ def test_arm_ast2600_evb_sdk(self):
>>                            
>> 'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
>>           self.vm.add_args('-device',
>>                            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
>> +        self.log.info('going to starrt *******')
> 
> 's/rr/r'

Drat, that whole line was just a debug print that I wanted to remove before 
sending out the patch ... I'll fix it.

  Thomas


>>           self.do_test_arm_aspeed_sdk_start(
>>               self.workdir + '/ast2600-default/image-bmc')
>> -        self.wait_for_console_pattern('ast2600-default login:')
>> -        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
>> -        exec_command_and_wait_for_pattern(self, '0penBmc', 
>> 'root@ast2600-default:~#')
>> +        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
>> -        exec_command_and_wait_for_pattern(self,
>> -             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
>> +        self.ssh_connect('root', '0penBmc', False)
>> +        self.ssh_command('dmesg -c > /dev/null')
>> +
>> +        self.ssh_command_output_contains(
>> +             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device 
>> ; '
>> +             'dmesg -c',
>>                'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
>> -        exec_command_and_wait_for_pattern(self,
>> +        self.ssh_command_output_contains(
>>                                'cat /sys/class/hwmon/hwmon19/temp1_input', 
>> '0')
>>           self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
>>                           property='temperature', value=18000);
>> -        exec_command_and_wait_for_pattern(self,
>> +        self.ssh_command_output_contains(
>>                                'cat /sys/class/hwmon/hwmon19/temp1_input', 
>> '18000')
>> -        exec_command_and_wait_for_pattern(self,
>> -             'echo ds1307 0x32 > 
>> /sys/class/i2c-dev/i2c-5/device/new_device',
>> +        self.ssh_command_output_contains(
>> +             'echo ds1307 0x32 > 
>> /sys/class/i2c-dev/i2c-5/device/new_device ; '
>> +             'dmesg -c',
>>                'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
>>           year = time.strftime("%Y")
>> -        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', 
>> year);
>> +        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', 
>> year);
> 


