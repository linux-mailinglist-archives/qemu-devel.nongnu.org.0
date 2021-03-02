Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE532A787
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:16:53 +0100 (CET)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8df-0004YS-Vo
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH8bh-00044C-6C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:14:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH8be-0000dy-0l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614705283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iE54W6LGRcVCbUs4HysGWSPzCCOBVn9xFDwMqpSRH9w=;
 b=CG5J64f45HYnx1ghCrsd+mEwu5DH/XnnN6bLYFPAR0rLjOrCkDUJ0w+q+b7d3uCKOJNLzR
 b7SKIdrUReTpcZwuWGr+lfbSOgtQgJPGnnd4jccnFsd3EB4kONij78wGYOpo8HYXvqvN/s
 vJTbDsiSJ9AgVr8+jEvLKLi2vs/WPvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-ebs-qXOpOM2MAQpxSIK_Vg-1; Tue, 02 Mar 2021 12:14:34 -0500
X-MC-Unique: ebs-qXOpOM2MAQpxSIK_Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67BAD79EC0;
 Tue,  2 Mar 2021 17:14:33 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C684B10016DB;
 Tue,  2 Mar 2021 17:14:20 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] tests: Add functional test for out-of-process
 device emulation
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210225205907.223995-1-willianr@redhat.com>
 <20210225205907.223995-3-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4b2187fb-ce57-a942-9e84-6abfbc5a1d73@redhat.com>
Date: Tue, 2 Mar 2021 14:14:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225205907.223995-3-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/25/21 5:59 PM, Willian Rampazzo wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
>
> Runs the Avocado acceptance test to check if a
> remote lsi53c895a device gets identified by the guest.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> [WR: Refactored code]
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   tests/acceptance/multiprocess.py | 95 ++++++++++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
>   create mode 100644 tests/acceptance/multiprocess.py

I ran the tests on my x86_64 workstation, so:

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
> new file mode 100644
> index 0000000000..96627f022a
> --- /dev/null
> +++ b/tests/acceptance/multiprocess.py
> @@ -0,0 +1,95 @@
> +# Test for multiprocess qemu
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +
> +import os
> +import socket
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +
> +class Multiprocess(Test):
> +    """
> +    :avocado: tags=multiprocess
> +    """
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +
> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> +                machine_type):
> +        """Main test method"""
> +        self.require_accelerator('kvm')
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
> +        self.vm.add_args('-object',
> +                         'memory-backend-memfd,id=sysmem-file,size=2G')
> +        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
> +        self.vm.add_args('-m', '2048')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args('-device',
> +                         'x-pci-proxy-dev,'
> +                         'id=lsi1,fd='+str(proxy_sock.fileno()))
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'as init process',
> +                                 'Kernel panic - not syncing')
> +        exec_command(self, 'mount -t sysfs sysfs /sys')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/pci/devices/*/uevent',
> +                                          'PCI_ID=1000:0012')
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
> +        machine_type = 'pc'
> +        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
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


