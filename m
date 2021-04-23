Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA445369211
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZutt-0002YY-2P
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZusD-0001y0-GJ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZus7-0003nT-1M
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619180722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZzyxjarnlm0jrW2M2hYUZG23t8YyEhc/wn/0Uvl1fw=;
 b=aOVCrZlNc0X86IoWnw6r3ecZ2rANyCyRsz72cDabbMo9nJcMyhgjoYgfnFzkmitUNAhHQO
 s8VKNKaqxVD4GHRrMUZ+4fBgUqUZzZ/YzTswxU33DhY6yUN+Y4T7jq60jwgy+olXgV7NMo
 FNLuwt+Pugb4ed5RLudxC2xF58VVkak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-dJbg8eXIPEugcQ2TgKIxJg-1; Fri, 23 Apr 2021 08:25:20 -0400
X-MC-Unique: dJbg8eXIPEugcQ2TgKIxJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 783A2107ACC7;
 Fri, 23 Apr 2021 12:25:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D21F5D745;
 Fri, 23 Apr 2021 12:25:14 +0000 (UTC)
Date: Fri, 23 Apr 2021 14:25:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
Message-ID: <YIK8qAw+HwhQgiEI@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317143529.615584-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 15:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add the test that shows that concept of ignore_children is incomplete.
> Actually, when we want to update something, ignoring permission of some
> existing BdrvChild, we should ignore also the propagated effect of this
> child to the other children. But that's not done. Better approach
> (update permissions on already updated graph) will be implemented
> later.
> 
> Now the test fails, so it's added with -d argument to not break make
> check.
> 
> Test fails with
> 
>  "Conflicts with use by fl1 as 'backing', which does not allow 'write' on base"
> 
> because when updating permissions we can ignore original top->fl1
> BdrvChild. But we don't ignore exclusive write permission in fl1->base
> BdrvChild, which is propagated. Correct thing to do is make graph
> change first and then do permission update from the top node.
> 
> To run test do
> 
>   ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-exclusive-write
> 
> from <build-directory>/tests.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/unit/test-bdrv-graph-mod.c | 70 +++++++++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
> index c4f7d16039..4e4e83674a 100644
> --- a/tests/unit/test-bdrv-graph-mod.c
> +++ b/tests/unit/test-bdrv-graph-mod.c
> @@ -1,7 +1,7 @@
>  /*
>   * Block node graph modifications tests
>   *
> - * Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
> + * Copyright (c) 2019-2021 Virtuozzo International GmbH. All rights reserved.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -44,6 +44,21 @@ static BlockDriver bdrv_no_perm = {
>      .bdrv_child_perm = no_perm_default_perms,
>  };
>  
> +static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
> +                                  BdrvChildRole role,
> +                                  BlockReopenQueue *reopen_queue,
> +                                  uint64_t perm, uint64_t shared,
> +                                  uint64_t *nperm, uint64_t *nshared)
> +{
> +    *nperm = BLK_PERM_WRITE;
> +    *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
> +}
> +
> +static BlockDriver bdrv_exclusive_writer = {
> +    .format_name = "exclusive-writer",
> +    .bdrv_child_perm = exclusive_write_perms,
> +};
> +
>  static BlockDriverState *no_perm_node(const char *name)
>  {
>      return bdrv_new_open_driver(&bdrv_no_perm, name, BDRV_O_RDWR, &error_abort);
> @@ -55,6 +70,12 @@ static BlockDriverState *pass_through_node(const char *name)
>                                  BDRV_O_RDWR, &error_abort);
>  }
>  
> +static BlockDriverState *exclusive_writer_node(const char *name)
> +{
> +    return bdrv_new_open_driver(&bdrv_exclusive_writer, name,
> +                                BDRV_O_RDWR, &error_abort);
> +}
> +
>  /*
>   * test_update_perm_tree
>   *
> @@ -185,8 +206,50 @@ static void test_should_update_child(void)
>      blk_unref(root);
>  }
>  
> +/*
> + * test_parallel_exclusive_write
> + *
> + * Check that when we replace node, old permissions of the node being removed
> + * doesn't break the replacement.
> + */
> +static void test_parallel_exclusive_write(void)
> +{
> +    BlockDriverState *top = exclusive_writer_node("top");
> +    BlockDriverState *base = no_perm_node("base");
> +    BlockDriverState *fl1 = pass_through_node("fl1");
> +    BlockDriverState *fl2 = pass_through_node("fl2");
> +
> +    /*
> +     * bdrv_attach_child() eats child bs reference, so we need two @base
> +     * references for two filters:
> +     */
> +    bdrv_ref(base);
> +
> +    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
> +                      &error_abort);
> +    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
> +                      &error_abort);
> +    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
> +                      &error_abort);
> +
> +    bdrv_replace_node(fl1, fl2, &error_abort);
> +
> +    bdrv_unref(fl2); /* second reference was created by bdrv_replace_node() */

This line is new and I don't understand it.

Why does bdrv_replace_node() create new references? Shouldn't it just
move all parents of fl2 to fl1, and when the refcount of fl2 drops to
zero, it would be deleted?

If we have to unref manually, is this a bug?

> +    bdrv_unref(top);
> +}

Kevin


