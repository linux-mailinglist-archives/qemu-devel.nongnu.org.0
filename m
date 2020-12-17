Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664562DDB76
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:33:17 +0100 (CET)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq1pk-0000Kn-2g
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1oB-0008Ev-Ev
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:31:41 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1o8-0004da-28
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:31:39 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x12so306167plr.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d+wPOtIhDirfL8ATFPP4hrcwCB+1OSP2geV3SP38/xU=;
 b=MntMcFMjSMyiPN9R7L2lgx+V3Cwg+zLGTPlkn+I9GQfrZYUdbCJBVoip72VlAUXsXm
 C2FPsxd8HANaqVt75kcG7x4a9Lv0yrKFMUCgyO3P4BtByN4JEAoB2nmThydpyYz+hFKC
 gp78MG0AX9BbSRiZ8hxjpMQy54MoHCaggtBJuhe6MZ9sVo3G/V1whmvcBjW4Fr3M6POf
 2pLn64+GpMJJIAnZqvXahHjVlV0KlboOZrOZH4ONisoawXrL8rZQdTjYWgBDa8fO8LR6
 NXPC7as6Zd+kD+91orcDfWWIxN8rwCRXBe5inBxqkhgQTpVuYgFSgk3G58ick7Nf4eNt
 nPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d+wPOtIhDirfL8ATFPP4hrcwCB+1OSP2geV3SP38/xU=;
 b=Anp1Cid1KH8NFIljQL4OJisz7xHoezj7ziaNorDZexDAGu6Z5C7/ETeiAqWScHTFNT
 HhQ4323SH58Awa3hEYu5vOMIE3keUEM6WAlvqvfRd1XId0aO+MkfgPPsyZdUWQydVJFC
 m1p+n4x6BNH3v7KLdsYORFu7kynIcR3K2gN6dMbu/ISZabeHNkX0dol1oT01BrhbfzyF
 nGSWiTP6Qau1OAHUW98c76fm5jTjtV6z5d+9pP3FUHUystwH35P1pUzrfbYO31E2OI3z
 qgN9eV5dt9KnEkP0j0jh5dyMSRhyxE57XL6iIQ65WmrrAKmZsZDBJMW1S49pKWZ5UKzK
 QMBA==
X-Gm-Message-State: AOAM533QVnDQqjMM+7GKCCq+f6hOTbBu1EflBw2nNPZZjq/+HzsVUCU8
 jAWXHATPTAOwGDndPdaE4Z5b1MXJllmt/a89
X-Google-Smtp-Source: ABdhPJx06QhgEFj1OSDKXo44+3bAu/FY6dJMvAwmx5vF2KAE48W69Z3BrPkjHGotWG3LoOYyN9XL6g==
X-Received: by 2002:a17:902:7b84:b029:da:60e0:9d38 with SMTP id
 w4-20020a1709027b84b02900da60e09d38mr1221357pll.55.1608244293343; 
 Thu, 17 Dec 2020 14:31:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 77sm6921922pfx.156.2020.12.17.14.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:31:32 -0800 (PST)
Date: Thu, 17 Dec 2020 14:31:32 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 14:31:31 PST (-0800)
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
In-Reply-To: <20201217214826.2094617-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-b0271174-4849-4bcd-a63d-b53fafb1ab89@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <Anup.Patel@wdc.com>, qemu-devel@nongnu.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 13:48:26 PST (-0800), Atish Patra wrote:
> Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> lesser. However, Linux kernel can address only 1GB of memory for RV32.
> Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> As a result, it can not process DT and panic if opensbi dynamic firmware
> is used.
>
> Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d62f3dc7581e..9e77b22e4d56 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -203,9 +203,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
>       * Thus, put it at an aligned address that less than fdt size from end of
> -     * dram or 4GB whichever is lesser.
> +     * dram or 3GB whichever is lesser.
>       */
> -    temp = MIN(dram_end, 4096 * MiB);
> +    temp = MIN(dram_end, 3072 * MiB);
>      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>
>      fdt_pack(fdt);

Presumably this was the cause of that 32-bit boot issue?

