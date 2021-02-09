Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89688315783
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:12:37 +0100 (CET)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZNE-0006zD-A8
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9Z80-0000kC-Iu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:56:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9Z7v-0004K6-F6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612900606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwScqzzH5lzE2KRj8K2H8bwqXJdMRYovuB+co1jT1mc=;
 b=aMDbFsJfjWJj5SYxi3XDZoC7gBz+gQnyiLA+Cbu6v0WORb2WQU+rO4JShzr3ahIPYQCuzV
 vuVos5dmjmj++9SAaltjXzW7VbiJJ5DiWyoefEeEqLwJ6x2dokC4KX6l0aL2S1tabM5+4+
 PmAYf/l8bfI2dgShg4cjKhwQUKFc9Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-pMfOMLpYOI60woonCTqx4A-1; Tue, 09 Feb 2021 14:56:42 -0500
X-MC-Unique: pMfOMLpYOI60woonCTqx4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72AB810066EF;
 Tue,  9 Feb 2021 19:56:40 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AA655D9D0;
 Tue,  9 Feb 2021 19:56:23 +0000 (UTC)
Subject: Re: [PATCH 15/22] Acceptance Tests: move useful ssh methods to base
 class
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-16-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7b988d30-894d-d115-231d-a9f8193f7f32@redhat.com>
Date: Tue, 9 Feb 2021 16:56:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-16-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/3/21 2:23 PM, Cleber Rosa wrote:
> Both the virtiofs submounts and the linux ssh mips malta tests
> contains useful methods related to ssh that deserve to be made
> available to other tests.  Let's move them to the base LinuxTest
> class.
>
> The method that helps with setting up an ssh connection will now
> support both key and password based authentication, defaulting to key
> based.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 49 ++++++++++++++++++++++-
>   tests/acceptance/linux_ssh_mips_malta.py  | 38 ++----------------
>   tests/acceptance/virtiofs_submounts.py    | 36 -----------------
>   3 files changed, 51 insertions(+), 72 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index b06692a59d..f0649e5011 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -10,6 +10,7 @@
>   
>   import logging
>   import os
> +import re
>   import sys
>   import uuid
>   import tempfile
> @@ -19,6 +20,7 @@ import avocado
>   from avocado.utils import cloudinit
>   from avocado.utils import datadrainer
>   from avocado.utils import network
> +from avocado.utils import ssh
>   from avocado.utils import vmimage
>   from avocado.utils.path import find_command
>   
> @@ -40,6 +42,8 @@ else:
>   sys.path.append(os.path.join(SOURCE_DIR, 'python'))
>   
>   from qemu.machine import QEMUMachine
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
>   
>   def is_readable_executable_file(path):
>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
> @@ -215,7 +219,50 @@ class Test(avocado.Test):
>                           cancel_on_missing=cancel_on_missing)
>   
>   
> -class LinuxTest(Test):
> +class LinuxSSHMixIn:
> +    """Contains utility methods for interacting with a guest via SSH."""
> +
> +    def ssh_connect(self, username, credential, credential_is_key=True):
> +        self.ssh_logger = logging.getLogger('ssh')
> +        res = self.vm.command('human-monitor-command',
> +                              command_line='info usernet')
> +        port = get_info_usernet_hostfwd_port(res)
> +        self.assertIsNotNone(port)
> +        self.assertGreater(port, 0)
> +        self.log.debug('sshd listening on port: %d', port)
> +        if credential_is_key:
> +            self.ssh_session = ssh.Session('127.0.0.1', port=port,
> +                                           user=username, key=credential)
> +        else:
> +            self.ssh_session = ssh.Session('127.0.0.1', port=port,
> +                                           user=username, password=credential)
> +        for i in range(10):
> +            try:
> +                self.ssh_session.connect()
> +                return
> +            except:
> +                time.sleep(4)
> +                pass
> +        self.fail('ssh connection timeout')
> +
> +    def ssh_command(self, command):
> +        self.ssh_logger.info(command)
> +        result = self.ssh_session.cmd(command)
> +        stdout_lines = [line.rstrip() for line
> +                        in result.stdout_text.splitlines()]
> +        for line in stdout_lines:
> +            self.ssh_logger.info(line)
> +        stderr_lines = [line.rstrip() for line
> +                        in result.stderr_text.splitlines()]
> +        for line in stderr_lines:
> +            self.ssh_logger.warning(line)
> +
> +        self.assertEqual(result.exit_status, 0,
> +                         f'Guest command failed: {command}')
> +        return stdout_lines, stderr_lines
> +
> +
> +class LinuxTest(Test, LinuxSSHMixIn):
>       """Facilitates having a cloud-image Linux based available.
>   
>       For tests that indend to interact with guests, this is a better choice
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
> index 1742235758..3f590a081f 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -12,7 +12,7 @@ import logging
>   import time
>   
>   from avocado import skipUnless
> -from avocado_qemu import Test
> +from avocado_qemu import Test, LinuxSSHMixIn
>   from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import process
>   from avocado.utils import archive
> @@ -21,7 +21,7 @@ from avocado.utils import ssh
>   from qemu.utils import get_info_usernet_hostfwd_port
>   
>   
> -class LinuxSSH(Test):
> +class LinuxSSH(Test, LinuxSSHMixIn):
>   
>       timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
>   
> @@ -72,41 +72,9 @@ class LinuxSSH(Test):
>       def setUp(self):
>           super(LinuxSSH, self).setUp()
>   
> -    def ssh_connect(self, username, password):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        res = self.vm.command('human-monitor-command',
> -                              command_line='info usernet')
> -        port = get_info_usernet_hostfwd_port(res)
> -        if not port:
> -            self.cancel("Failed to retrieve SSH port")
> -        self.log.debug("sshd listening on port: %d", port)
> -        self.ssh_session = ssh.Session(self.VM_IP, port=port,
> -                                       user=username, password=password)
> -        for i in range(10):
> -            try:
> -                self.ssh_session.connect()
> -                return
> -            except:
> -                time.sleep(4)
> -                pass
> -        self.fail("ssh connection timeout")
> -
>       def ssh_disconnect_vm(self):
>           self.ssh_session.quit()
>   
> -    def ssh_command(self, command, is_root=True):
> -        self.ssh_logger.info(command)
> -        result = self.ssh_session.cmd(command)
> -        stdout_lines = [line.rstrip() for line
> -                        in result.stdout_text.splitlines()]
> -        for line in stdout_lines:
> -            self.ssh_logger.info(line)
> -        stderr_lines = [line.rstrip() for line
> -                        in result.stderr_text.splitlines()]
> -        for line in stderr_lines:
> -            self.ssh_logger.warning(line)
> -        return stdout_lines, stderr_lines
> -
>       def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
>           image_url, image_hash = self.get_image_info(endianess)
>           image_path = self.fetch_asset(image_url, asset_hash=image_hash)
> @@ -127,7 +95,7 @@ class LinuxSSH(Test):
>           wait_for_console_pattern(self, console_pattern, 'Oops')
>           self.log.info('sshd ready')
>   
> -        self.ssh_connect('root', 'root')
> +        self.ssh_connect('root', 'root', False)
>   
>       def shutdown_via_ssh(self):
>           self.ssh_command('poweroff')
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 25ea54b6ff..d0fc103f72 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -10,7 +10,6 @@ from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import ssh
>   
>   from qemu.accel import kvm_available
> -from qemu.utils import get_info_usernet_hostfwd_port
>   
>   
>   def run_cmd(args):
> @@ -76,41 +75,6 @@ class VirtiofsSubmountsTest(LinuxTest):
>       :avocado: tags=accel:kvm
>       """
>   
> -    def ssh_connect(self, username, keyfile):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        res = self.vm.command('human-monitor-command',
> -                              command_line='info usernet')
> -        port = get_info_usernet_hostfwd_port(res)
> -        self.assertIsNotNone(port)
> -        self.assertGreater(port, 0)
> -        self.log.debug('sshd listening on port: %d', port)
> -        self.ssh_session = ssh.Session('127.0.0.1', port=port,
> -                                       user=username, key=keyfile)
> -        for i in range(10):
> -            try:
> -                self.ssh_session.connect()
> -                return
> -            except:
> -                time.sleep(4)
> -                pass
> -        self.fail('ssh connection timeout')
> -
> -    def ssh_command(self, command):
> -        self.ssh_logger.info(command)
> -        result = self.ssh_session.cmd(command)
> -        stdout_lines = [line.rstrip() for line
> -                        in result.stdout_text.splitlines()]
> -        for line in stdout_lines:
> -            self.ssh_logger.info(line)
> -        stderr_lines = [line.rstrip() for line
> -                        in result.stderr_text.splitlines()]
> -        for line in stderr_lines:
> -            self.ssh_logger.warning(line)
> -
> -        self.assertEqual(result.exit_status, 0,
> -                         f'Guest command failed: {command}')
> -        return stdout_lines, stderr_lines
> -
>       def run(self, args, ignore_error=False):
>           stdout, stderr, ret = run_cmd(args)
>   


