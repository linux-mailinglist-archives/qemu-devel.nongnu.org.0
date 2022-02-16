Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE34B932F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:28:53 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRr2-000349-J2
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nKRoY-0002A0-5o; Wed, 16 Feb 2022 16:26:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nKRoV-0006bg-Sf; Wed, 16 Feb 2022 16:26:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E9D2B82071;
 Wed, 16 Feb 2022 21:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FB3C004E1;
 Wed, 16 Feb 2022 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645046771;
 bh=EN9irQYIH2M8OsXxl6EnEEfmiiKAgEsKCvldZSe1ucg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2UgFXWF3ZhiyMkL2/5BmUhiRkMxolgU+CFENQqiTIhvgbhh8nvAKRYKSFrQmaNiy
 zMXgRwpI5RylHB+kQHCTOfipaKwBvSJUykyFQDoH3Tnvu2LXLR4HoBc5EHHTjusiYE
 h+JXX0BisyYyXVmLsqc3PtMHZSTwnk6pmv9fslDcd2tAQ5ISeh2LB/WIGAyNeIYogl
 JGc74mHFxBEl3Zq4VHhPPCaAe7HeA/QI7o2XpFt0qP/7FQ+ITKiE5n/1runiPUvZ2o
 0E+BCHSIWtTXwyA8+lHxLQzM5iPMVBxYuYZujJseHUmUQ5X1TSIuqDnVUs14qGoEGj
 WnNkwAQEJnPQw==
Date: Wed, 16 Feb 2022 13:26:08 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/6] hw/nvme: enhanced protection information (64-bit
 guard)
Message-ID: <20220216212608.GB1949599@dhcp-10-100-145-180.wdc.com>
References: <20220214123029.106404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214123029.106404-1-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 01:30:23PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This adds support for one possible new protection information format
> introduced in TP4068 (and integrated in NVMe 2.0): the 64-bit CRC guard
> and 48-bit reference tag. This version does not support storage tags.
> 
> Like the CRC16 support already present, this uses a software
> implementation of CRC64 (so it is naturally pretty slow). But its good
> enough for verification purposes.
> 
> This goes hand-in-hand with the support that Keith submitted for the
> Linux kernel[1].
> 
> [1]: https://lore.kernel.org/linux-nvme/20220201190128.3075065-1-kbusch@kernel.org/

Other than comment on 6/6, series looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

