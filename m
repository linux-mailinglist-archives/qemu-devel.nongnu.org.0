Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295001CD099
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 06:24:10 +0200 (CEST)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXzz7-0006V7-7h
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 00:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1jXzxt-00062Q-NF; Mon, 11 May 2020 00:22:53 -0400
Received: from relay68.bu.edu ([128.197.228.73]:53244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1jXzxs-00025k-Mx; Mon, 11 May 2020 00:22:53 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 04B4LoBk011088
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 11 May 2020 00:21:56 -0400
Date: Mon, 11 May 2020 00:21:50 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] net: use peer when purging queue in
 qemu_flush_or_purge_queue_packets()
Message-ID: <20200511042150.44na6uwgf6mhdngx@mozz.bu.edu>
References: <20200511040453.23956-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511040453.23956-1-jasowang@redhat.com>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 00:22:51
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200511 1204, Jason Wang wrote:
> The sender of packet will be checked in the qemu_net_queue_purge() but
> we use NetClientState not its peer when trying to purge the incoming
> queue in qemu_flush_or_purge_packets(). This will trigger the assert
> in virtio_net_reset since we can't pass the sender check.
> 
> Fix by using the peer.
> 
> Reported-by: "Alexander Bulekov" <alxndr@bu.edu>
> Fixes: ca77d85e1dbf9 ("net: complete all queued packets on VM stop")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Hi Jason,
With this patch, I can no longer reproduce the crash

Acked-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

> ---
>  net/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 38778e831d..9e47cf727d 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -610,7 +610,7 @@ void qemu_flush_or_purge_queued_packets(NetClientState *nc, bool purge)
>          qemu_notify_event();
>      } else if (purge) {
>          /* Unable to empty the queue, purge remaining packets */
> -        qemu_net_queue_purge(nc->incoming_queue, nc);
> +        qemu_net_queue_purge(nc->incoming_queue, nc->peer);
>      }
>  }
>  
> -- 
> 2.20.1
> 

