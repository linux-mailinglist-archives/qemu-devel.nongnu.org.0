Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263449C4C1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:52:18 +0100 (CET)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCd6H-0003rO-Gh
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:52:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcx3-00009Z-D9; Wed, 26 Jan 2022 02:42:46 -0500
Received: from [2001:41c9:1:41f::167] (port=34144
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcx1-0002av-Vz; Wed, 26 Jan 2022 02:42:45 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcwW-0008pH-LN; Wed, 26 Jan 2022 07:42:16 +0000
Message-ID: <b080e533-92e1-90bd-9f42-1134a45c47e8@ilande.co.uk>
Date: Wed, 26 Jan 2022 07:42:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220124231355.48210-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220124231355.48210-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/misc/macio/cuda: Simplify using the ldst API
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 23:13, Philippe Mathieu-Daudé via wrote:

> This code is easier to review using the load/store API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/misc/macio/cuda.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index e917a6a095..f1186671bf 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -36,6 +36,7 @@
>   #include "sysemu/runstate.h"
>   #include "qapi/error.h"
>   #include "qemu/cutils.h"
> +#include "qemu/bswap.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "trace.h"
> @@ -345,10 +346,7 @@ static bool cuda_cmd_get_time(CUDAState *s,
>   
>       ti = s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
>                              / NANOSECONDS_PER_SECOND);
> -    out_data[0] = ti >> 24;
> -    out_data[1] = ti >> 16;
> -    out_data[2] = ti >> 8;
> -    out_data[3] = ti;
> +    stl_be_p(out_data, ti);
>       *out_len = 4;
>       return true;
>   }
> @@ -363,8 +361,7 @@ static bool cuda_cmd_set_time(CUDAState *s,
>           return false;
>       }
>   
> -    ti = (((uint32_t)in_data[0]) << 24) + (((uint32_t)in_data[1]) << 16)
> -         + (((uint32_t)in_data[2]) << 8) + in_data[3];
> +    ti = ldl_be_p(in_data);
>       s->tick_offset = ti - (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
>                              / NANOSECONDS_PER_SECOND);
>       return true;

Looks fine to me.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

