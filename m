Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE66B1073
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxwY-0006MH-Er; Wed, 08 Mar 2023 12:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZxwR-0006Gh-PQ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:51:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZxwP-00022A-Nl
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:51:07 -0500
Received: by mail-wm1-x332.google.com with SMTP id p16so10308033wmq.5
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678297863;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSzxxXTS8xn1S7uHYqF4TFab+ZhRYtoOW5py1fZK1oA=;
 b=yglfWoL75T/rLlUuFprUgwFsDtjickuB1zfsffppbsHw1eaVNZt2QT9nQlehOu5xxh
 1OBqP8tABiRPhJqnK6VD9Ua8jPtIFlV51WCYeuHHbbbtmMQ7+1MZQEDGeGYyhbvSOjPp
 JqwW7kx5fpUQUvM6myJoggpI3A3ozNdqqRAuK7YrvDAbAUUtTESn7EQoSEmZKTxEZYuI
 MAo/QCzeyAkP0sxlSMh/qt0hsipBMLcVnCyq9JbijgSW7MtD494csxigDYj6av7lrVLP
 vJpsZI67IxCI+jxHPMEQ7vOzQMdYoIIazmRUA0LFOiYEkzytgbdpXKOBDnYPrdcp3H46
 v1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678297863;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HSzxxXTS8xn1S7uHYqF4TFab+ZhRYtoOW5py1fZK1oA=;
 b=OIuy2/5i3zM7sKObYHO9xqWjj0TSGPaQo9AQxR5KuwGDpF2SRj8mlsWq1Gs1Nq+Sik
 8fj906/UJnKtosHgxe+saiBvUweCEIarXOv8C/FLIYsIoV0fc3mcBkXbSfUUjhfN1nzs
 HNfcZm03ZMZadfPkz1PiPpv1TGDUxChPB5J2WcQIj886eSncXM9RfM982LJ9A+NOTmOF
 EiUrRJtBsBV0x8Gnl9I4qrYsDZCI3IwpOGN8UR8trNfs9gVw77SBp1L2nAftfyVBob6o
 KNnjihacgTanIDCGuWFxPf/7rrShjWBJCVNbdeGsuKAbtpsuhX44zbhZLUKqmv2s5Tgz
 825w==
X-Gm-Message-State: AO0yUKUFSoBp8LhkEHjuIEH1jJr9KGx9GMmthMvM0SvuAKWlg3GEPZmu
 nxwqPOxFC8exi+LnM3bjr5Juyw==
X-Google-Smtp-Source: AK7set+s49kPCzNiqaJ7atdOqkcHIuXp+vf3wo0xFzU2CP+lfbXD6YxYnLVWc3f9g+xd2tY4AdTQZA==
X-Received: by 2002:a05:600c:4692:b0:3ea:f73e:9d8a with SMTP id
 p18-20020a05600c469200b003eaf73e9d8amr16676793wmo.30.1678297863641; 
 Wed, 08 Mar 2023 09:51:03 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003eb369abd92sm171270wmo.2.2023.03.08.09.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:51:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1DB21FFB7;
 Wed,  8 Mar 2023 17:51:02 +0000 (GMT)
References: <20230308111952.2728440-1-dwmw2@infradead.org>
 <20230308111952.2728440-4-dwmw2@infradead.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] tests/avocado: Test Xen guest support under KVM
Date: Wed, 08 Mar 2023 17:45:43 +0000
In-reply-to: <20230308111952.2728440-4-dwmw2@infradead.org>
Message-ID: <87lek7nncp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


David Woodhouse <dwmw2@infradead.org> writes:

> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Exercise guests with a few different modes for interrupt delivery. In
> particular we want to cover:
>
>  =E2=80=A2 Xen event channel delivery via GSI to the I/O APIC
>  =E2=80=A2 Xen event channel delivery via GSI to the i8259 PIC
>  =E2=80=A2 MSIs routed to PIRQ event channels
>  =E2=80=A2 GSIs routed to PIRQ event channels
>
> As well as some variants of normal non-Xen stuff like MSI to vAPIC and
> PCI INTx going to the I/O APIC and PIC, which ought to still work even
> in Xen mode.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  tests/avocado/xen_guest.py | 147 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 tests/avocado/xen_guest.py
>
> diff --git a/tests/avocado/xen_guest.py b/tests/avocado/xen_guest.py
> new file mode 100644
> index 0000000000..c50b52958f
> --- /dev/null
> +++ b/tests/avocado/xen_guest.py
> @@ -0,0 +1,147 @@
> +# Xen guest functional tests
> +#

Perhaps to avoid confusion we should call the file kvm_xen_guests.py and
make it clearer in the comment this is the mode we are talking about.
c.f. the boot_xen.py tests which boot Xen (under TCG emulation) as a
proper hypervisor.

> +# Copyright =C2=A9 2021 Red Hat, Inc.
> +# Copyright =C2=A9 2023 Amazon.com, Inc. or its affiliates. All Rights R=
eserved.
> +#
> +# Author:
> +#  David Woodhouse <dwmw2@infradead.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +import os
> +
> +from avocado import skipIf
> +from avocado_qemu import LinuxTest
> +
> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

This just means we will never have CI coverage. In theory when running
on the GitLab shared runners the test should skip anyway when it can't
find /dev/kvm and hopefully can run on our custom runners when it can
see /dev/kvm.

> +class XenGuest(LinuxTest):
> +    """
> +    :avocado: tags=3Darch:x86_64
> +    :avocado: tags=3Ddistro:fedora
> +    :avocado: tags=3Ddistro_version:34
> +    :avocado: tags=3Dmachine:q35
> +    :avocado: tags=3Daccel:kvm
> +    :avocado: tags=3Dxen_guest
> +    """
> +
> +    kernel_path =3D None
> +    initrd_path =3D None
> +    kernel_params =3D None
> +
> +    def set_up_boot(self):
> +        path =3D self.download_boot()
> +        self.vm.add_args('-drive', 'file=3D%s,if=3Dnone,id=3Ddrv0' % pat=
h)
> +        self.vm.add_args('-device', 'xen-disk,drive=3Ddrv0,vdev=3Dxvda')
> +
> +    def setUp(self):
> +        super(XenGuest, self).setUp(None, 'virtio-net-pci')
> +
> +    def common_vm_setup(self, custom_kernel=3DNone):
> +        self.require_accelerator("kvm")
> +        self.vm.add_args("-accel", "kvm,xen-version=3D0x4000a,kernel-irq=
chip=3Dsplit")
> +        self.vm.add_args("-smp", "4")
> +
> +        if custom_kernel is None:
> +            return
> +
> +        kernel_url =3D self.distro.pxeboot_url + 'vmlinuz'
> +        initrd_url =3D self.distro.pxeboot_url + 'initrd.img'
> +        self.kernel_path =3D self.fetch_asset(kernel_url, algorithm=3D's=
ha256',
> +                                            asset_hash=3Dself.distro.ker=
nel_hash)
> +        self.initrd_path =3D self.fetch_asset(initrd_url, algorithm=3D's=
ha256',
> +                                            asset_hash=3Dself.distro.ini=
trd_hash)
> +
> +    def run_and_check(self):
> +        if self.kernel_path:
> +            self.vm.add_args('-kernel', self.kernel_path,
> +                             '-append', self.kernel_params,
> +                             '-initrd', self.initrd_path)
> +        self.launch_and_wait()
> +        self.ssh_command('cat /proc/cmdline')
> +        self.ssh_command('dmesg | grep -e "Grant table initialized"')
> +
> +    def test_xen_guest(self):
> +        """
> +        :avocado: tags=3Dxen_guest
> +        """
> +
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-pirq.*msi /proc/interrupts')
> +
> +    def test_xen_guest_nomsi(self):
> +        """
> +        :avocado: tags=3Dxen_guest_nomsi
> +        """
> +
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks pci=3Dnomsi')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-pirq.* /proc/interrupts')
> +
> +    def test_xen_guest_noapic_nomsi(self):
> +        """
> +        :avocado: tags=3Dxen_guest_noapic_nomsi
> +        """
> +
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks noapic pci=
=3Dnomsi')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-pirq /proc/interrupts')
> +
> +    def test_xen_guest_vapic(self):
> +        """
> +        :avocado: tags=3Dxen_guest_vapic
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.vm.add_args('-cpu', 'host,+xen-vapic')
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-pirq /proc/interrupts')
> +        self.ssh_command('grep PCI-MSI /proc/interrupts')
> +
> +    def test_xen_guest_novector(self):
> +        """
> +        :avocado: tags=3Dxen_guest_novector
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks' +
> +                              ' xen_no_vector_callback')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-platform-pci /proc/interrupts')
> +
> +    def test_xen_guest_novector_nomsi(self):
> +        """
> +        :avocado: tags=3Dxen_guest_novector_nomsi
> +        """
> +
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks pci=3Dnomsi'=
 +
> +                              ' xen_no_vector_callback')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-platform-pci /proc/interrupts')
> +
> +    def test_xen_guest_novector_noapic(self):
> +        """
> +        :avocado: tags=3Dxen_guest_novector_noapic
> +        """
> +
> +        self.common_vm_setup(True)
> +        self.kernel_params =3D (self.distro.default_kernel_params +
> +                              ' xen_emul_unplug=3Dide-disks' +
> +                              ' xen_no_vector_callback noapic')
> +        self.run_and_check()
> +        self.ssh_command('grep xen-platform-pci /proc/interrupts')


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

