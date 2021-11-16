Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F0453A71
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:53:00 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4Vn-00060I-5b
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:52:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mn4U2-0004gH-3C; Tue, 16 Nov 2021 14:51:10 -0500
Received: from [2001:41c9:1:41f::167] (port=42798
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mn4Ty-0006fW-SW; Tue, 16 Nov 2021 14:51:09 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mn4Tm-0003sd-BL; Tue, 16 Nov 2021 19:50:58 +0000
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211116150837.169291-1-lvivier@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6895b1ef-10db-a807-a9dd-668bda1739d8@ilande.co.uk>
Date: Tue, 16 Nov 2021 19:50:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116150837.169291-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] pmu: fix pmu vmstate subsection list
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2021 15:08, Laurent Vivier wrote:

> The subsection is not closed by a NULL marker so this can trigger
> a segfault when the pmu vmstate is saved.
> 
> This can be easily shown with:
> 
>    $ ./qemu-system-ppc64  -dump-vmstate vmstate.json
>    Segmentation fault (core dumped)
> 
> Fixes: d811d61fbc6c ("mac_newworld: add PMU device")
> Cc: mark.cave-ayland@ilande.co.uk
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/misc/macio/pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 4ad4f50e08c3..eb39c64694aa 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -718,6 +718,7 @@ static const VMStateDescription vmstate_pmu = {
>       },
>       .subsections = (const VMStateDescription * []) {
>           &vmstate_pmu_adb,
> +        NULL
>       }
>   };

Eeek. Good spot, looks like this bug has been around for some time:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

