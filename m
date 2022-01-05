Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28969485A6C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:08:53 +0100 (CET)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DWd-0001Y9-Fd
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5DTT-0006ns-Oh
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:05:36 -0500
Received: from [2a00:1450:4864:20::329] (port=51006
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5DTR-0007Zl-7i
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:05:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id m20so531622wmi.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ndeK3Z9FYXsxTm42GFVYASZbFu/PSg504ILRvmsp7bY=;
 b=wEl/wRXLvu/aEk0U6OxsmrRcqDS6DzvafABul2z+Swv4z1OfphE3NsWtzEVxSzDW0G
 4jKydR7AL0TQiWMsvcLMcUWOuOB1Rr7hlE0v1/ojch2IAwD0Cwc0BtWtG6zylZh6uyij
 5UX+NrsK3Fdl7O94/d2dU8WRt7mpTVJNMGmrYv74fFXRx0rDl3VZfNadxX/XLrsXdwSN
 iyHhpUAQbZOMtrJJP8EKQTNRNhoOQJ0uZTaJfBsYzQ2kuiuWN/VPTKgivGxR9fVlKfgv
 1mCP2SNTikAQ+DIkTEph/rtqfi3o5iNmJm0PkI7O0IXSeHuwS37b+nKVhBIWL2UlgpYZ
 VtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ndeK3Z9FYXsxTm42GFVYASZbFu/PSg504ILRvmsp7bY=;
 b=lB9aqybPUE1heIlvVId0qYWNe6xdfPHP4IG7jJQNE/ozp4P78nGPUQ6Xf9zBYRCJLd
 wFvbyszWJBREdqY06d/f0Jcj6al+omvpn+idTghJkYoL9+D96zOt+Cu7dO1Nf8twMr2s
 HA+JmFOUnIRomz2aeJMFvS5bQbv+aIJQuxDiT6Uop3xwNuBqEqyehMXR9PzDUZ8UFgpb
 gGDGAWDPYl/SiyMHE4Y+DVzgSt5zDNyLypc0jqry8jGxknY17tF4AH5fEKt4mbiy0GX1
 2AQ9IelQGDCBRvy9LsEdXRAps/YCQgwWE3exnHX2fOVTkI9lYtzorn4uLomHc24CWZdL
 yjiA==
X-Gm-Message-State: AOAM533vlju6WAsw14WHF2sBShznF2xwWy2VpPcjtgXbnATOdlUTWJSM
 YKchQYPTA0YUN/VsTvXzTWpmag==
X-Google-Smtp-Source: ABdhPJz56xheGJzEk6axb7Nd41X0s/CQASQJGT68ac56PBq5XuUFUCLjejmxt3ckjLRhr8aQ/b+KrA==
X-Received: by 2002:a7b:c92a:: with SMTP id h10mr4391554wml.26.1641416730624; 
 Wed, 05 Jan 2022 13:05:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b5sm78596wrr.19.2022.01.05.13.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:05:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDCAE1FFB7;
 Wed,  5 Jan 2022 21:05:28 +0000 (GMT)
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Trying to understand QOM object creation and property linking
Date: Wed, 05 Jan 2022 21:02:25 +0000
In-reply-to: <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
Message-ID: <87r19lj3l3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi Alex,
>
> On 5/1/22 19:03, Alex Benn=C3=A9e wrote:
>> Hi,
>> I'm having a hell of a time trying to create a new SoC+Board model
>> from
>> scratch. The problem comes down to trying to expose some properties to
>> the underlying CPU from my board model. So I have:
<snip>
>> static void pipico_machine_init(MachineState *machine)
>> {
>>      PiPicoMachineState *s =3D PIPICO_MACHINE(machine);
>>      ...
>>      MemoryRegion *system_memory =3D get_system_memory();

Hmm this memory is initialised by memory_region_init() so...

>>      ...
>>           /* initialize external Flash device */
>>      memory_region_init_rom(&s->flash, NULL,
>>                             "pico.flash0", 256 * KiB, &error_fatal);
>>      memory_region_add_subregion(system_memory, 0, &s->flash);
>>      /* Setup the SOC */
>>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP204=
0);
>>      /* link properties from machine the SoC needs */
>>      object_property_set_link(OBJECT(&s->soc), "memory",
>>                               OBJECT(system_memory), &error_fatal);
>>      sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>> The initialisation of the SoC is simple because I can't do much
>> until
>> things are realised:
>> static void rp2040_init(Object *obj)
>> {
>>      RP2040State *s =3D RP2040(obj);
>>      int n;
>>      fprintf(stderr, "%s: %p\n", __func__, obj);
>>      for (n =3D 0; n < RP2040_NCPUS; n++) {
>>          object_initialize_child(obj, "cpu[*]", &s->armv7m[n], TYPE_ARMV=
7M);
>>          qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
>>                               ARM_CPU_TYPE_NAME("cortex-m0"));
>
> Here for each core you need to initialize a MemoryRegion container, ...
>
>>      }
>> }
>> However when I get to realize the SoC itself:
>> static void rp2040_realize(DeviceState *dev, Error **errp)
>> {
>>      RP2040State *s =3D RP2040(dev);
>>      Object *obj =3D OBJECT(dev);
>>      int n;
>>      if (!s->board_memory) {
>>          error_setg(errp, "%s: memory property was not set", __func__);
>>          return;
>>      }
>>      /* initialize internal 16 KB internal ROM */
>>      memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
>>      memory_region_add_subregion(s->board_memory, 0, &s->rom);
>>      /* SRAM (Main 256k bank + two 4k banks)*/
>>      memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB,=
 errp);
>>      memory_region_add_subregion(s->board_memory, RP2040_SRAM_BASE, &s->=
sram03);
>>      memory_region_init_ram(&s->sram4, obj, "rp2040.sram4", 4 * KiB,
>> errp);
>>      memory_region_add_subregion(s->board_memory, RP2040_SRAM4_BASE, &s-=
>sram4);
>>      memory_region_init_ram(&s->sram5, obj, "rp2040.sram5", 4 * KiB,
>> errp);
>>      memory_region_add_subregion(s->board_memory, RP2040_SRAM5_BASE, &s-=
>sram5);
>>      ...
>>      for (n =3D 0; n < RP2040_NCPUS; n++) {
>>          /* DeviceState *cpudev =3D DEVICE(&s->armv7m[i]); */
>>          Object *cpuobj =3D OBJECT(&s->armv7m[n]);
>
> then you add the board_memory in the per-CPU container as subregion,
> ...

Can't be added as a subregion to the container...

  qemu-system-arm: ../../softmmu/memory.c:2538: memory_region_add_subregion=
_common: Assertion `!subregion->container' failed.

>
>>          object_property_set_link(cpuobj, "memory",
>>                                   OBJECT(&s->board_memory), errp);
>
> and finally each CPU links its container as its memory bus.

So something like:

        object_property_set_link(cpuobj, "memory", OBJECT(s->cpu_mem[n]), e=
rrp);

so the CPU sees the container with whatever particular set of memory
regions you want to make visible to that CPU?

<snip>

>> Follow-up questions, does only creating the main memory aliases as
>> part
>> of the SoC make sense? My rational is most of the memory is part of the
>> SoC not the board. I assume later RP2040 based boards may have different
>> flash configs or even external memory.
>> The current (messy) state of my tree can be seen at:
>>    https://gitlab.com/stsquad/qemu/-/commits/arm/picopi-rfc
>>=20


--=20
Alex Benn=C3=A9e

