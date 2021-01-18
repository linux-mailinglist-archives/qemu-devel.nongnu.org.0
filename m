Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287452FA35E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:43:53 +0100 (CET)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Vl2-0005Rw-4h
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1Vjd-0004Ua-CM
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:42:25 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1VjY-0002Ko-5P
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=rl4SYFQAifn4qpWJOaWl4q1+zc55bAcoAsETTefx/pI=; b=vRE2253BYeDiRkQQn3mEotUnH8
 buo1zMpeipF0AV/xbxquSDYrrq7AbNiFQ19K5MoSlnasktW93EmVQ9AlMZ8D4WUAqt89JsJitEVxE
 PumNmJuCNXsQoV6YXgKBdmDAbzZTaJW4BRdnxCR0NPZiWwgk4B0/eLo6kn4QQYRY/DiWsRzIqQlbg
 zeX+TUuhEJdUxPRLF7srO7wmEhh9O4SQIQwWWImhygMTIf6bTxvE79jErxDm3nVzlCTYpyiEyq2+T
 Gc+AmQrhaKDHwVcKuLAKQSE1TtsIN8haPOxGhAoNvIWhg/26Yh1yzOdd9ZTxYapxen3CZNXQsb9Lj
 Z0I2qcJWHGpXdIpOzVpCo3PMRe5/IC+e2WMAF3NX0e8HrUlU5SeNFpt80vebpw8iNEU00aCsDAO6Q
 oXQVDfUP5yU2fyyDvzeH7XlW5RBx3HyPr8DJuLOjYzxFJeVSJlhBuvyQfaFRSpHRcP2C2dud7K52T
 200f7MtuGL7779ed5s6dCnXRu/Ckwk5rJEfbJ1hQiIFvA9GkOUbv/wrgvRMjAvdux1ChIavSRKtSv
 tOroA9SlsEPpiEwY5VHSBSxs3nMWMUMMMKcP7sr+7FquY1fOpuLkUuuyE1LHf2vTVxgPIrUv7vVto
 sQQlsvFiG7PT8PGRKtLT32BG6PixByO0SsNUJAgsM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] 9pfs: Convert V9fsFidState::clunked to bool
Date: Mon, 18 Jan 2021 15:42:17 +0100
Message-ID: <1653749.QGb0FL96xq@silver>
In-Reply-To: <20210118142300.801516-2-groug@kaod.org>
References: <20210118142300.801516-1-groug@kaod.org>
 <20210118142300.801516-2-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 18. Januar 2021 15:22:58 CET Greg Kurz wrote:
> This can only be 0 or 1.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

I still need to go through the other 2 patches. I should be done tomorrow.

> ---
>  hw/9pfs/9p.c | 4 ++--
>  hw/9pfs/9p.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 6026b51a1c04..37c3379b7462 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -413,7 +413,7 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t
> fid) }
>      fidp = *fidpp;
>      *fidpp = fidp->next;
> -    fidp->clunked = 1;
> +    fidp->clunked = true;
>      return fidp;
>  }
> 
> @@ -544,7 +544,7 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
> 
>          /* Clunk fid */
>          s->fid_list = fidp->next;
> -        fidp->clunked = 1;
> +        fidp->clunked = true;
> 
>          put_fid(pdu, fidp);
>      }
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 32df81f360ea..93656323d1d7 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -279,7 +279,7 @@ struct V9fsFidState {
>      int open_flags;
>      uid_t uid;
>      int ref;
> -    int clunked;
> +    bool clunked;
>      V9fsFidState *next;
>      V9fsFidState *rclm_lst;
>  };




