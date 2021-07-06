Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08E3BD839
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:29:40 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0m4x-0007hU-21
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m0m2R-0005IG-Tn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m0m2N-0007pk-LF
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625581618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jSuDL1gtW8byfCB2KJblCu+U3OkTqWoolSsQLzkdvs=;
 b=c7opdy/60NYeV5I97+zWFT02/Z9RyRjgZ9MHrdHY9X3FeqzCreT6EgtGtKHCCNMuY/5YT6
 Ze/scGvRn452c3XUmF+9VaXHakHekNxVjCxYXdGDKITFQp3xTqjT9OI3iq9qr5M7UwhtbJ
 q1YT66pKrPLyCekXcLAjeL0G7oxtqFI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-L5GnQWb0MEiRy6DbXKOKIg-1; Tue, 06 Jul 2021 10:26:57 -0400
X-MC-Unique: L5GnQWb0MEiRy6DbXKOKIg-1
Received: by mail-pf1-f199.google.com with SMTP id
 w191-20020a62ddc80000b0290318fa423788so7352530pff.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6jSuDL1gtW8byfCB2KJblCu+U3OkTqWoolSsQLzkdvs=;
 b=A5wI4dDdXsCM1+3LIwLTUVMISDh14VggBmUH076xY4MH3J8EHtrQQBRWmltvD2YTRz
 eQJ7zodWa5uuwN5EWczxd0uOmr4P+rjjzugO6DfR7yrcahgfhyyUU6RIUSzmEWv+WMyA
 9daQgtQZz/Bx7AY7LuoKNxhvsS4t9+Z4He+cr5gbNt1VFxXMFJx9CUytUSQnOOHbfr+l
 /jaFtSEKZ6RvJXw3bnVMnrWSE2EbAzFoVg2Li8NDp8itbslvIVPZqVTy4ncPGLxFJm5z
 EXVMS+0ETiRRyNc0gDFLOVe9fKxpPf52zP98jITNckO/3WiJpqUdwb0wt49HcNSgExB7
 ggkA==
X-Gm-Message-State: AOAM5325ne1tumQJU5/Kq61wCi/AdpXxI++9Of4myF2SGx02vHe/eY66
 rAWJ8EcvmChQeND5NeRXoHzv5Sw2hk6yV1B3rfS0Y5yA92XuWAkBPsbvBdvFznktTQ2OEvMte70
 pEo0d+pC7rVE4FlY=
X-Received: by 2002:a63:4761:: with SMTP id w33mr21337488pgk.195.1625581616256; 
 Tue, 06 Jul 2021 07:26:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2i3K0wx9zTC+JWS1Wbj7s/eya8oxrxAX2Jqzve6SGPtoVR+dpYZHbgco0/sdBpf3RVB1BUQ==
X-Received: by 2002:a63:4761:: with SMTP id w33mr21337459pgk.195.1625581615959; 
 Tue, 06 Jul 2021 07:26:55 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id p38sm15634141pfh.151.2021.07.06.07.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:26:55 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] avocado_qemu: Add SMMUv3 tests
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-3-eric.auger@redhat.com>
 <a7b8faad-4535-f5f3-4f99-b13cf3dcfd7f@redhat.com>
 <d46e9c37-7989-451f-cb3d-edf0958911fd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <adcdf31f-6c0e-979e-608c-b7a8c0b43ac1@redhat.com>
Date: Tue, 6 Jul 2021 11:26:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d46e9c37-7989-451f-cb3d-edf0958911fd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/5/21 5:00 AM, Eric Auger wrote:
> Hi Wainer,
>
> On 7/1/21 8:13 PM, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 6/29/21 11:36 AM, Eric Auger wrote:
>>> Add new tests checking the good behavior of the SMMUv3 protecting
>>> 2 virtio pci devices (block and net). We check the guest boots and
>>> we are able to install a package. Different guest configs are tested:
>>> standard, passthrough an strict=0. This is tested with both fedora 31
>>> and
>>> 33. The former uses a 5.3 kernel without range invalidation whereas the
>>> latter uses a 5.8 kernel that features range invalidation.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>> v3 -> v4:
>>> - add tags for machine, distro in the class
>>> - removed smp and memory overrides
>>> - set default param value of common_vm_setup to False
>>>
>>> v1 -> v2:
>>> - removed ssh import
>>> - combined add_command_args() and common_vm_setup()
>>> - moved tags in class' docstring and added tags=arch:aarch64
>>> - use self.get_default_kernel_params()
>>> - added RIL tests with fed33 + introduce new tags
>>> ---
>>>    tests/acceptance/smmu.py | 132 +++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 132 insertions(+)
>>>    create mode 100644 tests/acceptance/smmu.py
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>
>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>
>> I tested it in a Fedora 32 aarch64 host. The execution output:
>>
>> # ./tests/venv/bin/avocado run tests/acceptance/smmu.py
>> JOB ID     : 1625038f5a2ae17c8ba6c503d3df8661ff528942
>> JOB LOG    :
>> /root/avocado/job-results/job-2021-07-01T13.38-1625038/job.log
>>   (1/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril: PASS (175.54 s)
>>   (2/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
>> WARN: Test passed but there were warnings during execution. Check the
>> log for details. (168.39 s)
>>   (3/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (161.58 s)
>>   (4/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril: PASS (150.85 s)
>>   (5/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (177.56 s)
>>   (6/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (190.86 s)
>> RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 4 | INTERRUPT 0
>> | CANCEL 0
>> JOB TIME   : 1026.50 s
>>
>> One thing that caught my attention was the amount of time spent on
>> each test. It spend more than 2 minutes on the package installation
>> (`self.ssh_command('dnf -y install numactl-devel')`) in the guest.
>>
>> Without that operation, it runs way faster:
>>
>> # ./tests/venv/bin/avocado run tests/acceptance/smmu.py
>> JOB ID     : 24f22f99169ece37df64d72d2eb373921f378aac
>> JOB LOG    :
>> /root/avocado/job-results/job-2021-07-01T13.28-24f22f9/job.log
>>   (1/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril: PASS (39.61 s)
>>   (2/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
>> WARN: Test passed but there were warnings during execution. Check the
>> log for details. (48.32 s)
>>   (3/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (48.10 s)
>>   (4/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril: PASS (39.22 s)
>>   (5/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (52.92 s)
>>   (6/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: WARN:
>> Test passed but there were warnings during execution. Check the log
>> for details. (50.96 s)
>> RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 4 | INTERRUPT 0
>> | CANCEL 0
>> JOB TIME   : 280.62 s
>>
>> Install a package seems a good exerciser for disk I/O and networking,
>> but maybe you can use another method for the sake of speed up the tests?
> As discussed earlier with Cleber, I am aware the test duration is long
> but it was useful finding bugs for SMMU with range invalidation. such a
> bug could not be hit with a single boot + ping for instance.
>
> Maybe we should have a mechanism that allows to put some tests out of
> the automatic CI?

Sorry Eric, I missed that discussion. I will review your v5 series very 
soon.

Thanks!

- Wainer

>
> Thanks
>
> Eric
>> - Wainer
>>
>>> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
>>> new file mode 100644
>>> index 0000000000..c1d4b88e5f
>>> --- /dev/null
>>> +++ b/tests/acceptance/smmu.py
>>> @@ -0,0 +1,132 @@
>>> +# SMMUv3 Functional tests
>>> +#
>>> +# Copyright (c) 2021 Red Hat, Inc.
>>> +#
>>> +# Author:
>>> +#  Eric Auger <eric.auger@redhat.com>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>> +# later.  See the COPYING file in the top-level directory.
>>> +
>>> +import os
>>> +
>>> +from avocado_qemu import LinuxTest, BUILD_DIR
>>> +
>>> +class SMMU(LinuxTest):
>>> +    """
>>> +    :avocado: tags=accel:kvm
>>> +    :avocado: tags=cpu:host
>>> +    :avocado: tags=arch:aarch64
>>> +    :avocado: tags=machine:virt
>>> +    :avocado: tags=distro:fedora
>>> +    :avocado: tags=smmu
>>> +    """
>>> +
>>> +    IOMMU_ADDON =
>>> ',iommu_platform=on,disable-modern=off,disable-legacy=on'
>>> +    kernel_path = None
>>> +    initrd_path = None
>>> +    kernel_params = None
>>> +
>>> +    def set_up_boot(self):
>>> +        path = self.download_boot()
>>> +        self.vm.add_args('-device',
>>> 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
>>> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
>>> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
>>> +        self.vm.add_args('-drive',
>>> +
>>> 'file=%s,if=none,cache=writethrough,id=drv0' % path)
>>> +
>>> +    def setUp(self):
>>> +        super(SMMU, self).setUp(None, 'virtio-net-pci' +
>>> self.IOMMU_ADDON)
>>> +
>>> +    def common_vm_setup(self, custom_kernel=False):
>>> +        self.require_accelerator("kvm")
>>> +        self.vm.add_args("-accel", "kvm")
>>> +        self.vm.add_args("-cpu", "host")
>>> +        self.vm.add_args("-machine", "iommu=smmuv3")
>>> +        self.vm.add_args("-d", "guest_errors")
>>> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
>>> +                         'edk2-aarch64-code.fd'))
>>> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
>>> +        self.vm.add_args('-object',
>>> +                         'rng-random,id=rng0,filename=/dev/urandom')
>>> +
>>> +        if custom_kernel is False:
>>> +            return
>>> +
>>> +        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
>>> +        initrd_url = self.get_pxeboot_url() + 'initrd.img'
>>> +        self.kernel_path = self.fetch_asset(kernel_url)
>>> +        self.initrd_path = self.fetch_asset(initrd_url)
>>> +
>>> +    def run_and_check(self):
>>> +        if self.kernel_path:
>>> +            self.vm.add_args('-kernel', self.kernel_path,
>>> +                             '-append', self.kernel_params,
>>> +                             '-initrd', self.initrd_path)
>>> +        self.launch_and_wait()
>>> +        self.ssh_command('cat /proc/cmdline')
>>> +        self.ssh_command('dnf -y install numactl-devel')
>>> +
>>> +
>>> +    # 5.3 kernel without RIL #
>>> +
>>> +    def test_smmu_noril(self):
>>> +        """
>>> +        :avocado: tags=smmu_noril
>>> +        :avocado: tags=smmu_noril_tests
>>> +        :avocado: tags=distro_version:31
>>> +        """
>>> +        self.common_vm_setup()
>>> +        self.run_and_check()
>>> +
>>> +    def test_smmu_noril_passthrough(self):
>>> +        """
>>> +        :avocado: tags=smmu_noril_passthrough
>>> +        :avocado: tags=smmu_noril_tests
>>> +        :avocado: tags=distro_version:31
>>> +        """
>>> +        self.common_vm_setup(True)
>>> +        self.kernel_params = self.get_default_kernel_params() + '
>>> iommu.passthrough=on'
>>> +        self.run_and_check()
>>> +
>>> +    def test_smmu_noril_nostrict(self):
>>> +        """
>>> +        :avocado: tags=smmu_noril_nostrict
>>> +        :avocado: tags=smmu_noril_tests
>>> +        :avocado: tags=distro_version:31
>>> +        """
>>> +        self.common_vm_setup(True)
>>> +        self.kernel_params = self.get_default_kernel_params() + '
>>> iommu.strict=0'
>>> +        self.run_and_check()
>>> +
>>> +    # 5.8 kernel featuring range invalidation
>>> +    # >= v5.7 kernel
>>> +
>>> +    def test_smmu_ril(self):
>>> +        """
>>> +        :avocado: tags=smmu_ril
>>> +        :avocado: tags=smmu_ril_tests
>>> +        :avocado: tags=distro_version:33
>>> +        """
>>> +        self.common_vm_setup()
>>> +        self.run_and_check()
>>> +
>>> +    def test_smmu_ril_passthrough(self):
>>> +        """
>>> +        :avocado: tags=smmu_ril_passthrough
>>> +        :avocado: tags=smmu_ril_tests
>>> +        :avocado: tags=distro_version:33
>>> +        """
>>> +        self.common_vm_setup(True)
>>> +        self.kernel_params = self.get_default_kernel_params() + '
>>> iommu.passthrough=on'
>>> +        self.run_and_check()
>>> +
>>> +    def test_smmu_ril_nostrict(self):
>>> +        """
>>> +        :avocado: tags=smmu_ril_nostrict
>>> +        :avocado: tags=smmu_ril_tests
>>> +        :avocado: tags=distro_version:33
>>> +        """
>>> +        self.common_vm_setup(True)
>>> +        self.kernel_params = self.get_default_kernel_params() + '
>>> iommu.strict=0'
>>> +        self.run_and_check()


