Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73E2DACD0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:15:26 +0100 (CET)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9Ej-0001P8-PN
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp9CJ-0000PT-Bm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:12:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp9CG-0000m4-Us
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608034371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45SVj6ixW5BIwfPuD+NTgrB4YHCHNS+cRbjYLlCLdog=;
 b=bWZW8y9vqINuSHIE7ENz+xNkfRCMbSLg1e+CKvyDOe1kzsb30r+LAmloVqmLcjjeEf78co
 oicfYh+Ecd89iJasNRhwFx6dqHRPRZ4LNZHVRCq8m19mTcpIXlOmOgMEgZANT3rHIU9dyh
 5yYEiUrVTxM/faCdbMNwp+fVwGQH46Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-DEshVlCCPQyfZLbZd14zsA-1; Tue, 15 Dec 2020 07:12:48 -0500
X-MC-Unique: DEshVlCCPQyfZLbZd14zsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB0E107ACE8;
 Tue, 15 Dec 2020 12:12:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22F819C44;
 Tue, 15 Dec 2020 12:12:34 +0000 (UTC)
Date: Tue, 15 Dec 2020 13:12:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201215121233.GD8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> While processing the parents of a BDS, one of the parents may process
> the child that's doing the tail recursion, which leads to a BDS being
> processed twice. This is especially problematic for the aio_notifiers,
> as they might attempt to work on both the old and the new AIO
> contexts.
> 
> To avoid this, add the BDS pointer to the ignore list, and check the
> child BDS pointer while iterating over the children.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/

What is the specific scenario where you saw this breaking? Did you have
multiple BdrvChild connections between two nodes so that we would go to
the parent node through one and then come back to the child node through
the other?

Maybe if what we really need to do is not processing every edge once,
but processing every node once, the list should be changed to contain
_only_ BDS objects. But then blk_do_set_aio_context() probably won't
work any more because it can't have blk->root ignored any more...

Anyway, if we end up changing what the list contains, the comment needs
an update, too. Currently it says:

 * @ignore will accumulate all visited BdrvChild object. The caller is
 * responsible for freeing the list afterwards.

Another option: Split the parents QLIST_FOREACH loop in two. First add
all parent BdrvChild objects to the ignore list, remember which of them
were newly added, and only after adding all of them call
child->klass->set_aio_ctx() for each parent that was previously not on
the ignore list. This will avoid that we come back to the same node
because all of its incoming edges are ignored now.

Kevin

>  block.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index f1cedac362..bc8a66ab6e 100644
> --- a/block.c
> +++ b/block.c
> @@ -6465,12 +6465,17 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>      bdrv_drained_begin(bs);
>  
>      QLIST_FOREACH(child, &bs->children, next) {
> -        if (g_slist_find(*ignore, child)) {
> +        if (g_slist_find(*ignore, child) || g_slist_find(*ignore, child->bs)) {
>              continue;
>          }
>          *ignore = g_slist_prepend(*ignore, child);
>          bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
>      }
> +    /*
> +     * Add a reference to this BS to the ignore list, so its
> +     * parents won't attempt to process it again.
> +     */
> +    *ignore = g_slist_prepend(*ignore, bs);
>      QLIST_FOREACH(child, &bs->parents, next_parent) {
>          if (g_slist_find(*ignore, child)) {
>              continue;
> -- 
> 2.26.2
> 


