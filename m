Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863DF347482
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:26:17 +0100 (CET)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzmJ-0004tx-En
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzjM-0002p0-U0
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzjI-0003ME-6g
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616577786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZM0ViQmihI4vpoU8uCV3BgujSJo7C4kjlMtrgsBZrHQ=;
 b=I/LgqWn5eRwD4T7EZCdYtW/pkepBIGiYEiHACc/cPXoVlwWcVxCXlyjpZgxKE3+PJN1PBb
 0vyueniMgfEz/1N1VB4G9Nu5EVSRMoRrc41/AG7eTypyUt5klHnL0q3y8rqRvRLg6zI7xq
 i7T1kQt6TCma848ugVqgx15BGhIPtVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-g39Fgc91MwCpWHHHe04FIA-1; Wed, 24 Mar 2021 05:23:03 -0400
X-MC-Unique: g39Fgc91MwCpWHHHe04FIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CA135B362;
 Wed, 24 Mar 2021 09:23:02 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A24859CA0;
 Wed, 24 Mar 2021 09:22:48 +0000 (UTC)
Subject: Re: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-8-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <887f1c44-898f-3a50-047e-7752a58c9887@redhat.com>
Date: Wed, 24 Mar 2021 10:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-8-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> The LinuxTest specifically targets users that need to interact with Linux
> guests.  So, it makes sense to give a connection by default, and avoid
> requiring it as boiler-plate code.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
>  tests/acceptance/virtiofs_submounts.py    | 1 -
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 535f63a48d..4960142bcc 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=None):
>          cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>          self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>  
> -    def launch_and_wait(self):
> +    def launch_and_wait(self, set_up_ssh_connection=True):
>          self.vm.set_console()
>          self.vm.launch()
>          console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
> @@ -398,3 +398,6 @@ def launch_and_wait(self):
>          console_drainer.start()
>          self.log.info('VM launched, waiting for boot confirmation from guest')
>          cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> +        if set_up_ssh_connection:
> +            self.log.info('Setting up the SSH connection')
> +            self.ssh_connect(self.username, self.ssh_key)
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index e10a935ac4..e019d3b896 100644
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
what about launch_and_wait calls in boot_linux.py. Don't you want to
force ssh connection off there?

Thanks

Eric


