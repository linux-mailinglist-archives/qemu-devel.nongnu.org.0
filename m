Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762B8F408
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 21:00:21 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyKyx-0005EH-E5
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 15:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyKqN-000683-DV
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:51:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyKqK-0000Tp-V2
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:51:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyKqK-0000Sa-N3
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:51:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56D4811A12;
 Thu, 15 Aug 2019 18:51:23 +0000 (UTC)
Received: from work-vm (ovpn-117-19.ams2.redhat.com [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33101001B12;
 Thu, 15 Aug 2019 18:51:20 +0000 (UTC)
Date: Thu, 15 Aug 2019 19:51:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>, kwolf@redhat.com, mreitz@redhat.com
Message-ID: <20190815185118.GB2883@work-vm>
References: <cover.1565892399.git.lukasstraub2@web.de>
 <20190815200823.3de1bd14@luklap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815200823.3de1bd14@luklap>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 15 Aug 2019 18:51:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] Replication: Ignore requests after
 failover
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lukas Straub (lukasstraub2@web.de) wrote:
> After failover the Secondary side of replication shouldn't change state, because
> it now functions as our primary disk.
> 
> In replication_start, replication_do_checkpoint, replication_stop, ignore
> the request if current state is BLOCK_REPLICATION_DONE (sucessful failover) or
> BLOCK_REPLICATION_FAILOVER (failover in progres i.e. currently merging active
> and hidden images into the base image).
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

We should add some block people to this one to review it; cc'ing in
Kevin and Max.

Dave

> ---
>  block/replication.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 3d4dedddfc..97cc65c0cf 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -454,6 +454,17 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>      aio_context_acquire(aio_context);
>      s = bs->opaque;
> 
> +    if (s->stage == BLOCK_REPLICATION_DONE ||
> +        s->stage == BLOCK_REPLICATION_FAILOVER) {
> +        /*
> +         * This case happens when a secondary is promoted to primary.
> +         * Ignore the request because the secondary side of replication
> +         * doesn't have to do anything anymore.
> +         */
> +        aio_context_release(aio_context);
> +        return;
> +    }
> +
>      if (s->stage != BLOCK_REPLICATION_NONE) {
>          error_setg(errp, "Block replication is running or done");
>          aio_context_release(aio_context);
> @@ -529,8 +540,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>                     "Block device is in use by internal backup job");
> 
>          top_bs = bdrv_lookup_bs(s->top_id, s->top_id, NULL);
> -        if (!top_bs || !bdrv_is_root_node(top_bs) ||
> -            !check_top_bs(top_bs, bs)) {
> +        if (!top_bs || !check_top_bs(top_bs, bs)) {
>              error_setg(errp, "No top_bs or it is invalid");
>              reopen_backing_file(bs, false, NULL);
>              aio_context_release(aio_context);
> @@ -577,6 +587,17 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
>      aio_context_acquire(aio_context);
>      s = bs->opaque;
> 
> +    if (s->stage == BLOCK_REPLICATION_DONE ||
> +        s->stage == BLOCK_REPLICATION_FAILOVER) {
> +        /*
> +         * This case happens when a secondary was promoted to primary.
> +         * Ignore the request because the secondary side of replication
> +         * doesn't have to do anything anymore.
> +         */
> +        aio_context_release(aio_context);
> +        return;
> +    }
> +
>      if (s->mode == REPLICATION_MODE_SECONDARY) {
>          secondary_do_checkpoint(s, errp);
>      }
> @@ -593,7 +614,7 @@ static void replication_get_error(ReplicationState *rs, Error **errp)
>      aio_context_acquire(aio_context);
>      s = bs->opaque;
> 
> -    if (s->stage != BLOCK_REPLICATION_RUNNING) {
> +    if (s->stage == BLOCK_REPLICATION_NONE) {
>          error_setg(errp, "Block replication is not running");
>          aio_context_release(aio_context);
>          return;
> @@ -635,6 +656,17 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>      aio_context_acquire(aio_context);
>      s = bs->opaque;
> 
> +    if (s->stage == BLOCK_REPLICATION_DONE ||
> +        s->stage == BLOCK_REPLICATION_FAILOVER) {
> +        /*
> +         * This case happens when a secondary was promoted to primary.
> +         * Ignore the request because the secondary side of replication
> +         * doesn't have to do anything anymore.
> +         */
> +        aio_context_release(aio_context);
> +        return;
> +    }
> +
>      if (s->stage != BLOCK_REPLICATION_RUNNING) {
>          error_setg(errp, "Block replication is not running");
>          aio_context_release(aio_context);
> --
> 2.20.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

