Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4696F07F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3Ep-00070h-Gk; Thu, 27 Apr 2023 11:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3El-00070Y-QE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3Ej-00055q-Ij
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682608103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXN68JOqz/idHsxr+lW1nUCLm6z6gSW/gcB76dxWRt4=;
 b=GQ/+LmJwlF6qo5/EP3xIv/KLsfk3XCNKB9RJGzOWn/+EEokf/mfw9/Qe3hSR4LMP7NQlVJ
 TZ0q2cexwKuKJrCwXaAesBNZbDyGKAyDnLfY7oGt/zwcVvnDyQCI3+SP5/1Nrwb9Wib71f
 X6B+X4EWttaes7D5sJRcRUnSHwmNmZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-USW-Qf-pNail0KPpSNwkBA-1; Thu, 27 Apr 2023 11:07:39 -0400
X-MC-Unique: USW-Qf-pNail0KPpSNwkBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675B718E6C71;
 Thu, 27 Apr 2023 15:07:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BFED1121314;
 Thu, 27 Apr 2023 15:07:19 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:07:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/20] qcow2: Don't call bdrv_getlength() in coroutine_fns
Message-ID: <t2hdbnwdbzyih7yrstklznn5zkco6clby7olin2wuwvxmyn5xb@endxlahdn65s>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-2-kwolf@redhat.com>
 <rur7ajjskl7pa24o5c6i4jtosi3qzhfmuu5ul2cn47anf46pzq@pou3kuqnx5up>
 <ZEpYq3CVl1iJUr3M@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEpYq3CVl1iJUr3M@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 27, 2023 at 01:12:43PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 20:37 hat Eric Blake geschrieben:
> > On Tue, Apr 25, 2023 at 07:31:39PM +0200, Kevin Wolf wrote:
> > > There is a bdrv_co_getlength() now, which should be used in coroutine
> > > context.
> > > 
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---

> > >  
> > > -static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
> > > -                                              bool want_zero,
> > > -                                              int64_t offset, int64_t count,
> > > -                                              int64_t *pnum, int64_t *map,
> > > -                                              BlockDriverState **file)
> > > +static int coroutine_fn GRAPH_RDLOCK
> > > +qcow2_co_block_status(BlockDriverState *bs, bool want_zero, int64_t offset,
> > > +                      int64_t count, int64_t *pnum, int64_t *map,
> > > +                      BlockDriverState **file)
> > >  {
> > 
> > Should the commit message also call out that you are using this
> > opportunity to add GRAPH_RDLOCK annotations on affected functions?
> 
> This is not just some additional change I did on the side, but the patch
> doesn't compile (on clang with TSA enabled) without it because
> bdrv_co_getlength() is GRAPH_RDLOCK, so its callers already must hold
> the lock.

Okay, that makes sense.

> 
> I can be more explicit about it in this patch, though I expect that the
> same situation might happen more often in the future, and I'm not sure
> if we want to mention that in the commit message any more than why we're
> passing through an Error pointer.

Still, a commit message something like:

There is a bdrv_co_getlength() now, which should be used in coroutine
context, which in turn requires more accurate function annotations.

would have helped me review faster.

> 
> > Overall, all changes in this patch make sense, but I'm reluctant to
> > add R-b unless you confirm whether this was a rebase mistake (where
> > the annotations were intended to be added in a later patch).
> 
> No, it's intentional.

All right, you've answered my question.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


