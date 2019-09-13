Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81102B1B52
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8iQt-0004qm-47
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8iOq-0003xq-6N
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8iOp-0001YA-81
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:01:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52824)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8iOm-0001X4-9t; Fri, 13 Sep 2019 06:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 875FB308429D;
 Fri, 13 Sep 2019 10:01:51 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C2F1600CE;
 Fri, 13 Sep 2019 10:01:47 +0000 (UTC)
Date: Fri, 13 Sep 2019 12:01:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190913100146.GC8312@dhcp-200-226.str.redhat.com>
References: <20190816153015.447957-1-vsementsov@virtuozzo.com>
 <20190816153015.447957-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816153015.447957-4-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 13 Sep 2019 10:01:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 3/5] block/qcow2: refactor
 qcow2_co_preadv_part
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.08.2019 um 17:30 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Further patch will run partial requests of iterations of
> qcow2_co_preadv in parallel for performance reasons. To prepare for
> this, separate part which may be parallelized into separate function
> (qcow2_co_preadv_task).
> 
> While being here, also separate encrypted clusters reading to own
> function, like it is done for compressed reading.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/block-core.json |   2 +-
>  block/qcow2.c        | 205 +++++++++++++++++++++++--------------------
>  2 files changed, 111 insertions(+), 96 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 0d43d4f37c..dd80aa11db 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3266,7 +3266,7 @@
>              'pwritev_rmw_tail', 'pwritev_rmw_after_tail', 'pwritev',
>              'pwritev_zero', 'pwritev_done', 'empty_image_prepare',
>              'l1_shrink_write_table', 'l1_shrink_free_l2_clusters',
> -            'cor_write', 'cluster_alloc_space', 'none'] }
> +            'cor_write', 'cluster_alloc_space', 'none', 'read_encrypted'] }

What's the point of this new blkdebug event?

Obviously, read_aio for an encrypted image must mean a read of encrypted
data. The same image can never trigger both read_aio and
read_encrypted, so why do we need to distinguish them as two different
events?

Kevin

