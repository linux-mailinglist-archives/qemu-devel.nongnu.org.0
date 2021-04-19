Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80183646EB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:16:42 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVdi-0005a2-14
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVTX-0000bS-HA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVTU-00056T-Tj
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618844766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nP4lqyBWE1iTnmUenggUxFMKsLRCoyopci3zWS9KWpc=;
 b=AfOEIWeONdN5aMYMr0HwdvM8pug/hQmxtkb727srxphCOgCncj+HaNWpoOl2ybYgZ0zzWf
 H+N71X7H+o7QHpXnBjSc2sdl3FMletFCJRc+DSCPTYtfvxdVQiagV5BvBLXnHU6p/2Fr/9
 LdtAe8cOSWeXOUuBTACocmhYrc+H2C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-d5L5HXQgNIii3f3YfRd4Qg-1; Mon, 19 Apr 2021 11:06:04 -0400
X-MC-Unique: d5L5HXQgNIii3f3YfRd4Qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD75E83DD23;
 Mon, 19 Apr 2021 15:06:03 +0000 (UTC)
Received: from [10.36.113.132] (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 135391F05C;
 Mon, 19 Apr 2021 15:05:24 +0000 (UTC)
Subject: Re: [PATCH v3 07/11] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210412044644.55083-1-crosa@redhat.com>
 <20210412044644.55083-8-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9781d88b-8193-1d79-56e9-68d194f8901e@redhat.com>
Date: Mon, 19 Apr 2021 17:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210412044644.55083-8-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 4/12/21 6:46 AM, Cleber Rosa wrote:
> The LinuxTest specifically targets users that need to interact with Linux
> guests.  So, it makes sense to give a connection by default, and avoid
> requiring it as boiler-plate code.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  tests/acceptance/avocado_qemu/__init__.py |  5 ++++-
>  tests/acceptance/boot_linux.py            | 18 +++++++++---------
>  tests/acceptance/virtiofs_submounts.py    |  1 -
>  3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 25f871f5bc6..1062a851b97 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -391,7 +391,7 @@ def set_up_cloudinit(self, ssh_pubkey=None):
>          cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>          self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>  
> -    def launch_and_wait(self):
> +    def launch_and_wait(self, set_up_ssh_connection=True):
>          self.vm.set_console()
>          self.vm.launch()
>          console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
> @@ -399,3 +399,6 @@ def launch_and_wait(self):
>          console_drainer.start()
>          self.log.info('VM launched, waiting for boot confirmation from guest')
>          cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> +        if set_up_ssh_connection:
> +            self.log.info('Setting up the SSH connection')
> +            self.ssh_connect(self.username, self.ssh_key)
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 0d178038a09..314370fd1f5 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -29,7 +29,7 @@ def test_pc_i440fx_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>      def test_pc_i440fx_kvm(self):
>          """
> @@ -38,7 +38,7 @@ def test_pc_i440fx_kvm(self):
>          """
>          self.require_accelerator("kvm")
>          self.vm.add_args("-accel", "kvm")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>      def test_pc_q35_tcg(self):
>          """
> @@ -47,7 +47,7 @@ def test_pc_q35_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>      def test_pc_q35_kvm(self):
>          """
> @@ -56,7 +56,7 @@ def test_pc_q35_kvm(self):
>          """
>          self.require_accelerator("kvm")
>          self.vm.add_args("-accel", "kvm")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>  
>  class BootLinuxAarch64(LinuxTest):
> @@ -85,7 +85,7 @@ def test_virt_tcg(self):
>          self.vm.add_args("-cpu", "max")
>          self.vm.add_args("-machine", "virt,gic-version=2")
>          self.add_common_args()
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>      def test_virt_kvm_gicv2(self):
>          """
> @@ -98,7 +98,7 @@ def test_virt_kvm_gicv2(self):
>          self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-machine", "virt,gic-version=2")
>          self.add_common_args()
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>      def test_virt_kvm_gicv3(self):
>          """
> @@ -111,7 +111,7 @@ def test_virt_kvm_gicv3(self):
>          self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-machine", "virt,gic-version=3")
>          self.add_common_args()
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>  
>  class BootLinuxPPC64(LinuxTest):
> @@ -128,7 +128,7 @@ def test_pseries_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
>  
>  
>  class BootLinuxS390X(LinuxTest):
> @@ -146,4 +146,4 @@ def test_s390_ccw_virtio_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> -        self.launch_and_wait()
> +        self.launch_and_wait(set_up_ssh_connection=False)
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index e10a935ac4e..e019d3b896b 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -136,7 +136,6 @@ def set_up_virtiofs(self):
>  
>      def launch_vm(self):
>          self.launch_and_wait()
> -        self.ssh_connect('root', self.ssh_key)
>  
>      def set_up_nested_mounts(self):
>          scratch_dir = os.path.join(self.shared_dir, 'scratch')
> 


