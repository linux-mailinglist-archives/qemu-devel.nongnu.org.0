Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B433A9AF5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:48:48 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUyM-0005hH-QU
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltUxJ-0004yi-FD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:47:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltUxH-0001wK-Av
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:47:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id v9so2552961wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SWvFeZi8DY1hQQ1UCE7196Ftmyspzcxyu0RCV0tQKJ4=;
 b=suNmQK7Qhsjz2tZVqEEzGDzZ6HRwtvp76tVVpYY0eFqfppIaLsUMVsKU15I0GbjPe/
 K+GspmyDmCSd6t25Nvld1xDoqKcNPvnyMp/I8cQj+vNRpkPrEu9C4RpeCrhhahgIXyxz
 yhghu2mM/0gf+zjCEKk34AU5bybOSdfBDN7+MlyFZwzbf9wD039YIngL5A8evnISZOoo
 5XysJGNJAFn0FdQuE4Shy4UvhH3BzcHWt8zul1Km803PNdrxu5b5pqBg/OIrPhkGeplY
 Qz7N+P/f9fgZWuyyiwdZU6jcEE4uClIMUHDWjoOs7A7OEaToHAdbrUscHy64KTKskefS
 H2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWvFeZi8DY1hQQ1UCE7196Ftmyspzcxyu0RCV0tQKJ4=;
 b=nS1OOCzJO0qPq5NkFrIEm+UAKexp1AQkFqOYD3XL2CLzMylwxFkEPAA3JaFzzifXPK
 6PrlP7eMgc6bMmuBkXFNiBT1jTX+b+XDzO1bvrbeADJd0AJuJEj7V02IEHqOtvDeVsiw
 n6Omn+SpTPgmbsLLBxfsV3bbQbjF/7/R6uzaKclX5IQnJJkht2Wfyo+HxyAl34sF6p54
 vtvAe8A5itm1/jDko95gcHWPlKpiorLzACty1JuMW2B5baJSQlqVAZKGuL/RqsMAcTNw
 R67kTIgVuuykxkXiyBuYlFJDiu9dnXnpQgS+uf0UTmdiPXXEFm6a1bdtPb8fB7245UOf
 u3zw==
X-Gm-Message-State: AOAM5336sdow8xEVU53tAzWfiQ5/TTjOlrOq0yLs04Ir8ySirtwzv+Nq
 8rmQeMFvyCGTx3WIKF0SYu0=
X-Google-Smtp-Source: ABdhPJxQpu2YwjR1MPa3xTjZTbVhmxR9vB904sKrm0TmT1pMlN+sI5FmvzphKZUWuYfJuayNoAhFbQ==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr5191085wrr.47.1623847657829; 
 Wed, 16 Jun 2021 05:47:37 -0700 (PDT)
Received: from [192.168.50.31] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id j12sm2103722wrt.69.2021.06.16.05.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 05:47:36 -0700 (PDT)
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: Qiang Liu <cyruscyliu@gmail.com>
References: <20210616104349.2398060-1-f4bug@amsat.org>
 <CAAKa2j=au0tnqPg8iPB7e3SHNZVL+RO9xb7=u6aszUWRiSC0Ew@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a7b8eb63-dae8-1086-49db-efae43660dd2@amsat.org>
Date: Wed, 16 Jun 2021 14:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAKa2j=au0tnqPg8iPB7e3SHNZVL+RO9xb7=u6aszUWRiSC0Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 1:58 PM, Qiang Liu wrote:
> Thx. I learned a lot about contributing to QEMU from this discussion!

I think this was a misunderstanding with Gerd, the maintainer.

Maintainers use some tools to ease their patch-by-email workflow.
As a tester/reviewer you simply reply to a patch with a "Reviewed-by"
or "Tested-by" tag (with your name and email) and the tools will
collect your tags. Then the maintainer take the patches with the
tags amended. So a v2 shouldn't be necessary normally. And this is
certainly not a task of the reviewer to resend the patch as v2 adding
its own R-b/T-b tags.
It might help you to look at the list mail archives:
https://lists.gnu.org/archive/html/qemu-devel/
or even better subscribe to the list (high traffic! you need to filter
for your interests).

> Best,
> Qiang
> 
> On Wed, Jun 16, 2021 at 6:43 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
>> Hardware Programming Guide" limit the sampling range from 4000 Hz to
>> 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
>> 3-2 and 3-3).
>>
>> Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
>> 42h registers (Set digitized sound output sampling rate):
>>
>>   Valid sampling rates range from 5000 to 45000 Hz inclusive.
>>
>> There is no comment regarding error handling if the register is filled
>> with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
>> Auto-initialize Transfer"). Assume limits are enforced in hardware.
>>
>> This fixes triggering an assertion in audio_calloc():
>>
>>   #1 abort
>>   #2 audio_bug audio/audio.c:119:9
>>   #3 audio_calloc audio/audio.c:154:9
>>   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
>>   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
>>   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
>>   #7 AUD_open_out audio/audio_template.h:503:14
>>   #8 continue_dma8 hw/audio/sb16.c:216:20
>>   #9 dma_cmd8 hw/audio/sb16.c:276:5
>>   #10 command hw/audio/sb16.c:0
>>   #11 dsp_write hw/audio/sb16.c:949:13
>>   #12 portio_write softmmu/ioport.c:205:13
>>   #13 memory_region_write_accessor softmmu/memory.c:491:5
>>   #14 access_with_adjusted_size softmmu/memory.c:552:18
>>   #15 memory_region_dispatch_write softmmu/memory.c:0:13
>>   #16 flatview_write_continue softmmu/physmem.c:2759:23
>>   #17 flatview_write softmmu/physmem.c:2799:14
>>   #18 address_space_write softmmu/physmem.c:2891:18
>>   #19 cpu_outw softmmu/ioport.c:70:5
>>
>> [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
>>
>> Fixes: 85571bc7415 ("audio merge (malc)")
>> Buglink: https://bugs.launchpad.net/bugs/1910603
>> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29174
>> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
>> Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: Added Qiang Liu's T-b/R-b tags ¯\_(ツ)_/¯
>> ---
>>  hw/audio/sb16.c              | 14 ++++++++++
>>  tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                  |  1 +
>>  tests/qtest/meson.build      |  1 +
>>  4 files changed, 68 insertions(+)
>>  create mode 100644 tests/qtest/fuzz-sb16-test.c
>>
>> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
>> index 8b207004102..5cf121fe363 100644
>> --- a/hw/audio/sb16.c
>> +++ b/hw/audio/sb16.c
>> @@ -115,6 +115,9 @@ struct SB16State {
>>      PortioList portio_list;
>>  };
>>
>> +#define SAMPLE_RATE_MIN 5000
>> +#define SAMPLE_RATE_MAX 45000
>> +
>>  static void SB_audio_callback (void *opaque, int free);
>>
>>  static int magic_of_irq (int irq)
>> @@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_len)
>>          int tmp = (256 - s->time_const);
>>          s->freq = (1000000 + (tmp / 2)) / tmp;
>>      }
>> +    if (s->freq < SAMPLE_RATE_MIN) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "sampling range too low: %d, increasing to %u\n",
>> +                      s->freq, SAMPLE_RATE_MIN);
>> +        s->freq = SAMPLE_RATE_MIN;
>> +    } else if (s->freq > SAMPLE_RATE_MAX) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "sampling range too high: %d, decreasing to %u\n",
>> +                      s->freq, SAMPLE_RATE_MAX);
>> +        s->freq = SAMPLE_RATE_MAX;
>> +    }
>>
>>      if (dma_len != -1) {
>>          s->block_size = dma_len << s->fmt_stereo;
>> diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
>> new file mode 100644
>> index 00000000000..51030cd7dc4
>> --- /dev/null
>> +++ b/tests/qtest/fuzz-sb16-test.c
>> @@ -0,0 +1,52 @@
>> +/*
>> + * QTest fuzzer-generated testcase for sb16 audio device
>> + *
>> + * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqos/libqtest.h"
>> +
>> +/*
>> + * This used to trigger the assert in audio_calloc
>> + * https://bugs.launchpad.net/qemu/+bug/1910603
>> + */
>> +static void test_fuzz_sb16_0x1c(void)
>> +{
>> +    QTestState *s = qtest_init("-M q35 -display none "
>> +                               "-device sb16,audiodev=snd0 "
>> +                               "-audiodev none,id=snd0");
>> +    qtest_outw(s, 0x22c, 0x41);
>> +    qtest_outb(s, 0x22c, 0x00);
>> +    qtest_outw(s, 0x22c, 0x1004);
>> +    qtest_outw(s, 0x22c, 0x001c);
>> +    qtest_quit(s);
>> +}
>> +
>> +static void test_fuzz_sb16_0x91(void)
>> +{
>> +    QTestState *s = qtest_init("-M pc -display none "
>> +                               "-device sb16,audiodev=none "
>> +                               "-audiodev id=none,driver=none");
>> +    qtest_outw(s, 0x22c, 0xf141);
>> +    qtest_outb(s, 0x22c, 0x00);
>> +    qtest_outb(s, 0x22c, 0x24);
>> +    qtest_outb(s, 0x22c, 0x91);
>> +    qtest_quit(s);
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +   if (strcmp(arch, "i386") == 0) {
>> +        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
>> +        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
>> +   }
>> +
>> +   return g_test_run();
>> +}
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7d9cd290426..d619ea8fcd1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2221,6 +2221,7 @@ F: qapi/audio.json
>>  F: tests/qtest/ac97-test.c
>>  F: tests/qtest/es1370-test.c
>>  F: tests/qtest/intel-hda-test.c
>> +F: tests/qtest/fuzz-sb16-test.c
>>
>>  Block layer core
>>  M: Kevin Wolf <kwolf@redhat.com>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c3a223a83d6..b03e8541700 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -20,6 +20,7 @@
>>  qtests_generic = \
>>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
>>    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>> +  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
>>    [
>>    'cdrom-test',
>>    'device-introspect-test',
>> --
>> 2.31.1
>>
> 

