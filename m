Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6F321A61
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:34:14 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECHt-0001Kj-S9
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lECGe-0000Tu-8Q
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:32:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lECGY-0000E9-KY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614004368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSJHEPLlCdHrzKwakQq8j13Lr4WV1hmz9Ee+7NCXr0M=;
 b=DCFJkX6NeVvMnQapEyammc0or/iO2IsKGHM8h+mld81yMUxWRbXnd6un1APzFy2AIEKUgV
 J3y5sLTPGV/NVAoyyGWqpZPNbR2se5lo8AelDVcJGK7vQy/lfAE96g7W5NpeicEeza2hkw
 Fz7ArSfCN84DmAano3y88yrr3ZSZblk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-gsdiCPGKOw2rZZcYm4cCYw-1; Mon, 22 Feb 2021 09:32:46 -0500
X-MC-Unique: gsdiCPGKOw2rZZcYm4cCYw-1
Received: by mail-ej1-f72.google.com with SMTP id 3so900711ejx.17
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSJHEPLlCdHrzKwakQq8j13Lr4WV1hmz9Ee+7NCXr0M=;
 b=edoDyGcFf1E5X+llrU3g8Ql9xmb+7i2gl9eMyb+ilDqJsg1xH5uM3kcvt4GD9WNRjK
 37Muo3dVyMV/GIlmogLAV5kQZVcy5C8Ses071oPJuyZP/HHH1FYI9JRs1kQ9U74eBMZ9
 lJBP9tgxZMo1NSWtsxX0+YL0dSpYy2ug5q+iixO2HRSxfKNaY7fGWk/twIDBocsDqZTi
 X2FvoWPDTvebx2vnAVGDkPu6BbpPrz2WWwXgQorvI2LBWoPxRq1Y7GnLr7qI/u66apMi
 Put9Wb0xmj5+inxpt8gznLU6ttjNwmah4wiTBkJd3htxaooTmU6dPY/lEc7HGrKtsTY2
 Swfw==
X-Gm-Message-State: AOAM530uEp0wjRRojClOdmS6Mybr6A2nRwSPSBLdJKzvt+vl8CQJDPWZ
 r06ok9Narw955Lrr+LNvrwO4C0eW1k+RcadqhZOr6CoS7EDJT1P5lVFbS+7uGvIiOZZ6+piy6PT
 hirIMeDLdSPwMPYM=
X-Received: by 2002:a17:906:48d7:: with SMTP id
 d23mr20115254ejt.275.1614004364773; 
 Mon, 22 Feb 2021 06:32:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhe9b6Q4A1jMsWkRbTi6TkmoKUFbTyBFT8RyOKUlTCn3Gh7umvuRj0gYaElniZa2j0PXxFmw==
X-Received: by 2002:a17:906:48d7:: with SMTP id
 d23mr20115232ejt.275.1614004364623; 
 Mon, 22 Feb 2021 06:32:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bo12sm10486949ejb.93.2021.02.22.06.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:32:44 -0800 (PST)
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7c3b0511-1f04-9c2e-1d2e-5159435c212c@redhat.com>
Date: Mon, 22 Feb 2021 15:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: fam@euphon.net, elena.ufimtseva@oracle.com, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Cleber too:

$ ./scripts/get_maintainer.pl -f tests/acceptance/multiprocess.py
Cleber Rosa <crosa@redhat.com> (reviewer:Acceptance (Integ...)
Wainer dos Santos Moschetta <wainersm@redhat.com> (reviewer:Acceptance
(Integ...)

On 12/23/20 7:44 AM, elena.ufimtseva@oracle.com wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
> 
> Runs the Avocado acceptance test to check if a
> remote lsi53c895a device gets identified by the guest.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  tests/acceptance/multiprocess.py | 104 +++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 tests/acceptance/multiprocess.py
> 
> diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
> new file mode 100644
> index 0000000000..d10b4d2c05
> --- /dev/null
> +++ b/tests/acceptance/multiprocess.py
> @@ -0,0 +1,104 @@
> +# Test for multiprocess qemu
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +
> +from qemu.accel import kvm_available
> +
> +import os
> +import socket
> +
> +ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
> +KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
> +
> +class Multiprocess(Test):
> +    """
> +    :avocado: tags=multiprocess
> +    """
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)
> +
> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> +                machine_type):
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +
> +        # Create socketpair to connect proxy and remote processes
> +        proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
> +                                                    socket.SOCK_STREAM)
> +        os.set_inheritable(proxy_sock.fileno(), True)
> +        os.set_inheritable(remote_sock.fileno(), True)
> +
> +        kernel_path = self.fetch_asset(kernel_url)
> +        initrd_path = self.fetch_asset(initrd_url)
> +
> +        # Create remote process
> +        remote_vm = self.get_vm()
> +        remote_vm.add_args('-machine', 'x-remote')
> +        remote_vm.add_args('-nodefaults')
> +        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
> +        remote_vm.add_args('-object', 'x-remote-object,id=robj1,'
> +                           'devid=lsi1,fd='+str(remote_sock.fileno()))
> +        remote_vm.launch()
> +
> +        # Create proxy process
> +        self.vm.set_console()
> +        self.vm.add_args('-machine', machine_type)
> +        self.vm.add_args('-accel', 'kvm')
> +        self.vm.add_args('-cpu', 'host')
> +        self.vm.add_args("-object",
> +                         "memory-backend-memfd,id=sysmem-file,size=2G")
> +        self.vm.add_args("--numa", "node,memdev=sysmem-file")
> +        self.vm.add_args("-m", "2048")
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args('-device',
> +                         'x-pci-proxy-dev,'
> +                         'id=lsi1,fd='+str(proxy_sock.fileno()))
> +        self.vm.launch()
> +        self.wait_for_console_pattern("as init process")
> +        exec_command_and_wait_for_pattern(self, "mount -t sysfs sysfs /sys",
> +                                          '', '')
> +        exec_command_and_wait_for_pattern(self,
> +                                          "cat /sys/bus/pci/devices/*/uevent",
> +                                          "PCI_ID=1000:0012", '')
> +
> +    def test_multiprocess_x86_64(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/x86_64/os/images'
> +                      '/pxeboot/vmlinuz')
> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/x86_64/os/images'
> +                      '/pxeboot/initrd.img')
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyS0 rdinit=/bin/bash')
> +        machine = 'pc'
> +        self.do_test(kernel_url, initrd_url, kernel_command_line, machine)
> +
> +    def test_multiprocess_aarch64(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        """
> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/aarch64/os/images'
> +                      '/pxeboot/vmlinuz')
> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> +                      '/linux/releases/31/Everything/aarch64/os/images'
> +                      '/pxeboot/initrd.img')
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'rdinit=/bin/bash console=ttyAMA0')
> +        machine_type = 'virt,gic-version=3'
> +        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
> 


