Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD014D8B85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:17:21 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpFw-0005LW-Ic
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:17:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpBI-0001By-Fo
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:12:36 -0400
Received: from [2607:f8b0:4864:20::b31] (port=38460
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpBG-0005Ed-MP
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:12:32 -0400
Received: by mail-yb1-xb31.google.com with SMTP id u3so32465337ybh.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaQ+Boi0mU+Pp7EhfQK7kgD4tno7V88QKhgpvqtno3c=;
 b=ztn9mtNK1qXxF4dQjeHeOhbGhahQ97fKCZYVVuzYQzEWGts7klHGllORMRDXQ5uJoY
 8U7MoYfg+ixINGPBIb9fd1dNR1ocSkWNXUuRRB9On3nidw4rvKdjmUebq5TYuItPiJOW
 mB4D275DjsHwxoiyUZKUsuwzG7E4vlDEwO4SRSJLR/eyc1fQRtwew7CYVfNsqEurVBci
 1TzKbGMZRuk0/vSgEKb3NwbH6ada//9mcBEp1qeR9sdb+E2TZMd8ihC0RhxK80+HhowO
 I7OuzpCSO3wDNoCOpRtP9Uu00UFTbN5KHT5UReYJeUpXaVSYiNefszbkuexMB7we/peD
 5fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaQ+Boi0mU+Pp7EhfQK7kgD4tno7V88QKhgpvqtno3c=;
 b=n7utx14OLx6K/iINmZ4vjo4hgYCIJuOyVVpbf/HoMduRaK8eFJe0l7tZKV4eLX59BI
 6ihoWwyDadBQR2Cpppp4nXmee/zBjY8rIUANn6J5/dbYHZWSRt9EOTwzGyd55DvvcO8A
 HGkUQl8P92T6PCjd73udyncnVhuBsgyOPP6f+ZsCTRGUN1T475PQQtqBvnK/qPLQXlZc
 UT3ZMIcAjor7kQw0fZzdn/2yzAxgoymV0Q/gz/RmJeHFA7EcnI+Y4JIf9EczZFeRe+hX
 uYIa6vio3T5jk3Y7D3tTJWTdo3pwObbf/jW87KiLnkzlbadOLBatfI+8aLXghzPrixuq
 lgWA==
X-Gm-Message-State: AOAM533LadQpHGFLX/IPmpEEffCp6syYtXPB75XDdGTV23M61BWgAqvn
 730RDLKilHJFDyFaEF5kRGZOmN4Kd6EefYvWG4at/Q==
X-Google-Smtp-Source: ABdhPJzrBekbOZPlEA/N/c5Ux78rddEtaQXyWViEuwGVudkv5/vzm7wKx+kOeG6lusypOp4F7pG9a3QaC0UZ+70pwoc=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr18719807yby.193.1647281549785; Mon, 14
 Mar 2022 11:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220304165628.2345765-1-peter.maydell@linaro.org>
In-Reply-To: <20220304165628.2345765-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:12:18 +0000
Message-ID: <CAFEAcA-7XPoeeO92C6YhR_1Cq3vsjR6vjJSSQqRTmvp34nhkbA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix handling of LPAE block descriptors
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for review, please?

thanks
-- PMM

On Fri, 4 Mar 2022 at 16:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> LPAE descriptors come in three forms:
>
>  * table descriptors, giving the address of the next level page table
>  * page descriptors, which occur only at level 3 and describe the
>    mapping of one page (which might be 4K, 16K or 64K)
>  * block descriptors, which occur at higher page table levels, and
>    describe the mapping of huge pages
>
> QEMU's page-table-walk code treats block and page entries
> identically, simply ORing in a number of bits from the input virtual
> address that depends on the level of the page table that we stopped
> at; we depend on the previous masking of descaddr with descaddrmask
> to have already cleared out the low bits of the descriptor word.
>
> This is not quite right: the address field in a block descriptor is
> smaller, and so there are bits which are valid address bits in a page
> descriptor or a table descriptor but which are not supposed to be
> part of the address in a block descriptor, and descaddrmask does not
> clear them.  We previously mostly got away with this because those
> descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
> block descriptor bit 16 is defined to be the nT bit.  No emulated
> QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
> see it when using KVM or hvf.
>
> Explicitly zero out all the descaddr bits we're about to OR vaddr
> bits into.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 088956eecf0..b5c8caafe84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>              indexmask = indexmask_grainsize;
>              continue;
>          }
> -        /* Block entry at level 1 or 2, or page entry at level 3.
> +        /*
> +         * Block entry at level 1 or 2, or page entry at level 3.
>           * These are basically the same thing, although the number
> -         * of bits we pull in from the vaddr varies.
> +         * of bits we pull in from the vaddr varies. Note that although
> +         * descaddrmask masks enough of the low bits of the descriptor
> +         * to give a correct page or table address, the address field
> +         * in a block descriptor is smaller; so we need to explicitly
> +         * clear the lower bits here before ORing in the low vaddr bits.
>           */
>          page_size = (1ULL << ((stride * (4 - level)) + 3));
> +        descaddr &= ~(page_size - 1);
>          descaddr |= (address & (page_size - 1));
>          /* Extract attributes from the descriptor */
>          attrs = extract64(descriptor, 2, 10)
> --
> 2.25.1

