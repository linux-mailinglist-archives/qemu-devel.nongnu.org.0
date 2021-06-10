Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156F3A36E2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 00:14:42 +0200 (CEST)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrSwj-0006Nj-5M
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 18:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrSw1-0005jD-Ta
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 18:13:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37592
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrSw0-0000us-2C
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 18:13:57 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lrSvk-0006iV-LE; Thu, 10 Jun 2021 23:13:44 +0100
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210609141010.1066750-1-f4bug@amsat.org>
 <20210609141010.1066750-3-f4bug@amsat.org>
 <543252e5-0b30-8424-d833-4103ddee3919@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0ee1083d-822b-f409-cf00-2b70b28b796e@ilande.co.uk>
Date: Thu, 10 Jun 2021 23:13:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <543252e5-0b30-8424-d833-4103ddee3919@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 2/2] cputlb: implement load_helper_unaligned() for
 unaligned loads
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/2021 22:41, Richard Henderson wrote:

> On 6/9/21 7:10 AM, Philippe Mathieu-Daudé wrote:
>> +    oi = make_memop_idx(MO_UB, mmu_idx);
>> +    if (memop_big_endian(op)) {
>> +        for (i = 0; i < size; ++i) {
>> +            /* Big-endian load.  */
>> +            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
>> +            val |= val8 << (((size - 1) * 8) - (i * 8));
>> +        }
>> +    } else {
>> +        for (i = 0; i < size; ++i) {
>> +            /* Little-endian load.  */
>> +            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
>> +            val |= val8 << (i * 8);
>> +        }
>> +    }
> 
> This doesn't quite work.  You can't just call helper_ret_ldub_mmu, as the other 
> option is full_ldub_code.  So, at present you've broken unaligned code loads.
> 
> We also need noinline markup for clang, like we do for helper_ret_stb_mmu. I've no 
> proof of that, but it certainly makes sense to record how we expect the inline loop 
> to be resolved.
> 
> Finally, you have to use uint64_t for val8, otherwise the shift fails for size == 8.
> 
> I'll fix these up and see how things go.

Ah that makes sense - I wasn't quite sure whether the previous full_load() would 
already be handled correctly by the code_read logic in load_helper_unaligned().

Sleeping on the problem, I do wonder if the role of load_helper() and store_helper() 
should be just to ensure that if an access crosses a page then both entries are in 
the softtlb before passing MMIO accesses down through the memory API with Andrew 
Jeffrey's proposed unaligned access patch (see 
https://gitlab.com/qemu-project/qemu/-/issues/360#note_597130838 for a summary of the 
IRC discussion).

However as I suspect this may cause some breakage then I would still be fine with 
load_helper_unaligned() in the meantime.


ATB,

Mark.

