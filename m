Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8B364B08
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:14:53 +0200 (CEST)
Received: from localhost ([::1]:60136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaIG-0007C4-K2
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYaGl-0006QA-5g
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:13:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54054
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYaGi-0006st-Il
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:13:18 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lYaGu-0003y7-1a; Mon, 19 Apr 2021 21:13:33 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210417140206.673885-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
Date: Mon, 19 Apr 2021 21:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210417140206.673885-1-f4bug@amsat.org>
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

On 17/04/2021 15:02, Philippe Mathieu-Daudé wrote:

> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> regions"), all newly created regions are assigned with
> unassigned_mem_ops (which might be then overwritten).
> 
> When using aliased container regions, and there is no region mapped
> at address 0 in the container, the memory_region_dispatch_read()
> and memory_region_dispatch_write() calls incorrectly return the
> container unassigned_mem_ops, because the alias offset is not used.
> 
> The memory_region_init_alias() flow is:
> 
>    memory_region_init_alias()
>    -> memory_region_init()
>       -> object_initialize(TYPE_MEMORY_REGION)
>          -> memory_region_initfn()
>             -> mr->ops = &unassigned_mem_ops;
> 
> Later when accessing the alias, the memory_region_dispatch_read()
> flow is:
> 
>    memory_region_dispatch_read(offset)
>    -> memory_region_access_valid(mr)   <- offset is ignored
>       -> mr->ops->valid.accepts()
>          -> unassigned_mem_accepts()
>          <- false
>       <- false
>     <- MEMTX_DECODE_ERROR
> 
> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
> 
> Fix by dispatching aliases recusirvely, accessing its origin region
> after adding the alias offset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3:
> - reworded, mentioning the "alias to container" case
> - use recursive call instead of while(), because easier when debugging
>    therefore reset Richard R-b tag.
> v2:
> - use while()
> ---
>   softmmu/memory.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e43..23bdbfac079 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>       unsigned size = memop_size(op);
>       MemTxResult r;
>   
> +    if (mr->alias) {
> +        return memory_region_dispatch_read(mr->alias,
> +                                           addr + mr->alias_offset,
> +                                           pval, op, attrs);
> +    }
>       if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>           *pval = unassigned_mem_read(mr, addr, size);
>           return MEMTX_DECODE_ERROR;
> @@ -1486,6 +1491,11 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>   {
>       unsigned size = memop_size(op);
>   
> +    if (mr->alias) {
> +        return memory_region_dispatch_write(mr->alias,
> +                                            addr + mr->alias_offset,
> +                                            data, op, attrs);
> +    }
>       if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>           unassigned_mem_write(mr, addr, data, size);
>           return MEMTX_DECODE_ERROR;

Whilst working on my q800 patches I realised that this was a similar problem to the 
one I had with my macio.alias implementation at [1]: except that in my case the 
unassigned_mem_ops mr->ops->valid.accepts() function was being invoked on a ROM 
memory region instead of an alias. I think this is exactly the same issue that you 
are attempting to fix with your related patch at 
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03190.html ("memory: 
Initialize MemoryRegionOps for RAM memory regions").

I eventually realised that I needed functions that could dispatch reads/writes to 
both IO memory regions and ROM memory regions, and that functionality is covered by 
the address_space_*() access functions. Using the address_space_*() functions I was 
then able to come up with the working implementation at [2] that handles accesses to 
both IO memory regions and ROM memory regions correctly.

The reason I initially used the 
memory_region_dispatch_read()/memory_region_dispatch_write() functions was because I 
could see that was how the virtio devices dispatched accesses through the proxy. 
However I'm wondering now if this API can only be used for terminating IO memory 
regions, and so the alias_offset that you're applying above should actually be 
applied elsewhere instead.


ATB,

Mark.

[1] https://github.com/mcayland/qemu/commit/56f8639fbecb8a8e323ce486e20cbe309e807419

[2] https://github.com/mcayland/qemu/commit/c1fa32da188bb2ce23faf1728228c1714672270d

