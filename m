Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C542FA28C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:07:14 +0100 (CET)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VBa-0004sA-0h
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1V9v-0004DW-BS
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1V9t-0001x8-JJ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610978728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTvTJgfmES4Wjv0XY9isP6A8JyUlfby4PK9m1zZNous=;
 b=cS14qZOOKI521hwuzoHDWU48wKrrFPE2diIyeKjTjyx5vIvvOqbs7AUa/DgqF8nFITJ1Qc
 pajmLRxDa8poCKLztTP0QgLj9HNsnP3O6CGDWUijVGcj3EBeytG0hvLeUQcLUUpjtDvAca
 6kpBMYMW19oKBoJAKhnIw8uHV938h5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-klh66MFrN6G6dDc-z2nFrA-1; Mon, 18 Jan 2021 09:05:25 -0500
X-MC-Unique: klh66MFrN6G6dDc-z2nFrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24F9A190A7A1;
 Mon, 18 Jan 2021 14:05:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A888D1001E73;
 Mon, 18 Jan 2021 14:05:22 +0000 (UTC)
Date: Mon, 18 Jan 2021 15:05:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 02/36] tests/test-bdrv-graph-mod: add
 test_parallel_perm_update
Message-ID: <20210118140521.GC11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add test to show that simple DFS recursion order is not correct for
> permission update. Correct order is topological-sort order, which will
> be introduced later.
> 
> Consider the block driver which has two filter children: one active
> with exclusive write access and one inactive with no specific
> permissions.
> 
> And, these two children has a common base child, like this:
> 
> ┌─────┐     ┌──────┐
> │ fl2 │ ◀── │ top  │
> └─────┘     └──────┘
>   │           │
>   │           │ w
>   │           ▼
>   │         ┌──────┐
>   │         │ fl1  │
>   │         └──────┘
>   │           │
>   │           │ w
>   │           ▼
>   │         ┌──────┐
>   └───────▶ │ base │
>             └──────┘
> 
> So, exclusive write is propagated.
> 
> Assume, we want to make fl2 active instead of fl1.
> So, we set some option for top driver and do permission update.
> 
> If permission update (remember, it's DFS) goes first through
> top->fl1->base branch it will succeed: it firstly drop exclusive write
> permissions and than apply them for another BdrvChildren.
> But if permission update goes first through top->fl2->base branch it
> will fail, as when we try to update fl2->base child, old not yet
> updated fl1->base child will be in conflict.
> 
> Now test fails, so it runs only with -d flag. To run do
> 
>   ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-perm-update
> 
> from <build-directory>/tests.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/test-bdrv-graph-mod.c | 64 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
> index 3b9e6f242f..27e3361a60 100644
> --- a/tests/test-bdrv-graph-mod.c
> +++ b/tests/test-bdrv-graph-mod.c
> @@ -232,6 +232,68 @@ static void test_parallel_exclusive_write(void)
>      bdrv_unref(top);
>  }
>  
> +static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
> +                                     BdrvChildRole role,
> +                                     BlockReopenQueue *reopen_queue,
> +                                     uint64_t perm, uint64_t shared,
> +                                     uint64_t *nperm, uint64_t *nshared)
> +{
> +    if (bs->file && c == bs->file) {
> +        *nperm = BLK_PERM_WRITE;
> +        *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
> +    } else {
> +        *nperm = 0;
> +        *nshared = BLK_PERM_ALL;
> +    }
> +}
> +
> +static BlockDriver bdrv_write_to_file = {
> +    .format_name = "tricky-perm",
> +    .bdrv_child_perm = write_to_file_perms,
> +};
> +
> +static void test_parallel_perm_update(void)
> +{
> +    BlockDriverState *top = no_perm_node("top");
> +    BlockDriverState *tricky =
> +            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
> +                                 &error_abort);
> +    BlockDriverState *base = no_perm_node("base");
> +    BlockDriverState *fl1 = pass_through_node("fl1");
> +    BlockDriverState *fl2 = pass_through_node("fl2");
> +    BdrvChild *c_fl1, *c_fl2;
> +
> +    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
> +                      &error_abort);
> +    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
> +                              BDRV_CHILD_FILTERED, &error_abort);
> +    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
> +                              BDRV_CHILD_FILTERED, &error_abort);
> +    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
> +                      &error_abort);
> +    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
> +                      &error_abort);
> +    bdrv_ref(base);
> +
> +    /* Select fl1 as first child to be active */
> +    tricky->file = c_fl1;
> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
> +
> +    assert(c_fl1->perm & BLK_PERM_WRITE);
> +
> +    /* Now, try to switch active child and update permissions */
> +    tricky->file = c_fl2;
> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
> +
> +    assert(c_fl2->perm & BLK_PERM_WRITE);
> +
> +    /* Switch once more, to not care about real child order in the list */
> +    tricky->file = c_fl1;
> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
> +
> +    assert(c_fl1->perm & BLK_PERM_WRITE);

Should we also assert in each case that the we don't hole the write
permission for the inactive child?

Kevin


