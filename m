Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5D2F6EC4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 00:04:18 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Bf6-0001Di-QE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 18:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0BeH-0000ec-Dg; Thu, 14 Jan 2021 18:03:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:59884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0BeF-0002it-Mp; Thu, 14 Jan 2021 18:03:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CDF523A5C;
 Thu, 14 Jan 2021 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610665401;
 bh=8y6KnMvVtHYwwP92WLW1Vy12t6qXb/FJNFBJkb0Xdqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dbYJm3qzHbAyJgLYGBbpHoJoLoVNGJI7dGOgA5uaS1rq+G+Hr18vQkNpHTG4avoR1
 2FqFZHAwIrKbhBVj3xu69fQBkPuf1ghz6JUOxa07j91UexLZMmi3dCLHjJSnDKg/3T
 EKJOmoQ8q1AbKzGV1tR6fmtk1G/nscEZMDfgsNzVPi4kZlIe6L//Z1WQjZRXumqskB
 JhYzMBPHpZN7yyJDRoAI+Vrtit8o1YSwJoQPPxMiIvTeZt4A+3dSroUe4HlylPrUSR
 MIj+/MJS6Soq9M66z989/cRccFUYGHNoYvqVAQR44KySVGir0w2jsm1AaVXy6JQa0H
 DnMG+YEGnnjSg==
Date: Thu, 14 Jan 2021 15:03:19 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix zone write finalize
Message-ID: <20210114230319.GC1511902@dhcp-10-100-145-180.wdc.com>
References: <20210112094235.188686-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112094235.188686-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 10:42:35AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The zone write pointer is unconditionally advanced, even for write
> faults. Make sure that the zone is always transitioned to Full if the
> write pointer reaches zone capacity.

Looks like some spec weirdness. It says we can transition to full:

  b) as a result of successful completion of a write operation that
     writes one or more logical blocks that causes the zone to reach its
     writeable zone capacity;

But a failed write also advances the write pointer as you've pointed
out, so they might want to strike "successful".

Looks fine to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 0854ee307227..280b31b4459d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1268,10 +1268,13 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
>      nlb = le16_to_cpu(rw->nlb) + 1;
>      zone = nvme_get_zone_by_slba(ns, slba);
>  
> +    zone->d.wp += nlb;
> +
>      if (failed) {
>          res->slba = 0;
> -        zone->d.wp += nlb;
> -    } else if (zone->w_ptr == nvme_zone_wr_boundary(zone)) {
> +    }
> +
> +    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {

The previous check was using 'zone->w_ptr', but now it's 'zone->d.wp'.
As far as I can tell, this difference will mean the zone won't finalize
until the last write completes, where before it could finalize after the
zone's last write is submitted. Either way looks okay, but I think these
two values ought to always be in sync.

>          switch (nvme_get_zone_state(zone)) {
>          case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> @@ -1288,9 +1291,6 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
>          default:
>              assert(false);
>          }
> -        zone->d.wp = zone->w_ptr;
> -    } else {
> -        zone->d.wp += nlb;
>      }
>  }

