Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CF3DD2FD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:32:08 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUIo-0004PE-4O
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAUHv-0003Pl-FF; Mon, 02 Aug 2021 05:31:11 -0400
Received: from relay68.bu.edu ([128.197.228.73]:55288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAUHs-0004ZK-G0; Mon, 02 Aug 2021 05:31:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1729UKL5014688
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 2 Aug 2021 05:30:23 -0400
Date: Mon, 2 Aug 2021 05:30:20 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1 1/3] hw/sd/sdcard: Document out-of-range
 addresses for SEND_WRITE_PROT
Message-ID: <20210802093020.jd37omp6j7rh6auk@mozz.bu.edu>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210728181728.2012952-2-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210728 2017, Philippe Mathieu-Daudé wrote:
> Per the 'Physical Layer Simplified Specification Version 3.01',
> Table 4-22: 'Block Oriented Write Protection Commands'
> 
>   SEND_WRITE_PROT (CMD30)
> 
>   If the card provides write protection features, this command asks
>   the card to send the status of the write protection bits [1].
> 
>   [1] 32 write protection bits (representing 32 write protect groups
>   starting at the specified address) [...]
>   The last (least significant) bit of the protection bits corresponds
>   to the first addressed group. If the addresses of the last groups
>   are outside the valid range, then the corresponding write protection
>   bits shall be set to 0.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

-Alex

> ---
>  hw/sd/sd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1f964e022b1..707dcc12a14 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>  
>      for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
>          assert(wpnum < sd->wpgrps_size);
> -        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
> +        if (addr >= sd->size) {
> +            /*
> +             * If the addresses of the last groups are outside the valid range,
> +             * then the corresponding write protection bits shall be set to 0.
> +             */
> +            continue;
> +        }
> +        if (test_bit(wpnum, sd->wp_groups)) {
>              ret |= (1 << i);
>          }
>      }
> -- 
> 2.31.1
> 

