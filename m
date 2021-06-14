Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D503A63D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:16:11 +0200 (CEST)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskZd-0000df-MO
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskYo-0008P7-Em
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:15:18 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskWs-0001uk-1b
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:15:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c9so14096370wrt.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fGUjFGs50K68ZxsYUlrhQ3FIpWHirbelzbotNl0Fwzw=;
 b=PNsYYfFVHi2o5Vk9O5YGt0Qma6VjBfdD1IJjOtPObMlU4LeP4R8EPwZY4Q6H8QxM5S
 gdf/CFM8HZQ03bAAlphPJYlctM2cv10fzJPV3U0PrKszmZ9TN7STw9W6bS1h4QF30drt
 ytJ2kqKu92CLnS/Ly3hp6YIu+5EYrMqZap9enZM4342/28SOCo8bOjK2bUwYPzxsn9TZ
 uB4AlIkcJusL6pdCNU+Uz/dCWIZKTF1gvnYyVjiybz/UnVKVQCdewlgFJaCWGUtfBPbT
 y6dq5W+/TMF0/65Ab5T5h8EzDt1J0VXRnmuyENUjjR80uOtaBh7nlP3DJyu2BtyW8asX
 i8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fGUjFGs50K68ZxsYUlrhQ3FIpWHirbelzbotNl0Fwzw=;
 b=sge2KoHYSamZGJW1S8jvoYMfqYWD8X8/hMjbT9wj51EKIhdfcFfZ8xJiulbSjpN5/1
 EwtUFztbzciZooLQkmk9zcqbCDmyfskGSvt09Akp8xo55QTNDgSLLbO0c7+mY72L4PPL
 AAAk0deAzNBUhuCrOqUmZ7IfLS+fBolR/h16PyfLShN4MtxJttKa6icsXLyuP5mZqkWC
 rzvs6hudnyULsdsnKEwNhpwpEWGDMF7cB+yBdCp+8LbDQDx/fPpGEEUqLURTBKuwF2OJ
 r2dbQLWkedB7ZZWQztS5gwICHTvaVtpYLzsAP/sfFM5Sxn+y1vYusXRmfpSH23Kglztt
 e6EQ==
X-Gm-Message-State: AOAM530gmbmuclwWg3JGScF0iy0TijSgWY3iC05FyXezDyZ5LeFEC1pt
 3ffpbwtJ0gn8FQqFnjn0HVc=
X-Google-Smtp-Source: ABdhPJyw/1QEcB2eQvcnrVtBiON2jtwOO37x/7Vxw5A4k022IaYs2h74Ms/bxrjFRCWNCI/UFH2wMA==
X-Received: by 2002:adf:f182:: with SMTP id h2mr18252172wro.313.1623669196362; 
 Mon, 14 Jun 2021 04:13:16 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x10sm15853940wrt.26.2021.06.14.04.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:13:15 -0700 (PDT)
Subject: Re: [PATCH] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210601151813.2059996-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b755adfe-5fbe-affb-cc1b-5b4cb377b715@amsat.org>
Date: Mon, 14 Jun 2021 13:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601151813.2059996-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 6/1/21 5:18 PM, Philippe Mathieu-Daudé wrote:
> While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
> Hardware Programming Guide" limit the sampling range from 4000 Hz to
> 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
> 3-2 and 3-3).
> 
> Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
> 42h registers (Set digitized sound output sampling rate):
> 
>   Valid sampling rates range from 5000 to 45000 Hz inclusive.
> 
> There is no comment regarding error handling if the register is filled
> with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
> Auto-initialize Transfer"). Assume limits are enforced in hardware.
> 
> This fixes triggering an assertion in audio_calloc():
> 
>   #1 abort
>   #2 audio_bug audio/audio.c:119:9
>   #3 audio_calloc audio/audio.c:154:9
>   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
>   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
>   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
>   #7 AUD_open_out audio/audio_template.h:503:14
>   #8 continue_dma8 hw/audio/sb16.c:216:20
>   #9 dma_cmd8 hw/audio/sb16.c:276:5
>   #10 command hw/audio/sb16.c:0
>   #11 dsp_write hw/audio/sb16.c:949:13
>   #12 portio_write softmmu/ioport.c:205:13
>   #13 memory_region_write_accessor softmmu/memory.c:491:5
>   #14 access_with_adjusted_size softmmu/memory.c:552:18
>   #15 memory_region_dispatch_write softmmu/memory.c:0:13
>   #16 flatview_write_continue softmmu/physmem.c:2759:23
>   #17 flatview_write softmmu/physmem.c:2799:14
>   #18 address_space_write softmmu/physmem.c:2891:18
>   #19 cpu_outw softmmu/ioport.c:70:5
> 
> [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
> 
> Fixes: 85571bc7415 ("audio merge (malc)")
> Buglink: https://bugs.launchpad.net/bugs/1910603
> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29174
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/audio/sb16.c              | 14 ++++++++++
>  tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |  1 +
>  tests/qtest/meson.build      |  1 +
>  4 files changed, 68 insertions(+)
>  create mode 100644 tests/qtest/fuzz-sb16-test.c
> 
> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> index 8b207004102..5cf121fe363 100644
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -115,6 +115,9 @@ struct SB16State {
>      PortioList portio_list;
>  };
>  
> +#define SAMPLE_RATE_MIN 5000
> +#define SAMPLE_RATE_MAX 45000
> +
>  static void SB_audio_callback (void *opaque, int free);
>  
>  static int magic_of_irq (int irq)
> @@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_len)
>          int tmp = (256 - s->time_const);
>          s->freq = (1000000 + (tmp / 2)) / tmp;
>      }
> +    if (s->freq < SAMPLE_RATE_MIN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too low: %d, increasing to %u\n",
> +                      s->freq, SAMPLE_RATE_MIN);
> +        s->freq = SAMPLE_RATE_MIN;
> +    } else if (s->freq > SAMPLE_RATE_MAX) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too high: %d, decreasing to %u\n",
> +                      s->freq, SAMPLE_RATE_MAX);
> +        s->freq = SAMPLE_RATE_MAX;
> +    }
>  
>      if (dma_len != -1) {
>          s->block_size = dma_len << s->fmt_stereo;
> diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
> new file mode 100644
> index 00000000000..51030cd7dc4
> --- /dev/null
> +++ b/tests/qtest/fuzz-sb16-test.c
> @@ -0,0 +1,52 @@
> +/*
> + * QTest fuzzer-generated testcase for sb16 audio device
> + *
> + * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +
> +/*
> + * This used to trigger the assert in audio_calloc
> + * https://bugs.launchpad.net/qemu/+bug/1910603
> + */
> +static void test_fuzz_sb16_0x1c(void)
> +{
> +    QTestState *s = qtest_init("-M q35 -display none "
> +                               "-device sb16,audiodev=snd0 "
> +                               "-audiodev none,id=snd0");
> +    qtest_outw(s, 0x22c, 0x41);
> +    qtest_outb(s, 0x22c, 0x00);
> +    qtest_outw(s, 0x22c, 0x1004);
> +    qtest_outw(s, 0x22c, 0x001c);
> +    qtest_quit(s);
> +}
> +
> +static void test_fuzz_sb16_0x91(void)
> +{
> +    QTestState *s = qtest_init("-M pc -display none "
> +                               "-device sb16,audiodev=none "
> +                               "-audiodev id=none,driver=none");
> +    qtest_outw(s, 0x22c, 0xf141);
> +    qtest_outb(s, 0x22c, 0x00);
> +    qtest_outb(s, 0x22c, 0x24);
> +    qtest_outb(s, 0x22c, 0x91);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +   if (strcmp(arch, "i386") == 0) {
> +        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
> +        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
> +   }
> +
> +   return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f55404f2fa..7edb26d2293 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2213,6 +2213,7 @@ F: qapi/audio.json
>  F: tests/qtest/ac97-test.c
>  F: tests/qtest/es1370-test.c
>  F: tests/qtest/intel-hda-test.c
> +F: tests/qtest/fuzz-sb16-test.c
>  
>  Block layer core
>  M: Kevin Wolf <kwolf@redhat.com>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c3a223a83d6..b03e8541700 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -20,6 +20,7 @@
>  qtests_generic = \
>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
>    [
>    'cdrom-test',
>    'device-introspect-test',
> 

