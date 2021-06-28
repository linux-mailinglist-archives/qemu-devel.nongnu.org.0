Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B33B6877
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:28:22 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvzZ-0004pQ-AP
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxvyd-0003Wa-Ly
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxvyb-0000Hn-3P
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624904840;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dcKZNlZTy3OmG+uKN9JPUDv595fxbPvKfvPTiDPcgQ=;
 b=SXoKCJy6G3xq2z9g4OUTkDVh+TKNjhWGXNt2TSu21CjqiwiPy9cojrHGfk17ngIryJnqNq
 uCjAvJN3J5ejr1xuOxUESReVICrlDqPoGOPuTivvYKPk3oCkBtr+bHH9rkjJnvsknyIL9j
 mAi2MziW8JDTn6VxvJbiWxnGQtYnNPs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-DwOOFEy0MMWW5llvrCRkDA-1; Mon, 28 Jun 2021 14:27:17 -0400
X-MC-Unique: DwOOFEy0MMWW5llvrCRkDA-1
Received: by mail-pj1-f71.google.com with SMTP id
 e11-20020a17090a77cbb029016f97f61097so497764pjs.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/dcKZNlZTy3OmG+uKN9JPUDv595fxbPvKfvPTiDPcgQ=;
 b=U6ds9SzqY9UHl/50vsEiy93XWXEXdkbpOL3gcxZ5JfynGtrINqUuJO2/+1hDAuwGKc
 JHj5FemeRG8du4utzGaavSYWrBivEtAShlFd/Vyj557szyhchNh7pb7+mohAMRVHfJiJ
 wie6xj6D2RcOqWNIC3+fYwrMok9nsISY7ZQ1yiLfJ44dJjWs2UI2Rb2klaSNMqLRRS5O
 9pdD/06iX4ChrjcMoBtrCT6rv8x9zAFfr8PezXXfvjK/4DDyU2lxSczHXpxZeXYOjAVR
 VQio+yCUeYPDhk4MVq9hLLc7hRIA+UX45JuT2SfJO7xQW47jFOkKotnInnW/kHCIYhl8
 ZuIw==
X-Gm-Message-State: AOAM533EWIK/2As3NVsdHfYW94pUG6tWzUo7ytKG+7BHYJsQCRWeICOx
 ZNwodTdQTz6D1VuBJLJMIJ5/D14+wY1Vos+vQyIMxlpzyGpIDsVcrDzwp49AcH8zKnlsFLyARXc
 dR/T1oCEyPDzM4KA=
X-Received: by 2002:a17:902:9895:b029:128:cdfb:f389 with SMTP id
 s21-20020a1709029895b0290128cdfbf389mr8943275plp.45.1624904835889; 
 Mon, 28 Jun 2021 11:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCYWQAWvNwYscpwef0STsZEgY/RMKWE/b6h9ptWVtvFc7ZlhaNYdRJir5U+wwX9g9IMVeraQ==
X-Received: by 2002:a17:902:9895:b029:128:cdfb:f389 with SMTP id
 s21-20020a1709029895b0290128cdfbf389mr8943255plp.45.1624904835634; 
 Mon, 28 Jun 2021 11:27:15 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id w20sm17209956pff.90.2021.06.28.11.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 11:27:15 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] avocado_qemu: Add SMMUv3 tests
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, crosa@redhat.com, peterx@redhat.com
References: <20210621080824.789274-1-eric.auger@redhat.com>
 <20210621080824.789274-3-eric.auger@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <53e16364-b1fb-1917-2e12-61bc21f521db@redhat.com>
Date: Mon, 28 Jun 2021 15:27:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621080824.789274-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/21/21 5:08 AM, Eric Auger wrote:
> Add new tests checking the good behavior of the SMMUv3 protecting
> 2 virtio pci devices (block and net). We check the guest boots and
> we are able to install a package. Different guest configs are tested:
> standard, passthrough an strict=0. This is tested with both fedora 31 and
> 33. The former uses a 5.3 kernel without range invalidation whereas the
> latter uses a 5.8 kernel that features range invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - removed ssh import
> - combined add_command_args() and common_vm_setup()
> - moved tags in class' docstring and added tags=arch:aarch64
> - use self.get_default_kernel_params()
> - added RIL tests with fed33 + introduce new tags
> ---
>   tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 133 insertions(+)
>   create mode 100644 tests/acceptance/smmu.py
>
> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
> new file mode 100644
> index 0000000000..bcb5416a56
> --- /dev/null
> +++ b/tests/acceptance/smmu.py
> @@ -0,0 +1,133 @@
> +# SMMUv3 Functional tests
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Eric Auger <eric.auger@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado_qemu import LinuxTest, BUILD_DIR
> +
> +class SMMU(LinuxTest):
> +    """
> +    :avocado: tags=accel:kvm
> +    :avocado: tags=cpu:host
> +    :avocado: tags=arch:aarch64
> +    :avocado: tags=smmu
> +    """
> +
> +    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
> +    kernel_path = None
> +    initrd_path = None
> +    kernel_params = None
> +
> +    def set_up_boot(self):
> +        path = self.download_boot()
> +        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
> +                         'drive=drv0,id=virtio-disk0,bootindex=1,'
> +                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
> +        self.vm.add_args('-drive',
> +                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
> +
> +    def setUp(self):
> +        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
> +
> +    def common_vm_setup(self, custom_kernel=None):
As some tests call `self.common_vm_setup(True)`, I think `custom_kernel` 
should be `True|False`.
> +        self.require_accelerator("kvm")
> +        self.vm.add_args("-machine", "virt")
FYI, if you have the "machine" tag (e.g. "tags=machine:virt") to your 
tests then avocado_qemu will set "-machine" automatically to any created VM.
> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-smp", "8")
> +        self.vm.add_args("-m", "4096")

The `avocado_qemu.LinuxTest` provides default values for smp and memory 
which cannot be properly overwritten. The resulting command line will 
have -smp and -m twice.

I created an issue to track that improvement: 
https://gitlab.com/qemu-project/qemu/-/issues/453

> +        self.vm.add_args("-machine", "iommu=smmuv3")
> +        self.vm.add_args("-d", "guest_errors")
> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
> +                         'edk2-aarch64-code.fd'))
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +        if custom_kernel is None:
> +            return
> +
> +        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
> +        initrd_url = self.get_pxeboot_url() + 'initrd.img'
> +        self.kernel_path = self.fetch_asset(kernel_url)
> +        self.initrd_path = self.fetch_asset(initrd_url)
> +
> +    def run_and_check(self):
> +        if self.kernel_path:
> +            self.vm.add_args('-kernel', self.kernel_path,
> +                             '-append', self.kernel_params,
> +                             '-initrd', self.initrd_path)
> +        self.launch_and_wait()
> +        self.ssh_command('cat /proc/cmdline')
> +        self.ssh_command('dnf -y install numactl-devel')
> +
> +
> +    # 5.3 kernel without RIL #
> +
> +    def test_smmu_noril(self):
> +        """
> +        :avocado: tags=smmu_noril
> +        :avocado: tags=smmu_noril_tests
> +        :avocado: tags=distro_version:31
> +        """
> +        self.common_vm_setup()
> +        self.run_and_check()
> +
> +    def test_smmu_noril_passthrough(self):
> +        """
> +        :avocado: tags=smmu_noril_passthrough
> +        :avocado: tags=smmu_noril_tests
> +        :avocado: tags=distro_version:31

Maybe you should "distro" tag the tests (or better, tag the class), so 
that a readers of this don't need to browse the `LinuxTest` class 
looking for the distro to be used (although it may be clear to some, 
based on the distro_version)...

Thanks for contributing those tests!

- Wainer

> +        """
> +        self.common_vm_setup(True)
> +        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
> +        self.run_and_check()
> +
> +    def test_smmu_noril_nostrict(self):
> +        """
> +        :avocado: tags=smmu_noril_nostrict
> +        :avocado: tags=smmu_noril_tests
> +        :avocado: tags=distro_version:31
> +        """
> +        self.common_vm_setup(True)
> +        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
> +        self.run_and_check()
> +
> +    # 5.8 kernel featuring range invalidation
> +    # >= v5.7 kernel
> +
> +    def test_smmu_ril(self):
> +        """
> +        :avocado: tags=smmu_ril
> +        :avocado: tags=smmu_ril_tests
> +        :avocado: tags=distro_version:33
> +        """
> +        self.common_vm_setup()
> +        self.run_and_check()
> +
> +    def test_smmu_ril_passthrough(self):
> +        """
> +        :avocado: tags=smmu_ril_passthrough
> +        :avocado: tags=smmu_ril_tests
> +        :avocado: tags=distro_version:33
> +        """
> +        self.common_vm_setup(True)
> +        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
> +        self.run_and_check()
> +
> +    def test_smmu_ril_nostrict(self):
> +        """
> +        :avocado: tags=smmu_ril_nostrict
> +        :avocado: tags=smmu_ril_tests
> +        :avocado: tags=distro_version:33
> +        """
> +        self.common_vm_setup(True)
> +        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
> +        self.run_and_check()


