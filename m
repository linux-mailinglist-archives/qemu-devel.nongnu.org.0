Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0C2C0131
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:16:45 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh71f-0005V5-Ik
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kh6zq-00046r-Ue; Mon, 23 Nov 2020 03:14:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33816
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kh6zo-0000HA-FJ; Mon, 23 Nov 2020 03:14:50 -0500
Received: from host86-179-247-26.range86-179.btcentralplus.com
 ([86.179.247.26] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kh700-00044a-8l; Mon, 23 Nov 2020 08:15:05 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: f4bug@amsat.org, gson@gson.org, 1892540@bugs.launchpad.net,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
References: <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <7ec9f656-fa32-90a2-01a2-8f05e1b4ea53@ilande.co.uk>
Date: Mon, 23 Nov 2020 08:14:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.26
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-5.2] hw/display/tcx: add missing 64-bit access for
 framebuffer blitter
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/2020 08:17, Mark Cave-Ayland wrote:

> Commit ae5643ecc6 "hw/display/tcx: Allow 64-bit accesses to framebuffer stippler
> and blitter" enabled 64-bit access for the TCX framebuffer stippler and blitter
> but missed applying the change to one of the blitter MemoryRegions.
> 
> Whilst the original change works for me on my local NetBSD test image, the latest
> NetBSD ISO panics on startup without this fix.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: ae5643ecc6 ("hw/display/tcx: Allow 64-bit accesses to framebuffer stippler and blitter")
> Buglink: https://bugs.launchpad.net/bugs/1892540
> ---
>   hw/display/tcx.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 878ecc8c50..3799d29b75 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -649,10 +649,14 @@ static const MemoryRegionOps tcx_blit_ops = {
>       .read = tcx_blit_readl,
>       .write = tcx_blit_writel,
>       .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> +    .impl = {
>           .min_access_size = 4,
>           .max_access_size = 4,
>       },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
>   };
>   
>   static const MemoryRegionOps tcx_rblit_ops = {

Adding CC to qemu-stable so that this follow-up fix also gets applied to 5.1.1.


ATB,

Mark.

