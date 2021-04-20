Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B18365336
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:23:50 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkje-0002ZQ-0T
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYkiS-00027P-9J
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:22:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54786
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYkiQ-0004WD-Ij
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:22:36 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYkif-0000KL-Gl; Tue, 20 Apr 2021 08:22:49 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <CAAdtpL5EtysZp17DotHXRzthHVkKft6OmVCVUKdaVKrkTxnCtA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <efb6be77-9fc3-7071-4bf8-b0f0e6dffc40@ilande.co.uk>
Date: Tue, 20 Apr 2021 08:22:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL5EtysZp17DotHXRzthHVkKft6OmVCVUKdaVKrkTxnCtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.83.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 22:11, Philippe Mathieu-Daudé wrote:

>> My patch might not be the proper fix, but we need to figure out how
>> to avoid others to hit the same problem, as it is very hard to debug.
>>
>> At least an assertion and a comment.
> 
> Something like:
> 
> -- >8 --
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e43..e031ac6e074 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1442,6 +1442,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>      unsigned size = memop_size(op);
>      MemTxResult r;
> 
> +    assert(!(mr->alias && !mr>alias_offset)); /* Use AddressSpace API
> instead */
>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>          *pval = unassigned_mem_read(mr, addr, size);
>          return MEMTX_DECODE_ERROR;

AFAICT the dispatch functions don't handle rom/ram or aliases so you might need to go 
a bit stronger. The check is further complicated by the fact that you can have 
rom/ram devices which do define the underlying mr->ops.

I'm wondering for memory_region_dispatch_read() if this would work?

    assert(!mr->alias && !memory_access_is_direct(mr, false));


ATB,

Mark.

