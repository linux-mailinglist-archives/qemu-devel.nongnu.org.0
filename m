Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768033BF393
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:29:00 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IqY-0001BZ-VZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1In8-000249-JV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1In6-0002fI-49
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625707523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3izxdeeuscba3+LfWHvj2GAVmNokmkPuQghfIHr9N1w=;
 b=SpgzYViQ+VmXoU+L4688HV1F7goUoiJ69yKS3x9XWxFIyuNFykNvZbYafk/D95aDnp2Xti
 jTMmmHvo7WEQRFW20emJv7dsLjR5pejbhqb0ftrh75bSdrWEKKoE+rNROgXXb9km/MWdml
 d2lHcV/h9ias893lRl2FqmICCdFblWw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-04jfnnR4P7CpTc1zMEQsGQ-1; Wed, 07 Jul 2021 21:25:20 -0400
X-MC-Unique: 04jfnnR4P7CpTc1zMEQsGQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d8-20020ac866880000b0290251ed4135d5so2380760qtp.20
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 18:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3izxdeeuscba3+LfWHvj2GAVmNokmkPuQghfIHr9N1w=;
 b=mQIUBvuTD3bZii5bVtrvRUM9Ewp9yun5YhgnrSAs7IWMGgypC8vghyw4Q5Einehw8d
 C0gMR6x9Bj7nn6yrNzrdbgH/oFCdZ1iYq8M9IAXsvBFNU39tQSwGrfg1CShXjv6f+FSk
 w0x0NrI/rTMBWoLpq1JLE5jkaNuKBja96sng/dFsSQChSFVlaQZjlOgNsrEngftmj6GA
 coZiJaniMd6ZcIRaak5ykmcnyGvkSZdM3DnNxdG7V7l0R0f577aZKt2eiD+gohwdHrTd
 XjxBwMYQ0sMo5kNwhRRsVNSdH7KhSs5cmQtXuIPQ2tRUrVjgWQ3fu2oZDe5OUby+nYUI
 B7BA==
X-Gm-Message-State: AOAM5310dmM6+U57NPKUEqwV03FZ8s4cEIstqmu/QD5fOF0eDqjtxmtJ
 gd02tpWeTBWm8Y16YqDk7KlLhtoczLquQX4zrAPWppNYLRd4Flgdfc0opHt+ILxoGpuqxNk81mn
 CB15WnCghT8kLLtk=
X-Received: by 2002:a37:468b:: with SMTP id
 t133mr28362993qka.189.1625707519259; 
 Wed, 07 Jul 2021 18:25:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBaTAjJ/Ocej3ELYG1l1ezrq19YAtmUfYOAA64zuiMI/lLFmDkB7d8ke9Unhi90sH2uYq5GQ==
X-Received: by 2002:a37:468b:: with SMTP id
 t133mr28362977qka.189.1625707519073; 
 Wed, 07 Jul 2021 18:25:19 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id t30sm332193qkm.11.2021.07.07.18.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 18:25:18 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-3-eric.auger@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <4f3e06ba-6622-faea-4965-a034379ba907@redhat.com>
Date: Wed, 7 Jul 2021 21:25:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706131729.30749-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/6/21 9:17 AM, Eric Auger wrote:
> From: Willian Rampazzo <willianr@redhat.com>
>
> When running LinuxTests we may need to run the guest with
> custom params. It is practical to store the pxeboot URL
> and the default kernel params so that the
> tests just need to fetch those and augment the kernel params.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
> ---
>
> v4 -> v5:
> - fixed some indentation issues (William)
> - added William's R-b
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 53 ++++++++++++++++++++++-
>   1 file changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index af93cd63ea..ee354eb458 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -309,12 +309,51 @@ class LinuxDistro:
>           'fedora': {
>               '31': {
>                   'x86_64':
> -                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
> +                'pxeboot_url': 'https://archives.fedoraproject.org/'
> +                               'pub/archive/fedora/linux/releases/31/'
> +                               'Everything/x86_64/os/images/pxeboot/',
> +                'kernel_params': 'root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c'
> +                                 ' ro no_timer_check net.ifnames=0'
> +                                 ' console=tty1 console=ttyS0,115200n8'
> +                },
> +                'aarch64':
> +                {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',


So this is what made it easy for me to catch the issue on the previous 
patch.  The aarch64 info should be present on the previous patch too, 
with this one adding the pxeboot_url, kernel_params, etc.


But, just to be extra clear, the actual issue of `self._info` being set 
to `None` on the previous patch still needs to be addressed.



> +                'pxeboot_url': 'https://archives.fedoraproject.org/'
> +                               'pub/archive/fedora/linux/releases/31/'
> +                               'Everything/aarch64/os/images/pxeboot/',
> +                'kernel_params': 'root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7'
> +                                 ' ro earlyprintk=pl011,0x9000000'
> +                                 ' ignore_loglevel no_timer_check'
> +                                 ' printk.time=1 rd_NO_PLYMOUTH'
> +                                 ' console=ttyAMA0'
> +                },
>                   'ppc64':
>                   {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>                   's390x':
>                   {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
> -            }
> +            },
> +            '32': {
> +                'aarch64':
> +                {'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
> +                'pxeboot_url': 'http://dl.fedoraproject.org/pub/fedora/linux/'
> +                               'releases/32/Server/aarch64/os/images/pxeboot/',
> +                'kernel_params': 'root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5'
> +                                 ' ro no_timer_check net.ifnames=0'
> +                                 ' console=tty1 console=ttyS0,115200n8',
> +                },
> +            },
> +            '33': {
> +                'aarch64':
> +                {'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
> +                'pxeboot_url': 'http://dl.fedoraproject.org/pub/fedora/linux/'
> +                               'releases/33/Server/aarch64/os/images/pxeboot/',
> +                'kernel_params': 'root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a'
> +                                 ' ro no_timer_check net.ifnames=0'
> +                                 ' console=tty1 console=ttyS0,115200n8'
> +                                 ' console=tty0',
> +                 },
> +            },
>           }
>       }
>   
> @@ -337,6 +376,16 @@ def checksum(self):
>       def checksum(self, value):
>           self._info['checksum'] = value
>   
> +    @property
> +    def pxeboot_url(self):
> +        """Gets the repository url where pxeboot files can be found"""
> +        return self._info.get('pxeboot_url', None)
> +
> +    @property
> +    def default_kernel_params(self):
> +        """Gets the default kernel parameters"""
> +        return self._info.get('kernel_params', None)
> +
>   
>   class LinuxTest(Test, LinuxSSHMixIn):
>       """Facilitates having a cloud-image Linux based available.


Everything else looks to me.


Thanks,

- Cleber.


