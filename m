Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C43C6EC8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:45:15 +0200 (CEST)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fuc-0007zo-Gh
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3FtW-00071B-Df
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:44:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3FtU-00038U-1e
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:44:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id dj21so12712492edb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Az/2PHI96AtBR1ylatRFGXqu5fi6wlmc+MdQzPHxgW8=;
 b=lFKnnerA3Xk/XcA6DjTXPdzNL1U2YyB1TxYrXWUQUXCo1/8yv/xOpQXPtGpvxfA9BQ
 l0xlkFQIm338vsSS8NqALD77AWh2d84uau+al+yOBhgoh8+8roBy4juvK+idYW4Kaynj
 1EXmUIavsLNpfwIR7XkcpTAhJL6GR6SA6M808+a5shRwNkMfbgOOW6AsrfYFNKP63x2j
 ZYWnzhznAsdeE8XH+fK+vqqDWcLA8B2uDABvrCH2C39tnOZN4JB7uElQ23lzXRqv3wvY
 0eFfA9+r2wn6YU7JszZZdig1zoP0hfigj+F/NOLwEZxmAw1qh++3H/mcDLQgASExNaBe
 uGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Az/2PHI96AtBR1ylatRFGXqu5fi6wlmc+MdQzPHxgW8=;
 b=tQDxg3xzwYj0rqJyLn8G20iptxwOgCCXGVmtYhE3w2jhTOQphQ2llRpi7fjQ0ajqVT
 6BpbznOlG+xwVKfAbfkhSBtBTrmmaMKg1o37mFMrcvH3ghx2HxplZZXNHoUWdtvKqCkg
 ZvHgjvKoO/2pMKs++I+fiLRXFbzSw4EhDM4RqHhstIdaRyhNlt83yHA/fYCjBe874r8f
 QkUc+lXdjZs2ltwLrBcQgslIIzXuOVW2Ui9H8Yz7WhQRV4T6vpNOhXVuHm3E+AKrqJvF
 vOe/3IG3mkye62Yfv1vH0lXwV/KWXPrk6NPJ0ZrE7XbhhAQIH9HCl7jaFRym8GW0A00S
 NZgg==
X-Gm-Message-State: AOAM531wAq53ydxxr8FK/ClEHOFe3xcvZ5ki4ibdCV+bJXwAPPYYPMcl
 9S7aa3Bj3Xp5nVdPwV3Dp/JbvkEW3cOMqyMmzhNiTw==
X-Google-Smtp-Source: ABdhPJwCWe6VPj3VTD/JWP2raTKknrSsve052vzH7Ivp7EPS74g/uvwtti6M2VraobXbVUQf1EDs6Skx/m1g3r/LmL8=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr4904630edb.52.1626173042392; 
 Tue, 13 Jul 2021 03:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200714003254.4044149-1-alistair.francis@wdc.com>
 <20200714003254.4044149-5-alistair.francis@wdc.com>
In-Reply-To: <20200714003254.4044149-5-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:43:22 +0100
Message-ID: <CAFEAcA-OmEhVkZFryiJjy693pTEtMLR=MHzEi6y4FSu7Zy=6Dg@mail.gmail.com>
Subject: Re: [PULL 04/15] RISC-V: Copy the fdt in dram instead of ROM
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jul 2020 at 01:44, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Currently, the fdt is copied to the ROM after the reset vector. The firmware
> has to copy it to DRAM. Instead of this, directly copy the device tree to a
> pre-computed dram address. The device tree load address should be as far as
> possible from kernel and initrd images. That's why it is kept at the end of
> the DRAM or 4GB whichever is lesser.

Hi; Coverity reports an issue in this code (CID 1458136):

> +uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> +{
> +    uint32_t temp, fdt_addr;
> +    hwaddr dram_end = dram_base + mem_size;
> +    int fdtsize = fdt_totalsize(fdt);
> +
> +    if (fdtsize <= 0) {
> +        error_report("invalid device-tree");
> +        exit(1);
> +    }
> +
> +    /*
> +     * We should put fdt as far as possible to avoid kernel/initrd overwriting
> +     * its content. But it should be addressable by 32 bit system as well.
> +     * Thus, put it at an aligned address that less than fdt size from end of
> +     * dram or 4GB whichever is lesser.
> +     */
> +    temp = MIN(dram_end, 4096 * MiB);
> +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> +
> +    fdt_pack(fdt);

fdt_pack() can return an error code, but we are not checking its
return value here.

(This is one of Coverity's heuristics where it only reports failure
to check errors if it sees enough other callsites in the codebase
which do check errors to make it decide this is an "always need a
check" API, which is why the error has only popped up now a year on...)

> +    /* copy in the device tree */
> +    qemu_fdt_dumpdtb(fdt, fdtsize);
> +
> +    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
> +                          &address_space_memory);
> +
> +    return fdt_addr;
> +}

thanks
-- PMM

