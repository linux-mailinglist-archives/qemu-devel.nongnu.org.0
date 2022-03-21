Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536E4E2EE5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:14:47 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLcE-0001JS-3m
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLYa-0003bq-W5
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLYZ-0006T1-Bt
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3G6WchGWvyVgp7y1+VYyRvZmCDd0+pELE6d0oFsGNg=;
 b=QAd7EWKILXEWe2ChzF+dCl2Hlzr1DtIBBhNVHj5iocGCJvHoSc1wORkKHZYYVQLmZfaM9a
 VF/IsZZH9uvt0rlqkNF5PaLVMFAnmPm2pN4WSRHcZi+lbw+5B1dMgJyWJ8VOhNWtcE14Sl
 +Mbk6OCEVzGC7NVC5r4rkpaleFd8oUk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-7eS_cpsDPfKZVYKHxaJ0CA-1; Mon, 21 Mar 2022 13:10:53 -0400
X-MC-Unique: 7eS_cpsDPfKZVYKHxaJ0CA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b0038a12dbc23bso10529145wme.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3G6WchGWvyVgp7y1+VYyRvZmCDd0+pELE6d0oFsGNg=;
 b=7gmIR2ra0hByOO997fWa4dwdeIVW2dGdPTwO6Xv0Zjh3fq+w6vTIQIJdFj9iHWgV/s
 vN6DY48ZPnulKnmw5GW70E74YY7jeS3RNKZMBszS8uSauE18WTJSSjgmME9058zppWjN
 iDSCAJMc2vNavSYX7KjINWnTkRgsTvZfSPyaDOKWa14i/E3Ny1LQgyKP+ZeXf38mGbhx
 ST5z9WBhGnAM5xGB+X8IMHFzqOghHyzuu/Y03775f5EQ86f6LAMCooTdWYzaI7ARwIiJ
 UIAUtXmFZkr+Zdto+VTaPyEuXVp5CmbAJxs0R+FACgPMC8MrmFiycGiPmgjzfCkxHT1A
 jRpA==
X-Gm-Message-State: AOAM5318808PwF0xCMvK9RI99n5VumSX9pR+VGvg14DI3Rc//xR8sYAt
 P9WhW78dusjFwFeDokYRGPaNwpQ+KRUFB+NPo0zPazO4SNPyZ5ltERisStwC2YE10p4WZErZ9Ie
 6jiLtSmi/1bVLE3k=
X-Received: by 2002:a5d:6651:0:b0:203:fc53:cf22 with SMTP id
 f17-20020a5d6651000000b00203fc53cf22mr11702282wrw.365.1647882652230; 
 Mon, 21 Mar 2022 10:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjNh82Y6NykqMwS7TcEkhqsX9+rXGtHlfi6rZdLtO3Z8edOCGvVdhqbsE2CN9SNdotIqayVQ==
X-Received: by 2002:a5d:6651:0:b0:203:fc53:cf22 with SMTP id
 f17-20020a5d6651000000b00203fc53cf22mr11702258wrw.365.1647882652008; 
 Mon, 21 Mar 2022 10:10:52 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm66891wmq.40.2022.03.21.10.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 10:10:51 -0700 (PDT)
Message-ID: <ede500df-5261-ddae-b359-1cc6e051cd07@redhat.com>
Date: Mon, 21 Mar 2022 18:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 2/8] tests/avocado: update aarch64_virt test to
 exercise -cpu max
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220315121251.2280317-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 sw@weilnetz.de, richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2022 13.12, Alex Bennée wrote:
> The Fedora 29 kernel is quite old and importantly fails when running
> in LPA2 scenarios. As it's not really exercising much of the CPU space
> replace it with a custom 5.16.12 kernel with all the architecture
> options turned on. There is a minimal buildroot initramfs included in
> the kernel which has a few tools for stress testing the memory
> subsystem. The userspace also targets the Neoverse N1 processor so
> will fail without additional v8.x+ features.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 9c618d4809..ca3a40e91d 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -12,6 +12,7 @@
>   import lzma
>   import gzip
>   import shutil
> +import time
>   
>   from avocado import skip
>   from avocado import skipUnless
> @@ -330,25 +331,30 @@ def test_aarch64_virt(self):
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
>           :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
> -        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> -                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> -                      '/vmlinuz')
> -        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
> +        kernel_url = ('https://fileserver.linaro.org/s/'
> +                      'z6B2ARM7DQT3HWN/download')
> +
> +        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>   
>           self.vm.set_console()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                  'console=ttyAMA0')
>           self.require_accelerator("tcg")
> -        self.vm.add_args('-cpu', 'cortex-a53',
> +        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
>                            '-accel', 'tcg',
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line)
>           self.vm.launch()
> -        console_pattern = 'Kernel command line: %s' % kernel_command_line
> -        self.wait_for_console_pattern(console_pattern)
> +        self.wait_for_console_pattern('Welcome to Buildroot')
> +        time.sleep(0.1)
> +        exec_command(self, 'root')
> +        time.sleep(0.1)
> +        exec_command(self, 'cat /proc/self/maps')
> +        time.sleep(0.1)

I can't say much about scope of aarch64 testing, but while you're at it, you 
also could move the new test to a separate file, like 
machine_aarch64_virt.py, so that it could be added to MAINTAINERS, too?

  Thomas


