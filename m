Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C442D7FD5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:18:12 +0100 (CET)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knorj-0003zU-SD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knokO-0002XH-Ln
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knokM-0002ID-Tg
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607717434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndVRTb+G2k0I7YH++Y7dS7OAYJgT79NiWa3TD872+ug=;
 b=hHpnvfBt3Hw2sKdCkl+vxZhGTBpi3H1LhhN+6s/IGwqTNP+REyiynB487OjviAbkK+hRUI
 u2S0JNbhJ9lamZzZ9H6ZevVvRAdWO5OeKqKt8w2lB/wn/AHxJOsRwj5NPnsejoaoCth0Rl
 sgUNhWjuOVorb+cH1B2sVtwTHQkjaNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-1wFdFs9wMFSq5unJUsJU9w-1; Fri, 11 Dec 2020 15:10:31 -0500
X-MC-Unique: 1wFdFs9wMFSq5unJUsJU9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6FD10054FF;
 Fri, 11 Dec 2020 20:10:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C06065D9D2;
 Fri, 11 Dec 2020 20:10:27 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/acceptance: Extract the code to clear dmesg and
 wait for CRW reports
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <20201211173134.376078-2-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7647459b-789a-1dd6-ea6c-03fc6d8e7b5b@redhat.com>
Date: Fri, 11 Dec 2020 17:10:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211173134.376078-2-thuth@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/11/20 2:31 PM, Thomas Huth wrote:
> We will use this in more spots soon, so it's easier to put this into
> a separate function.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 30 ++++++++++++---------
>   1 file changed, 17 insertions(+), 13 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 864ef4ee6e..733a7ca24a 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -17,12 +17,24 @@ from avocado_qemu import wait_for_console_pattern
>   class S390CCWVirtioMachine(Test):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>   
> +    timeout = 120
> +
>       def wait_for_console_pattern(self, success_message, vm=None):
>           wait_for_console_pattern(self, success_message,
>                                    failure_message='Kernel panic - not syncing',
>                                    vm=vm)
>   
> -    timeout = 120
> +    def wait_for_crw_reports(self):
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> +                        'CRW reports')
> +
> +    dmesg_clear_count = 1
> +    def clear_guests_dmesg(self):
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
> +                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
> +                    'dm_clear ' + str(self.dmesg_clear_count))
> +        self.dmesg_clear_count += 1
>   
>       def test_s390x_devices(self):
>   
> @@ -100,26 +112,18 @@ class S390CCWVirtioMachine(Test):
>                           'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
>                           '0x0000000c')
>           # add another device
> -        exec_command_and_wait_for_pattern(self,
> -                                    'dmesg -c > /dev/null; echo dm_clear\ 1',
> -                                    'dm_clear 1')
> +        self.clear_guests_dmesg()
>           self.vm.command('device_add', driver='virtio-net-ccw',
>                           devno='fe.0.4711', id='net_4711')
> -        exec_command_and_wait_for_pattern(self,
> -                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> -                        'CRW reports')
> +        self.wait_for_crw_reports()
>           exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
>                                             '0.0.4711')
>           # and detach it again
> -        exec_command_and_wait_for_pattern(self,
> -                                    'dmesg -c > /dev/null; echo dm_clear\ 2',
> -                                    'dm_clear 2')
> +        self.clear_guests_dmesg()
>           self.vm.command('device_del', id='net_4711')
>           self.vm.event_wait(name='DEVICE_DELETED',
>                              match={'data': {'device': 'net_4711'}})
> -        exec_command_and_wait_for_pattern(self,
> -                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> -                        'CRW reports')
> +        self.wait_for_crw_reports()
>           exec_command_and_wait_for_pattern(self,
>                                             'ls /sys/bus/ccw/devices/0.0.4711',
>                                             'No such file or directory')


