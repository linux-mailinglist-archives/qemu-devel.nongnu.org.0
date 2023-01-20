Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D7674FA2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIn0Q-00072S-Un; Fri, 20 Jan 2023 03:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIn0P-000728-NN
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:44:13 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIn0N-0000ka-2L
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:44:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 126552EEDC;
 Fri, 20 Jan 2023 08:44:06 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 20 Jan
 2023 09:44:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045df9d637-235b-4d8f-9e37-68212970231e,
 B144956C13BBC382596DA5742790BEAB579A3E91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <64b1bbda-37db-2751-073b-54572d186c83@kaod.org>
Date: Fri, 20 Jan 2023 09:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mac_nvram: Add block backend to persist NVRAM contents
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230119222845.27209745706@zero.eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230119222845.27209745706@zero.eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 96c00c65-5f72-45a1-929d-1fba352ad1f9
X-Ovh-Tracer-Id: 6077044747516414944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/19/23 23:28, BALATON Zoltan wrote:
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

This could use blk_check_size_and_read_all() instead ?

C.


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


