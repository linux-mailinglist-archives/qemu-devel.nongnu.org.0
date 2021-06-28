Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA053B6468
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:07:51 +0200 (CEST)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsrW-0004PG-BK
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxsqU-0003gT-0a
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxsqQ-0003T0-BW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624892801;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAmBKlBemlvXeDOJSiHkAcNG+dVvRlOBAILIGO+oPP0=;
 b=U5vvqv6Kito2HG2SEqKKw8kGa+178wogUlhj89MLl3kIRsjgJ3ybntmqGOjP58mZj0EHRf
 F5zPBindY1K3prArE3J8LldlS8a5SHDdFscCzuST+Bcw17WtZDpc8P7GabtRXCVDmStuKw
 tSCGTAYor3crytDvQ3eFyoJ2yGOtf4E=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596--qCg9Ok7N3SlDDoIt4mIcQ-1; Mon, 28 Jun 2021 11:06:38 -0400
X-MC-Unique: -qCg9Ok7N3SlDDoIt4mIcQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 q2-20020a170902e302b0290128ec775274so662658plc.20
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZAmBKlBemlvXeDOJSiHkAcNG+dVvRlOBAILIGO+oPP0=;
 b=cjYoWf34sGeHsyr2MLMeXb/Dx2BzlFwitKqCQVWOabcrcRFJILRC3FF3bJJblZ/FSl
 eqoZUvNzSq+jDX0+oxWNnAxGduLkFwDPMfmIsWPH62q77jFrkSTSmbPpa37dUnqJHo1B
 kbhZFjGS1PWxB+Rpm/b6UFOWSOZNHJhLRd/+6l9Smp3NOLpejSns1n2GSxUpIiYBMYi1
 +0+Edfvm7bLVNDjeF+LeLVo1CpPyCZ7m06SASWk5bO/sOvtJFJmcRGjEbgjRxG1e1Brn
 aBcRFtw6veaTS50EAu4xNyJPvsvYcAW+PrYxq3pzmdtjfdELqxJTcadNZqR5BQbJtjci
 73xQ==
X-Gm-Message-State: AOAM531VdjVU3W7n5kQ1a/cy/aMb8bCzK0BJjSCNynypngGbQEC59oio
 A0bWmAztQyELjw8QGMBMgU9hfb7Uq2hP5ij8v4iRX2ymITquNrZN7be7rdIPs25iyGr0UtHdUx6
 Dl57Cje3AFp8/4mM=
X-Received: by 2002:a17:902:ea0b:b029:128:c224:4fc1 with SMTP id
 s11-20020a170902ea0bb0290128c2244fc1mr10362671plg.82.1624892796594; 
 Mon, 28 Jun 2021 08:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTIcIkqhML4yVjN4kHTtpvR236Y7Rays2ENg5gAtpsBxF8HWQu8YqDFXS5PToP71iVhOwp2Q==
X-Received: by 2002:a17:902:ea0b:b029:128:c224:4fc1 with SMTP id
 s11-20020a170902ea0bb0290128c2244fc1mr10362650plg.82.1624892796349; 
 Mon, 28 Jun 2021 08:06:36 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id x5sm14487125pfu.116.2021.06.28.08.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:06:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, crosa@redhat.com, peterx@redhat.com
References: <20210621080824.789274-1-eric.auger@redhat.com>
 <20210621080824.789274-2-eric.auger@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <95e946f0-856b-33fe-f2b9-6aec91132893@redhat.com>
Date: Mon, 28 Jun 2021 12:06:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621080824.789274-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 6/21/21 5:08 AM, Eric Auger wrote:
> When running LinuxTests we may need to run the guest with
> custom params. It is practical to store the pxeboot URL
> and the default kernel params so that the
> tests just need to fetch those and augment the kernel params.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v2 -> v3:
> - add fed32 and fed33 checksums
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 52 ++++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 81ac90bebb..8152420fa5 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -305,17 +305,59 @@ def ssh_command(self, command):
>       'fedora': {
>           '31': {
>               'x86_64':
> -            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
> +             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
> +                            "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
> +             'kernel_params': "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
> +                              "no_timer_check net.ifnames=0 "
> +                              "console=tty1 console=ttyS0,115200n8"},
>               'aarch64':
> -            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
> +            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
> +             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
> +                            "linux/releases/31/Everything/aarch64/os/images/pxeboot/",
> +             'kernel_params': "root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
> +                              "earlyprintk=pl011,0x9000000 ignore_loglevel "
> +                              "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
> +                              "console=ttyAMA0 "},
>               'ppc64':
>               {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>               's390x':
>               {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>               }
> +        ,
> +        '32': {
> +            'aarch64':
> +            { 'kernel_params': "root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5 ro "
> +                              "no_timer_check net.ifnames=0 console=tty1 "
> +                              "console=ttyS0,115200n8 ",
Nit: indentation ^
> +              'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
> +              'pxeboot_url':  "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
Maybe use dl.fedoraproject.org instead of a mirror server?
> +                              "32/Server/aarch64/os/images/pxeboot/"},
> +            }
> +        ,
> +        '33': {
> +            'aarch64':
> +            { 'kernel_params': "root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a ro "
> +                              "no_timer_check net.ifnames=0 console=tty1 "
> +                              "console=ttyS0,115200n8 console=tty0 ",
> +              'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
> +              'pxeboot_url':  "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
Likewise.
> +                              "33/Server/aarch64/os/images/pxeboot/"},
> +            }
>           }
>       }
>   
> +def get_known_distro_kernel_params(distro, distro_version, arch):
> +    try:
> +        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('kernel_params')
> +    except AttributeError:
> +        return None
> +
> +def get_known_distro_pxeboot_url(distro, distro_version, arch):
> +    try:
> +        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('pxeboot_url')
> +    except AttributeError:
> +        return None
>   
>   def get_known_distro_checksum(distro, distro_version, arch):
>       try:
> @@ -449,6 +491,12 @@ def set_up_cloudinit(self, ssh_pubkey=None):
>           cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>           self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>   
> +    def get_default_kernel_params(self):
> +        return get_known_distro_kernel_params(self.distro, self.distro_version, self.arch)
> +
> +    def get_pxeboot_url(self):
> +        return get_known_distro_pxeboot_url(self.distro, self.distro_version, self.arch)
> +

As the KNOWN_DISTROS grows, more loosely methods will be created in the 
avocado_qemu/__init__.py file.

I refactored the code so that KNOWN_DISTROS and related methods are 
packaged in a class. See in:

https://github.com/wainersm/qemu/tree/eauger_avocado-qemu-v3-refactor

Maybe you could incorporate that in your series? Otherwise I can send as 
a follow up series. Whatever you prefer.

Thanks!

- Wainer

>       def launch_and_wait(self, set_up_ssh_connection=True):
>           self.vm.set_console()
>           self.vm.launch()


