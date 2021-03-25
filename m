Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE56349430
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:34:22 +0100 (CET)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPR41-00071F-JO
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPR1U-0005P6-Q7
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPR1R-0002fz-Rh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616682700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxS+K7GQa0LZYJHZpiGFx2DWtQy1q2PVp7enw0/pV0M=;
 b=NJ1FzgoVQSrp0+FpzRXBz6mzG4SrKSnfcAix3+9bBZMq/+1UgdyjxPyBgHgyzT4ie6q2El
 thdJIy8M4Lk38XeRBornd6VIK9WJeBjI4y3FpIgh1GnIa7m5uOgqu0Nt3X5Gn4Gkpruc8N
 sRUP3A7X2ySiNZjlvH0sXxcjmBhmT4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-3-Ac540_NYCH1q8jSxrFvg-1; Thu, 25 Mar 2021 10:31:38 -0400
X-MC-Unique: 3-Ac540_NYCH1q8jSxrFvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA21CC62A;
 Thu, 25 Mar 2021 14:31:35 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2EA21972B;
 Thu, 25 Mar 2021 14:31:27 +0000 (UTC)
Subject: Re: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-8-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <629927fd-ce1e-a501-0e35-15360a81cc07@redhat.com>
Date: Thu, 25 Mar 2021 11:31:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-8-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/23/21 7:15 PM, Cleber Rosa wrote:
> The LinuxTest specifically targets users that need to interact with Linux
> guests.  So, it makes sense to give a connection by default, and avoid
> requiring it as boiler-plate code.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
>   tests/acceptance/virtiofs_submounts.py    | 1 -
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 535f63a48d..4960142bcc 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=None):
>           cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>           self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>   
> -    def launch_and_wait(self):
> +    def launch_and_wait(self, set_up_ssh_connection=True):
>           self.vm.set_console()
>           self.vm.launch()
>           console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
> @@ -398,3 +398,6 @@ def launch_and_wait(self):
>           console_drainer.start()
>           self.log.info('VM launched, waiting for boot confirmation from guest')
>           cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> +        if set_up_ssh_connection:
> +            self.log.info('Setting up the SSH connection')
> +            self.ssh_connect(self.username, self.ssh_key)

Where is self.username set?

- Wainer

> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index e10a935ac4..e019d3b896 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -136,7 +136,6 @@ def set_up_virtiofs(self):
>   
>       def launch_vm(self):
>           self.launch_and_wait()
> -        self.ssh_connect('root', self.ssh_key)
>   
>       def set_up_nested_mounts(self):
>           scratch_dir = os.path.join(self.shared_dir, 'scratch')


