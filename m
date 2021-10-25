Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1095439974
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:58:13 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1QT-0001L7-46
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mf1OZ-0008E6-Hm
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:56:15 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48176 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mf1OX-0001bV-AW
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:56:15 -0400
Received: from [192.168.106.118]
 (dynamic-095-114-012-148.95.114.pool.telefonica.de [95.114.12.148])
 by csgraf.de (Postfix) with ESMTPSA id EDFCC608043E;
 Mon, 25 Oct 2021 16:56:11 +0200 (CEST)
Message-ID: <543422ff-4556-04d7-77bb-88095dd69805@csgraf.de>
Date: Mon, 25 Oct 2021 16:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v5] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211025142138.9393-1-yaroshchuk2000@gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20211025142138.9393-1-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.846,
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
Cc: phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, f4bug@amsat.org,
 laurent@vivier.eu, r.bolshakov@yadro.com, pbonzini@redhat.com,
 gsomlo@gmail.com, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 25.10.21 16:21, Vladislav Yaroshchuk wrote:
> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
>
> Usage:
> `-device isa-applesmc,osk=host`
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
> Enable this feature by default on Apple devices
>
> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   hw/misc/applesmc.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 121 insertions(+)
>
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf1d3..6bd2584ca0 100644
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
> @@ -312,9 +317,106 @@ static const MemoryRegionOps applesmc_err_io_ops = {
>       },
>   };
>   
> +#if defined(__APPLE__) && defined(__MACH__)
> +/*
> + * Based on
> + * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_HANDLE_EVENT     = 2,
> +    SMC_READ_KEY         = 5


Anonymous enums are not great. Would you mind to just make them 
#define's instead?


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
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    assert(host_osk != NULL);
> +
> +    io_service_t    hostsmc_service = IO_OBJECT_NULL;
> +    io_connect_t    hostsmc_connect = IO_OBJECT_NULL;
> +    size_t          smc_param_size = sizeof(struct AppleSMCParam);
> +    IOReturn        status = kIOReturnError;
> +    int             i;


No need to align the variable names. If anything, better follow the 
Reverse Christmas Tree model :)

Also, let's wait for v6 until Daniel and me agreed on the parameter.


Alex



