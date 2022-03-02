Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAD4CA060
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:13:45 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPL3H-0000ny-TU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL1m-0008Vi-NY
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:12:10 -0500
Received: from [2001:41c9:1:41f::167] (port=53258
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL1k-0008Pd-Ib
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:12:09 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPL10-0005xX-8P; Wed, 02 Mar 2022 09:11:26 +0000
Message-ID: <9e01f70b-b7a4-fc78-79c0-17f4a87a3ea1@ilande.co.uk>
Date: Wed, 2 Mar 2022 09:11:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220228222527.8234-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/10] macfb: increase number of registers saved in
 MacfbState
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 22:25, Mark Cave-Ayland wrote:

> The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
> initialisation and resolution changes. Whilst the function of many of these
> registers is unknown, it is worth the minimal cost of saving these extra values as
> part of migration to help future-proof the migration stream for the q800 machine
> as it starts to stabilise.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/display/macfb.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> index 6d9f0f7869..c0e2df8dc6 100644
> --- a/include/hw/display/macfb.h
> +++ b/include/hw/display/macfb.h
> @@ -48,7 +48,7 @@ typedef struct MacFbMode {
>       uint32_t offset;
>   } MacFbMode;
>   
> -#define MACFB_NUM_REGS      8
> +#define MACFB_NUM_REGS      (0x200 / sizeof(uint32_t))
>   
>   typedef struct MacfbState {
>       MemoryRegion mem_vram;

Sigh. This patch isn't right: it's missing a later commit in my local branch that 
needs to be squashed into it, and even then I can now see a bug in that implementation.

I'll send an updated version of this patch in v2.


ATB,

Mark.

