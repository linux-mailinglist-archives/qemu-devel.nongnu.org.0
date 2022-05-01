Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DC51667A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 19:07:36 +0200 (CEST)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlD2l-0004QK-Kx
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 13:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1nlD1q-0003lS-DD
 for qemu-devel@nongnu.org; Sun, 01 May 2022 13:06:38 -0400
Received: from mail.csgraf.de ([85.25.223.15]:34292 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1nlD1n-0000Yw-UA
 for qemu-devel@nongnu.org; Sun, 01 May 2022 13:06:38 -0400
Received: from [192.168.106.118]
 (dynamic-095-115-014-159.95.115.pool.telefonica.de [95.115.14.159])
 by csgraf.de (Postfix) with ESMTPSA id 75933608044D;
 Sun,  1 May 2022 19:06:26 +0200 (CEST)
Message-ID: <585d36f3-6cd1-622e-0c4f-0f919141fbe8@csgraf.de>
Date: Sun, 1 May 2022 19:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v10] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 rene@exactcode.de, ehabkost@redhat.com, marcel.a@redhat.com,
 jan.kiszka@siemens.com, alistair.francis@xilinx.com, laurent@vivier.eu,
 f4bug@amsat.org, marcandre.lureau@redhat.com, r.bolshakov@yadro.com,
 berrange@redhat.com, pbonzini@redhat.com, gsomlo@gmail.com, suse@csgraf.de,
 armbru@redhat.com, chetan4windows@gmail.com, imammedo@redhat.com,
 afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Vladislav,

On 29.04.22 21:18, Vladislav Yaroshchuk wrote:
> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
>
> New 'hostosk' property is added:
> * `-device isa-applesmc,hostosk=on`
> The property is set to 'on' by default for machine version > 7.0
>
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating system within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
>   * software development
>   * testing during software development
>   * using macOS Server
>   * personal, non-commercial use
>
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
>
> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   hw/core/machine.c  |   4 +-
>   hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 125 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d..7f4a27406a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
>   
> -GlobalProperty hw_compat_7_0[] = {};
> +GlobalProperty hw_compat_7_0[] = {
> +    { "isa-applesmc", "hostosk", "off" }
> +};
>   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>   
>   GlobalProperty hw_compat_6_2[] = {
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 81cd6b6423..8672c9d56e 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -37,6 +37,11 @@
>   #include "qemu/module.h"
>   #include "qemu/timer.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
> +
> +#if defined(__APPLE__) && defined(__MACH__)
> +#include <IOKit/IOKitLib.h>
> +#endif
>   
>   /* #define DEBUG_SMC */
>   
> @@ -80,7 +85,7 @@ enum {
>   #define smc_debug(...) do { } while (0)
>   #endif
>   
> -static char default_osk[64] = "This is a dummy key. Enter the real key "
> +static char default_osk[65] = "This is a dummy key. Enter the real key "


This is only necessary if we run strlen() on the default_osk. Do we have to?


>                                 "using the -osk parameter";
>   
>   struct AppleSMCData {
> @@ -109,6 +114,7 @@ struct AppleSMCState {
>       uint8_t data_pos;
>       uint8_t data[255];
>       char *osk;
> +    bool hostosk;
>       QLIST_HEAD(, AppleSMCData) data_def;
>   };
>   
> @@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops = {
>       },
>   };
>   
> +#if defined(__APPLE__) && defined(__MACH__)


This needs to check for x86 as well, no?


> +/*
> + * Based on
> + * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_HANDLE_EVENT     = 2,
> +    SMC_READ_KEY         = 5
> +};
> +
> +struct AppleSMCParam {
> +    uint32_t key;
> +    uint8_t pad0[22];
> +    IOByteCount data_size;
> +    uint8_t pad1[10];
> +    uint8_t command;


This looks odd. You have 10 bytes padding + 1 byte command between a u64 
and a u32. Please make sure that there the struct would be identical if 
you add __attribute__((packed)).


> +    uint32_t pad2;
> +    uint8_t bytes[32];
> +};
> +
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    assert(host_osk != NULL);


That assert is pretty useless here, as the function is only used 
internally on s->osk. I'd just remove it. If you want to keep it, please 
move it below the variable declarations.


> +
> +    io_service_t hostsmc_service = IO_OBJECT_NULL;
> +    io_connect_t hostsmc_connect = IO_OBJECT_NULL;
> +    size_t smc_param_size = sizeof(struct AppleSMCParam);
> +    IOReturn status = kIOReturnError;
> +    int i;
> +
> +    struct AppleSMCParam smc_param[2] = {
> +         {
> +             .key = ('OSK0'),
> +             .data_size = sizeof(smc_param[0].bytes),
> +             .command = SMC_READ_KEY,
> +         }, {
> +             .key = ('OSK1'),
> +             .data_size = sizeof(smc_param[0].bytes),
> +             .command = SMC_READ_KEY,
> +         },
> +    };
> +
> +    hostsmc_service = IOServiceGetMatchingService(
> +        kIOMasterPortDefault,
> +        IOServiceMatching("AppleSMC"));
> +    if (hostsmc_service == IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to get host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    status = IOServiceOpen(hostsmc_service,
> +                           mach_task_self(),
> +                           0,
> +                           &hostsmc_connect);
> +    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to open host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(smc_param); ++i) {
> +        status = IOConnectCallStructMethod(
> +                hostsmc_connect,
> +                SMC_HANDLE_EVENT,
> +                &smc_param[i],
> +                sizeof(struct AppleSMCParam),
> +                &smc_param[i],
> +                &smc_param_size


I think it's better to pull smc_param_size's declaration (or at least 
its initialization) into the loop. That way you know you always pass the 
correct size and IOConnectCallStructMethod() didn't modify it after the 
first call.


> +            );
> +
> +        if (status != kIOReturnSuccess) {
> +            error_setg(errp, "Unable to read OSK from host-AppleSMC");
> +            goto error;
> +        }
> +    }
> +
> +    memcpy(host_osk, smc_param[0].bytes, 32);
> +    memcpy(host_osk + 32, smc_param[1].bytes, 32);
> +
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return true;
> +
> +error:
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return false;
> +}
> +#else
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    error_setg(errp, "OSK read is not supported on this host");
> +    return false;
> +}
> +#endif
> +
>   static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>   {
>       AppleSMCState *s = APPLE_SMC(dev);
> @@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>       isa_register_ioport(&s->parent_obj, &s->io_err,
>                           s->iobase + APPLESMC_ERR_PORT);
>   
> -    if (!s->osk || (strlen(s->osk) != 64)) {
> -        warn_report("Using AppleSMC with invalid key");
> +    if (s->osk && s->hostosk) {
> +        error_setg(errp, "-osk property cannot be used with -hostosk=on");


This isn't -hostosk, it's just "hostosk=on". I think it's also better to 
refer to osk as osk rather than -osk. -osk is the legacy command line 
syntax.


> +    }
> +
> +    if (!s->osk && !s->hostosk) {
>           s->osk = default_osk;
> +        warn_report("Using AppleSMC with default (dummy) OSK");
> +    }
> +
> +    if (s->hostosk) {
> +        s->osk = g_malloc0(65);
> +        /* Fail hard if we cannot read requested host OSK */
> +        if (!applesmc_read_host_osk(s->osk, errp)) {
> +            g_assert_not_reached();
> +        }
> +    }
> +
> +    if (s->osk && strlen(s->osk) != 64) {
> +        /* Only valid OSK is accepted within 'osk' property */
> +        error_setg(errp, "Using AppleSMC with key of invalid length");


Do you envision that the hostosk function will return an invalid key in 
the future? If not, I would just only do the strlen() check if we have 
s->osk set. That way, you can also limit your alloc to 64 bytes.


The rest looks great to me! I'll give v11 a spin on a few machines I 
have lying around when it comes :)


Thanks!

Alex


>       }
>   
>       QLIST_INIT(&s->data_def);
> @@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] = {
>       DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
>                          APPLESMC_DEFAULT_IOBASE),
>       DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> +    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

