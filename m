Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9394B270C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:27:40 +0100 (CET)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIVxb-0001dW-DV
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIV8G-0000td-Hm
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIV8E-0007OE-FH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DiGBwMzZP9OQsLmPoe5g4IETmffIfpeRCLbrAmLqwLw=;
 b=Tju+uWjwtMDuP5IIPlD/TafHVVE3gD0wgyEaQTVfPGaWNMHFYScWjVHitsTo8TVIVjcEvN
 EKot1gNpAbB/R+pWDjgdZh5S9UCZbOrDGzC5UKbqknTunedsMpop2OaU+N8ih5L07g4k2T
 u/DnLfcH7tOyZXvW7c+u3E0ttU4uB9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-MRnOXlLNNFWCJHCe4mGEaA-1; Fri, 11 Feb 2022 07:34:33 -0500
X-MC-Unique: MRnOXlLNNFWCJHCe4mGEaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E018E83DD21;
 Fri, 11 Feb 2022 12:34:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE6B78DFE;
 Fri, 11 Feb 2022 12:34:20 +0000 (UTC)
Date: Fri, 11 Feb 2022 13:34:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 3/6] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
Message-ID: <YgZXyuNKUozyXhip@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208153655.1251658-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
> Doing the opposite can make adding the child node to a non-drained node,
> as apply_subtree_drain is only done in ->attach() and thus make
> assert_bdrv_graph_writable fail.
> 
> This can happen for example during a transaction rollback (test 245,
> test_io_with_graph_changes):
> 1. a node is removed from the graph, thus it is undrained
> 2. then something happens, and we need to roll back the transactions
>    through tran_abort()
> 3. at this point, the current code would first attach the undrained node
>    to the graph via QLIST_INSERT_HEAD, and then call ->attach() that
>    will take care of restoring the drain with apply_subtree_drain(),
>    leaving the node undrained between the two operations.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/block.c b/block.c
> index ec346a7e2e..08a6e3a4ef 100644
> --- a/block.c
> +++ b/block.c
> @@ -2872,8 +2872,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>      }
>  
>      if (new_bs) {
> -        assert_bdrv_graph_writable(new_bs);
> -        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>  
>          /*
>           * Detaching the old node may have led to the new node's
> @@ -2890,6 +2888,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>          if (child->klass->attach) {
>              child->klass->attach(child);
>          }
> +
> +        assert_bdrv_graph_writable(new_bs);
> +        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
> +
>      }

Extra empty line. Looks good otherwise.

Does this also mean that the order in bdrv_child_cb_attach/detach() is
wrong? Or maybe adding a new node to bs->children is okay even when the
child node isn't drained.

Kevin


