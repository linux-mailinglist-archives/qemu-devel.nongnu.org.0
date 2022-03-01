Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F54C8E69
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:56:55 +0100 (CET)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3vq-0008Rt-4D
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nP3u9-0006qO-6s; Tue, 01 Mar 2022 09:55:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nP3u7-0000Gd-0G; Tue, 01 Mar 2022 09:55:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8806B81AA9;
 Tue,  1 Mar 2022 14:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80765C340EE;
 Tue,  1 Mar 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646146496;
 bh=DZFkNVkWM++1nE/Fc+Ik2PaAHWstkhrbKjO9ln59gI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IOJvVuu7QJHii2Af+SlsTr5EFexChnBEte1urxEtY9lj7hjO8XXx4Q0l43bg8JW2U
 VmK3uPExReejWLY6/fkJZYVGlEWpZqOQbiwi6QY4JRpUsLlfvi3LeIhTiTN/TllkP2
 94JTVo1fDSc1jShxdmH3dbW3WcFfSKmIna+850XThxfyPcg2v6GrQ9DSLsOnMgSChL
 c04PRNRnN6u03bGRSwnAX3nHPQQgMEm8H5mS0J7BfxzWeuoZJHmc1VUc9rfVoFhs9S
 MGlrw+fmAAt/eB401SUr42ZJUDh36vBfYu5hsne4Izeleuj1yqXiYHK6Hu9vtI/cBp
 Xu/28sUs9WP6w==
Date: Tue, 1 Mar 2022 06:54:53 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 0/6] hw/nvme: enhanced protection information (64-bit
 guard)
Message-ID: <20220301145453.GB364422@dhcp-10-100-145-180.wdc.com>
References: <20220301104428.160017-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301104428.160017-1-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 11:44:22AM +0100, Klaus Jensen wrote:
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
>   [1]: https://lore.kernel.org/linux-nvme/20220201190128.3075065-1-kbusch@kernel.org/

Thanks Klaus, this looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

