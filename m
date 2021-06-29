Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B843B73FD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:11:39 +0200 (CEST)
Received: from localhost ([::1]:48246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyESg-000259-7h
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEQ8-0007GE-IU
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEQ4-00053V-Ja
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624975735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTRZIX+XdIlPurHCtc/ct6i6H9GYEnH/70XEHBPYpfE=;
 b=hso/258sYccuQ8G7/7YLKouzciuC1ZN8qWq1L33SYXbfSzmblDDc9MMpP6jtGBsB5SyWYb
 3NnAuVC9pw2FWb35qMStGWnl4Xt6pudDj3dr/0ITyV+9Fpd8YJhikA6ppaQ+tvBXV2Fpel
 jsE+QsTPHSnc9OCwNiHgq9S/Lke3esM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-LyFi3f4HPYaSqeTez1QkRw-1; Tue, 29 Jun 2021 10:08:54 -0400
X-MC-Unique: LyFi3f4HPYaSqeTez1QkRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 13-20020a1c010d0000b02901eca51685daso1349807wmb.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UTRZIX+XdIlPurHCtc/ct6i6H9GYEnH/70XEHBPYpfE=;
 b=AYY38i3StijBsg2L8DPKdz5vmAwYFtg/axh2RLQ1poEKBAIC9IxHF6dA9XelXxOui9
 bXrfrBosHMjxy7LBjWQS+wavtkkwtsNSEDG4wawl+lUGZ3Yklx6qVjwx276PPmPtrq3M
 PIA9Q5gd/XmiLTf0Msjay5mslhWcP7sFb2O1fJUmg2UfdIl2uCQFxGIlG8tPgJnM5g0G
 5KHl9yAkUUq9vBOsq/X1YhsNXdmuzruyKr2ie7GW7Vd1Ly8MQUqfprkJLAfU2hCrSPYH
 fdRn7Sy+w84JR5hQSH83zbTtxfD45QuJnFOIjG0i2xrvQOhp/7LBBs+sIkCOgoNAAVSZ
 rI+Q==
X-Gm-Message-State: AOAM531uuY/mx/kHUtL+OxFWx5SLta2ZHL5UjsuOD+CxKwkfoe8qXKi+
 E+O1w2XF/IXFEfePXZDTQo/43zhmLrnMEdVFvYIUoDz4WkJ0DlPSTTnawqm8hq27kBrbuG+yVql
 TvD1+FdxbrY9f59s=
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr9859138wmj.159.1624975733347; 
 Tue, 29 Jun 2021 07:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymQ6x2rL5/cjDlLVwOeFETye01kF94ksFCa5/flQMpqzrhheeUgUU+/k5/oYvrnKePYoA5SA==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr9859113wmj.159.1624975733167; 
 Tue, 29 Jun 2021 07:08:53 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v11sm9646184wru.49.2021.06.29.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 07:08:52 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] avocado_qemu: Add SMMUv3 tests
To: wainersm@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, peterx@redhat.com
References: <20210621080824.789274-1-eric.auger@redhat.com>
 <20210621080824.789274-3-eric.auger@redhat.com>
 <53e16364-b1fb-1917-2e12-61bc21f521db@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b132b5ca-dfc9-1a85-0a10-542ea3e5a74b@redhat.com>
Date: Tue, 29 Jun 2021 16:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <53e16364-b1fb-1917-2e12-61bc21f521db@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/28/21 8:27 PM, Wainer dos Santos Moschetta wrote:
> Hi,
>
> On 6/21/21 5:08 AM, Eric Auger wrote:
>> Add new tests checking the good behavior of the SMMUv3 protecting
>> 2 virtio pci devices (block and net). We check the guest boots and
>> we are able to install a package. Different guest configs are tested:
>> standard, passthrough an strict=0. This is tested with both fedora 31
>> and
>> 33. The former uses a 5.3 kernel without range invalidation whereas the
>> latter uses a 5.8 kernel that features range invalidation.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - removed ssh import
>> - combined add_command_args() and common_vm_setup()
>> - moved tags in class' docstring and added tags=arch:aarch64
>> - use self.get_default_kernel_params()
>> - added RIL tests with fed33 + introduce new tags
>> ---
>>   tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>   create mode 100644 tests/acceptance/smmu.py
>>
>> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
>> new file mode 100644
>> index 0000000000..bcb5416a56
>> --- /dev/null
>> +++ b/tests/acceptance/smmu.py
>> @@ -0,0 +1,133 @@
>> +# SMMUv3 Functional tests
>> +#
>> +# Copyright (c) 2021 Red Hat, Inc.
>> +#
>> +# Author:
>> +#  Eric Auger <eric.auger@redhat.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +
>> +from avocado_qemu import LinuxTest, BUILD_DIR
>> +
>> +class SMMU(LinuxTest):
>> +    """
>> +    :avocado: tags=accel:kvm
>> +    :avocado: tags=cpu:host
>> +    :avocado: tags=arch:aarch64
>> +    :avocado: tags=smmu
>> +    """
>> +
>> +    IOMMU_ADDON =
>> ',iommu_platform=on,disable-modern=off,disable-legacy=on'
>> +    kernel_path = None
>> +    initrd_path = None
>> +    kernel_params = None
>> +
>> +    def set_up_boot(self):
>> +        path = self.download_boot()
>> +        self.vm.add_args('-device',
>> 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
>> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
>> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
>> +        self.vm.add_args('-drive',
>> +                        
>> 'file=%s,if=none,cache=writethrough,id=drv0' % path)
>> +
>> +    def setUp(self):
>> +        super(SMMU, self).setUp(None, 'virtio-net-pci' +
>> self.IOMMU_ADDON)
>> +
>> +    def common_vm_setup(self, custom_kernel=None):
> As some tests call `self.common_vm_setup(True)`, I think
> `custom_kernel` should be `True|False`.
OK changed to False
>> +        self.require_accelerator("kvm")
>> +        self.vm.add_args("-machine", "virt")
> FYI, if you have the "machine" tag (e.g. "tags=machine:virt") to your
> tests then avocado_qemu will set "-machine" automatically to any
> created VM.
OK
>> +        self.vm.add_args("-accel", "kvm")
>> +        self.vm.add_args("-cpu", "host")
>> +        self.vm.add_args("-smp", "8")
>> +        self.vm.add_args("-m", "4096")
>
> The `avocado_qemu.LinuxTest` provides default values for smp and
> memory which cannot be properly overwritten. The resulting command
> line will have -smp and -m twice.
>
> I created an issue to track that improvement:
> https://gitlab.com/qemu-project/qemu/-/issues/453
OK removed those params and rely on defaults
>
>> +        self.vm.add_args("-machine", "iommu=smmuv3")
>> +        self.vm.add_args("-d", "guest_errors")
>> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
>> +                         'edk2-aarch64-code.fd'))
>> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
>> +        self.vm.add_args('-object',
>> +                         'rng-random,id=rng0,filename=/dev/urandom')
>> +
>> +        if custom_kernel is None:
>> +            return
>> +
>> +        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
>> +        initrd_url = self.get_pxeboot_url() + 'initrd.img'
>> +        self.kernel_path = self.fetch_asset(kernel_url)
>> +        self.initrd_path = self.fetch_asset(initrd_url)
>> +
>> +    def run_and_check(self):
>> +        if self.kernel_path:
>> +            self.vm.add_args('-kernel', self.kernel_path,
>> +                             '-append', self.kernel_params,
>> +                             '-initrd', self.initrd_path)
>> +        self.launch_and_wait()
>> +        self.ssh_command('cat /proc/cmdline')
>> +        self.ssh_command('dnf -y install numactl-devel')
>> +
>> +
>> +    # 5.3 kernel without RIL #
>> +
>> +    def test_smmu_noril(self):
>> +        """
>> +        :avocado: tags=smmu_noril
>> +        :avocado: tags=smmu_noril_tests
>> +        :avocado: tags=distro_version:31
>> +        """
>> +        self.common_vm_setup()
>> +        self.run_and_check()
>> +
>> +    def test_smmu_noril_passthrough(self):
>> +        """
>> +        :avocado: tags=smmu_noril_passthrough
>> +        :avocado: tags=smmu_noril_tests
>> +        :avocado: tags=distro_version:31
>
> Maybe you should "distro" tag the tests (or better, tag the class), so
> that a readers of this don't need to browse the `LinuxTest` class
> looking for the distro to be used (although it may be clear to some,
> based on the distro_version)...
done
>
> Thanks for contributing those tests!
you're welcome

Thanks

Eric
>
> - Wainer
>
>> +        """
>> +        self.common_vm_setup(True)
>> +        self.kernel_params = self.get_default_kernel_params() + '
>> iommu.passthrough=on'
>> +        self.run_and_check()
>> +
>> +    def test_smmu_noril_nostrict(self):
>> +        """
>> +        :avocado: tags=smmu_noril_nostrict
>> +        :avocado: tags=smmu_noril_tests
>> +        :avocado: tags=distro_version:31
>> +        """
>> +        self.common_vm_setup(True)
>> +        self.kernel_params = self.get_default_kernel_params() + '
>> iommu.strict=0'
>> +        self.run_and_check()
>> +
>> +    # 5.8 kernel featuring range invalidation
>> +    # >= v5.7 kernel
>> +
>> +    def test_smmu_ril(self):
>> +        """
>> +        :avocado: tags=smmu_ril
>> +        :avocado: tags=smmu_ril_tests
>> +        :avocado: tags=distro_version:33
>> +        """
>> +        self.common_vm_setup()
>> +        self.run_and_check()
>> +
>> +    def test_smmu_ril_passthrough(self):
>> +        """
>> +        :avocado: tags=smmu_ril_passthrough
>> +        :avocado: tags=smmu_ril_tests
>> +        :avocado: tags=distro_version:33
>> +        """
>> +        self.common_vm_setup(True)
>> +        self.kernel_params = self.get_default_kernel_params() + '
>> iommu.passthrough=on'
>> +        self.run_and_check()
>> +
>> +    def test_smmu_ril_nostrict(self):
>> +        """
>> +        :avocado: tags=smmu_ril_nostrict
>> +        :avocado: tags=smmu_ril_tests
>> +        :avocado: tags=distro_version:33
>> +        """
>> +        self.common_vm_setup(True)
>> +        self.kernel_params = self.get_default_kernel_params() + '
>> iommu.strict=0'
>> +        self.run_and_check()
>


