Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A209E2D2E2B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:26:25 +0100 (CET)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmesi-0004cj-N6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kmegV-0003In-Rz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:13:47 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45416
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kmegT-0007Bu-A4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:13:47 -0500
Received: from host31-48-197-51.range31-48.btcentralplus.com ([31.48.197.51]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kmegL-000117-Ab; Tue, 08 Dec 2020 15:13:41 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201205150903.3062711-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <566df971-ffe6-317d-3dec-6bd120757921@ilande.co.uk>
Date: Tue, 8 Dec 2020 15:13:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201205150903.3062711-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.51
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/timer/slavio_timer: Allow 64-bit accesses
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
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Benoit Canet <benoit.canet@gmail.com>, Yap KV <yapkv@yahoo.com>,
 1906905@bugs.launchpad.net, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/12/2020 15:09, Philippe Mathieu-Daudé wrote:

> Per the "NCR89C105 Chip Specification" referenced in the header:
> 
>                    Chip-level Address Map
> 
>    ------------------------------------------------------------------
>    | 1D0 0000 ->   | Counter/Timers                        | W,D    |
>    |   1DF FFFF    |                                       |        |
>    ...
> 
>    The address map indicated the allowed accesses at each address.
>    [...] W indicates a word access, and D indicates a double-word
>    access.
> 
> The SLAVIO timer controller is implemented expecting 32-bit accesses.
> Commit a3d12d073e1 restricted the memory accesses to 32-bit, while
> the device allows 64-bit accesses.
> 
> This was not an issue until commit 5d971f9e67 which reverted
> ("memory: accept mismatching sizes in memory_region_access_valid").
> 
> Fix by renaming .valid MemoryRegionOps as .impl, and add the valid
> access range (W -> 4, D -> 8).
> 
> Since commit 21786c7e598 ("memory: Log invalid memory accesses")
> this class of bug can be quickly debugged displaying 'guest_errors'
> accesses, as:
> 
>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio -d guest_errors
> 
>    Power-ON Reset
>    Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid size (min:4 max:4)
> 
>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdio -S
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        ...
>        0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
>               ^^^^^^^^^                                 ^^^^^^^
>                     \ memory region base address and name /
> 
>    (qemu) info qtree
>    bus: main-system-bus
>      dev: slavio_timer, id ""              <-- device type name
>        gpio-out "sysbus-irq" 17
>        num_cpus = 1 (0x1)
>        mmio 0000000ff1310000/0000000000000014
>        mmio 0000000ff1300000/0000000000000010 <--- base address
>        mmio 0000000ff1301000/0000000000000010
>        mmio 0000000ff1302000/0000000000000010
>        ...
> 
> Reported-by: Yap KV <yapkv@yahoo.com>
> Buglink: https://bugs.launchpad.net/bugs/1906905
> Fixes: a3d12d073e1 ("slavio_timer: convert to memory API")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Benoit Canet <benoit.canet@gmail.com>
> Cc: <1906905@bugs.launchpad.net>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/timer/slavio_timer.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 5b2d20cb6a5..03e33fc5926 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops = {
>       .write = slavio_timer_mem_writel,
>       .endianness = DEVICE_NATIVE_ENDIAN,
>       .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
>           .min_access_size = 4,
>           .max_access_size = 4,
>       },

I don't really use the proprietary Sun ROMs here, but the fix looks good to me:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

It's probably also worth a CC to qemu-stable to try and also get this into 5.1.1 to 
accompany the related TCX issues.


ATB,

Mark.

