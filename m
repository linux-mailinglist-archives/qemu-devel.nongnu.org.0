Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0772D13C0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:31:19 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHXm-0001zh-7D
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmHVe-0001CV-L0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmHVb-0001MX-Si
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607351337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6j+pHH/ihDg90vErRfLcZjLueUY828EiQOTqwKWUxg=;
 b=HcFB5diGXA++Zt26AxsIOGVK9y8A3hwDccXCDQ/Zg913u9pjoMXofrB60+arx6HzFXYVWl
 RlpsNSLC/URb6YCdWsSbLSnYuGS7c2yKITQozkgfsKgTt2ksu8OibzAzlllIV+8Z53OY+o
 eJZrXidwqhRVI1vocVSi02SZ4PpttE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-k94qBK2NN--vO7-10leWhg-1; Mon, 07 Dec 2020 09:28:55 -0500
X-MC-Unique: k94qBK2NN--vO7-10leWhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA10107ACE6;
 Mon,  7 Dec 2020 14:28:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B08F65D6AD;
 Mon,  7 Dec 2020 14:28:48 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201204121450.120730-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c3c60abd-2a38-8267-aafa-9a7534d5bf24@redhat.com>
Date: Mon, 7 Dec 2020 15:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201204121450.120730-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2020 13.14, Cornelia Huck wrote:
> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2:
> - switch device id
> - clear out dmesg before looking for CRW messages
> 
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 53b8484f8f9c..83c00190621b 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -97,3 +97,19 @@ class S390CCWVirtioMachine(Test):
>          exec_command_and_wait_for_pattern(self,
>                                            'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
>                                            '0x0000000c')
> +        # add another device
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
> +        self.vm.command('device_add', driver='virtio-net-ccw',
> +                        devno='fe.0.4711', id='net_4711')
> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')

Looking at this twice, I'm a little bit afraid that this could be racy -
what if the kernel decides to emit the line with the "CRW" just after we
executed the dmesg command? I'd maybe use something like this instead:

exec_command_and_wait_for_pattern(self,
 'while ! dmesg -c | grep CRW ; do sleep 1 ; done', '~ #')

> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                                          '0.0.4711')
> +        # and detach it again
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')

If adapt my above change, you could also get rid of this dmesg -c here
(since it's done in the while loop already)

> +        self.vm.command('device_del', id='net_4711')
> +        self.vm.event_wait(name='DEVICE_DELETED',
> +                           match={'data': {'device': 'net_4711'}})
> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')

dito

> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> +                                          'No such file or directory')

With my suggestion applied:

Reviewed-by: Thomas Huth <thuth@redhat.com>


