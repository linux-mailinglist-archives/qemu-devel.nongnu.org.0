Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7892D4C27
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:47:15 +0100 (CET)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6Mk-0005K7-TE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kn6K2-0003cd-Qz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kn6K0-0000eo-J3
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607546663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J68gE+6n/zdWecADpVj1LuJX/WT+j1DSnZK1ahptIis=;
 b=MgLZ38yWwJF/2ibNJc29FrivyDKZDLaJZSf8nVyyDVVpx3AILJuVpsKrBoTeD8RuhTrFq9
 g8ZkiIia6BLfe6vQitsiwnwZdV0T6CO0oARfihLHzzHHE6U501NbagO3eA9rkhiXbt0r9x
 UVj6Wz/m2gHfWJaDzbo9BWLTAX5jcSY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-g9STiqQHNtWAe40LwfMscQ-1; Wed, 09 Dec 2020 15:44:21 -0500
X-MC-Unique: g9STiqQHNtWAe40LwfMscQ-1
Received: by mail-qv1-f72.google.com with SMTP id j5so2111524qvu.22
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 12:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J68gE+6n/zdWecADpVj1LuJX/WT+j1DSnZK1ahptIis=;
 b=Kl+xrXmmlBKOc7QP/ZHIUAo0zyg8OAWfbvV5g9Up1+2DlTLwykiPgGdjE2+VV8pAWO
 sZkhvqY0h4W4UuXS0/Bk1wt6bXakRshYwA/L35YvZEzMynKiMi/+cnjPY3XEmyj32vvb
 J7R0aFXSLJq2WbyrhHFX+iTmxZGzKog6cLG10OZVjwGaiSgQ6qKcDoPvYP1M/cKft6EQ
 RYxUUW/yVIcdMqgkCEQkuhZBI1iejMR70ej2VJrxLYfsRGgK2owKuKCBT1CPuT14tpeo
 UJHufXD3/J7/ar2YgzalfAhmuAgWaMjXxYZw6mWfDrCHLE4mgdNE/RkaJM8Ky59vcszj
 em2w==
X-Gm-Message-State: AOAM532M5TUdRSf7AIT0hCpHSlKstyxwxgqjDWAx2iSVXthMI+w+l0VK
 Ry/KBKtt2YlRlHya2Ct5p2kjEy7OOPA3VoJTPiuaIC9H58yjJzyip5SYL7uX0irpNK2qP8veVgV
 K8kuu4S0I6YJ7AFk=
X-Received: by 2002:a05:620a:8d9:: with SMTP id
 z25mr5226351qkz.127.1607546661237; 
 Wed, 09 Dec 2020 12:44:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0IlE4+ynbBedQGHIn6qbrukFgbfZWMBoLzSnYo5OnfDZrTULaadHdom+D0u8wS6lvHpJNmg==
X-Received: by 2002:a05:620a:8d9:: with SMTP id
 z25mr5226330qkz.127.1607546661018; 
 Wed, 09 Dec 2020 12:44:21 -0800 (PST)
Received: from [192.168.0.13] ([177.194.7.8])
 by smtp.gmail.com with ESMTPSA id y6sm1906020qki.115.2020.12.09.12.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 12:44:20 -0800 (PST)
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <7aad6909-a802-6990-25c7-27d3f4f3ee4c@redhat.com>
Date: Wed, 9 Dec 2020 17:44:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208122843.147186-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
> 
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>   1 file changed, 24 insertions(+)
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
> 

I tested it on top of your s390-next branch. So far so good:

JOB ID     : 7708796aa28805766d088de296e1131b025f4ed1
JOB LOG    : 
/home/linux1/src/qemu.dev/build/tests/results/job-2020-12-09T15.40-7708796/job.log
  (1/1) 
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (7.07 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 7.18 s

Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>


