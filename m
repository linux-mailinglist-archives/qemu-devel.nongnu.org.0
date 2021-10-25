Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09996439370
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:15:59 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mex1K-0008A8-4F
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mewz5-0006uS-FZ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:13:39 -0400
Received: from mail.csgraf.de ([85.25.223.15]:47984 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mewz2-000256-CQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:13:39 -0400
Received: from [192.168.106.118]
 (dynamic-095-114-012-148.95.114.pool.telefonica.de [95.114.12.148])
 by csgraf.de (Postfix) with ESMTPSA id 8B89C608030F;
 Mon, 25 Oct 2021 12:13:33 +0200 (CEST)
Message-ID: <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
Date: Mon, 25 Oct 2021 12:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.33,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=cc=82rres?= <t0rr3sp3dr0@gmail.com>, laurent@vivier.eu,
 f4bug@amsat.org, r.bolshakov@yadro.com, Paolo Bonzini <pbonzini@redhat.com>,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22.10.21 18:14, Vladislav Yaroshchuk wrote:
> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
>
> Usage:
> `-device isa-applesmc,hostosk=on`
>
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
> - software development
> - testing during software development
> - using macOS Server
> - personal, non-commercial use
>
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
>
> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>


There was a similar proposal on the mailing list by Pedro Torres 
recently. Please copy everyone who contributed to that email thread in 
your patch submission in addition to everyone who commented on previous 
versions of your own submission.

Also, this is definitely not "trivial" material. Trivial means spelling 
or super obvious fixes. This one is an actual feature :). I've removed 
qemu-trivial@ from the copy list.


> ---
>   hw/misc/applesmc.c | 155 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 154 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf1d3..6bdec0063b 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -37,6 +37,11 @@
>   #include "qemu/module.h"
>   #include "qemu/timer.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
> +
> +#if defined(__APPLE__)
> +#include <IOKit/IOKitLib.h>
> +#endif
>   
>   /* #define DEBUG_SMC */
>   
> @@ -108,6 +113,7 @@ struct AppleSMCState {
>       uint8_t data_len;
>       uint8_t data_pos;
>       uint8_t data[255];
> +    bool hostosk_flag;
>       char *osk;
>       QLIST_HEAD(, AppleSMCData) data_def;
>   };
> @@ -312,9 +318,136 @@ static const MemoryRegionOps applesmc_err_io_ops = {
>       },
>   };
>   
> +#if defined(__APPLE__)
> +/*
> + * Based on
> + * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_CLIENT_OPEN      = 0,
> +    SMC_CLIENT_CLOSE     = 1,
> +    SMC_HANDLE_EVENT     = 2,
> +    SMC_READ_KEY         = 5
> +};
> +
> +struct AppleSMCParam {
> +    uint32_t    key;
> +    uint8_t     pad0[22];
> +    IOByteCount data_size;
> +    uint8_t     pad1[10];
> +    uint8_t     command;
> +    uint32_t    pad2;
> +    uint8_t     bytes[32];
> +};
> +
> +static bool applesmc_read_host_osk(char **host_osk, Error **errp)


Please just provide a buffer to write the OSK into (char *host_osk) to 
the function.


> +{
> +    assert(host_osk != NULL);
> +
> +    io_service_t            hostsmc_service = IO_OBJECT_NULL;
> +    io_connect_t            hostsmc_connect = IO_OBJECT_NULL;
> +    size_t                  out_size = sizeof(struct AppleSMCParam);
> +    IOReturn                status = kIOReturnError;
> +    struct AppleSMCParam    in = {0};
> +    struct AppleSMCParam    out = {0};


Can in and out be the same variable?


> +
> +    /* OSK key size + '\0' */
> +    *host_osk = g_malloc0(65);
> +    (*host_osk)[64] = '\0';
> +
> +    hostsmc_service = IOServiceGetMatchingService(kIOMasterPortDefault,
> +                                          IOServiceMatching("AppleSMC"));
> +    if (hostsmc_service == IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to get host-AppleSMC service");
> +        goto error_osk_buffer_free;
> +    }
> +
> +    status = IOServiceOpen(hostsmc_service,
> +                           mach_task_self(),
> +                           1,
> +                           &hostsmc_connect);
> +    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to open host-AppleSMC service");
> +        goto error_osk_buffer_free;
> +    }
> +
> +    status = IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_OPEN,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
> +    );
> +    if (status != kIOReturnSuccess) {
> +        error_setg(errp, "Unable to connect to host-AppleSMC");
> +        goto error_ioservice_close;
> +    }
> +
> +    in.key = ('OSK0');
> +    in.data_size = sizeof(out.bytes);
> +    in.command = SMC_READ_KEY;


Since you know all these beforehand, can't you just create two struct 
AppleSMCParam - one for osk0 and one for osk1? Then just shoot them off 
here:

struct AppleSMCParam cmd[2] = {
     {
         .key = ('OSK0'),
         .data_size = sizeof(cmd[0].bytes),
         .command = SMC_READ_KEY,
     }, {
         .key = ('OSK1'),
         .data_size = sizeof(cmd[0].bytes),
         .command = SMC_READ_KEY,
     },
};


for (i = 0; i < ARRAY_SIZE(in); i++) {
     IOConnectCallStructMethod(hostsmc_connect, SMC_HANDLE_EVENT, 
cmd[i], sizeof(cmd[i]), cmd[i], &out_size);
     if (out_size != sizeof(cmd[i])) {
         goto err;
     }
}

> +    status = IOConnectCallStructMethod(
> +        hostsmc_connect,
> +        SMC_HANDLE_EVENT,
> +        &in,
> +        sizeof(struct AppleSMCParam),
> +        &out,
> +        &out_size
> +    );
> +
> +    if (status != kIOReturnSuccess) {
> +        error_setg(errp, "Unable to read OSK0 from host-AppleSMC");
> +        goto error_ioconnect_close;
> +    }
> +    strncpy(*host_osk, (const char *) out.bytes, 32);


The OSK is not a string (well, it is, but technically it isn't). Just 
treat it as opaque 32 bytes of memory. Memcpy is what you want here.


> +
> +    in.key = ('OSK1');
> +    in.data_size = sizeof(out.bytes);
> +    in.command = SMC_READ_KEY;
> +    status = IOConnectCallStructMethod(
> +        hostsmc_connect,
> +        SMC_HANDLE_EVENT,
> +        &in,
> +        sizeof(struct AppleSMCParam),
> +        &out,
> +        &out_size
> +    );
> +    if (status != kIOReturnSuccess) {
> +        error_setg(errp, "Unable to read OSK1 from host-AppleSMC");
> +        goto error_ioconnect_close;
> +    }
> +    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
> +
> +    IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_CLOSE,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> +    IOServiceClose(hostsmc_connect);
> +    return true;
> +
> +error_ioconnect_close:
> +    IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_CLOSE,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> +error_ioservice_close:
> +    IOServiceClose(hostsmc_connect);
> +
> +error_osk_buffer_free:
> +    g_free(*host_osk);
> +    return false;
> +}
> +#else
> +static bool applesmc_read_host_osk(char **output_key, Error **errp)
> +{
> +    error_setg(errp, "isa-applesmc.hostosk ignored: "
> +                     "unsupported on non-Apple hosts");
> +    return false;
> +}
> +#endif
> +
>   static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>   {
> -    AppleSMCState *s = APPLE_SMC(dev);
> +    AppleSMCState   *s = APPLE_SMC(dev);

Why the whitespace change here?


> +    Error           *err = NULL;
>   
>       memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
>                             "applesmc-data", 1);
> @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>       isa_register_ioport(&s->parent_obj, &s->io_err,
>                           s->iobase + APPLESMC_ERR_PORT);
>   
> +    if (s->hostosk_flag) {
> +        /*
> +         * Property 'hostosk' has higher priority than 'osk'
> +         * and shadows it.
> +         * Free user-provided 'osk' property value
> +         */
> +        if (s->osk) {
> +            warn_report("isa-applesmc.osk is shadowed "
> +                        "by isa-applesmc.hostosk");
> +            g_free(s->osk);
> +        }
> +
> +        if (!applesmc_read_host_osk(&s->osk, &err)) {
> +            /* On host OSK retrieval error report a warning */
> +            error_report_err(err);
> +            s->osk = default_osk;
> +        }
> +    }


This part is yucky. A few things:

1) QEMU in general does not fail user requested operations silently. If 
the user explicitly asked to read the host OSK and we couldn't, it must 
propagate that error.
2) In tandem to the above, I think the only consistent CX is to make 
both options mutually exclusive. The easiest way to achieve that IMHO 
would be to overload the "osk" property. If it is "host", then use the 
host one.
3) Should we make "osk"="host" the default on macOS as well then? Of 
course, that one should *not* fail hard when it can't read the key, 
because it's an implicit request rather than an explicit one.


Alex


> +
>       if (!s->osk || (strlen(s->osk) != 64)) {
>           warn_report("Using AppleSMC with invalid key");
>           s->osk = default_osk;
> @@ -344,6 +496,7 @@ static Property applesmc_isa_properties[] = {
>       DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
>                          APPLESMC_DEFAULT_IOBASE),
>       DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> +    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk_flag, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

