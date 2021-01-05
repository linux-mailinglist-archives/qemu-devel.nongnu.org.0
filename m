Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC82EA984
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:08:34 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwkCX-0006FJ-Ag
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwkAE-0005Rs-Ia
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:06:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwkAC-0000D9-Tq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:06:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id c133so2636140wme.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EFMyGSDJt4qj6NP/4S3XK5VuofbF5cddEcI+tpbu6ss=;
 b=eru1qnHPbUR8R73Sff4pNQGyc7cOSN8uARFZ2zP/MP4SL8p9cq7VIA+oVGuvOateo3
 ftw095N7j3KoDMzELTbW5bHhDHuUPkDdDP/0B39Dk8XfAXyZl7VetYD+0Jt5h82ys0KS
 iVWitGpVgbvJplYLZqWKGyCxDaNYwCNOAA+tB5GA4nmXYvqtggVQ3xyXyMuP3d2D4soA
 6STcaVm7S4YBU6giZC82FP8h7qGVPUuBooVr+P8GzEYYkz2b3TyRAVBbDOWqiMZ0Gx9X
 qXpmT3WtxUwqffYFZwc3vcS8OeIQHaj0WPxnsE4y/Et9lW5H/1URQ+TuRJ1aZ2ikZSAS
 MvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EFMyGSDJt4qj6NP/4S3XK5VuofbF5cddEcI+tpbu6ss=;
 b=q2HW/OCPCqsbpJpr45BfjsUvFxXX9G76Oilqbvimanc9f0xJ1t5i/wEgplsVDNrvst
 qbVEisK6FL0O9Jv1COFJ2atBYgi5e/8ttTx0In3HxXhwl4hZEU4A89K5/2GykD/37XfZ
 MZ6Oy/sdrEuv4p9ah9cwYdQPTmcezxJ36qgasocmdymb4QtIjpiy+ya+74JSGG211BuN
 rGM8jchCOL9HpiQc9EeACRhxm0inZWWQKLDzFuymOgUaZFacrLYZhQEawpZm3YPi2wTd
 scjBgFHybkRTK03cvJGDsKhV4b8WloRQPSbZh4oICGk/jEEeKUBqJ9MjT4QWAXFHUHTA
 kHOw==
X-Gm-Message-State: AOAM533RZaVs0UWRDstPe2kAJ0zMK3oWbKdpWePHQ2GhwwtCRBUR5Iby
 3hAfcgllB2VCtcjXc0xl7xU=
X-Google-Smtp-Source: ABdhPJwmCZviwiJZzuMDTYlHOcS3SrNhIn2LQ8IbikrAhnxZ8cG1UVSZxmVefKxWWOcmQmWVnoyuNA==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr2966305wma.22.1609844767281; 
 Tue, 05 Jan 2021 03:06:07 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s6sm104908391wro.79.2021.01.05.03.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 03:06:06 -0800 (PST)
Subject: Re: [PATCH] hw/timer/slavio_timer: Allow 64-bit accesses
To: qemu-devel@nongnu.org
References: <20201205150903.3062711-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3ecd3ef-fe83-12a8-d59d-ec68c2351b9c@amsat.org>
Date: Tue, 5 Jan 2021 12:06:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201205150903.3062711-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Benoit Canet <benoit.canet@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Yap KV <yapkv@yahoo.com>,
 1906905@bugs.launchpad.net, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 12/5/20 4:09 PM, Philippe Mathieu-Daudé wrote:
> Per the "NCR89C105 Chip Specification" referenced in the header:
> 
>                   Chip-level Address Map
> 
>   ------------------------------------------------------------------
>   | 1D0 0000 ->   | Counter/Timers                        | W,D    |
>   |   1DF FFFF    |                                       |        |
>   ...
> 
>   The address map indicated the allowed accesses at each address.
>   [...] W indicates a word access, and D indicates a double-word
>   access.
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
>   $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio -d guest_errors
> 
>   Power-ON Reset
>   Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid size (min:4 max:4)
> 
>   $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdio -S
>   (qemu) info mtree
>   address-space: memory
>     0000000000000000-ffffffffffffffff (prio 0, i/o): system
>       ...
>       0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
>              ^^^^^^^^^                                 ^^^^^^^
>                    \ memory region base address and name /
> 
>   (qemu) info qtree
>   bus: main-system-bus
>     dev: slavio_timer, id ""              <-- device type name
>       gpio-out "sysbus-irq" 17
>       num_cpus = 1 (0x1)
>       mmio 0000000ff1310000/0000000000000014
>       mmio 0000000ff1300000/0000000000000010 <--- base address
>       mmio 0000000ff1301000/0000000000000010
>       mmio 0000000ff1302000/0000000000000010
>       ...
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
>  hw/timer/slavio_timer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 5b2d20cb6a5..03e33fc5926 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops = {
>      .write = slavio_timer_mem_writel,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> 

