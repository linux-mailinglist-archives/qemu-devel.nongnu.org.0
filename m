Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0F3156C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:31:34 +0100 (CET)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YjV-0003E5-9o
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9Yfo-0000Q9-M6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:27:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9Yfl-0000kI-2e
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612898858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L937yaHmyMw3p2CaRdZi9Bw4CHWRoAstr/jqDkjMnQA=;
 b=ZhAdYNOgu65ACOVVgZRPIP189cLfPJ3yBztgakAziY9az5PMogY9xJKNDnVf4j9aD/b7/6
 kIAWMWw3LoyPTl6SKDPkE5RLFByVT0LC3IWfNFIi1H8e8BFZbcNeh6jU6RAcMWVaGVsoq5
 AjE3r7i1J7+Fxcwt4En/jgvwZYAknhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-k9jFQXnENqGWYf6-UqRd3w-1; Tue, 09 Feb 2021 14:27:34 -0500
X-MC-Unique: k9jFQXnENqGWYf6-UqRd3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE0561005501;
 Tue,  9 Feb 2021 19:27:32 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C21E42CE8A;
 Tue,  9 Feb 2021 19:27:12 +0000 (UTC)
Subject: Re: [PATCH 14/22] Acceptance Tests: introduce LinuxTest base class
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-15-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0bead76c-cf61-2893-a08c-9cf0f7904925@redhat.com>
Date: Tue, 9 Feb 2021 16:27:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-15-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/3/21 2:23 PM, Cleber Rosa wrote:
> This is basically the infrastructure around "boot_linux.py" tests, but
> now made into a base class for general use.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 87 +++++++++++++++++++++
>   tests/acceptance/boot_linux.py            | 94 ++---------------------
>   tests/acceptance/virtiofs_submounts.py    |  6 +-
>   3 files changed, 94 insertions(+), 93 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index bf54e419da..b06692a59d 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -16,6 +16,13 @@ import tempfile
>   
>   import avocado
>   
> +from avocado.utils import cloudinit
> +from avocado.utils import datadrainer
> +from avocado.utils import network
> +from avocado.utils import vmimage
> +from avocado.utils.path import find_command
> +
> +
>   #: The QEMU build root directory.  It may also be the source directory
>   #: if building from the source dir, but it's safer to use BUILD_DIR for
>   #: that purpose.  Be aware that if this code is moved outside of a source
> @@ -206,3 +213,83 @@ class Test(avocado.Test):
>                           expire=expire,
>                           find_only=find_only,
>                           cancel_on_missing=cancel_on_missing)
> +
> +
> +class LinuxTest(Test):
> +    """Facilitates having a cloud-image Linux based available.
> +
> +    For tests that indend to interact with guests, this is a better choice
> +    to start with than the more vanilla `Test` class.
> +    """
> +
> +    timeout = 900
> +    chksum = None
> +
> +    def setUp(self, ssh_pubkey=None):
> +        super(LinuxTest, self).setUp()
> +        self.vm.add_args('-smp', '2')
> +        self.vm.add_args('-m', '1024')
> +        self.set_up_boot()
> +        self.set_up_cloudinit(ssh_pubkey)
> +
> +    def download_boot(self):
> +        self.log.debug('Looking for and selecting a qemu-img binary to be '
> +                       'used to create the bootable snapshot image')
> +        # If qemu-img has been built, use it, otherwise the system wide one
> +        # will be used.  If none is available, the test will cancel.
> +        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> +        if not os.path.exists(qemu_img):
> +            qemu_img = find_command('qemu-img', False)
> +        if qemu_img is False:
> +            self.cancel('Could not find "qemu-img", which is required to '
> +                        'create the bootable image')
> +        vmimage.QEMU_IMG = qemu_img
> +
> +        self.log.info('Downloading/preparing boot image')
> +        # Fedora 31 only provides ppc64le images
> +        image_arch = self.arch
> +        if image_arch == 'ppc64':
> +            image_arch = 'ppc64le'
> +        try:
> +            boot = vmimage.get(
> +                'fedora', arch=image_arch, version='31',
> +                checksum=self.chksum,
> +                algorithm='sha256',
> +                cache_dir=self.cache_dirs[0],
> +                snapshot_dir=self.workdir)
> +        except:
> +            self.cancel('Failed to download/prepare boot image')
> +        return boot.path
> +
> +    def prepare_cloudinit(self, ssh_pubkey=None):
> +        self.log.info('Preparing cloudinit image')
> +        try:
> +            cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> +            self.phone_home_port = network.find_free_port()
> +            cloudinit.iso(cloudinit_iso, self.name,
> +                          username='root',
> +                          password='password',
> +                          # QEMU's hard coded usermode router address
> +                          phone_home_host='10.0.2.2',
> +                          phone_home_port=self.phone_home_port,
> +                          authorized_key=ssh_pubkey)
> +        except Exception:
> +            self.cancel('Failed to prepare the cloudinit image')
> +        return cloudinit_iso
> +
> +    def set_up_boot(self):
> +        path = self.download_boot()
> +        self.vm.add_args('-drive', 'file=%s' % path)
> +
> +    def set_up_cloudinit(self, ssh_pubkey=None):
> +        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
> +        self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
> +
> +    def launch_and_wait(self):
> +        self.vm.set_console()
> +        self.vm.launch()
> +        console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
> +                                                 logger=self.log.getChild('console'))
> +        console_drainer.start()
> +        self.log.info('VM launched, waiting for boot confirmation from guest')
> +        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index bcd923bb4a..14e89d020d 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -10,16 +10,11 @@
>   
>   import os
>   
> -from avocado_qemu import Test, BUILD_DIR
> +from avocado_qemu import LinuxTest, BUILD_DIR
>   
>   from qemu.accel import kvm_available
>   from qemu.accel import tcg_available
>   
> -from avocado.utils import cloudinit
> -from avocado.utils import network
> -from avocado.utils import vmimage
> -from avocado.utils import datadrainer
> -from avocado.utils.path import find_command
>   from avocado import skipIf
>   
>   ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
> @@ -27,86 +22,7 @@ KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
>   TCG_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "TCG"
>   
>   
> -class BootLinuxBase(Test):
> -    def download_boot(self):
> -        self.log.debug('Looking for and selecting a qemu-img binary to be '
> -                       'used to create the bootable snapshot image')
> -        # If qemu-img has been built, use it, otherwise the system wide one
> -        # will be used.  If none is available, the test will cancel.
> -        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> -        if not os.path.exists(qemu_img):
> -            qemu_img = find_command('qemu-img', False)
> -        if qemu_img is False:
> -            self.cancel('Could not find "qemu-img", which is required to '
> -                        'create the bootable image')
> -        vmimage.QEMU_IMG = qemu_img
> -
> -        self.log.info('Downloading/preparing boot image')
> -        # Fedora 31 only provides ppc64le images
> -        image_arch = self.arch
> -        if image_arch == 'ppc64':
> -            image_arch = 'ppc64le'
> -        try:
> -            boot = vmimage.get(
> -                'fedora', arch=image_arch, version='31',
> -                checksum=self.chksum,
> -                algorithm='sha256',
> -                cache_dir=self.cache_dirs[0],
> -                snapshot_dir=self.workdir)
> -        except:
> -            self.cancel('Failed to download/prepare boot image')
> -        return boot.path
> -
> -    def prepare_cloudinit(self, ssh_pubkey=None):
> -        self.log.info('Preparing cloudinit image')
> -        try:
> -            cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> -            self.phone_home_port = network.find_free_port()
> -            cloudinit.iso(cloudinit_iso, self.name,
> -                          username='root',
> -                          password='password',
> -                          # QEMU's hard coded usermode router address
> -                          phone_home_host='10.0.2.2',
> -                          phone_home_port=self.phone_home_port,
> -                          authorized_key=ssh_pubkey)
> -        except Exception:
> -            self.cancel('Failed to prepare the cloudinit image')
> -        return cloudinit_iso
> -
> -class BootLinux(BootLinuxBase):
> -    """
> -    Boots a Linux system, checking for a successful initialization
> -    """
> -
> -    timeout = 900
> -    chksum = None
> -
> -    def setUp(self, ssh_pubkey=None):
> -        super(BootLinux, self).setUp()
> -        self.vm.add_args('-smp', '2')
> -        self.vm.add_args('-m', '1024')
> -        self.set_up_boot()
> -        self.set_up_cloudinit(ssh_pubkey)
> -
> -    def set_up_boot(self):
> -        path = self.download_boot()
> -        self.vm.add_args('-drive', 'file=%s' % path)
> -
> -    def set_up_cloudinit(self, ssh_pubkey=None):
> -        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
> -        self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
> -
> -    def launch_and_wait(self):
> -        self.vm.set_console()
> -        self.vm.launch()
> -        console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
> -                                                 logger=self.log.getChild('console'))
> -        console_drainer.start()
> -        self.log.info('VM launched, waiting for boot confirmation from guest')
> -        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> -
> -
> -class BootLinuxX8664(BootLinux):
> +class BootLinuxX8664(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64
>       """
> @@ -154,7 +70,7 @@ class BootLinuxX8664(BootLinux):
>           self.launch_and_wait()
>   
>   
> -class BootLinuxAarch64(BootLinux):
> +class BootLinuxAarch64(LinuxTest):
>       """
>       :avocado: tags=arch:aarch64
>       :avocado: tags=machine:virt
> @@ -212,7 +128,7 @@ class BootLinuxAarch64(BootLinux):
>           self.launch_and_wait()
>   
>   
> -class BootLinuxPPC64(BootLinux):
> +class BootLinuxPPC64(LinuxTest):
>       """
>       :avocado: tags=arch:ppc64
>       """
> @@ -230,7 +146,7 @@ class BootLinuxPPC64(BootLinux):
>           self.launch_and_wait()
>   
>   
> -class BootLinuxS390X(BootLinux):
> +class BootLinuxS390X(LinuxTest):
>       """
>       :avocado: tags=arch:s390x
>       """
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 1e745f15a2..25ea54b6ff 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -5,15 +5,13 @@ import subprocess
>   import time
>   
>   from avocado import skipUnless
> -from avocado_qemu import Test, BUILD_DIR
> +from avocado_qemu import LinuxTest, BUILD_DIR
>   from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import ssh
>   
>   from qemu.accel import kvm_available
>   from qemu.utils import get_info_usernet_hostfwd_port
>   
> -from boot_linux import BootLinux
> -
>   
>   def run_cmd(args):
>       subp = subprocess.Popen(args,
> @@ -72,7 +70,7 @@ def has_cmds(*cmds):
>       return (True, '')
>   
>   
> -class VirtiofsSubmountsTest(BootLinux):
> +class VirtiofsSubmountsTest(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64
>       :avocado: tags=accel:kvm


