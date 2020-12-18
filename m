Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00E2DE8E4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:26:23 +0100 (CET)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKSM-0007UK-A9
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kqKPo-0006SA-74
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:23:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kqKPl-0001GX-FZ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608315819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6Dneus7OgrxXKZRQokvaBAQMQRda6FjR3aXFSbCsNY=;
 b=ZJ3LlBMPcKcA/w3pchpgzaltqSImyKBEaVYd6fy5oFvnclQYitHSOZMGxMSX/t2gRCxXD/
 kZcGHoopFjmh5UqCkEz35HonIpqn5xJQJQOyLrSIGOBe1oFdpRSwsryM+mLXFZzeHvM88c
 VqpSsTzlndus9mypqd3AxpnX3affOjg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Ns0jkjo3OF-rz_N1YacYAw-1; Fri, 18 Dec 2020 13:23:36 -0500
X-MC-Unique: Ns0jkjo3OF-rz_N1YacYAw-1
Received: by mail-qk1-f199.google.com with SMTP id n190so2615005qkf.18
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 10:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e6Dneus7OgrxXKZRQokvaBAQMQRda6FjR3aXFSbCsNY=;
 b=hyNwCHkfuhCr6qfnoQOsnSDYmBv4WQ5+EEYR8GOPBMpC21dhLluLdpj9TBRqBl0mT3
 8i80pN+VXM4j1RUKcdW0Z+NZzDf5Jcv3eRTt8q0B5+ypk92DlMHG84VivJJAVxgttVd2
 i8n/rIBop3g+dr+bNedAg6GZA37TNGJXhln+2249vnZf1UyAeTrqGCqck4Z1tBmYEYbA
 fma9GHpiLGWGqzbIy3HoAULwKSSCOT5+HbrrP9VG9PEA7K14loCeMCKaIxTLhVY8a8Uu
 3Ok9P/x2lgvBIovSyesKAq61RowXBLvEFf84JsxDQI/jOUylIucGuzQpQfFrMVeUxj9s
 PjUA==
X-Gm-Message-State: AOAM530KXBNJA6/LDpRpO2JUgOfF41rqxkxoNgXEjADvjbNeGmmdgAlY
 JlzZLderXVl4GohaIJtvPTLVYwMQF2n5S/lfaTzsC1TTmi5JFWSEG/QoCQQXUuQPzVn4G2QxAgp
 vHRNJrWZUDZJkYoE=
X-Received: by 2002:a37:aace:: with SMTP id t197mr5997764qke.400.1608315816463; 
 Fri, 18 Dec 2020 10:23:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjXJ8NBCQYFU4Q/U99XXpqtaDuZxuXCqaqxBQHWI67vyY35fzETvaPA2kqF7DEjqvGdD6nWA==
X-Received: by 2002:a37:aace:: with SMTP id t197mr5997742qke.400.1608315816211; 
 Fri, 18 Dec 2020 10:23:36 -0800 (PST)
Received: from [192.168.1.108] ([177.194.2.130])
 by smtp.gmail.com with ESMTPSA id w8sm6262257qts.50.2020.12.18.10.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 10:23:35 -0800 (PST)
Subject: Re: [PATCH v2] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201217085334.211772-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <d341b59d-17bb-a159-0bbd-e53e2dab9f65@redhat.com>
Date: Fri, 18 Dec 2020 15:23:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217085334.211772-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 5:53 AM, Thomas Huth wrote:
> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and whether we can hot-plug and -unplug a virtio-crypto device.
> But the most interesting part is maybe that we can also successfully
> write some stuff into the emulated framebuffer of the virtio-gpu
> device and make sure that we can read back that data from a screenshot.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: 20201215183623.110128-1-thuth@redhat.com
> 
>   v2:
>   - Uncompress the initrd on the host already to speed up the test
>   - Disable plymouth to seepd up the test
>   - Check for device numbers
>   - Added virtio-crypto test
>   - Added ":avocado: tags=device:" lines
> 
>   tests/acceptance/machine_s390_ccw_virtio.py | 111 ++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index abe25a08f0..a9a0f8a8e2 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -9,10 +9,14 @@
>   # This work is licensed under the terms of the GNU GPL, version 2 or
>   # later.  See the COPYING file in the top-level directory.
>   
> +import os
> +import re
> +import tempfile
>   
>   from avocado_qemu import Test
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
>   
>   class S390CCWVirtioMachine(Test):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -150,3 +154,110 @@ class S390CCWVirtioMachine(Test):
>           self.vm.command('human-monitor-command', command_line='balloon 128')
>           exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
>                                             'MemTotal:         115640 kB')
> +
> +
> +    def test_s390x_fedora(self):
> +
> +        """
> +        :avocado: tags=arch:s390x
> +        :avocado: tags=machine:s390-ccw-virtio
> +        :avocado: tags=device:virtio-gpu
> +        :avocado: tags=device:virtio-crypto
> +        :avocado: tags=device:virtio-net
> +        """
> +
> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> +                      '/images/kernel.img')
> +        kernel_hash = 'b93d1efcafcf29c1673a4ce371a1f8b43941cfeb'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> +                      '/images/initrd.img')
> +        initrd_hash = '3de45d411df5624b8d8ef21cd0b44419ab59b12f'
> +        initrd_path_xz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +        initrd_path = os.path.join(self.workdir, 'initrd-raw.img')
> +        archive.lzma_uncompress(initrd_path_xz, initrd_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE + ' audit=0 '
> +                              'rd.plymouth=0 plymouth.enable=0 rd.rescue')
> +        self.vm.add_args('-nographic',
> +                         '-smp', '4',
> +                         '-m', '512',
> +                         '-name', 'Some Guest Name',
> +                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
> +                         '-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-device', 'zpci,uid=7,target=n',
> +                         '-device', 'virtio-net-pci,id=n,mac=02:ca:fe:fa:ce:12',
> +                         '-device', 'virtio-rng-ccw,devno=fe.1.9876',
> +                         '-device', 'virtio-gpu-ccw,devno=fe.2.5432')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Entering emergency mode')
> +
> +        # Some tests to see whether the CLI options have been considered:
> +        exec_command_and_wait_for_pattern(self, 'lspci',
> +                             '0007:00:00.0 Class 0200: Device 1af4:1000')
> +        exec_command_and_wait_for_pattern(self,
> +                             'cat /sys/class/net/enP7p0s0/address',
> +                             '02:ca:fe:fa:ce:12')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                             '0.1.9876')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                             '0.2.5432')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                             'processors    : 4')
> +        exec_command_and_wait_for_pattern(self, 'grep MemTotal /proc/meminfo',
> +                             'MemTotal:         499848 kB')
> +        exec_command_and_wait_for_pattern(self, 'grep Name /proc/sysinfo',
> +                             'Extended Name:   Some Guest Name')
> +        exec_command_and_wait_for_pattern(self, 'grep UUID /proc/sysinfo',
> +                             '30de4fd9-b4d5-409e-86a5-09b387f70bfa')
> +
> +        # Disable blinking cursor, then write some stuff into the framebuffer.
> +        # QEMU's PPM screendumps contain uncompressed 24-bit values, while the
> +        # framebuffer uses 32-bit, so we pad our text with some spaces when
> +        # writing to the framebuffer. Since the PPM is uncompressed, we then
> +        # can simply read the written "magic bytes" back from the PPM file to
> +        # check whether the framebuffer is working as expected.
> +        exec_command_and_wait_for_pattern(self,
> +            'echo -e "\e[?25l" > /dev/tty0', ':/#')
> +        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<250;i++)); do '
> +            'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
> +            'done',
> +            ':/#')
> +        exec_command_and_wait_for_pattern(self,
> +            'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
> +            '12+0 records out')
> +        tmpfile = tempfile.NamedTemporaryFile(suffix='.ppm',
> +                                              prefix='qemu-scrdump-')
> +        self.vm.command('screendump', filename=tmpfile.name)
> +        ppmfile = open(tmpfile.name, "r")
> +        tmpfile.close
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "P6\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "1024 768\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "255\n")
> +        line = ppmfile.readline()
> +        self.assertEqual(line, "The quick fox jumps over a lazy dog\n")
> +        ppmfile.close
> +
> +        # Hot-plug a virtio-crypto device and see whether it gets accepted
> +        self.clear_guest_dmesg()

Your previous patch "[PATCH 1/3] tests/acceptance: Extract the code to 
clear dmesg and wait for CRW reports" defined the method as 
"clear_guests_dmesg". After fixing this in the code:

Tested-by: Willian Rampazzo <willianr@redhat.com>

> +        self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
> +                        id='cbe0')
> +        self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
> +                        cryptodev='cbe0')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Accelerator.device) ; do'
> +                        ' sleep 1 ; done', 'Accelerator device is ready')
> +        self.vm.command('device_del', id='crypdev0')
> +        self.vm.command('object-del', id='cbe0')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep Start.virtcrypto_remove) ; do'
> +                        ' sleep 1 ; done', 'Start virtcrypto_remove.')
> 

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


