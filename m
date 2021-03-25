Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033EF3494C6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:59:06 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRRx-0006NR-2S
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPROy-0003d7-LV
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPROw-0000Qx-Bo
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616684157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lc/u9baUMlYSoPqbWmLGzYsaZBeLLXCavKWWnYV00sI=;
 b=degP9wVSAAVY7zGLudRwcx/YPdB4VByNH6cMP7b4Bpo2fsvXLXQbq2/sn6jZfZh6w9lMCH
 t/pns1VIOHySsss9l4tY4WshGVwmQdrJQlwLXfuf5AwQLS5PyZ9YAK5ftKzRJ+QM4LVNoq
 WR1Mon5x/SCRsvaI9dHTN/zxTEmHmbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-3LJ3ioMZO-qoRt0f5oapfA-1; Thu, 25 Mar 2021 10:55:54 -0400
X-MC-Unique: 3LJ3ioMZO-qoRt0f5oapfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1EF6A290;
 Thu, 25 Mar 2021 14:55:53 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B453910013D7;
 Thu, 25 Mar 2021 14:55:51 +0000 (UTC)
Subject: Re: [PATCH 1/1] avocado_qemu: Add SMMUv3 tests
To: Cleber Rosa <crosa@redhat.com>
References: <20210325095712.250262-1-eric.auger@redhat.com>
 <20210325095712.250262-2-eric.auger@redhat.com>
 <20210325143604.GA3629845@amachine.somewhere>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <02d5fffb-6735-bd2c-3b68-65cba31136d3@redhat.com>
Date: Thu, 25 Mar 2021 15:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325143604.GA3629845@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 3/25/21 3:36 PM, Cleber Rosa wrote:
> On Thu, Mar 25, 2021 at 10:57:12AM +0100, Eric Auger wrote:
>> Add new tests checking the good behavior of the SMMUv3 protecting
>> 2 virtio pci devices (block and net). We check the guest boots and
>> we are able to install a package. Different guest configs are tested:
>> standard, passthrough an strict=0. Given the version of the guest
>> kernel in use (5.3.7 at this moment), range invalidation is not yet
>> tested. This will be handled separately.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  tests/acceptance/smmu.py | 104 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>  create mode 100644 tests/acceptance/smmu.py
>>
>> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
>> new file mode 100644
>> index 0000000000..65ecac8f1a
>> --- /dev/null
>> +++ b/tests/acceptance/smmu.py
>> @@ -0,0 +1,104 @@
>> +# SMMUv3 Functional tests
>> +#
>> +# Copyright (c) 2021 Red Hat, Inc.
>> +#
>> +# Author:
>> +#  Eric Auger <eric.auger@redhat.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +
>> +from avocado_qemu import LinuxTest, BUILD_DIR
>> +from avocado.utils import ssh
> 
> This import is not needed, given that the you're not using them directly,
> but only using the LinuxTest methods that wrap them.
Sure I will remove it
> 
>> +
>> +class SMMU(LinuxTest):
>> +
>> +    KERNEL_COMMON_PARAMS = ("root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
>> +                            "earlyprintk=pl011,0x9000000 ignore_loglevel "
>> +                            "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
>> +                            "console=ttyAMA0 ")
>> +    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
>> +    IMAGE = ("https://archives.fedoraproject.org/pub/archive/fedora/"
>> +             "linux/releases/31/Everything/aarch64/os/images/pxeboot/")
>> +    kernel_path = None
>> +    initrd_path = None
>> +    kernel_params = None
>> +
>> +    def set_up_boot(self):
>> +        path = self.download_boot()
>> +        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
>> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
>> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
>> +        self.vm.add_args('-drive',
>> +                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
>> +
>> +    def setUp(self):
>> +        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
>> +
>> +    def add_common_args(self):
>> +        self.vm.add_args("-machine", "virt")
>> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
>> +                                      'edk2-aarch64-code.fd'))
>> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
>> +        self.vm.add_args('-object',
>> +                         'rng-random,id=rng0,filename=/dev/urandom')
>> +
>> +    def common_vm_setup(self, custom_kernel=None):
>> +        self.require_accelerator("kvm")
>> +        self.add_common_args()
> 
> I know you're following the previous test pattern/template, but maybe
> combine add_command_args() and common_vm_setup()?  They seem to be
> doing the same thing.
yep
> 
>> +        self.vm.add_args("-accel", "kvm")
>> +        self.vm.add_args("-cpu", "host")
>> +        self.vm.add_args("-machine", "iommu=smmuv3")
>> +
>> +        if custom_kernel is None:
>> +            return
>> +
>> +        kernel_url = self.IMAGE + 'vmlinuz'
>> +        initrd_url = self.IMAGE + 'initrd.img'
>> +        self.kernel_path = self.fetch_asset(kernel_url)
>> +        self.initrd_path = self.fetch_asset(initrd_url)
>> +
>> +    def run_and_check(self):
>> +        if self.kernel_path:
>> +            self.vm.add_args('-kernel', self.kernel_path,
>> +                             '-append', self.kernel_params,
>> +                             '-initrd', self.initrd_path)
>> +        self.launch_and_wait()
>> +        self.ssh_command('cat /proc/cmdline')
>> +        self.ssh_command('dnf -y install numactl-devel')
> 
> Would you expect the package installation to cover significant more
> than, say, a package removal?  Not relying on the distro's package
> repos (and external networking) would be an improvement to the test's
> stability, but I wonder how much functional coverage would be lost.
I noticed this package installed caused an issue in a specific case
(range invalidation) which is not handled here due to the kernel being
too old. I image that doing the package install is more stressful wrt
network than the remove?
> 
> FIY, I've tried it with 'dnf -y remove yum' instead, and test times
> are also considerably lower.
> 
>> +
>> +    def test_smmu(self):
>> +        """
>> +        :avocado: tags=accel:kvm
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=smmu
>> +        """
> 
> These tags are common across all tests, so you can move them to the class'
> docstring.  Also, you need to add ":avocado: tags=arch:aarch64" or else
> these will be attempted to be executed with other targets.
sure
> 
>> +
>> +        self.common_vm_setup()
>> +        self.run_and_check()
>> +
>> +    def test_smmu_passthrough(self):
>> +        """
>> +        :avocado: tags=accel:kvm
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=smmu
>> +        """
>> +        self.common_vm_setup(True)
>> +
>> +        self.kernel_params = self.KERNEL_COMMON_PARAMS + 'iommu.passthrough=on'
>> +
>> +        self.run_and_check()
>> +
>> +    def test_smmu_nostrict(self):
>> +        """
>> +        :avocado: tags=accel:kvm
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=smmu
>> +        """
>> +        self.common_vm_setup(True)
>> +
>> +        self.kernel_params = self.KERNEL_COMMON_PARAMS + 'iommu.strict=0'
>> +
>> +        self.run_and_check()
>> -- 
>> 2.26.2
>>
> 
> Other than those comments, the tests work as expected:
> 
> $ ./tests/venv/bin/avocado run tests/acceptance/smmu.py
> JOB ID     : 8b1f1bb775d41e5c593e727ec1907710f076b161
> JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-25T10.31-8b1f1bb/job.log
>  (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: PASS (42.99 s)
>  (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: PASS (47.06 s)
>  (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: PASS (47.54 s)
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 138.56 s
> 
> And even with a bit of stress (running them in parallel) proved to be
> quite stable:
> 
> ./tests/venv/bin/avocado run --test-runner=nrunner tests/acceptance/smmu.py
> 
> JOB ID     : bb2c3a006bb491a7086612dfa1ef980b55db4105
> JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-25T10.30-bb2c3a0/job.log
>  (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: STARTED
>  (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: STARTED
>  (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: STARTED
>  (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: PASS (50.22 s)
>  (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: PASS (57.98 s)
>  (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: PASS (58.28 s)
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 60.35 s

Thank you very much for this testing!

Eric
> 
> Regards,
> - Cleber.
> 


