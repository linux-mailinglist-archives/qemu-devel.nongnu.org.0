Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE351441A47
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:56:01 +0100 (CET)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUyv-0007nD-4s
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhUwp-0005Ko-3d
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:53:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhUwm-00072p-Qp
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:53:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso7591205wmc.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nS58yJo50/PL+h/20vNh1AAHKjecfY5jYTesVVpLtss=;
 b=WS/MLQbGr02ZStMqkkrey/nzMJdZOlQagvG0w6AemqziIZIyRyfMXp6Vn0/kA4YyYT
 InCKutM6pUwAq7cBjyK3HiEI95B+h6Z1R0t7DcLDjHgJNDJR11WnnC7UaQyZv/C6/8Rb
 gEtTGj1UHmLad69ukNl1VfWVAegQnNRKHO7498K5Nqm9gBSBIl/uL/PUQdgbLWvZCte/
 K27EC8ZW2qg/oFg423y0CaITKeWaIL8gZMKx64bnWvC5JrDO8yo1C+67APuM6zHWARCg
 Rvya8CuL2cGlyHJB3kZ1WxaCLRsuTyzZYh+lrZi/2LMRZc7lkPocR10PNbqvplOJzDCp
 UVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nS58yJo50/PL+h/20vNh1AAHKjecfY5jYTesVVpLtss=;
 b=zMfPl3D/S0vSOWisJS+qOBrHbLjjvGF2kM4FqAz1vZNAh9Dd3JagkEIVk/W4WZ1R6W
 gJ5to+RpT2OD+lRbQeAUW4S0im6XJ3ejHAmFpOG0JytG2UUhMCGWkMZTfWHL0jqTwByf
 hdoD5Mt85e6iV+oqmE1NwHU+0PD++TaN7nBqCpf3NjdnjOPzCiQwed64vzBQnEtjxYyR
 YsNZ1JAvH5zNkfuf4uKm+HFc1BNkXNBe/vDy0V1wXT8JhJJVEHREzGgurM3gCaHIimQh
 Ho53gI7z2ev6uJosVyT6//Ti0HgAwhwlTPdjph0qjdaAwzzuaBfR+zbV3W/pqrClxxTJ
 dIew==
X-Gm-Message-State: AOAM531rqV53VrnlvteSDo9uLzDCGN3HGZov9BogZSQMrgTlbYJY4u9b
 /5DN0AX4cheacPWCc/W+gOf+O8Flyrj9zse4iSNYpA==
X-Google-Smtp-Source: ABdhPJyTaIHt6mQPoEbHrdGmUF4EK2WhQOhfRGuBSow5PEBDj432zqFQaffRAPpzLob/okJyfA/XccOEV0luIqEOYSM=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr38912149wmc.126.1635764027264; 
 Mon, 01 Nov 2021 03:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211026140311.158151-1-damien.hedde@greensocs.com>
In-Reply-To: <20211026140311.158151-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 10:53:36 +0000
Message-ID: <CAFEAcA_SbBqvPdEsqCVoKGOqwL_a26xn0b6nuniqOA3+Fi3Ezg@mail.gmail.com>
Subject: Re: [PATCH v2] generic-loader: check that binary file target location
 exists
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 at 15:11, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> When loading a binary file, we only check if it is smaller than the
> ram_size. It does not really check if the file will be loaded at an
> existing location (if there is nothing at the target address, it will
> "fail" silently later). It prevents loading a binary blob bigger than
> ram_size too even if the target location is big enough.
>
> Replace this check by looking for the target memory region size and
> prevent loading a bigger file than the available space.
>
> Get rid of "hw/boards.h" include, since we needed it only to access
> `current_machine`.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> Hi,
>
> This is an updated version implementing what we discussed in v1.
>
> This can be tested easily, eg, using opentitan machine which has a 64K ram
> located at 0x10000000.
>
> the following works (we a blob corresponding to the whole ram)
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10000000,file=blob.bin
>
> but this command fails because we load a blob which is too big
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10001000,file=blob.bin
> | qemu-system-riscv32: -device loader,addr=0x10001000,file=blob.bin: Cannot load specified image blob.bin
>
> and this command fails too (we load a blob at an unmapped location)
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x0,file=blob.bin
> | qemu-system-riscv32: -device loader,addr=0x0,file=blob.bin: Address 0x0 does not exists
>
> Thanks,
> Damien
>
> v2:
>  + instead of disabling the ram_size check, look for the target
>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01077.html
>
> See also the original discussion about generic-loader:
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html
> ---
>  hw/core/generic-loader.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index d14f932eea..88d3f9fd56 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -34,7 +34,6 @@
>  #include "hw/core/cpu.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/reset.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> @@ -153,8 +152,23 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>          }
>
>          if (size < 0 || s->force_raw) {
> -            /* Default to the maximum size being the machine's ram size */
> -            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
> +            MemoryRegion *root = as ? as->root : get_system_memory();
> +            MemoryRegionSection mrs;
> +            uint64_t avail = 0;
> +
> +            mrs = memory_region_find(root, s->addr, 1);
> +
> +            if (mrs.mr) {
> +                avail = int128_get64(mrs.mr->size) - mrs.offset_within_region;
> +                memory_region_unref(mrs.mr);
> +            } else {
> +                error_setg(errp, "Address 0x%" PRIx64 " does not exists",
> +                           s->addr);
> +                return;
> +            }

Won't this break the case of loading a file that spans two
consecutive-but-different memory regions ? I think if we want
to catch "we tried to load something to an address not backed
by something" we should do that by making load_image_targetphys_as()
correctly handle errors from the memory accesses it makes and
propagate an error-return to the caller.

-- PMM

