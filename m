Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87A2E20C3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 20:19:21 +0100 (CET)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks9fL-0000CI-Nw
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 14:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ks9d8-0007sa-6y
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ks9d4-0000dy-HP
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608751016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SbTJd64CiQdt+Mw1Mjdpc862JJbZiRtoCMimN8ZYfY=;
 b=GvcKZs849xW7Ds6Pv8x8Z7afM2+WIATmNQeeQl9YZFGEDJY7wVuBQJwPVDJjPIdszJubbz
 fGKqFDnWyBwxPV8IihZJxmc5X00ju0+onXZyV8QyLZu4mJdSZHaIJfZlUxyXXTk1pTkFTe
 D60uW/ZxHxkKCSER0qO4tSS2w1uCSMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-3SHLm-KjMkaLYmHAYMDytA-1; Wed, 23 Dec 2020 14:16:52 -0500
X-MC-Unique: 3SHLm-KjMkaLYmHAYMDytA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFBFB803626;
 Wed, 23 Dec 2020 19:16:50 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1832C6F810;
 Wed, 23 Dec 2020 19:16:20 +0000 (UTC)
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
To: elena.ufimtseva@oracle.com, qemu-devel@nongnu.org
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ceb573a1-0abc-9ff1-b9c4-58a072d98913@redhat.com>
Date: Wed, 23 Dec 2020 16:16:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/23/20 3:44 AM, elena.ufimtseva@oracle.com wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
>
> Runs the Avocado acceptance test to check if a
> remote lsi53c895a device gets identified by the guest.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   tests/acceptance/multiprocess.py | 104 +++++++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
>   create mode 100644 tests/acceptance/multiprocess.py

The test looks good. Thanks for contributing it!

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

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


