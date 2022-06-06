Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F233F53ED24
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:44:12 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGlu-0007Co-NQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGhq-0005cc-S7
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:40:01 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGhp-0005j4-0H
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:39:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1447611F9;
 Mon,  6 Jun 2022 17:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8ADC385A9;
 Mon,  6 Jun 2022 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654537195;
 bh=E/KMnli56ivgtHivCHSxhFbFmO5hhJAc+qxXDBOiGA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dqPPcERDgLy7UOVMWr0wE4JSao4f0SHl9kKM4pcwpLEqi/UwsSVIE3a//Cbjthm3H
 tfjYJ/rmXn2oNn90Nq/yPZ3T6LNc4QZfvM9g7S+vY62sg7PYC18GmGyhYFXqHfAS9Y
 BUksNhvAaP/KJXlLMB+wtFhj9Yo090zVliN5S86u/FATlCTzsJb9ySIX+j8Zj9Byk7
 9nUi4aPu05WbkBPPiKmlQHxqxLE3MUjyT12MtiuDBdLDvP1bN4UJcIl/Dx+6tYLSgi
 3AI7959N8DXjJW/1tZRdonZq2xweKDBQh+7TBqeCdIYow6lWnmMuFiy/Gr43WFtj6y
 xyrqKzqecM5vw==
Date: Mon, 6 Jun 2022 10:39:52 -0700
From: Ben Widawsky <bwidawsk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH] hw/cxl: Fix missing write mask for HDM decoder target
 list registers
Message-ID: <20220606173952.66q3gtwtydrs7xwb@bwidawsk-mobl5>
References: <20220531123953.17582-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531123953.17582-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=bwidawsk@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22-05-31 13:39:53, Jonathan Cameron wrote:
> Without being able to write these registers, no interleaving is possible.
> More refined checks of HDM register state on commit to follow.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-component-utils.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index 7985c9bfca..993248b5c0 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -174,6 +174,8 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
>          write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
>          write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
>          write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
> +        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
> +        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;

I wonder if this should be 0. It will be weird for endpoints to have a skip
value of 0xff.

>      }
>  }
>  
> -- 
> 2.32.0
> 

