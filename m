Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1DB6F04CD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:13:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przYX-0008GW-LS; Thu, 27 Apr 2023 07:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przYR-0008FH-QM
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przYQ-0008GU-Bc
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682593969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcqjlJUhDmx0uhA3/fECjNXICb0HxoBxDg6R4Lw80EY=;
 b=Ps8V3u0XlqkOTuMRMNI1T+Vt+QtOK1Ufa8UiglKs/fZodPF9pH2inyuRgoN0tC2aJj4rWs
 1KZD4oHJMDt+IRT+7J/VP2z16dsiH74f0ZhMaweNiuZqqxUuzeHoo1zY1PLxMvpTVIjQnA
 4zhcYT+504Kg3HETJvW+ZyQLpI8Et3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-144m1r8-N_6fypKZ-5gsPQ-1; Thu, 27 Apr 2023 07:12:46 -0400
X-MC-Unique: 144m1r8-N_6fypKZ-5gsPQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2025C1C06908;
 Thu, 27 Apr 2023 11:12:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A3D492B0F;
 Thu, 27 Apr 2023 11:12:44 +0000 (UTC)
Date: Thu, 27 Apr 2023 13:12:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/20] qcow2: Don't call bdrv_getlength() in coroutine_fns
Message-ID: <ZEpYq3CVl1iJUr3M@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-2-kwolf@redhat.com>
 <rur7ajjskl7pa24o5c6i4jtosi3qzhfmuu5ul2cn47anf46pzq@pou3kuqnx5up>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rur7ajjskl7pa24o5c6i4jtosi3qzhfmuu5ul2cn47anf46pzq@pou3kuqnx5up>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.04.2023 um 20:37 hat Eric Blake geschrieben:
> On Tue, Apr 25, 2023 at 07:31:39PM +0200, Kevin Wolf wrote:
> > There is a bdrv_co_getlength() now, which should be used in coroutine
> > context.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  block/qcow2.h          |  4 +++-
> >  block/qcow2-refcount.c |  2 +-
> >  block/qcow2.c          | 19 +++++++++----------
> >  3 files changed, 13 insertions(+), 12 deletions(-)
> 
> > 
> > diff --git a/block/qcow2.h b/block/qcow2.h
> > index c75decc38a..4f67eb912a 100644
> > --- a/block/qcow2.h
> > +++ b/block/qcow2.h
> > @@ -895,7 +895,9 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
> >                                  void *cb_opaque, Error **errp);
> >  int coroutine_fn GRAPH_RDLOCK qcow2_shrink_reftable(BlockDriverState *bs);
> >  int64_t coroutine_fn qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
> > -int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
> > +
> > +int coroutine_fn GRAPH_RDLOCK
> > +qcow2_detect_metadata_preallocation(BlockDriverState *bs);
> 
> > +++ b/block/qcow2.c
> > @@ -2089,11 +2089,10 @@ static void qcow2_join_options(QDict *options, QDict *old_options)
> >      }
> >  }
> >  
> > -static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
> > -                                              bool want_zero,
> > -                                              int64_t offset, int64_t count,
> > -                                              int64_t *pnum, int64_t *map,
> > -                                              BlockDriverState **file)
> > +static int coroutine_fn GRAPH_RDLOCK
> > +qcow2_co_block_status(BlockDriverState *bs, bool want_zero, int64_t offset,
> > +                      int64_t count, int64_t *pnum, int64_t *map,
> > +                      BlockDriverState **file)
> >  {
> 
> Should the commit message also call out that you are using this
> opportunity to add GRAPH_RDLOCK annotations on affected functions?

This is not just some additional change I did on the side, but the patch
doesn't compile (on clang with TSA enabled) without it because
bdrv_co_getlength() is GRAPH_RDLOCK, so its callers already must hold
the lock.

I can be more explicit about it in this patch, though I expect that the
same situation might happen more often in the future, and I'm not sure
if we want to mention that in the commit message any more than why we're
passing through an Error pointer.

> Overall, all changes in this patch make sense, but I'm reluctant to
> add R-b unless you confirm whether this was a rebase mistake (where
> the annotations were intended to be added in a later patch).

No, it's intentional.

Kevin


