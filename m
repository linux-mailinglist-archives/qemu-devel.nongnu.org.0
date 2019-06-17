Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C297481B3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 14:20:20 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcqcV-0004mi-DL
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 08:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hcq9b-0001IB-3t
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hcq9X-0007AZ-DP
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:50:27 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:60761 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hcq9V-00077S-IX
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:50:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E488F1A202B;
 Mon, 17 Jun 2019 13:50:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from [10.10.13.132] (rtrkw870-lin.domain.local [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C6E221A1F9F;
 Mon, 17 Jun 2019 13:50:18 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
 <1559816130-17113-7-git-send-email-stefan.brankovic@rt-rk.com>
 <18871125-cb2c-57e7-864d-c5c7a8846093@linaro.org>
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
Message-ID: <15835022-ed00-40e7-ed93-767b794e32d7@rt-rk.com>
Date: Mon, 17 Jun 2019 13:50:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <18871125-cb2c-57e7-864d-c5c7a8846093@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: Re: [Qemu-devel] [PATCH 6/8] target/ppc: Optimize emulation of
 vclzw instruction
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6.6.19. 20:34, Richard Henderson wrote:
> On 6/6/19 5:15 AM, Stefan Brankovic wrote:
>> +    for (i = 0; i < 2; i++) {
>> +        if (i == 0) {
>> +            /* Get high doubleword element of vB in avr. */
>> +            get_avr64(avr, VB, true);
>> +        } else {
>> +            /* Get low doubleword element of vB in avr. */
>> +            get_avr64(avr, VB, false);
>> +        }
> Better as simply get_avr64(avr, VB, i);
Definitely shorter way to do this.
>
>> +        /*
>> +         * Perform count for every word element using tcg_gen_clzi_i64.
>> +         * Since it counts leading zeros on 64 bit lenght, we have to move
>> +         * ith word element to highest 32 bits of tmp, or it with mask(so we get
>> +         * all ones in lowest 32 bits), then perform tcg_gen_clzi_i64 and move
>> +         * it's result in appropriate word element of result.
>> +         */
>> +        tcg_gen_shli_i64(tmp, avr, 32);
>> +        tcg_gen_or_i64(tmp, tmp, mask);
>> +        tcg_gen_clzi_i64(result, tmp, 64);
>> +
>> +        tcg_gen_or_i64(tmp, avr, mask);
>> +        tcg_gen_clzi_i64(tmp, tmp, 64);
> s/64/32.
>
>> +        tcg_gen_deposit_i64(result, result, tmp, 32, 32);
> That said, it's probably better to treat this as 4 words, not 2 doublewords.
>
> 	for (i = 0; i < 4; i++) {
> 	    tcg_gen_ld_i32(tmp, cpu_env, avr_full_offset(VB) + i * 4);
> 	    tcg_gen_clzi_i32(tmp, tmp, 32);
> 	    tcg_gen_st_i32(tmp, cpu_env, avr_full_offset(VT) + i * 4);
> 	}
>
I will use this way in v2.

Kind Regards,

Stefan

> r~

