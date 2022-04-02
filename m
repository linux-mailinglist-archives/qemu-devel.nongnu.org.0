Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892274F052A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 19:08:26 +0200 (CEST)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nahEf-0006JA-4Z
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 13:08:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nahDW-0005Vn-9n
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 13:07:14 -0400
Received: from [2001:41c9:1:41f::167] (port=38020 helo=mail.ilande.co.uk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nahDU-0002LM-25
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 13:07:13 -0400
Received: from [82.7.49.91] (helo=[192.168.0.26])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nahCc-00033S-ES; Sat, 02 Apr 2022 18:06:22 +0100
Message-ID: <4c47f07b-b751-a3f9-72e2-896f7bf1360c@ilande.co.uk>
Date: Sat, 2 Apr 2022 18:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220402154711.679252-1-laurent@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220402154711.679252-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.7.49.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] nubus: fix memory leak in nubus_bridge_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/04/2022 16:47, Laurent Vivier wrote:

> Move qbus_init() to a realize function.
> 
> Leak detected by valgrind:
> 
>    QTEST_QEMU_BINARY="valgrind --leak-check=full \
>    --show-leak-kinds=definite ./qemu-system-m68k" \
>    tests/qtest/device-introspect-test \
>    -p /m68k/device/introspect/concrete/defaults/none
>    ...
>    ==606164== 6 bytes in 1 blocks are definitely lost in loss record 123 of 1,771
>    ==606164==    at 0x484486F: malloc (vg_replace_malloc.c:381)
>    ==606164==    by 0x4FF0428: g_malloc (gmem.c:106)
>    ==606164==    by 0x5004433: g_strdup (gstrfuncs.c:364)
>    ==606164==    by 0x3D1BA6: memory_region_do_init (memory.c:1170)
>    ==606164==    by 0x3D1BA6: memory_region_init (memory.c:1195)
>    ==606164==    by 0x375C88: nubus_init (nubus-bus.c:104)
>    ==606164==    by 0x49DE82: object_init_with_type (object.c:377)
>    ==606164==    by 0x49DE82: object_initialize_with_type (object.c:519)
>    ==606164==    by 0x495772: qbus_init (bus.c:158)
>    ==606164==    by 0x375DDB: nubus_bridge_init (nubus-bridge.c:21)
>    ==606164==    by 0x49DE82: object_init_with_type (object.c:377)
>    ==606164==    by 0x49DE82: object_initialize_with_type (object.c:519)
>    ==606164==    by 0x49E028: object_new_with_type (object.c:734)
>    ==606164==    by 0x5660AC: qmp_device_list_properties (qom-qmp-cmds.c:146)
>    ==606164==    by 0x67CC35: qmp_marshal_device_list_properties (qapi-commands-qdev.c:66)
>    ...
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/nubus-bridge.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
> index a42c86080f25..51c3f6328784 100644
> --- a/hw/nubus/nubus-bridge.c
> +++ b/hw/nubus/nubus-bridge.c
> @@ -18,11 +18,17 @@ static void nubus_bridge_init(Object *obj)
>       NubusBridge *s = NUBUS_BRIDGE(obj);
>       NubusBus *bus = &s->bus;
>   
> -    qbus_init(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
> -
>       qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
>   }
>   
> +static void nubus_bridge_realize(DeviceState *d, Error **errp)
> +{
> +    NubusBridge *s = NUBUS_BRIDGE(d);
> +    NubusBus *bus = &s->bus;
> +
> +    qbus_init(bus, sizeof(NubusBus), TYPE_NUBUS_BUS, d, NULL);
> +}
> +
>   static Property nubus_bridge_properties[] = {
>       DEFINE_PROP_UINT16("slot-available-mask", NubusBridge,
>                          bus.slot_available_mask, 0xffff),
> @@ -34,6 +40,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->fw_name = "nubus";
> +    dc->realize = nubus_bridge_realize;
>       device_class_set_props(dc, nubus_bridge_properties);
>   }

Since qbus_init() is adding a bus that can have child devices, I think the correct 
solution here would be to add an instance_finalize function to the Nubus bridge 
device that calls qbus_finalize().


ATB,

Mark.

