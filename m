Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF50A3C2A86
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:47:23 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xP8-0000ky-A9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1xMg-0007l4-IU
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:44:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1xMc-00070v-Um
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625863485;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gd0kLtG1Q24TcTgJG2plSXgoiwhkFpACKLAfH7rFtZ8=;
 b=iYedgyWcZtw82UEQrGqRyMFLpffcX3DqkClPMzEJIClJlCaM8vYbcYcrXTnL67fhfrYD7r
 WUCKk+gwHqJS+XN+iRUmCiZVfW1CoXh6+yJrgWLIGo+qA05oe8kAPaCDyAYEj5J/KwWvcr
 VmaAkVlzzBkqzMnFzENWoW3r/CRkxrk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-qb9MfLtHNCuL9x_JUaBJWw-1; Fri, 09 Jul 2021 16:44:44 -0400
X-MC-Unique: qb9MfLtHNCuL9x_JUaBJWw-1
Received: by mail-pl1-f200.google.com with SMTP id
 l10-20020a17090270cab029011dbfb3981aso3950191plt.22
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 13:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Gd0kLtG1Q24TcTgJG2plSXgoiwhkFpACKLAfH7rFtZ8=;
 b=b3mAOdD3TW3z0WU1aLKoCRpaTfsqCAv8O3bVSrqai0EUvEBY4xs1VO2iTllpCB4iXG
 tu9sDbJelDWr1THxp0dkV//ZFtKK2MZyHReRnU8igpjm4J4799s7ZsV5PpAfr1wrVmEv
 cdpIGyI9GZHBybP4peMyWqu7GZB2ndo5zin5Ln1T20nWS/gtvYHapwlA0Z1u09nSkwWb
 b5ygl9QjjW+7oWiLbANdIlEFkZCfNtpLphOt7Gs1flW+OR6VDwxZgTwVv+KJmhGI+PWi
 iUwY5GTbnstHus/prT0ST5K6hChtNe2i4UqO4WRTsr7ezQe4unAqeLi8EvhkXzom4mO3
 VtRA==
X-Gm-Message-State: AOAM530zquFIdhV704PBpvWUpYjnQqW8hjX4mXTnH9c8OcBn95R6hJBg
 7/BLI4gM88JBEtK+AtPoKx6SUa1M28r2f7Q6KvddeDrmYsefFqjKvdfgcLTOw87BiG7qL/m6SLk
 R7WOIfxZYfqEH8iM=
X-Received: by 2002:a17:902:d213:b029:127:9520:7649 with SMTP id
 t19-20020a170902d213b029012795207649mr32529152ply.10.1625863483376; 
 Fri, 09 Jul 2021 13:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUzU88Is3j2lIEB2ODxdVe6sTXSrNAtoUMyze74TeRQhR1HwsfYAsfVCvtRXtLl9riCmqTtA==
X-Received: by 2002:a17:902:d213:b029:127:9520:7649 with SMTP id
 t19-20020a170902d213b029012795207649mr32529137ply.10.1625863483123; 
 Fri, 09 Jul 2021 13:44:43 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id p53sm7499843pfw.108.2021.07.09.13.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 13:44:42 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] avocado_qemu: Add Intel iommu tests
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, crosa@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-5-eric.auger@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <37b10db2-4cc2-1adc-df26-c57a09679642@redhat.com>
Date: Fri, 9 Jul 2021 17:44:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210706131729.30749-5-eric.auger@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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


On 7/6/21 10:17 AM, Eric Auger wrote:
> Add Intel IOMMU functional tests based on fedora 31.
> Different configs are checked:
> - strict
> - caching mode, strict
> - passthrough.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> ---
>
> v4 -> v5:
> - import cleanup (William)
> - IntelIOMMU becomes the class name (William)
> - Added William's Sob
> ---
>   tests/acceptance/intel_iommu.py | 115 ++++++++++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 tests/acceptance/intel_iommu.py

I successfully ran this test.

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/intel_iommu.py b/tests/acceptance/intel_iommu.py
> new file mode 100644
> index 0000000000..ad10491d89
> --- /dev/null
> +++ b/tests/acceptance/intel_iommu.py
> @@ -0,0 +1,115 @@
> +# INTEL_IOMMU Functional tests
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Eric Auger <eric.auger@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +import os
> +
> +from avocado import skipIf
> +from avocado_qemu import LinuxTest
> +
> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +class IntelIOMMU(LinuxTest):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=distro:fedora
> +    :avocado: tags=distro_version:31
> +    :avocado: tags=machine:q35
> +    :avocado: tags=accel:kvm
> +    :avocado: tags=intel_iommu
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
> +        self.vm.add_args('-device', 'virtio-gpu-pci' + self.IOMMU_ADDON)
> +        self.vm.add_args('-drive',
> +                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
> +
> +    def setUp(self):
> +        super(IntelIOMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
> +
> +    def add_common_args(self):
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +    def common_vm_setup(self, custom_kernel=None):
> +        self.require_accelerator("kvm")
> +        self.add_common_args()
> +        self.vm.add_args("-accel", "kvm")
> +
> +        if custom_kernel is None:
> +            return
> +
> +        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
> +        initrd_url = self.distro.pxeboot_url + 'initrd.img'
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
> +        self.ssh_command('dmesg | grep -e DMAR -e IOMMU')
> +        self.ssh_command('find /sys/kernel/iommu_groups/ -type l')
> +        self.ssh_command('dnf -y install numactl-devel')
> +
> +    def test_intel_iommu(self):
> +        """
> +        :avocado: tags=intel_iommu_intremap
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +
> +        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_strict(self):
> +        """
> +        :avocado: tags=intel_iommu_strict
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on,strict'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_strict_cm(self):
> +        """
> +        :avocado: tags=intel_iommu_strict_cm
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on,caching-mode=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on,strict'
> +        self.run_and_check()
> +
> +    def test_intel_iommu_pt(self):
> +        """
> +        :avocado: tags=intel_iommu_pt
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on')
> +        self.vm.add_args('-machine', 'kernel_irqchip=split')
> +        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on iommu=pt'
> +        self.run_and_check()


