Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820033E342
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:57:22 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKUy-0008Jq-VO
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKTh-0007gn-3Y; Tue, 16 Mar 2021 20:56:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMKTe-0002ux-P2; Tue, 16 Mar 2021 20:56:00 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p19so523459wmq.1;
 Tue, 16 Mar 2021 17:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FGHtzH5hWfWnXqlTafusR//DbhmRIl9gzezAaAt0LFY=;
 b=WavEe1bTp0Hb1zWfhBTO8fOX5sH+6MmpI4aMdNzE/kLeIiD6LnY0G2DJjn0rpTsmZj
 YGGUuKhDi1KGHSqs1qE2D5ga2sGhgXLqXl7y2t4pxlqLNoSQHMXAim99IPUYWYaIuCjt
 /f8E0z/tytQbeXkGHvxHujbk9cmcxsm7IY1ty0RUPWjxRIhLxMCwbYe/r8Ef4KRzCTqP
 OD6oNWCnd7idX05XvmfvmwVzArQmwrpP66xoY1yND85nZyRaQNhFS60wj9NiITco2LeY
 srNJxzNoKu4e+l07tmxXZZMoI8wYswwHH4NvUYMCVVdQaZz+oZJwZbiVaOBU0cOCHCOJ
 VGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGHtzH5hWfWnXqlTafusR//DbhmRIl9gzezAaAt0LFY=;
 b=lVU4k5wInca/h27YwB1QCN1lZxafYAx6oYtP55WRR5fAKb0qrq0dRSrmxU8LKCwI0n
 bQGmTWjAMWflqMsfEYvpQ3WC7xK+Y++M4hjHmfDqptQlWJjR0sB9g1okb9HGKDB7nPP5
 KWT/YBX4IQoUK2YCGuCyfgyFX6zOYED2eMxun5z6zCiSTAt0//f3HiJLcjfuzrhjxN92
 hPXp6vidt2nWnhAgRAQH/ps96KCtRWNnNQE8yEYzZ3LkN/VP7GZZj0/oaNp8j6J5PGw6
 /FMUEWCRxbMi1Aegg9FnbPbCUzf4AFi9x9eyrVglbF1tLpw61pzAC1cE7GMustP1fsZQ
 FjYw==
X-Gm-Message-State: AOAM531EwxSHMTRJozpurvhDkSTpvI/ryx9471v7fsMXq7BONR/2qot3
 nGX/WA2eNscd1R94to3qkHY=
X-Google-Smtp-Source: ABdhPJzbiwCFDaPg8tc5YWyDp+bGmWwaT4wjTg9+V/OzOSwDnvGi3XheD0e17GIQe1D85arb2KnTQw==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr1188335wmm.33.1615942556197; 
 Tue, 16 Mar 2021 17:55:56 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 13sm842586wmw.5.2021.03.16.17.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:55:55 -0700 (PDT)
Subject: Re: [PATCH v9 6/7] hw/pci-host: Add emulation of Marvell MV64361 PPC
 system controller
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615932192.git.balaton@eik.bme.hu>
 <e3bd27f053de5335713835013a7119409c8dc104.1615932192.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae1821e4-efae-d97a-ca55-079bb0399fe8@amsat.org>
Date: Wed, 17 Mar 2021 01:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e3bd27f053de5335713835013a7119409c8dc104.1615932192.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:03 PM, BALATON Zoltan wrote:
> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
> chip that is used on the pegasos2 PPC board. This adds emulation of it
> that models the device enough to boot guests on this board. The
> mv643xx.h header with register definitions is taken from Linux 4.15.10
> only fixing white space errors, removing not needed parts and changing
> formatting for QEMU coding style.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/pci-host/Kconfig           |   4 +
>  hw/pci-host/meson.build       |   2 +
>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>  hw/pci-host/mv643xx.h         | 918 ++++++++++++++++++++++++++++++++
>  hw/pci-host/trace-events      |   6 +
>  include/hw/pci-host/mv64361.h |   8 +
>  include/hw/pci/pci_ids.h      |   1 +
>  7 files changed, 1905 insertions(+)
>  create mode 100644 hw/pci-host/mv64361.c
>  create mode 100644 hw/pci-host/mv643xx.h
>  create mode 100644 include/hw/pci-host/mv64361.h

> +static void unmap_region(MemoryRegion *mr)
> +{
> +    if (memory_region_is_mapped(mr)) {
> +        memory_region_del_subregion(get_system_memory(), mr);
> +        object_unparent(OBJECT(mr));
> +    }
> +}
> +
> +static void map_pci_region(MemoryRegion *mr, MemoryRegion *parent,
> +                           struct Object *owner, const char *name,
> +                           hwaddr poffs, uint64_t size, hwaddr moffs)
> +{
> +    memory_region_init_alias(mr, owner, name, parent, poffs, size);
> +    memory_region_add_subregion(get_system_memory(), moffs, mr);
> +    trace_mv64361_region_map(name, poffs, size, moffs);
> +}
> +
> +static void setup_mem_windows(MV64361State *s, uint32_t val)
> +{
> +    MV64361PCIState *p;
> +    MemoryRegion *mr;
> +    uint32_t mask;
> +    int i;
> +
> +    val &= 0x1fffff;

magic value for PCI_WINDOW_SIZE_MASK?

> +    for (mask = 1, i = 0; i < 21; i++, mask <<= 1) {

magic 21.

> +        if ((val & mask) != (s->base_addr_enable & mask)) {
> +            trace_mv64361_region_enable(!(val & mask) ? "enable" : "disable", i);
> +            switch (i) {
> +            /*
> +             * 0-3 are SDRAM chip selects but we map all RAM directly
> +             * 4-7 are device chip selects (not sure what those are)
> +             * 8 is Boot device (ROM) chip select but we map that directly too
> +             */
> +            case 9:
> +                p = &s->pci[0];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->io, OBJECT(s), "pci0-io-win",
> +                                   p->remap[4], (p->io_size + 1) << 16,
> +                                   (p->io_base & 0xfffff) << 16);
> +                }
> +                break;
> +            case 10:
> +                p = &s->pci[0];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem0-win",
> +                                   p->remap[0], (p->mem_size[0] + 1) << 16,
> +                                   (p->mem_base[0] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 11:
> +                p = &s->pci[0];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem1-win",
> +                                   p->remap[1], (p->mem_size[1] + 1) << 16,
> +                                   (p->mem_base[1] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 12:
> +                p = &s->pci[0];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem2-win",
> +                                   p->remap[2], (p->mem_size[2] + 1) << 16,
> +                                   (p->mem_base[2] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 13:
> +                p = &s->pci[0];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci0-mem3-win",
> +                                   p->remap[3], (p->mem_size[3] + 1) << 16,
> +                                   (p->mem_base[3] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 14:
> +                p = &s->pci[1];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->io, OBJECT(s), "pci1-io-win",
> +                                   p->remap[4], (p->io_size + 1) << 16,
> +                                   (p->io_base & 0xfffff) << 16);
> +                }
> +                break;
> +            case 15:
> +                p = &s->pci[1];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem0-win",
> +                                   p->remap[0], (p->mem_size[0] + 1) << 16,
> +                                   (p->mem_base[0] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 16:
> +                p = &s->pci[1];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem1-win",
> +                                   p->remap[1], (p->mem_size[1] + 1) << 16,
> +                                   (p->mem_base[1] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 17:
> +                p = &s->pci[1];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem2-win",
> +                                   p->remap[2], (p->mem_size[2] + 1) << 16,
> +                                   (p->mem_base[2] & 0xfffff) << 16);
> +                }
> +                break;
> +            case 18:
> +                p = &s->pci[1];
> +                mr = &s->cpu_win[i];
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    map_pci_region(mr, &p->mem, OBJECT(s), "pci1-mem3-win",
> +                                   p->remap[3], (p->mem_size[3] + 1) << 16,
> +                                   (p->mem_base[3] & 0xfffff) << 16);
> +                }
> +                break;
> +            /* 19 is integrated SRAM */
> +            case 20:
> +                mr = &s->regs;
> +                unmap_region(mr);
> +                if (!(val & mask)) {
> +                    memory_region_add_subregion(get_system_memory(),
> +                        (s->regs_base & 0xfffff) << 16, mr);
> +                }
> +                break;
> +            }
> +        }
> +    }
> +}
> +
> +static void mv64361_update_irq(void *opaque, int n, int level)
> +{
> +    MV64361State *s = opaque;
> +    uint64_t val = s->main_int_cr;
> +
> +    if (level) {
> +        val |= BIT_ULL(n);
> +    } else {
> +        val &= ~BIT_ULL(n);
> +    }
> +    if ((s->main_int_cr & s->cpu0_int_mask) != (val & s->cpu0_int_mask)) {
> +        qemu_set_irq(s->cpu_irq, level);
> +    }
> +    s->main_int_cr = val;
> +}
> +
> +static uint64_t mv64361_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    MV64361State *s = MV64361(opaque);
> +    uint32_t ret = 0;
> +
> +    switch (addr) {
> +    case MV64340_CPU_CONFIG:
> +        ret = s->cpu_conf;
> +        break;
> +    case MV64340_PCI_0_IO_BASE_ADDR:
> +        ret = s->pci[0].io_base;
> +        break;
> +    case MV64340_PCI_0_IO_SIZE:
> +        ret = s->pci[0].io_size;
> +        break;
> +    case MV64340_PCI_0_IO_ADDR_REMAP:
> +        ret = s->pci[0].remap[4] >> 16;
> +        break;
> +    case MV64340_PCI_0_MEMORY0_BASE_ADDR:
> +        ret = s->pci[0].mem_base[0];
> +        break;
> +    case MV64340_PCI_0_MEMORY0_SIZE:
> +        ret = s->pci[0].mem_size[0];
> +        break;
> +    case MV64340_PCI_0_MEMORY0_LOW_ADDR_REMAP:
> +        ret = (s->pci[0].remap[0] & 0xffff0000) >> 16;

extract32()

> +        break;
> +    case MV64340_PCI_0_MEMORY0_HIGH_ADDR_REMAP:
> +        ret = s->pci[0].remap[0] >> 32;
> +        break;
> +    case MV64340_PCI_0_MEMORY1_BASE_ADDR:
> +        ret = s->pci[0].mem_base[1];
> +        break;
> +    case MV64340_PCI_0_MEMORY1_SIZE:
> +        ret = s->pci[0].mem_size[1];
> +        break;
> +    case MV64340_PCI_0_MEMORY1_LOW_ADDR_REMAP:
> +        ret = (s->pci[0].remap[1] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_0_MEMORY1_HIGH_ADDR_REMAP:
> +        ret = s->pci[0].remap[1] >> 32;
> +        break;
> +    case MV64340_PCI_0_MEMORY2_BASE_ADDR:
> +        ret = s->pci[0].mem_base[2];
> +        break;
> +    case MV64340_PCI_0_MEMORY2_SIZE:
> +        ret = s->pci[0].mem_size[2];
> +        break;
> +    case MV64340_PCI_0_MEMORY2_LOW_ADDR_REMAP:
> +        ret = (s->pci[0].remap[2] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_0_MEMORY2_HIGH_ADDR_REMAP:
> +        ret = s->pci[0].remap[2] >> 32;
> +        break;
> +    case MV64340_PCI_0_MEMORY3_BASE_ADDR:
> +        ret = s->pci[0].mem_base[3];
> +        break;
> +    case MV64340_PCI_0_MEMORY3_SIZE:
> +        ret = s->pci[0].mem_size[3];
> +        break;
> +    case MV64340_PCI_0_MEMORY3_LOW_ADDR_REMAP:
> +        ret = (s->pci[0].remap[3] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_0_MEMORY3_HIGH_ADDR_REMAP:
> +        ret = s->pci[0].remap[3] >> 32;
> +        break;
> +    case MV64340_PCI_1_IO_BASE_ADDR:
> +        ret = s->pci[1].io_base;
> +        break;
> +    case MV64340_PCI_1_IO_SIZE:
> +        ret = s->pci[1].io_size;
> +        break;
> +    case MV64340_PCI_1_IO_ADDR_REMAP:
> +        ret = s->pci[1].remap[4] >> 16;
> +        break;
> +    case MV64340_PCI_1_MEMORY0_BASE_ADDR:
> +        ret = s->pci[1].mem_base[0];
> +        break;
> +    case MV64340_PCI_1_MEMORY0_SIZE:
> +        ret = s->pci[1].mem_size[0];
> +        break;
> +    case MV64340_PCI_1_MEMORY0_LOW_ADDR_REMAP:
> +        ret = (s->pci[1].remap[0] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_1_MEMORY0_HIGH_ADDR_REMAP:
> +        ret = s->pci[1].remap[0] >> 32;
> +        break;
> +    case MV64340_PCI_1_MEMORY1_BASE_ADDR:
> +        ret = s->pci[1].mem_base[1];
> +        break;
> +    case MV64340_PCI_1_MEMORY1_SIZE:
> +        ret = s->pci[1].mem_size[1];
> +        break;
> +    case MV64340_PCI_1_MEMORY1_LOW_ADDR_REMAP:
> +        ret = (s->pci[1].remap[1] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_1_MEMORY1_HIGH_ADDR_REMAP:
> +        ret = s->pci[1].remap[1] >> 32;
> +        break;
> +    case MV64340_PCI_1_MEMORY2_BASE_ADDR:
> +        ret = s->pci[1].mem_base[2];
> +        break;
> +    case MV64340_PCI_1_MEMORY2_SIZE:
> +        ret = s->pci[1].mem_size[2];
> +        break;
> +    case MV64340_PCI_1_MEMORY2_LOW_ADDR_REMAP:
> +        ret = (s->pci[1].remap[2] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_1_MEMORY2_HIGH_ADDR_REMAP:
> +        ret = s->pci[1].remap[2] >> 32;
> +        break;
> +    case MV64340_PCI_1_MEMORY3_BASE_ADDR:
> +        ret = s->pci[1].mem_base[3];
> +        break;
> +    case MV64340_PCI_1_MEMORY3_SIZE:
> +        ret = s->pci[1].mem_size[3];
> +        break;
> +    case MV64340_PCI_1_MEMORY3_LOW_ADDR_REMAP:
> +        ret = (s->pci[1].remap[3] & 0xffff0000) >> 16;
> +        break;
> +    case MV64340_PCI_1_MEMORY3_HIGH_ADDR_REMAP:
> +        ret = s->pci[1].remap[3] >> 32;
> +        break;
> +    case MV64340_INTERNAL_SPACE_BASE_ADDR:
> +        ret = s->regs_base;
> +        break;
> +    case MV64340_BASE_ADDR_ENABLE:
> +        ret = s->base_addr_enable;
> +        break;
> +    case MV64340_PCI_0_CONFIG_ADDR:
> +        ret = pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]), 0, size);
> +        break;
> +    case MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG ...
> +         MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG + 3:
> +        ret = pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[0]),
> +                  addr - MV64340_PCI_0_CONFIG_DATA_VIRTUAL_REG, size);

Code smell... You probably want memory_region_dispatch_read().

> +        break;
> +    case MV64340_PCI_1_CONFIG_ADDR:
> +        ret = pci_host_conf_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]), 0, size);
> +        break;
> +    case MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG ...
> +         MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG + 3:
> +        ret = pci_host_data_le_ops.read(PCI_HOST_BRIDGE(&s->pci[1]),
> +                  addr - MV64340_PCI_1_CONFIG_DATA_VIRTUAL_REG, size);
> +        break;
> +    case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
> +        /* FIXME: Should this be sent via the PCI bus somehow? */
> +        if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
> +            ret = pic_read_irq(isa_pic);
> +        }
> +        break;
> +    case MV64340_MAIN_INTERRUPT_CAUSE_LOW:
> +        ret = s->main_int_cr;
> +        break;
> +    case MV64340_MAIN_INTERRUPT_CAUSE_HIGH:
> +        ret = s->main_int_cr >> 32;
> +        break;
> +    case MV64340_CPU_INTERRUPT0_MASK_LOW:
> +        ret = s->cpu0_int_mask;
> +        break;
> +    case MV64340_CPU_INTERRUPT0_MASK_HIGH:
> +        ret = s->cpu0_int_mask >> 32;
> +        break;
> +    case MV64340_CPU_INTERRUPT0_SELECT_CAUSE:
> +        ret = s->main_int_cr;
> +        if (s->main_int_cr & s->cpu0_int_mask) {
> +            if (!(s->main_int_cr & s->cpu0_int_mask & 0xffffffff)) {
> +                ret = s->main_int_cr >> 32 | BIT(30);
> +            } else if ((s->main_int_cr & s->cpu0_int_mask) >> 32) {
> +                ret |= BIT(31);
> +            }
> +        }
> +        break;
> +    case MV64340_CUNIT_ARBITER_CONTROL_REG:
> +        ret = 0x11ff0000 | (s->gpp_int_level << 10);
> +        break;
> +    case MV64340_GPP_IO_CONTROL:
> +        ret = s->gpp_io;
> +        break;
> +    case MV64340_GPP_LEVEL_CONTROL:
> +        ret = s->gpp_level;
> +        break;
> +    case MV64340_GPP_VALUE:
> +        ret = s->gpp_value;
> +        break;
> +    case MV64340_GPP_VALUE_SET:
> +    case MV64340_GPP_VALUE_CLEAR:
> +        ret = 0;
> +        break;
> +    case MV64340_GPP_INTERRUPT_CAUSE:
> +        ret = s->gpp_int_cr;
> +        break;
> +    case MV64340_GPP_INTERRUPT_MASK0:
> +    case MV64340_GPP_INTERRUPT_MASK1:
> +        ret = s->gpp_int_mask;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented register read 0x%"
> +                      HWADDR_PRIx "\n", __func__, addr);
> +        break;
> +    }
> +    if (addr != MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG) {
> +        trace_mv64361_reg_read(addr, ret);
> +    }
> +    return ret;
> +}
> +
> +static void warn_swap_bit(uint64_t val)
> +{
> +    if ((val & 0x3000000ULL) >> 24 != 1) {

Code smell. Shouldn't this be a MemoryRegion?

> +        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __func__);
> +    }
> +}
> +
> +static void mv64361_set_pci_mem_remap(MV64361State *s, int bus, int idx,
> +                                      uint64_t val, bool high)
> +{
> +    if (high) {
> +        s->pci[bus].remap[idx] = val;
> +    } else {
> +        s->pci[bus].remap[idx] &= 0xffffffff00000000ULL;
> +        s->pci[bus].remap[idx] |= (val & 0xffffULL) << 16;
> +    }
> +}

