Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791603206BD
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 19:59:25 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDXTQ-0002u1-Hd
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 13:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXSY-0002Te-Nb
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 13:58:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXSW-00054Q-Tm
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 13:58:30 -0500
Received: by mail-wr1-x432.google.com with SMTP id n4so14550614wrx.1
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 10:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RS/WrRy0s7hDgXGfz+V5bUZKb/XnMwkIHgKdWPXCkM=;
 b=CjeX6S4SR40AqXQtdSgSTbcFiNT/Mac6EmYjj0VzeZw3GW3RtGxuCnC/nSSdwM8PbQ
 7Ot72U8hv88NPWsXQUK4xN3/RVR1isLlTfax9v/LUYfHbiVGs5QZdDg4xQMX3yYH/BDW
 lsXAr6LQSeVAF58lsIirQ+aUCd2OIon6KQjEdWf5y0K5AgWWYE5CztaQDphxaXUNX7pm
 Z1ZtYEqW5+/RxquqLPM0pI8AIEIucVGe+0xeZxWUQFYWWDsckDH/4VEkhzsWvDrPSHLE
 G+B1a1GLvRhVLV+sUh1XHueI77WkGSZIClL9i6Vpm9rYqUk1S2aj3CioyGKZkuuDTNoF
 6ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RS/WrRy0s7hDgXGfz+V5bUZKb/XnMwkIHgKdWPXCkM=;
 b=VUVvRqls8SjvnfQLpDTsIh00q1UB+CF8XkRKgM39twql9611FIins9omRwaYRrwSEr
 YalEWVBduiMC5Hrpis7/beGeNXw+72YTwtKoM0ea3qom4ALnHT14acT4BUy7MEOeglV+
 ufr2u+H/k4qPx+d7klWUlk9UMVOsnEDJta4rbzpQs2TeNgAq8Xj3Ri+BiBTvXlUyedkw
 VXt6Xoo6OIZ9J0A1ws6wN/PEsclTdKmJYUHp9Ga6RX3vYX6QyTucY8/V7D7X7OpQ0Wy8
 NdkOMGuzQe6G+x8hstmcNB5GZ38VGKLh9N8H4Rb5/+oa3s4qUkMibBNlYr5C+dTY+YJO
 75yQ==
X-Gm-Message-State: AOAM532dHKPBe6zB/cnmrCvdKJE7OtSsWii/w75iwaxz/Cac/lr3hoCc
 bEVCJPbo2UvucGmmbpj5DrA=
X-Google-Smtp-Source: ABdhPJwg42RZHGUk8/tEDHGFmkHlRLiKcHgzuDgPRhi+V+nmxckjW6+0BybrddfB+HVBHTmEZOnWSg==
X-Received: by 2002:a5d:4088:: with SMTP id o8mr12811431wrp.33.1613847505581; 
 Sat, 20 Feb 2021 10:58:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x66sm18117634wmg.6.2021.02.20.10.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 10:58:24 -0800 (PST)
Subject: Re: [PATCH v2 04/13] vt82c686: Fix up power management io base and
 config
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe7beb96-28c1-b8d5-3d9e-371078717972@amsat.org>
Date: Sat, 20 Feb 2021 19:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> Similar to the SMBus io registers there is a power management io range
> that is set via similar base address reg and enable bit. Some handling
> of this was already there but with several problems: using the wrong
> registers and bits, wrong size range, not acually updating mapping and
> handling reset correctly, nor emulating any of the actual io
> registers. Some of these errors are fixed up here.
> 
> After this patch we use the correct base address register, enable bit
> and region size and allow guests to map/unmap this region and
> correctly reset all registers to default values on reset but we still
> don't emulate any of the registers in this range.

^^ One change,

vv Another change.

> Previously just an empty RAM region was mapped on realize, now we add
> an empty io range logging access instead. I think the pm timer should
> be hooked up here but not sure guests need it. PMON on fuloong2e sets
> a base address but does not seem to enable region; the pegasos2
> firmware pokes some regs but continues anyway so don't know if
> anything would make use of these facilities. Therefore this is just a
> clean up of previous state for now and not intending to fully
> implement missing functionality which could be done later if some
> guests need it.

I split your patch in 2.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/trace-events |  2 ++
>  hw/isa/vt82c686.c   | 56 ++++++++++++++++++++++++++++++++-------------
>  2 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/isa/trace-events b/hw/isa/trace-events
> index d267d3e652..641d69eedf 100644
> --- a/hw/isa/trace-events
> +++ b/hw/isa/trace-events
> @@ -17,5 +17,7 @@ apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
>  # vt82c686.c
>  via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>  via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
> +via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
> +via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>  via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
>  via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 9c4d153022..fc2a1f4430 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -39,14 +39,11 @@ struct VT686PMState {
>  
>  static void pm_io_space_update(VT686PMState *s)
>  {
> -    uint32_t pm_io_base;
> -
> -    pm_io_base = pci_get_long(s->dev.config + 0x40);
> -    pm_io_base &= 0xffc0;
> +    uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;

0x48 is Power Management I/O Base,
0xff80UL is mask for Power Management I/O Register Base Address,
OK.

>      memory_region_transaction_begin();
> -    memory_region_set_enabled(&s->io, s->dev.config[0x80] & 1);
> -    memory_region_set_address(&s->io, pm_io_base);
> +    memory_region_set_address(&s->io, pmbase);
> +    memory_region_set_enabled(&s->io, s->dev.config[0x41] & BIT(7));

0x41 is General Configuration 1,
bit 7 is I/O Enable for ACPI I/O Base,
OK.

>      memory_region_transaction_commit();
>  }
>  
> @@ -92,6 +89,13 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>  
>      trace_via_pm_write(addr, val, len);
>      pci_default_write_config(d, addr, val, len);
> +    if (ranges_overlap(addr, len, 0x48, 4)) {
> +        uint32_t v = pci_get_long(s->dev.config + 0x48);
> +        pci_set_long(s->dev.config + 0x48, (v & 0xff80UL) | 1);

bit 0 is always set, OK.

> +    }
> +    if (range_covers_byte(addr, len, 0x41)) {

Access to General Configuration. Why not use both registers?

       if (ranges_overlap(addr, len, 0x40, 2)) {

> +        pm_io_space_update(s);
> +    }
>      if (ranges_overlap(addr, len, 0x90, 4)) {
>          uint32_t v = pci_get_long(s->dev.config + 0x90);
>          pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
> @@ -102,6 +106,27 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>      }
>  }
>  
> +static void pm_io_write(void *op, hwaddr addr, uint64_t data, unsigned size)
> +{
> +    trace_via_pm_io_write(addr, data, size);
> +}
> +
> +static uint64_t pm_io_read(void *op, hwaddr addr, unsigned size)
> +{
> +    trace_via_pm_io_read(addr, 0, size);
> +    return 0;
> +}
> +
> +static const MemoryRegionOps pm_io_ops = {
> +    .read = pm_io_read,
> +    .write = pm_io_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +};
> +
>  static void pm_update_sci(VT686PMState *s)
>  {
>      int sci_level, pmsts;
> @@ -128,35 +153,34 @@ static void vt82c686b_pm_reset(DeviceState *d)
>  {
>      VT686PMState *s = VT82C686B_PM(d);
>  
> +    memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
> +           PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
> +    /* Power Management IO base */
> +    pci_set_long(s->dev.config + 0x48, 1);

bit 1 always set, OK.

>      /* SMBus IO base */
>      pci_set_long(s->dev.config + 0x90, 1);
> -    s->dev.config[0xd2] = 0;
>  
> +    pm_io_space_update(s);
>      smb_io_space_update(s);
>  }
>  
>  static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>  {
>      VT686PMState *s = VT82C686B_PM(dev);
> -    uint8_t *pci_conf;
>  
> -    pci_conf = s->dev.config;
> -    pci_set_word(pci_conf + PCI_COMMAND, 0);
> -    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_FAST_BACK |
> +    pci_set_word(dev->config + PCI_STATUS, PCI_STATUS_FAST_BACK |
>                   PCI_STATUS_DEVSEL_MEDIUM);
>  
> -    /* 0x48-0x4B is Power Management I/O Base */
> -    pci_set_long(pci_conf + 0x48, 0x00000001);
> -
>      pm_smbus_init(DEVICE(s), &s->smb, false);
>      memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
>      memory_region_set_enabled(&s->smb.io, false);
>  
>      apm_init(dev, &s->apm, NULL, s);
>  
> -    memory_region_init(&s->io, OBJECT(dev), "vt82c686-pm", 64);
> +    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
> +                          "vt82c686-pm", 0x100);

Section "Configuration Space Power Management Registers" describes:

  4B-48: Power Mgmt I/O Base (256 Bytes)

Section "Offset 4B-48 – Power Management I/O Base" describes:

  Port Address for the base of the 128-byte Power
  Management I/O Register block, corresponding to
  AD[15:7].

At least we are sure 64 bytes isn't enough indeed, but is it 128 or 256?

> +    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
>      memory_region_set_enabled(&s->io, false);
> -    memory_region_add_subregion(get_system_io(), 0, &s->io);
>  
>      acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
>      acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);

TBH it took me almost 1h to review this single patch.

