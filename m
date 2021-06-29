Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D43B7154
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 13:31:46 +0200 (CEST)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyBxw-0006i7-B6
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 07:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyBwf-0005t6-Jk
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:30:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyBwd-0003yJ-CP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:30:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so2168461wml.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qRN8PM622sPBAM4kdhmTkswkxJUoNK/Nf+dgV6aaiCk=;
 b=P5NIjsbfC3XRwKcSm0Wq/WJqzEJG2N1S4VyRI9LaUc5MWvvv+hRFAlY9ahiCnYvdRj
 du2XJetm0BaMHZaSNqwZj9XVXG+pPlK6KN05f9+jVfFQEBoCmolHjQGpRUTId0REko41
 bR5fNZBjDQu8kGBCxGE9z8UGhuaU1YiPjzPqQWgBqHSPDiHJgqHeIe4eJaeFr5d/Eifz
 QhFqLbZJ+aUzUrXN7i4iR63wtSwb7Lq24D8pbt4Db+7kOX3zusONsR5wy+U9lxUohfx6
 H7NZbCRDZu7eNYMXgV1yWjV4m+lcKBZBDMyKDr96Kj96fU51xD09wVgr0XvxF9qg0cMz
 82Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qRN8PM622sPBAM4kdhmTkswkxJUoNK/Nf+dgV6aaiCk=;
 b=sa2n6HpVTv/g2/q3WxrHFrXtlI1czF7pXocyRJRW9H41aGD6lffBl0RVzr9qQGMLJW
 C+OFuf4XM7bKSohHNlqZSfExBhx99qh/hcmEZSfuMj2hVw3xbSkjqa5uG+DEvX4LQP2/
 YI5CV6AgqYxYVQD6RQfdUfbtz2vqNuKgOmAS6vAJmQ+QPkeSf2V8hNw1JHSTjuOWgkJH
 N1WuKcc17zQtXhPeKXt+jm5sUnaMKgK0893TIeZ4isQqmZbAw5wodFlf8GYf1cINM+F0
 QxEUuJ/lVns/LQk7FXFlp4mJ4jfXaHgdEEedlpsvjha85FXZKR/PpcmRUf2yI2zPi+Pa
 e5qg==
X-Gm-Message-State: AOAM533IUMIrgfrHkKZaGd+JXhG1W177smsSVGRbpDEcUC0aoT8B4uve
 +BxgPQIM3I0bGays3pdPtYs=
X-Google-Smtp-Source: ABdhPJydoqr6ycow+aESUVi1P8t55Xa0uvdc3WX8fqHfwuIs4N+YEpqXIuxCdUc0jgSC68vSdPFcpg==
X-Received: by 2002:a1c:5407:: with SMTP id i7mr3392533wmb.57.1624966220850;
 Tue, 29 Jun 2021 04:30:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f6sm631769wrs.13.2021.06.29.04.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 04:30:20 -0700 (PDT)
Subject: Re: [PATCH 5/5] tests/acceptance: Test PMON on the Fuloong 2E machine
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-6-f4bug@amsat.org>
 <f1c3c761-1ded-abc9-a66c-e73c4956c7d4@eik.bme.hu>
 <be4c8cfa-78d6-0ec8-60fb-463b3140f8fa@amsat.org>
 <4a11b9c7-4444-c936-f32d-97c190c749c7@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e27bf7b-87db-0899-b564-59dab7ad3f70@amsat.org>
Date: Tue, 29 Jun 2021 13:30:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4a11b9c7-4444-c936-f32d-97c190c749c7@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 12:47 PM, BALATON Zoltan wrote:
> On Tue, 29 Jun 2021, Philippe Mathieu-Daudé wrote:
>> On 6/24/21 10:43 PM, BALATON Zoltan wrote:
>>> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>>>> Test the PMON firmware. As the firmware is not redistributable,
>>>> it has to be downloaded manually first. Then it can be used by
>>>> providing its path via the PMON_BIN_PATH environment variable:
>>>>
>>>>  $ PMON2E_BIN_PATH=~/images/fuloong2e/pmon_2e.bin \
>>>>    AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>>>    avocado --show=app,console run
>>>> tests/acceptance/machine_mips_fuloong2e.py
>>>>  Fetching asset from
>>>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
>>>>
>>>>
>>>>   (1/3)
>>>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_serial_console:
>>>>
>>>>
>>>>  console: PMON2000 MIPS Initializing. Standby...
>>>>  console: ERRORPC=00000000 CONFIG=00030932
>>>>  console: PRID=00006302
>>>>  console: Init SDRAM Done!
>>>>  console: Sizing caches...
>>>>  console: Init caches...
>>>>  console: godson2 caches found
>>>>  console: Init caches done, cfg = 00030932
>>>>  console: Copy PMON to execute location...
>>>>  console: copy text section done.
>>>>  console: Copy PMON to execute location done.
>>>>  Uncompressing Bios........................OK,Booting Bios
>>>>  PASS (0.25 s)
>>>>   (2/3)
>>>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_framebuffer_console:
>>>>
>>>>
>>>>  [...]
>>>>  Uncompressing Bios........................OK,Booting Bios
>>>>  console: FREQ
>>>>  console: FREI
>>>>  console: DONE
>>>>  console: TTYI
>>>>  console: TTYD
>>>>  console: ENVI
>>>>  console: MAPV
>>>>  console: Mfg  0, Id 60
>>>>  console: STDV
>>>>  console: SBDD
>>>>  console: PPCIH
>>>>  console: PCIS
>>>>  console: PCIR
>>>>  console: PCIW
>>>>  console: NETI
>>>>  console: RTCL
>>>>  console: PCID
>>>>  console: VGAI
>>>>  console: Default MODE_ID 2
>>>>  console: starting radeon init...
>>>>  console: radeon init done
>>>>  console: FRBI
>>>>  console: cfb_console init,fb=b4000000
>>>>  console: Video: Drawing the logo ...
>>>>  console: CONSOLE_SIZE 450560HSTI
>>>>  PASS (4.10 s)
>>>>   (3/3)
>>>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>>>>
>>>>
>>>>  console: Linux version 2.6.27.7lemote (root@debian) (gcc version
>>>> 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25
>>>> CST 2008
>>>>  console: busclock=33000000,
>>>> cpuclock=-2145008360,memsize=256,highmemsize=0
>>>>  console: console [early0] enabled
>>>>  console: CPU revision is: 00006302 (ICT Loongson-2)
>>>>  PASS (0.19 s)
>>>>  RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT
>>>> 0 | CANCEL 0
>>>>  JOB TIME   : 5.10 s
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>> tests/acceptance/machine_mips_fuloong2e.py | 62 ++++++++++++++++++++++
>>>> 1 file changed, 62 insertions(+)
>>>>
>>>> diff --git a/tests/acceptance/machine_mips_fuloong2e.py
>>>> b/tests/acceptance/machine_mips_fuloong2e.py
>>>> index 0ac285e2af1..4854ba98560 100644
>>>> --- a/tests/acceptance/machine_mips_fuloong2e.py
>>>> +++ b/tests/acceptance/machine_mips_fuloong2e.py
>>>> @@ -8,15 +8,77 @@
>>>> # SPDX-License-Identifier: GPL-2.0-or-later
>>>>
>>>> import os
>>>> +import time
>>>>
>>>> from avocado import skipUnless
>>>> from avocado_qemu import Test
>>>> from avocado_qemu import wait_for_console_pattern
>>>>
>>>> +from tesseract_utils import tesseract_available, tesseract_ocr
>>>> +
>>>> class MipsFuloong2e(Test):
>>>>
>>>>     timeout = 60
>>>>
>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>>>> code')
>>>> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not
>>>> available')
>>>> +    def test_pmon_serial_console(self):
>>>> +        """
>>>> +        :avocado: tags=arch:mips64el
>>>> +        :avocado: tags=machine:fuloong2e
>>>> +        :avocado: tags=endian:little
>>>> +        :avocado: tags=device:bonito64
>>>> +        :avocado: tags=device:via686b
>>>> +        """
>>>> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
>>>> +        pmon_path = self.fetch_asset('file://' +
>>>> os.getenv('PMON2E_BIN_PATH'),
>>>> +                                     asset_hash=pmon_hash,
>>>> algorithm='md5')
>>>> +
>>>> +        self.vm.set_console()
>>>> +        self.vm.add_args('-bios', pmon_path)
>>>> +        self.vm.launch()
>>>> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing.
>>>> Standby...')
>>>> +        wait_for_console_pattern(self, 'Booting Bios')
>>>> +
>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>>>> code')
>>>> +    # Tesseract 4 adds a new OCR engine based on LSTM neural
>>>> networks. The
>>>> +    # new version is faster and more accurate than version 3. The
>>>> drawback is
>>>> +    # that it is still alpha-level software.
>>>> +    @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not
>>>> available')
>>>> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not
>>>> available')
>>>> +    def test_pmon_framebuffer_console(self):
>>>> +        """
>>>> +        :avocado: tags=arch:mips64el
>>>> +        :avocado: tags=machine:fuloong2e
>>>> +        :avocado: tags=endian:little
>>>> +        :avocado: tags=device:bonito64
>>>> +        :avocado: tags=device:ati-vga
>>>> +        """
>>>> +        screenshot_path = os.path.join(self.workdir, 'dump.ppm')
>>>> +
>>>> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
>>>> +        pmon_path = self.fetch_asset('file://' +
>>>> os.getenv('PMON2E_BIN_PATH'),
>>>> +                                     asset_hash=pmon_hash,
>>>> algorithm='md5')
>>>> +
>>>> +        self.vm.set_console()
>>>> +        self.vm.add_args('-bios', pmon_path,
>>>> +                         '-vga', 'std',
>>>> +                         '-device', 'ati-vga,model=rv100')
>>>
>>> I think this is the default if you just drop -vga std so I don't know
>>> why you have that in the first place but then you should not need to add
>>> ati-vga explicitely.
>>
>> I thought this is what you asked me here:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg753832.html
> 
> No, I've said the same in that message that fuloong2e has an ati-vga as
> default so no -vga option should be needed at all.
> 
>> Currently:
>>
>> console: VGAI
>> console: Default MODE_ID 2
>> console: starting radeon init...
>> console: iobase=bfd0a200,mmbase=b6064000
>> console: mc_status=5
>> console: mc_status=5
>> console: mc_status=5
>> console: mc_status=5
>> console: ppll_div_3 = 301f4
>> console: Wrote: 0x00000043 0x000301f4 0x00000000 (0x00000000)
>> console: Wrote: rd=67, fd=500, pd=3
>> console: VCLK_ECP_CNTL = 000000C3
>> console: radeon init done
>> console: FRBI
>> console: cfb_console init,fb=b5000000
>> console: Video: Drawing the logo ...
>> console: CONSOLE_SIZE 450560HSTI
>> PASS (4.53 s)
>>
>> Without '-vga std -device ati-vga,model=rv100':
>>
>> console: VGAI
>> console: Default MODE_ID 2
>> console: starting radeon init...
>> INTERRUPTED: Test interrupted by SIGTERM
>> Runner error occurred: Timeout reached... (60.29 s)
> 
> That's strange (with the REG_MASK fixed to 0xff in bonito.c) I get:
> 
> $ qemu-system-mips64el -M fuloong2e -bios pmon_2e.bin -serial stdio
> [...]
> VGAI
> Default MODE_ID 2
> starting radeon init...
> iobase=bfd0a100,mmbase=b5050000
> mc_status=5
> mc_status=5
> mc_status=5
> mc_status=5
> ppll_div_3 = 301f4
> Wrote: 0x00000043 0x000301f4 0x00000000 (0x00000000)
> Wrote: rd=67, fd=500, pd=3
> VCLK_ECP_CNTL = 000000C3
> radeon init done
> FRBI
> cfb_console init,fb=b4000000
> Video: Drawing the logo ...
> CONSOLE_SIZE 450560HSTI
> 
> So I think you should not need either -vga std nor -device ati-vga as
> those would add another VGA card to the one already on the board.

So after looking in git history, Avocado tests inherited iotests,
and since commit 0fd05e8dd1e ("qemu-iotests: start vms in qtest mode")
the VMs are started with -display none -vga none.
See in python/qemu/machine/machine.py:

    def _base_args(self) -> List[str]:
        args = ['-display', 'none', '-vga', 'none']

Which is why we have to use '-vga std' here.

Except if you disagree, I'll queue the patch using:

      self.vm.add_args('-bios', pmon_path,
                       '-vga', 'std')

Thanks,

Phil.

