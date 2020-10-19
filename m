Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7289292711
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 14:17:23 +0200 (CEST)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUU6M-0007bJ-Tp
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 08:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kUU2T-0005MU-Na
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kUU2Q-0004KL-Es
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603109596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9g4UVmvISmG5aEvXw3+UeB365SaPjRfUDxfmQ1HAfk=;
 b=eq7pfkf1QrUKy3TSL1osRA8XmvNWTYLVll66/WTEmng0rv1hBTZl+JGKFYoh2jLNdMiZnL
 EM8EMOJk6buVEiV2SFD0qwQLEklHiHm+NO2znkJA1dURCsEQ45N8E80aaagNQtrtBWY9C3
 FID7yDO82487VY++aoaget8FeZxgHds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-e--ZGHEOP3easvDNPjC9rg-1; Mon, 19 Oct 2020 08:13:12 -0400
X-MC-Unique: e--ZGHEOP3easvDNPjC9rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B15D1803F44;
 Mon, 19 Oct 2020 12:13:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7075DA33;
 Mon, 19 Oct 2020 12:13:03 +0000 (UTC)
Date: Mon, 19 Oct 2020 14:13:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 02/13] block: use return status of bdrv_append()
Message-ID: <20201019121302.GD6508@merkur.fritz.box>
References: <20201016171057.6182-1-vsementsov@virtuozzo.com>
 <20201016171057.6182-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201016171057.6182-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: berto@igalia.com, pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, armbru@redhat.com, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.10.2020 um 19:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Now bdrv_append returns status and we can drop all the local_err things
> around it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>  block.c                     |  5 +----
>  block/backup-top.c          | 20 ++++++++------------
>  block/commit.c              |  5 +----
>  block/mirror.c              |  6 ++----
>  blockdev.c                  |  4 +---
>  tests/test-bdrv-graph-mod.c |  6 +++---
>  6 files changed, 16 insertions(+), 30 deletions(-)
> 
> diff --git a/block.c b/block.c
> index b05fbff42d..7b6818c681 100644
> --- a/block.c
> +++ b/block.c
> @@ -3161,7 +3161,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>      int64_t total_size;
>      QemuOpts *opts = NULL;
>      BlockDriverState *bs_snapshot = NULL;
> -    Error *local_err = NULL;
>      int ret;
>  
>      /* if snapshot, we create a temporary backing file and open it
> @@ -3208,9 +3207,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>       * order to be able to return one, we have to increase
>       * bs_snapshot's refcount here */
>      bdrv_ref(bs_snapshot);
> -    bdrv_append(bs_snapshot, bs, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (bdrv_append(bs_snapshot, bs, errp) < 0) {

We generally avoid calling functions with side effects inside a
comparison. Let's use the usual pattern:

    ret = bdrv_append(bs_snapshot, bs, errp);
    if (ret < 0) {
        ...
    }

(I mention it only once, but there are multiple instances in this
patch.)

>          bs_snapshot = NULL;
>          goto out;
>      }

> diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
> index 8cff13830e..2b71601c24 100644
> --- a/tests/test-bdrv-graph-mod.c
> +++ b/tests/test-bdrv-graph-mod.c
> @@ -101,7 +101,7 @@ static BlockDriverState *pass_through_node(const char *name)
>   */
>  static void test_update_perm_tree(void)
>  {
> -    Error *local_err = NULL;
> +    int ret;
>  
>      BlockBackend *root = blk_new(qemu_get_aio_context(),
>                                   BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ,
> @@ -114,8 +114,8 @@ static void test_update_perm_tree(void)
>      bdrv_attach_child(filter, bs, "child", &child_of_bds,
>                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
>  
> -    bdrv_append(filter, bs, &local_err);
> -    error_free_or_abort(&local_err);
> +    ret = bdrv_append(filter, bs, NULL);
> +    assert(ret < 0);

Usually, test cases use g_assert_cmpint() which prints the expected and
actual value if it fails.

Kevin


