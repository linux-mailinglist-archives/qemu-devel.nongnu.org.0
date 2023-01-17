Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85566E4C8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:22:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpeg-0007rf-16; Tue, 17 Jan 2023 12:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHped-0007r7-TN
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHpec-0006XR-9R
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673976104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uC6y09rjV/F06b5aQhMM5vCxcgXBRuyADFAcT9jUjU=;
 b=I1/4x1ExdYLNpn7bkTluSqY/uKWKCNahnyWYcDdtY3sIxPVSEZVwfZ85/4H5PxvmnAmR98
 S9h+usWHt6Zwy2OyHtPJlJ2eFlMd5YAVS0RZmwgrJac1//zSYtWt85vzEPAw0APJb4T+uZ
 riSScGy+WerXwLB4c8E4b+1QQBJCqAI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-4DKTG2QDNs2DTFK1XCSXcg-1; Tue, 17 Jan 2023 12:21:18 -0500
X-MC-Unique: 4DKTG2QDNs2DTFK1XCSXcg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ABD33C106A2;
 Tue, 17 Jan 2023 17:21:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F4F4492B10;
 Tue, 17 Jan 2023 17:21:17 +0000 (UTC)
Date: Tue, 17 Jan 2023 18:21:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Message-ID: <Y8bZDDGwBB33TtDg@redhat.com>
References: <20221215130225.476477-3-pbonzini@redhat.com>
 <Y8bCbcWefiHfE9BT@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8bCbcWefiHfE9BT@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 17.01.2023 um 16:44 hat Kevin Wolf geschrieben:
> Am 15.12.2022 um 14:02 hat Paolo Bonzini geschrieben:
> > blkdebug events can be called from either non-coroutine or coroutine
> > contexts.  However, suspend actions only make sense from within
> > a coroutine.  Currently, using those action would lead to an abort() in
> > qemu_coroutine_yield() ("Co-routine is yielding to no one").  Catch them
> > and print an error instead.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  block.c                          |  2 +-
> >  block/blkdebug.c                 | 10 ++++++++--
> >  include/block/block-io.h         |  2 +-
> >  include/block/block_int-common.h |  3 ++-
> >  4 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/block.c b/block.c
> > index 3f2bd128570e..49c66475c73e 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -6334,7 +6334,7 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
> >      return drv->bdrv_get_specific_stats(bs);
> >  }
> >  
> > -void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> > +void coroutine_mixed_fn bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> >  {
> >      IO_CODE();
> >      if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
> > diff --git a/block/blkdebug.c b/block/blkdebug.c
> > index 4265ca125e25..ce297961b7db 100644
> > --- a/block/blkdebug.c
> > +++ b/block/blkdebug.c
> > @@ -31,6 +31,7 @@
> >  #include "block/qdict.h"
> >  #include "qemu/module.h"
> >  #include "qemu/option.h"
> > +#include "qemu/error-report.h"
> >  #include "qapi/qapi-visit-block-core.h"
> >  #include "qapi/qmp/qdict.h"
> >  #include "qapi/qmp/qlist.h"
> > @@ -837,7 +838,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> >      }
> >  }
> >  
> > -static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> > +static void coroutine_mixed_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> >  {
> >      BDRVBlkdebugState *s = bs->opaque;
> >      struct BlkdebugRule *rule, *next;
> > @@ -855,7 +856,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> >      }
> >  
> >      while (actions_count[ACTION_SUSPEND] > 0) {
> > -        qemu_coroutine_yield();
> > +        if (qemu_in_coroutine()) {
> > +            qemu_coroutine_yield();
> > +        } else {
> > +            error_report("Non-coroutine event %s cannot suspend\n",
> > +                         BlkdebugEvent_lookup.array[event]);
> 
> error_report() already adds a newline, so we shouldn't have an "\n"
> here.
> 
> > +        }
> >          actions_count[ACTION_SUSPEND]--;
> >      }
> >  }
> 
> Thanks, fixed this up and applied to the block branch.

In fact, this conflicts with a patch in my series:

[PATCH v2 13/14] block: Convert bdrv_debug_event() to co_wrapper_mixed

Resolving the conflict essentially reverts this one because after that
patch it actually is a coroutine_fn. So I may just drop this one agian.

Kevin


