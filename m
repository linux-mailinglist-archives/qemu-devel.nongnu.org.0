Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166323557AA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:24:15 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnYs-0002vn-5o
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTnX0-0001wS-Ee
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTnWv-0007KO-Nr
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617722531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbfXLqtOBQg7xDbuPYV9p74an8hsFJgTN2FmRjxjqbY=;
 b=FSLQyBx8kFgWVchANWqLCEtEkaY2qvQguHCe5xGs14RUq5CLM8yNxlTHVXJq+bmadZo4uS
 k4Xr6kBMrIOjFc5h2nKAiWBlyn3H1vmwc8TBF0NmBhd6rAAey/NfJXoxoay382S+uCt9k2
 g2wxok2eFOCPokayZk37N3+7k4G50CM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-P1gB1e7vMYqFbqQqwy9wcA-1; Tue, 06 Apr 2021 11:22:09 -0400
X-MC-Unique: P1gB1e7vMYqFbqQqwy9wcA-1
Received: by mail-ed1-f69.google.com with SMTP id f9so10578324edd.13
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IbfXLqtOBQg7xDbuPYV9p74an8hsFJgTN2FmRjxjqbY=;
 b=B207ee/+642sUpQI+I6Vt1STgfjCk062l2gWFGLSgRbIERHQbFpq4V6p6WyOk3f+2M
 O+rX/et496L8/v4cSYNFgeIAJtn1Qze9kXZhVwG7X89DVKA1sa+LS6MF29rlnt+oFizY
 M3mtA/P9/viofYoBQow6HdjMZqBC5T0rwoUCAg9mkMxEzx55d/S3O1X9p5V2izJVMlXX
 rM5LC5xq3k2ZXKeDLKDb0QODt+U8VQQ92Az2FanXodwruxv6zIL6CBBomsPUlhS/oFXs
 QYjomHNFEKTZ7D5SlsqHxJ1rvmfvUWmKMnI5XHm4f5T5AaU3BhhF6dfPuyCMmO9fzIOI
 fMWw==
X-Gm-Message-State: AOAM533Bxno3V2k34z4MdjUxbG9CYR+NLA1L+WeC9Hha3HvLEG0mtSlS
 xRjmGCp7EL+lTzmteiB7SAlY66/siiFTtUFzkmttQCkUXArR47ZC1LNebU3q0Up56DiwJKi8eZr
 N96figQJqkaBxc7NFISrxADheDqnCQrF/jamPvaLEu9F84grhEqddBrWPUaARj/cy
X-Received: by 2002:a17:907:2bf6:: with SMTP id
 gv54mr35202191ejc.514.1617722528094; 
 Tue, 06 Apr 2021 08:22:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xdljJIKQth9gOBGnKQSqpfEFS6IpO7/60Qm8Um82QHWj4GsXzsre0+3skSw6SPUAAEBWLw==
X-Received: by 2002:a17:907:2bf6:: with SMTP id
 gv54mr35202165ejc.514.1617722527893; 
 Tue, 06 Apr 2021 08:22:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id yk8sm11331074ejb.123.2021.04.06.08.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 08:22:06 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
Date: Tue, 6 Apr 2021 17:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eefvnx3s.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 5:45 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> The current 'virt_kvm' test is restricted to GICv2, but can also
>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>> tested on some hardware.
>>
>> Noticed while running:
>>
>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>  ...
>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>
>> The job.log content is:
>>
>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>
>> With this patch:
>>
>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>  (1/1)
>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>  PASS (55.10 s)
> 
> On the new aarch64 machine which is GICv3 I get the following:
> 
>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
> 
> which it shouldn't have run. However:
> 
>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
> 
> Is this something that has regressed or am I doing it wrong?

Typo in the tag: "device:gic3" -> "device:gicv3"

>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
>> index 0055dc7cee..c743e231f4 100644
>> --- a/tests/acceptance/boot_linux.py
>> +++ b/tests/acceptance/boot_linux.py
>> @@ -182,10 +182,11 @@ def test_virt_tcg(self):
>>          self.add_common_args()
>>          self.launch_and_wait()
>>  
>> -    def test_virt_kvm(self):
>> +    def test_virt_kvm_gicv2(self):
>>          """
>>          :avocado: tags=accel:kvm
>>          :avocado: tags=cpu:host
>> +        :avocado: tags=device:gicv2
>>          """
>>          if not kvm_available(self.arch, self.qemu_bin):
>>              self.cancel(KVM_NOT_AVAILABLE)
>> @@ -195,6 +196,20 @@ def test_virt_kvm(self):
>>          self.add_common_args()
>>          self.launch_and_wait()
>>  
>> +    def test_virt_kvm_gicv3(self):
>> +        """
>> +        :avocado: tags=accel:kvm
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=device:gicv3
>> +        """
>> +        if not kvm_available(self.arch, self.qemu_bin):
>> +            self.cancel(KVM_NOT_AVAILABLE)
>> +        self.vm.add_args("-accel", "kvm")
>> +        self.vm.add_args("-cpu", "host")
>> +        self.vm.add_args("-machine", "virt,gic-version=3")
>> +        self.add_common_args()
>> +        self.launch_and_wait()
>> +
>>  
>>  class BootLinuxPPC64(BootLinux):
>>      """
> 
> 


