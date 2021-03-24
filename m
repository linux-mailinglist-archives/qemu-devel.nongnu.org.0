Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62F347426
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:10:05 +0100 (CET)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzWe-0003cf-Gq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzUZ-0002oZ-Df
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzUX-0002YP-By
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616576872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jjRq2jHZS5biCyvE8EIBdcK9yzmb8AcuvhsOWQWspU=;
 b=WzSL3/FbN9EA9dHRvZvnWgoAFYKh+llq7RbtDHDHIvCq+H47Yi9vGBeUIcDaNj3hoOrxMi
 xuEbfm9/EmA89NP9mvKVTtcwM0VPKTKcV6KNWAYrNdHL2T2fWuiImQSQaXf0aWYWXEPG53
 ajNPGFGgtMlfP2iF51ZJSSGb2zHMeiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-6lU722j3NC-Rm3X15Pa1yw-1; Wed, 24 Mar 2021 05:07:49 -0400
X-MC-Unique: 6lU722j3NC-Rm3X15Pa1yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D8088127C;
 Wed, 24 Mar 2021 09:07:48 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 075761C4;
 Wed, 24 Mar 2021 09:07:33 +0000 (UTC)
Subject: Re: [PATCH v2 04/10] Acceptance Tests: move useful ssh methods to
 base class
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-5-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <41f58f57-8cc5-f375-943e-0b2d298b8fbd@redhat.com>
Date: Wed, 24 Mar 2021 10:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-5-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 3/23/21 11:15 PM, Cleber Rosa wrote:
> Both the virtiofs submounts and the linux ssh mips malta tests
> contains useful methods related to ssh that deserve to be made
> available to other tests.  Let's move them to the base LinuxTest
nit: strictly speaking they are moved to another class which is
inherited by LinuxTest, right?
> class.
> 
> The method that helps with setting up an ssh connection will now
> support both key and password based authentication, defaulting to key
> based.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 48 ++++++++++++++++++++++-
>  tests/acceptance/linux_ssh_mips_malta.py  | 38 ++----------------
>  tests/acceptance/virtiofs_submounts.py    | 37 -----------------
>  3 files changed, 50 insertions(+), 73 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 83b1741ec8..67f75f66e5 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -20,6 +20,7 @@
>  from avocado.utils import cloudinit
>  from avocado.utils import datadrainer
>  from avocado.utils import network
> +from avocado.utils import ssh
>  from avocado.utils import vmimage
>  from avocado.utils.path import find_command
>  
> @@ -43,6 +44,8 @@
>  from qemu.accel import kvm_available
>  from qemu.accel import tcg_available
>  from qemu.machine import QEMUMachine
> +from qemu.utils import get_info_usernet_hostfwd_port
> +
>  
>  def is_readable_executable_file(path):
>      return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
> @@ -253,7 +256,50 @@ def fetch_asset(self, name,
>                          cancel_on_missing=cancel_on_missing)
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
>      """Facilitates having a cloud-image Linux based available.
>  
>      For tests that indend to interact with guests, this is a better choice
> diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
> index 052008f02d..3f590a081f 100644
> --- a/tests/acceptance/linux_ssh_mips_malta.py
> +++ b/tests/acceptance/linux_ssh_mips_malta.py
> @@ -12,7 +12,7 @@
>  import time
>  
>  from avocado import skipUnless
> -from avocado_qemu import Test
> +from avocado_qemu import Test, LinuxSSHMixIn
>  from avocado_qemu import wait_for_console_pattern
>  from avocado.utils import process
>  from avocado.utils import archive
> @@ -21,7 +21,7 @@
>  from qemu.utils import get_info_usernet_hostfwd_port
Can't you remove this now?
>  
>  
> -class LinuxSSH(Test):
> +class LinuxSSH(Test, LinuxSSHMixIn):
out of curiosity why can't it be migrated to a LinuxTest?
>  
>      timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
>  
> @@ -72,41 +72,9 @@ def get_kernel_info(self, endianess, wordsize):
>      def setUp(self):
>          super(LinuxSSH, self).setUp()
>  
> -    def ssh_connect(self, username, password):
> -        self.ssh_logger = logging.getLogger('ssh')
> -        res = self.vm.command('human-monitor-command',
> -                              command_line='info usernet')
> -        port = get_info_usernet_hostfwd_port(res)
> -        if not port:
> -            self.cancel("Failed to retrieve SSH port")
> -        self.log.debug("sshd listening on port:" + port)
> -        self.ssh_session = ssh.Session(self.VM_IP, port=int(port),
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
>      def ssh_disconnect_vm(self):
>          self.ssh_session.quit()
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
>      def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
>          image_url, image_hash = self.get_image_info(endianess)
>          image_path = self.fetch_asset(image_url, asset_hash=image_hash)
> @@ -127,7 +95,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
>          wait_for_console_pattern(self, console_pattern, 'Oops')
>          self.log.info('sshd ready')
>  
> -        self.ssh_connect('root', 'root')
> +        self.ssh_connect('root', 'root', False)
>  
>      def shutdown_via_ssh(self):
>          self.ssh_command('poweroff')
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 57a7047342..bed8ce44df 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -9,8 +9,6 @@
>  from avocado_qemu import wait_for_console_pattern
>  from avocado.utils import ssh
>  
> -from qemu.utils import get_info_usernet_hostfwd_port
> -
>  
>  def run_cmd(args):
>      subp = subprocess.Popen(args,
> @@ -75,41 +73,6 @@ class VirtiofsSubmountsTest(LinuxTest):
>      :avocado: tags=accel:kvm
>      """
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
>      def run(self, args, ignore_error=False):
>          stdout, stderr, ret = run_cmd(args)
>  
> 

Besides,

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


