Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168453BF38E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:27:08 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Iok-0004xc-RI
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1IfR-0008GZ-Dw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1IfM-0001sS-Dc
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625707041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJTr8xvq0pyFdnwrB+JZrtMv4FfXmBoReglu6bB1PzI=;
 b=TOP9+WlPbzJaDDEGQhVN61bA1jSq51pOGSJJU1g50fEg4wcKJ/f6ShlunODwv6UOyNDgva
 ljpgNH2lsAks6Z53BoAxg7oEHEOpxAlLprWsbFEVdDliSBdX+9p1H3ivWYzuJt82lalzSb
 /ZqK/Z9EYi6L6XrKLBkxU7VlrhbZRFU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-9cGmgSrXOm6d5l_UocN1PQ-1; Wed, 07 Jul 2021 21:17:11 -0400
X-MC-Unique: 9cGmgSrXOm6d5l_UocN1PQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso2767746qke.2
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 18:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FJTr8xvq0pyFdnwrB+JZrtMv4FfXmBoReglu6bB1PzI=;
 b=HpzWfmZb6/jT26zLQJiAyEf7gPqIbfmjuMZ3rv7WnqhdFwj6WDki15EgpScbFqseOD
 V4hWFyH3TsDENi9kvdGrnny8OJlYAmtbcCOenPFty1AkI27qIqCJmX1ZB/4F9TLiEUaW
 yXb6oLP6n+1ar4Z1jcCQXKD9u2R5J1bFcs1OfmkxSCvAuLc36n3QTK2thXlepaR2ITKO
 CiDf1pqVKbyDItJtQqlrCNarlte0KiTU5gK7B2IAtB0Cmc0O2hfmWEnuz97HavaPhOLU
 vToQxVUpdLogER87RSXln94SHmGqgEhEPXpRLGtWKkano30P8TZuY9Ar8urxdjHULMcm
 P0oA==
X-Gm-Message-State: AOAM530NcBDu4QNw0iwyOTRd9H7vFJizKB6FVbpIzlZvNCKSQxMfsfz2
 PjBUmrdRwnnlVDI+moQCenetSh8frjVbpwut7ZFU1uzj2AijqdZgXVFJIoAl17f97ooK3Pu/Lal
 yixWlr4uTkCAulhQ=
X-Received: by 2002:a05:6214:1631:: with SMTP id
 e17mr3937750qvw.16.1625707030289; 
 Wed, 07 Jul 2021 18:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX9142JGC1TT4LZkmLzLDTFDIUHtgc/cqwAl5DvXEwmFxIzTukX7BOpVNMUGluBlTAT76DWA==
X-Received: by 2002:a05:6214:1631:: with SMTP id
 e17mr3937735qvw.16.1625707030082; 
 Wed, 07 Jul 2021 18:17:10 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id n20sm327026qkk.102.2021.07.07.18.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 18:17:09 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-2-eric.auger@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <df9835de-fe4a-2233-a625-3b04b7b0d514@redhat.com>
Date: Wed, 7 Jul 2021 21:17:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706131729.30749-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
> As the KNOWN_DISTROS grows, more loosely methods will be created in
> the avocado_qemu/__init__.py file.
>
> Let's refactor the code so that KNOWN_DISTROS and related methods are
> packaged in a class
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 74 +++++++++++++----------
>   1 file changed, 42 insertions(+), 32 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 81ac90bebb..af93cd63ea 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -299,29 +299,43 @@ def ssh_command(self, command):
>                            f'Guest command failed: {command}')
>           return stdout_lines, stderr_lines
>   
> +class LinuxDistro:
> +    """Represents a Linux distribution
>   


I definitely like the idea.


> -#: A collection of known distros and their respective image checksum
> -KNOWN_DISTROS = {
> -    'fedora': {
> -        '31': {
> -            'x86_64':
> -            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> -            'aarch64':
> -            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
> -            'ppc64':
> -            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
> -            's390x':
> -            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
> +    Holds information of known distros.
> +    """
> +    #: A collection of known distros and their respective image checksum
> +    KNOWN_DISTROS = {
> +        'fedora': {
> +            '31': {
> +                'x86_64':
> +                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +                'ppc64':
> +                {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
> +                's390x':
> +                {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>               }
>           }
>       }
>   
> +    def __init__(self, name, version, arch):
> +        self.name = name
> +        self.version = version
> +        self.arch = arch


This looks a lot like 
https://github.com/avocado-framework/avocado/blob/f0996dafefa412c77c221c2d1a6fafdcba1c97b7/avocado/utils/distro.py#L34 
, although admittedly, their goals are very different.


As a next step, in the future, I'd consider separating the data from the 
actual class and having it the LinuxDistro instances, helped by a 
registry.  Something like:


class LinuxDistroRegistry:

    def __init__(self):
       self.distros = set()

    def register(self, linux_distro):

       self.distros.add(linux_distro)

    def query(self, **kwargs):

       ...


registry = LinuxDistroRegistry()

registry.register(LinuxDistro('fedora', '31', 'x86_64', 'deadbeefdeadbeef'))

registry.register(LinuxDistro('fedora', '31', 'aarch64', 
'beefdeadbeefdead'))

checksum = registry.query(name='fedora', version='31', 
arch='x86_64').checksum


> +        try:
> +            self._info = self.KNOWN_DISTROS.get(name).get(version).get(arch)


The `AttributeError` that could be caught at the removed 
`get_known_distro_checksum()` function, could come from any of the 
`.get()`s returning `None`, which in turn would not have a `.get()` 
attribute.

But now, if there's a "name", then a "version", but no "arch" entry, 
this line will set `self._info` to `None`.  This is manifested if you 
try to run a test that tries to find an aarch64 distro, such as:

./tests/venv/bin/avocado run 
tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2


It will result in:


20:38:18 ERROR| Reproduced traceback from: 
/var/lib/users/cleber/build/qemu/tests/venv/lib64/python3.9/site-packages/avocado/core/test.py:756
20:38:18 ERROR| Traceback (most recent call last):
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/acceptance/avocado_qemu/__init__.py", 
line 426, in download_boot
20:38:18 ERROR|     checksum=self.distro.checksum,
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/acceptance/avocado_qemu/__init__.py", 
line 334, in checksum
20:38:18 ERROR|     return self._info.get('checksum', None)
20:38:18 ERROR| AttributeError: 'NoneType' object has no attribute 'get'
20:38:18 ERROR|
20:38:18 ERROR| During handling of the above exception, another 
exception occurred:
20:38:18 ERROR|
20:38:18 ERROR| Traceback (most recent call last):
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/acceptance/avocado_qemu/__init__.py", 
line 387, in setUp
20:38:18 ERROR|     self.set_up_boot()
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/acceptance/avocado_qemu/__init__.py", 
line 455, in set_up_boot
20:38:18 ERROR|     path = self.download_boot()
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/acceptance/avocado_qemu/__init__.py", 
line 431, in download_boot
20:38:18 ERROR|     self.cancel('Failed to download/prepare boot image')
20:38:18 ERROR|   File 
"/var/lib/users/cleber/build/qemu/tests/venv/lib64/python3.9/site-packages/avocado/core/test.py", 
line 988, in cancel
20:38:18 ERROR|     raise exceptions.TestCancel(message)
20:38:18 ERROR| avocado.core.exceptions.TestCancel: Failed to 
download/prepare boot image


Cheers,

- Cleber.


