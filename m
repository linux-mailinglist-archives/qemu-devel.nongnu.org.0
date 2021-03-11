Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA33381F9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:59:25 +0100 (CET)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKVDA-00045o-Ik
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKV2B-0007jU-7Y; Thu, 11 Mar 2021 18:48:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKV26-0004zP-0a; Thu, 11 Mar 2021 18:47:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id v11so766131wro.7;
 Thu, 11 Mar 2021 15:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E4ioJKc7f+Z5AVOqnzwzGSYPoFcRnwacpQI8v6j/V68=;
 b=B2pzsMBVrPYL4li2z86sJjkCcpXCenNPiVqJE2/QVZqP7mbOeqiLYXvllUP+6q5hEn
 MFmk+7fZlrBL/GrowiBvq5skWplkSQnRWFefVsUItAmBbcX/2zPkkL9uwt5ZDa0SmFe2
 Kc/N03nu8DrnaMqSEgZpj3jU9kNC0/8ASdVw8+MFrMGUGrSMVzylPImj8kY8J0OpVIll
 jGTYmmczEUu0xszj6Wn1FChCdf8cgXTvCKHfF2n0dm8ArzMIyeGay/JwFaJKXEhg0mLf
 B9Osq1jlSVAeFZSM9gbG2VzIS5ZofZ+2lq5LumHLXAseUFACMJO1DUIhILJP3yL4cm8p
 O1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E4ioJKc7f+Z5AVOqnzwzGSYPoFcRnwacpQI8v6j/V68=;
 b=hPz8mzglhIAktwtSRlfT877rfZMCwmKPDjmLJ2EhcjCnW42YYvpgRtO83ddXGmn6zH
 zPShjpxE8YVssqqMSP3gu2jlixlYWCGm9KfKo7jJPNVxAgn24zYUXTF21V9S6P4u/d8D
 tFv9WhCxFvmCUgauAAcCYFHYSvI/sP+0nIXqweAcIUxgncOhfXTNld1KfuAji3l99a+a
 lvB9/8vAi0Rbp7xx0r6WMpivJEK8hjoeInXDfBgzFONb42O6BmlfDZ36+HU7j2mNZ454
 GTPskfz5alIM9WF8r/ZWVqiul++NTlIW5wypVMQyN7YmuN8EK0JCQDihGXhDlI+eD5TA
 2NWQ==
X-Gm-Message-State: AOAM531eIKgIUWKx0LKrXDK3vhDMgjdOzFY75vUA/qsRJt35r/vywnn1
 3LXTCm8k+K6cnuDjper6vmY=
X-Google-Smtp-Source: ABdhPJxb6158k3ozVWh7hK6c7jgEiO+NSljDf9PgQRTFQoHUBCsdepx5h3NxTPVIrsoHXpG2W/3S4A==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr11449062wrt.115.1615506476090; 
 Thu, 11 Mar 2021 15:47:56 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm5688726wrv.47.2021.03.11.15.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 15:47:55 -0800 (PST)
Subject: Re: [PATCH v7 1/8] vt82c686: Implement control of serial port io
 ranges via config regs
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <8cf90aad5a9fce1a20cbf49e4ef71c51ba04faed.1615345138.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c1c3d6b-44e4-66e1-366e-e40245589f7e@amsat.org>
Date: Fri, 12 Mar 2021 00:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8cf90aad5a9fce1a20cbf49e4ef71c51ba04faed.1615345138.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

ping for review?

On 3/10/21 3:58 AM, BALATON Zoltan wrote:
> In VIA super south bridge the io ranges of superio components
> (parallel and serial ports and FDC) can be controlled by superio
> config registers to set their base address and enable/disable them.
> This is not easy to implement in QEMU because ISA emulation is only
> designed to set io base address once on creating the device and io
> ranges are registered at creation and cannot easily be disabled or
> moved later.
> 
> In this patch we hack around that but only for serial ports because
> those have a single io range at port base that's relatively easy to
> handle and it's what guests actually use and set address different
> than the default.
> 
> We do not attempt to handle controlling the parallel and FDC regions
> because those have multiple io ranges so handling them would be messy
> and guests either don't change their deafult or don't care. We could
> even get away with disabling and not emulating them, but since they
> are already there, this patch leaves them mapped at their default
> address just in case this could be useful for a guest in the future.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 84 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 05d084f698..a3353ec5db 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -252,8 +252,24 @@ static const TypeInfo vt8231_pm_info = {
>  typedef struct SuperIOConfig {
>      uint8_t regs[0x100];
>      MemoryRegion io;
> +    ISASuperIODevice *superio;
> +    MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
>  } SuperIOConfig;
>  
> +static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
> +                                    int offs)
> +{
> +    MemoryRegion *subregion, *mr = NULL;
> +
> +    QTAILQ_FOREACH(subregion, &parent->subregions, subregions_link) {
> +        if (subregion->addr == offs) {
> +            mr = subregion;
> +            break;
> +        }
> +    }
> +    return mr;
> +}
> +
>  static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>                                unsigned size)
>  {
> @@ -279,7 +295,53 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      case 0xfd ... 0xff:
>          /* ignore write to read only registers */
>          return;
> -    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
> +    case 0xe2:
> +    {
> +        data &= 0x1f;
> +        if (data & BIT(2)) { /* Serial port 1 enable */
> +            ISADevice *dev = sc->superio->serial[0];
> +            if (!memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_io[0]);
> +            }
> +        } else {
> +            MemoryRegion *io = isa_address_space_io(sc->superio->serial[0]);
> +            if (memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_del_subregion(io, sc->serial_io[0]);
> +            }
> +        }
> +        if (data & BIT(3)) { /* Serial port 2 enable */
> +            ISADevice *dev = sc->superio->serial[1];
> +            if (!memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_io[1]);
> +            }
> +        } else {
> +            MemoryRegion *io = isa_address_space_io(sc->superio->serial[1]);
> +            if (memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_del_subregion(io, sc->serial_io[1]);
> +            }
> +        }
> +        break;
> +    }
> +    case 0xe7: /* Serial port 1 io base address */
> +    {
> +        data &= 0xfe;
> +        sc->superio->serial[0]->ioport_id = data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[0])) {
> +            memory_region_set_address(sc->serial_io[0], data << 2);
> +        }
> +        break;
> +    }
> +    case 0xe8: /* Serial port 2 io base address */
> +    {
> +        data &= 0xfe;
> +        sc->superio->serial[1]->ioport_id = data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[1])) {
> +            memory_region_set_address(sc->serial_io[1], data << 2);
> +        }
> +        break;
> +    }
>      default:
>          qemu_log_mask(LOG_UNIMP,
>                        "via_superio_cfg: unimplemented register 0x%x\n", idx);
> @@ -385,6 +447,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>      qemu_irq *isa_irq;
> +    ISASuperIOClass *ic;
>      int i;
>  
>      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> @@ -394,7 +457,9 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
>      i8254_pit_init(isa_bus, 0x40, 0, NULL);
>      i8257_dma_init(isa_bus, 0);
> -    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> +    s->superio_cfg.superio = ISA_SUPERIO(isa_create_simple(isa_bus,
> +                                                      TYPE_VT82C686B_SUPERIO));
> +    ic = ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>  
>      for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> @@ -412,6 +477,21 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>       */
>      memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
>                                  &s->superio_cfg.io);
> +
> +    /* Grab io regions of serial devices so we can control them */
> +    for (i = 0; i < ic->serial.count; i++) {
> +        ISADevice *sd = s->superio_cfg.superio->serial[i];
> +        MemoryRegion *io = isa_address_space_io(sd);
> +        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
> +        if (!mr) {
> +            error_setg(errp, "Could not get io region for serial %d", i);
> +            return;
> +        }
> +        s->superio_cfg.serial_io[i] = mr;
> +        if (memory_region_is_mapped(mr)) {
> +            memory_region_del_subregion(io, mr);
> +        }
> +    }
>  }
>  
>  static void via_class_init(ObjectClass *klass, void *data)
> 

