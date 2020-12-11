Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BF2D7A1F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:59:26 +0100 (CET)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkpJ-0007p3-3j
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knkiv-0001s1-Cu
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knkip-0007LD-05
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607701961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yerYWN2qb7qmQWJcAh9h6aMETd3uymTfWIRyOYuWjzw=;
 b=f6UJy8t/okgFBHiIQiggFmDGdz5swZZ2NHGaE12hCa3KgNgHweYgOKfv5m10tektyWGaOo
 YnykLqIyLZAQMpCcvEVn+WdQG+AF+mJ5RIKbaH2xtM4oC8UtXxPqC03K6Vb7PAqaQCW8TK
 SYyVR2odVotucsNOSJUhiqj2/2MtjIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-Z-9VozpaOL2BYuafK__uCg-1; Fri, 11 Dec 2020 10:52:37 -0500
X-MC-Unique: Z-9VozpaOL2BYuafK__uCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC0C107ACE4;
 Fri, 11 Dec 2020 15:52:36 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A25D10016FE;
 Fri, 11 Dec 2020 15:52:33 +0000 (UTC)
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <b381f43a-c1c1-cae3-fff3-ccfa266ce8e3@redhat.com>
Date: Fri, 11 Dec 2020 12:52:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208122843.147186-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/8/20 9:28 AM, Cornelia Huck wrote:
> Hotplug a virtio-net-ccw device, and then hotunplug it again.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> v2->v3:
> - do the dmesg cleanout and waiting for messages properly [Thomas]
>
> Wainer: I dropped your r-b, as there had been too many changes for
>          me to be comfortable with retaining it
Ok.
>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>   1 file changed, 24 insertions(+)

lgtm.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 81d14088818c..864ef4ee6e9b 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -99,3 +99,27 @@ class S390CCWVirtioMachine(Test):
>           exec_command_and_wait_for_pattern(self,
>                           'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
>                           '0x0000000c')
> +        # add another device
> +        exec_command_and_wait_for_pattern(self,
> +                                    'dmesg -c > /dev/null; echo dm_clear\ 1',
> +                                    'dm_clear 1')
> +        self.vm.command('device_add', driver='virtio-net-ccw',
> +                        devno='fe.0.4711', id='net_4711')
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> +                        'CRW reports')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                                          '0.0.4711')
> +        # and detach it again
> +        exec_command_and_wait_for_pattern(self,
> +                                    'dmesg -c > /dev/null; echo dm_clear\ 2',
> +                                    'dm_clear 2')
> +        self.vm.command('device_del', id='net_4711')
> +        self.vm.event_wait(name='DEVICE_DELETED',
> +                           match={'data': {'device': 'net_4711'}})
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> +                        'CRW reports')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> +                                          'No such file or directory')


