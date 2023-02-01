Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965D6871E6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 00:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNMVc-0000BL-Jw; Wed, 01 Feb 2023 18:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMVZ-0000B1-Io; Wed, 01 Feb 2023 18:27:17 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMVX-00067x-VH; Wed, 01 Feb 2023 18:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OXzFs8vvAqmTMi/vhFNUAoCPI0gHTvQeQsU5wb5H+Os=; b=rzp99VLoyhJpWxy74gF23hYcwQ
 9tpokiFNsZBJ4Oht/YjstabjT1hNso7xQ27CXueeM30bUCIsGrbwyzT1VPop2Ycfs7OmwOaUKwlXu
 xC6ozDDslYPP2IH6FHMOh8SECQIkuz4uBT2DVbL6ifg0Oc6s0qni5UGaL7OomoLNJs63k5GvX+W8m
 Z8M3zcSHPnfaeqiXw00Whp8Af3+8clTFtwQNIPn6RMyV+4/f0ZNibrrCcZ9JNx4oKVU2DeLvnjddl
 kbcoULDGZMFT+KXvHL0MnU2jMob0SSnQfiDDzYUCV6MeK1aoQu646wo3LWZ+kBAhHMVDSE6MJac9P
 76rif5Y4163LceUPivLVZbBxC6Vcy4/ky7WI3AEtbufsNdWyFYGc9oRCZAnoqfWtGEYeZpyUarD7N
 NOpO+6wc9K06Fp993aq6MChNeixzzq8zIdP5thGGIor6A4rJSgFVJvy3kyUePtkcsabNmhLTD99/u
 e0YEs47iug0VRhL5ipGop4E7n/+ATYtqjA4s/tT+G5sk4SxjTOeVv5eL5UeP1H+zM94zaFFRBKth1
 9LTiAR27tL6fx9LbESWhb0WbIOl66Lj3NgcDZaqK31z1j2/XjyYepFFwm/ElgAk6WsBxQmvLP2dRJ
 7GwrPlXTwL9wGTBeSNxmk8q9sq2Gz8XxPYX1DZzBs=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMV0-0005ii-Nc; Wed, 01 Feb 2023 23:26:46 +0000
Message-ID: <8e9a31b1-db54-2d9e-2ca5-989ef506f6dd@ilande.co.uk>
Date: Wed, 1 Feb 2023 23:27:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230119222845.27209745706@zero.eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230119222845.27209745706@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] mac_nvram: Add block backend to persist NVRAM contents
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/01/2023 22:28, BALATON Zoltan wrote:

> Add a way to set a backing store for the mac_nvram similar to what
> spapr_nvram or mac_via PRAM already does to allow to save its contents
> between runs. Use -drive file=nvram.img,format=raw,if=mtd to specify
> backing file where nvram.img must be MACIO_NVRAM_SIZE which is 8192
> bytes. It is only wired for mac_oldworld for now but could be used by
> mac_newworld in the future too.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/nvram/mac_nvram.c         | 28 ++++++++++++++++++++++++++++
>   hw/ppc/mac_oldworld.c        |  8 +++++++-
>   include/hw/nvram/mac_nvram.h |  1 +
>   3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
> index 3d9ddda217..810e84f07e 100644
> --- a/hw/nvram/mac_nvram.c
> +++ b/hw/nvram/mac_nvram.c
> @@ -24,9 +24,12 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qapi/error.h"
>   #include "hw/nvram/chrp_nvram.h"
>   #include "hw/nvram/mac_nvram.h"
>   #include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "sysemu/block-backend.h"
>   #include "migration/vmstate.h"
>   #include "qemu/cutils.h"
>   #include "qemu/module.h"
> @@ -44,6 +47,9 @@ static void macio_nvram_writeb(void *opaque, hwaddr addr,
>       addr = (addr >> s->it_shift) & (s->size - 1);
>       trace_macio_nvram_write(addr, value);
>       s->data[addr] = value;
> +    if (s->blk) {
> +        blk_pwrite(s->blk, addr, 1, &s->data[addr], 0);
> +    }
>   }
>   
>   static uint64_t macio_nvram_readb(void *opaque, hwaddr addr,
> @@ -91,6 +97,27 @@ static void macio_nvram_realizefn(DeviceState *dev, Error **errp)
>   
>       s->data = g_malloc0(s->size);
>   
> +    if (s->blk) {
> +        int64_t len = blk_getlength(s->blk);
> +        if (len < 0) {
> +            error_setg_errno(errp, -len,
> +                             "could not get length of nvram backing image");
> +            return;
> +        } else if (len != s->size) {
> +            error_setg_errno(errp, -len,
> +                             "invalid size nvram backing image");
> +            return;
> +        }
> +        if (blk_set_perm(s->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
> +                         BLK_PERM_ALL, errp) < 0) {
> +            return;
> +        }
> +        if (blk_pread(s->blk, 0, s->size, s->data, 0) < 0) {
> +            error_setg(errp, "can't read-nvram contents");
> +            return;
> +        }
> +    }
> +
>       memory_region_init_io(&s->mem, OBJECT(s), &macio_nvram_ops, s,
>                             "macio-nvram", s->size << s->it_shift);
>       sysbus_init_mmio(d, &s->mem);
> @@ -106,6 +133,7 @@ static void macio_nvram_unrealizefn(DeviceState *dev)
>   static Property macio_nvram_properties[] = {
>       DEFINE_PROP_UINT32("size", MacIONVRAMState, size, 0),
>       DEFINE_PROP_UINT32("it_shift", MacIONVRAMState, it_shift, 0),
> +    DEFINE_PROP_DRIVE("drive", MacIONVRAMState, blk),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index e052ad880e..52e554710f 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -103,7 +103,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       DeviceState *dev, *pic_dev, *grackle_dev;
>       BusState *adb_bus;
>       uint16_t ppc_boot_device;
> -    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
> +    DriveInfo *dinfo, *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       void *fw_cfg;
>       uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>       uint8_t *spd_data[3] = {};
> @@ -256,6 +256,12 @@ static void ppc_heathrow_init(MachineState *machine)
>       qdev_prop_set_chr(dev, "chrA", serial_hd(0));
>       qdev_prop_set_chr(dev, "chrB", serial_hd(1));
>   
> +    dinfo = drive_get(IF_MTD, 0, 0);
> +    if (dinfo) {
> +        dev = DEVICE(object_resolve_path_component(macio, "nvram"));
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
>       pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
>   
>       pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
> diff --git a/include/hw/nvram/mac_nvram.h b/include/hw/nvram/mac_nvram.h
> index b780aca470..0c4dfaeff6 100644
> --- a/include/hw/nvram/mac_nvram.h
> +++ b/include/hw/nvram/mac_nvram.h
> @@ -44,6 +44,7 @@ struct MacIONVRAMState {
>   
>       MemoryRegion mem;
>       uint8_t *data;
> +    BlockBackend *blk;
>   };
>   
>   void pmac_format_nvram_partition(MacIONVRAMState *nvr, int len);

This looks okay as far as I can tell, however you want to split this into 2 patches: 
the first which makes the changes to the mac_nvram device, and the second to wire it 
up to the g3beige machine.


ATB,

Mark.

