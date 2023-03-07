Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8206ADDAC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:40:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVfK-0000Jl-E7; Tue, 07 Mar 2023 06:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVfH-0000JT-OC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVfF-0007WS-To
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGv/2bbHbGH3YbyckOnCzJ+hSm0Bw/cY9Kj8ZN/JqCE=;
 b=gjwZ3Y7adSXecduWo+sR/tlhi8jjPJFvXQ2+hCJNkjPA5TtFG8dkGsqy2xJfB8rJ8KaHQS
 sLMA4vXBfq7hlRChYU+Wh7NNKUWkJ+9v3eB6qy0xmfXb59dCWUw3uGfjtQo4HSgWFbqeFU
 iHTa7vgEwDmR4D5299Hdg1qDBFPlKoQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-Q6fJoQmoNeu1sdCPhsEjNQ-1; Tue, 07 Mar 2023 06:39:24 -0500
X-MC-Unique: Q6fJoQmoNeu1sdCPhsEjNQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso18754840edh.15
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGv/2bbHbGH3YbyckOnCzJ+hSm0Bw/cY9Kj8ZN/JqCE=;
 b=kHUT6YCKNyCd4DzOlf1WilXHyIJF/szC0NQcuztxwB+VBU0612Js4uR/FuZc3Egyg7
 rpC9cnjN6XgYQLqcGSbDfGW17XvlLyPzpaM68IGEjt1RASzq7JUJNHYG1q5uzBOiAI/x
 rBohFG2lkPlSvxOyFCwnypaaJR4AHrZy/XyQaJCPqj0ScnK7nJ1uf4oW1jvv4BqWnLoH
 eAvNUKD9UZj+KMyGMP5dwWI7cDgBUqUiOmZpWDdikCiTSrQ5L2iZjcqvDWSAA4vTnp4/
 qqdbzsIoXUWPj8vjDK3/2dNJ1uQc/EyUxlI+1RgsAkl9CHjdOfEUN1+F6Jqk4RQgtTzU
 b9jA==
X-Gm-Message-State: AO0yUKVVcTPKcIPzpjKz3YmTkgRD1xsqxLbGmCPAYOaMYE5YkWOcRvCM
 q8s9dSKPXVtkX1w3LTVJ8lNuNLKYsQ1/6O1XMQaFOZPCfru/QuMfj74jkAXOpFx+8/6N872B1PM
 J+c9yaQlk4DF/M24=
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id
 be7-20020a1709070a4700b008f0143dfa4bmr18201936ejc.7.1678189163544; 
 Tue, 07 Mar 2023 03:39:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/bhLKwNYPcUOIU+WhUYwKbwTblVIazehNUij5sz2tsELsk5Q6M8kT1dpdS+sXq+wKF1l+xUw==
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id
 be7-20020a1709070a4700b008f0143dfa4bmr18201914ejc.7.1678189163256; 
 Tue, 07 Mar 2023 03:39:23 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 27-20020a170906005b00b008b175c46867sm5944505ejg.116.2023.03.07.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:39:22 -0800 (PST)
Date: Tue, 7 Mar 2023 12:39:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 4/4] test/avocado: test Linux boot up in x2APIC with
 userspace local APIC
Message-ID: <20230307123922.438a3a22@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230221160500.30336-5-minhquangbui99@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-5-minhquangbui99@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 21 Feb 2023 23:05:00 +0700
Bui Quang Minh <minhquangbui99@gmail.com> wrote:

> Simple test to check Linux boot up in x2APIC with userspace local APIC and
> TCG accelerator.

just an idea, while booting linux would give some coverage,
we probably would get much better coverage by using apic test case
from kvm unit test:
  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/blob/master/x86/apic.c

> 
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  tests/avocado/tcg_x2apic.py | 91 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 tests/avocado/tcg_x2apic.py
> 
> diff --git a/tests/avocado/tcg_x2apic.py b/tests/avocado/tcg_x2apic.py
> new file mode 100644
> index 0000000000..ff4f27017c
> --- /dev/null
> +++ b/tests/avocado/tcg_x2apic.py
> @@ -0,0 +1,91 @@
> +# x2APIC with TCG accelerator tests
> +# Based on intel_iommu.py, INTEL_IOMMU Functional tests
> +#
> +# Copyright (c) Bui Quang Minh <minhquangbui99@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later. See the COPYING file in the top-level directory.
> +import os
> +
> +from avocado import skipIf
> +from avocado_qemu import LinuxTest
> +
> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +class TCGx2APIC(LinuxTest):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=distro:fedora
> +    :avocado: tags=distro_version:31
> +    :avocado: tags=machine:q35
> +    :avocado: tags=accel:tcg
> +    :avocado: tags=x2apic
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
> +        super(TCGx2APIC, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
> +
> +    def add_common_args(self):
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +    def common_vm_setup(self, custom_kernel=None):
> +        self.require_accelerator('tcg')
> +        self.add_common_args()
> +        self.vm.add_args('-accel', 'tcg')
> +        self.vm.add_args('-device', 'intel-iommu,intremap=on,eim=on')
> +        self.vm.add_args('-cpu', 'qemu64,+x2apic')
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
> +        self.ssh_command('dmesg | grep "x2apic enabled"')
> +
> +    def test_physical_x2apic(self):
> +        """
> +        :avocado: tags=physical_x2apic
> +        """
> +
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params = (self.distro.default_kernel_params +
> +                              ' quiet intel_iommu=on x2apic_phys')
> +        self.run_and_check()
> +        self.ssh_command('dmesg | grep "Switched APIC routing to physical x2apic"')
> +
> +    def test_cluster_x2apic(self):
> +        """
> +        :avocado: tags=cluster_x2apic
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.kernel_params = (self.distro.default_kernel_params +
> +                              ' quiet intel_iommu=on')
> +        self.run_and_check()
> +        self.ssh_command('dmesg | grep "Switched APIC routing to cluster x2apic"')


