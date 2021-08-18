Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE33EFFA0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:53:36 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHKJ-0001IF-FF
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHIN-0007uE-Mt
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:51:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38592
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHIK-0004bf-Ow
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:51:35 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHHy-000CO1-St; Wed, 18 Aug 2021 09:51:15 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-40-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a66ca5f9-ff77-14ed-3951-fd771b070dde@ilande.co.uk>
Date: Wed, 18 Aug 2021 09:51:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 39/55] target/sparc: Use cpu_*_mmu instead of
 helper_*_mmu
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
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

On 03/08/2021 05:14, Richard Henderson wrote:

> The helper_*_mmu functions were the only thing available
> when this code was written.  This could have been adjusted
> when we added cpu_*_mmuidx_ra, but now we can most easily
> use the newest set of interfaces.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/ldst_helper.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 299fc386ea..a3e1cf9b6e 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1328,27 +1328,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
>               oi = make_memop_idx(memop, idx);
>               switch (size) {
>               case 1:
> -                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
> +                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
>                   break;
>               case 2:
>                   if (asi & 8) {
> -                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
>                   } else {
> -                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
>                   }
>                   break;
>               case 4:
>                   if (asi & 8) {
> -                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
>                   } else {
> -                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
>                   }
>                   break;
>               case 8:
>                   if (asi & 8) {
> -                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
>                   } else {
> -                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
> +                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
>                   }
>                   break;
>               default:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

