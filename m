Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD93B693D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 21:40:09 +0200 (CEST)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxx71-0000Al-LH
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 15:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxx61-0007sA-Ee
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxx5x-0003R4-P8
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624909139;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHXXe/EbS7I9ShLlmd7iYnKaMEgAXeuYfH3FEmq4sz8=;
 b=EvULl5/SOEfgYhWyEKhUB48luXeQ75Im2ChG0ReiF7Tax1N3VlgSDxd33cl1hz5r9YBe+I
 Lt14aHbDvWvpRke3pohaUTIFwlB6Qslq6wgtVqSphPmA9ynYex3Ak/o8vnryOZRfseYxBC
 Nx4qebxxb+DnLdV6SVhwRUJPOB6mCsg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-sP1bv9PAOAeI0HEvn4QJsQ-1; Mon, 28 Jun 2021 15:38:58 -0400
X-MC-Unique: sP1bv9PAOAeI0HEvn4QJsQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 br8-20020a17090b0f08b02901706e80711dso4467743pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 12:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dHXXe/EbS7I9ShLlmd7iYnKaMEgAXeuYfH3FEmq4sz8=;
 b=ebqNrujI1E5J7JK60FLartLAd3Yt5QFKd+tDF+OCWCsIVa+GZDUNfL/UXLdj15gw7v
 JAYy+Aye2j3kOcSUK8acwwyVzPwkgqSR5U2Tw1U0Skq30xLVZ9am/rLIxRso+y4Qs7Ca
 OQlAyEdAv2rbZ4ER+wm38TbvVyVuwNJfk5OG87VmH3TzBj+tM37b+q/vNKNwi8SVh0FV
 16g5mEGwMkaDde0d1XCZP7xMnWgrCvaxJDueiYsPz2CgngVmmJHsyn5ne/rNU4EBK2iM
 07aVZkklxypwnAhdLZ2Q4JVvLFSD9R3degOaAXxyJ8HN+THU6XEr2IDogiH3+TJQq3zO
 R5lA==
X-Gm-Message-State: AOAM532Tz5Qt1SV+7peyirLz3pNjUshoH/S0HAONosJ7r7BJmECIxFGR
 Zvo2u4AbjLAoM4763CzhvcqZnNTgXoxIIUqSUwAOPPIljHEzooP57ZfbiIrxZeQ487uJWfx01X/
 NH0CqRBifuaF+HSM=
X-Received: by 2002:a63:2011:: with SMTP id g17mr24802755pgg.195.1624909135664; 
 Mon, 28 Jun 2021 12:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRCdHb6wDvxXtxRHWJh6aietQeFXHjokuFOTHCqaF9BDzQbvfD8c5OzVFJBGHJX1xK3o1qNw==
X-Received: by 2002:a63:2011:: with SMTP id g17mr24802735pgg.195.1624909135393; 
 Mon, 28 Jun 2021 12:38:55 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id c5sm14730815pfv.47.2021.06.28.12.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 12:38:54 -0700 (PDT)
Subject: Re: [PATCH 5/5] tests/acceptance: Test PMON on the Fuloong 2E machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-6-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7bf010e5-8461-4839-684f-183eae77a57c@redhat.com>
Date: Mon, 28 Jun 2021 16:38:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624202747.1433023-6-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Cleber Rosa <crosa@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/24/21 5:27 PM, Philippe Mathieu-Daudé wrote:
> Test the PMON firmware. As the firmware is not redistributable,
> it has to be downloaded manually first. Then it can be used by
> providing its path via the PMON_BIN_PATH environment variable:
In the code it is used PMON2E_BIN_PATH.
>
>    $ PMON2E_BIN_PATH=~/images/fuloong2e/pmon_2e.bin \
>      AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>      avocado --show=app,console run tests/acceptance/machine_mips_fuloong2e.py
>    Fetching asset from tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
>     (1/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_serial_console:
>    console: PMON2000 MIPS Initializing. Standby...
>    console: ERRORPC=00000000 CONFIG=00030932
>    console: PRID=00006302
>    console: Init SDRAM Done!
>    console: Sizing caches...
>    console: Init caches...
>    console: godson2 caches found
>    console: Init caches done, cfg = 00030932
>    console: Copy PMON to execute location...
>    console: copy text section done.
>    console: Copy PMON to execute location done.
>    Uncompressing Bios........................OK,Booting Bios
>    PASS (0.25 s)
>     (2/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_framebuffer_console:
>    [...]
>    Uncompressing Bios........................OK,Booting Bios
>    console: FREQ
>    console: FREI
>    console: DONE
>    console: TTYI
>    console: TTYD
>    console: ENVI
>    console: MAPV
>    console: Mfg  0, Id 60
>    console: STDV
>    console: SBDD
>    console: PPCIH
>    console: PCIS
>    console: PCIR
>    console: PCIW
>    console: NETI
>    console: RTCL
>    console: PCID
>    console: VGAI
>    console: Default MODE_ID 2
>    console: starting radeon init...
>    console: radeon init done
>    console: FRBI
>    console: cfb_console init,fb=b4000000
>    console: Video: Drawing the logo ...
>    console: CONSOLE_SIZE 450560HSTI
>    PASS (4.10 s)
>     (3/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>    console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
>    console: busclock=33000000, cpuclock=-2145008360,memsize=256,highmemsize=0
>    console: console [early0] enabled
>    console: CPU revision is: 00006302 (ICT Loongson-2)
>    PASS (0.19 s)
>    RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 5.10 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/machine_mips_fuloong2e.py | 62 ++++++++++++++++++++++
>   1 file changed, 62 insertions(+)

Need to fix the commit message (or the code) as pointed above. With that,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
> index 0ac285e2af1..4854ba98560 100644
> --- a/tests/acceptance/machine_mips_fuloong2e.py
> +++ b/tests/acceptance/machine_mips_fuloong2e.py
> @@ -8,15 +8,77 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   
>   import os
> +import time
>   
>   from avocado import skipUnless
>   from avocado_qemu import Test
>   from avocado_qemu import wait_for_console_pattern
>   
> +from tesseract_utils import tesseract_available, tesseract_ocr
> +
>   class MipsFuloong2e(Test):
>   
>       timeout = 60
>   
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
> +    def test_pmon_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        :avocado: tags=device:bonito64
> +        :avocado: tags=device:via686b
> +        """
> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
> +        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Booting Bios')
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    # Tesseract 4 adds a new OCR engine based on LSTM neural networks. The
> +    # new version is faster and more accurate than version 3. The drawback is
> +    # that it is still alpha-level software.
> +    @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available')
> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
> +    def test_pmon_framebuffer_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        :avocado: tags=device:bonito64
> +        :avocado: tags=device:ati-vga
> +        """
> +        screenshot_path = os.path.join(self.workdir, 'dump.ppm')
> +
> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
> +        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path,
> +                         '-vga', 'std',
> +                         '-device', 'ati-vga,model=rv100')
> +        self.vm.launch()
> +
> +        wait_for_console_pattern(self, 'Video: Drawing the logo ...')
> +        self.log.info('VM launched, waiting for logo on display')
> +        time.sleep(2)
> +        wait_for_console_pattern(self, 'CONSOLE_SIZE')
> +        self.vm.command('human-monitor-command', command_line='stop')
> +        self.vm.command('human-monitor-command',
> +                        command_line='screendump %s' % screenshot_path)
> +
> +        lines = tesseract_ocr(screenshot_path, tesseract_version=4,
> +                              tesseract_args='--dpi 128')
> +        pmon_version = 'PNON2000 for Loongson, Version 1.1.2' # PNON is enough
> +        self.assertIn(pmon_version, lines)
> +
>       @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>       @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
>       def test_linux_kernel_isa_serial(self):


