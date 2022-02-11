Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFC4B2699
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 13:59:15 +0100 (CET)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIVW6-0003u9-J1
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 07:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIV2G-0007Xc-Af
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:28:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIV2C-0006VC-LF
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S+EdwNwrWRXstiFgbw4zbSi+inXm46Cw8IxjxFqoATA=;
 b=ZtR32kTQz3MXBhxR2H1qxcRs4D1/KGftUrtZVlOak/rl4pVRKLxlUb/p0Ia4LJgMN/H5B0
 amtRo3wscEP2Qb7LuQ/aanZHig5/OjtGZiCVrAyPk6OMePlzVrY8kNtUInXztjUI3H/leV
 dB0K0hoR8Qm0L2u/LlOVTpU8Hncokg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-k6gllriFN-KI-UAuHHLXkA-1; Fri, 11 Feb 2022 07:28:16 -0500
X-MC-Unique: k6gllriFN-KI-UAuHHLXkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E3C8143E5;
 Fri, 11 Feb 2022 12:28:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04590105910A;
 Fri, 11 Feb 2022 12:28:12 +0000 (UTC)
Date: Fri, 11 Feb 2022 13:28:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 2/6] block.c: bdrv_replace_child_noperm: first remove the
 child, and then call ->detach()
Message-ID: <YgZWW21Aw/iC4Jep@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208153655.1251658-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Doing the opposite can make ->detach() (more precisely
> bdrv_unapply_subtree_drain() in bdrv_child_cb_detach) undo the subtree_drain
> just performed to protect the removal of the child from the graph,
> thus making the fully-enabled assert_bdrv_graph_writable fail.
> 
> Note that assert_bdrv_graph_writable is not yet fully enabled.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 4551eba2aa..ec346a7e2e 100644
> --- a/block.c
> +++ b/block.c
> @@ -2854,14 +2854,16 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>      }
>  
>      if (old_bs) {
> -        /* Detach first so that the recursive drain sections coming from @child
> +        assert_bdrv_graph_writable(old_bs);
> +        QLIST_REMOVE(child, next_parent);
> +        /*
> +         * Detach first so that the recursive drain sections coming from @child
>           * are already gone and we only end the drain sections that came from
> -         * elsewhere. */
> +         * elsewhere.
> +         */

This comment is confusing, but that's not your fault.

It was originally added in commit d736f119dae and referred to calling
.detach() before calling .drained_end(), which was the very next thing
it would do. Commit debc2927671 moved the .drained_end() code to the end
of the whole operation, but left this comment (and a similar one for
.attach() and .drained_begin()) around even though it doesn't explain
the new code very well any more.

>          if (child->klass->detach) {
>              child->klass->detach(child);
>          }
> -        assert_bdrv_graph_writable(old_bs);
> -        QLIST_REMOVE(child, next_parent);
>      }
>  
>      child->bs = new_bs;

After digging into what the comment really meant, I think it doesn't
refer to the order of QLIST_REMOVE() and .detach(). The change looks
safe to me.

I would just suggest updating the comment to explain the order you're
fixing here instead of the now irrelevant one.

Kevin


