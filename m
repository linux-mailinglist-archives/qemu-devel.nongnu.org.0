Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9C34764B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:38:42 +0100 (CET)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0uP-0004Ax-4h
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lP0t3-0003Hj-VM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lP0t2-0003u6-7s
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616582235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXngNC4I8a9qN9gzuktwglSLZHpJ00expjqUgExF2TA=;
 b=h0dfxZeDNz+ywFz+aLtbdUB6TTa/qWZb0oNeHNe2bviDfKrm+Kx7H9W9uZU7SXBqIScb5O
 6/6BttJ8m5qJcweX4syDGIbDRMm7C89w+j0+tln5K4nmwt9lycmuSMMZ6+WcixD1hVDd1G
 sDMysmT2gAxk+xzZILXC/g886kcQ6/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-kmjPRsV2NwS36hduKDrCrA-1; Wed, 24 Mar 2021 06:37:12 -0400
X-MC-Unique: kmjPRsV2NwS36hduKDrCrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA961853023;
 Wed, 24 Mar 2021 10:37:11 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA0175447C;
 Wed, 24 Mar 2021 10:36:54 +0000 (UTC)
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8b620ceb-f056-799e-93c4-02df3559e019@redhat.com>
Date: Wed, 24 Mar 2021 11:36:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-6-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> For users of the LinuxTest class, let's set up the VM with the port
> redirection for SSH, instead of requiring each test to set the same
> arguments.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>  tests/acceptance/virtiofs_submounts.py    | 4 ----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 67f75f66e5..e75b002c70 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
>      timeout = 900
>      chksum = None
>  
> -    def setUp(self, ssh_pubkey=None):
> +    def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
I would be interested in testing with HW bridging too, when a bridge is
available. Do you think we could have the netdev configurable too?
This would be helpful to test vhost for instance.

With respect the network device type, I am currently working on SMMU
test and I need to call the parent setUp-) with the following args now:

super(IOMMU, self).setUp(pubkey,
'virtio-net-pci,iommu_platform=on,disable-modern=off,disable-legacy=on')

It works but I am not sure you had such kind of scenario in mind?

Thanks

Eric

>          super(LinuxTest, self).setUp()
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', '%s,netdev=vnet' % network_device_type)
>          self.set_up_boot()
>          if ssh_pubkey is None:
>              ssh_pubkey, self.ssh_key = self.set_up_existing_ssh_keys()
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index bed8ce44df..e10a935ac4 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -207,10 +207,6 @@ def setUp(self):
>              self.vm.add_args('-kernel', vmlinuz,
>                               '-append', 'console=ttyS0 root=/dev/sda1')
>  
> -        # Allow us to connect to SSH
> -        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> -                         '-device', 'virtio-net,netdev=vnet')
> -
>          self.require_accelerator("kvm")
>          self.vm.add_args('-accel', 'kvm')
>  
> 


