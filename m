Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F1645E69
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wyi-00040f-2S; Wed, 07 Dec 2022 11:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2wyf-0003yb-Qf
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2wye-0003Xl-85
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670429335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57lYLZUpTcCtgq8wtd1agzTDx882Z48d17P3yLAYQYw=;
 b=d+stQW/8F074m1HS7Q4KhX7g0UH79mv7PsUT846OUvVfLg7Y2nyOTqltKgW52qQfO1Z87e
 LpSO3gvYjc1SQs87XbVa82/+lA3SFfdxW3AGVNZlroNhZYLf4vIZ2sxJXKP0ll0yjwUtMW
 W7jqe0XayaVoIwa+sy62YwopXgW5hFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-XyMc_5sdOF-zOx42_lp-pg-1; Wed, 07 Dec 2022 11:08:52 -0500
X-MC-Unique: XyMc_5sdOF-zOx42_lp-pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ECA98630D0;
 Wed,  7 Dec 2022 16:08:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F6A40C2064;
 Wed,  7 Dec 2022 16:08:50 +0000 (UTC)
Date: Wed, 7 Dec 2022 17:08:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/18] block: Introduce a block graph rwlock
Message-ID: <Y5C6j2Y6c9RJBh8D@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
 <d49373f0-ba87-f976-726b-64ff15a5e371@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49373f0-ba87-f976-726b-64ff15a5e371@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 07.12.2022 um 15:12 hat Emanuele Giuseppe Esposito geschrieben:
> > Emanuele Giuseppe Esposito (7):
> >   graph-lock: Implement guard macros
> >   async: Register/unregister aiocontext in graph lock list
> >   block: wrlock in bdrv_replace_child_noperm
> >   block: remove unnecessary assert_bdrv_graph_writable()
> >   block: assert that graph read and writes are performed correctly
> >   block-coroutine-wrapper.py: introduce annotations that take the graph
> >     rdlock
> >   block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock
> > 
> > Kevin Wolf (10):
> >   block: Factor out bdrv_drain_all_begin_nopoll()
> >   Import clang-tsa.h
> >   clang-tsa: Add TSA_ASSERT() macro
> >   clang-tsa: Add macros for shared locks
> >   configure: Enable -Wthread-safety if present
> >   test-bdrv-drain: Fix incorrrect drain assumptions
> >   block: Fix locking in external_snapshot_prepare()
> >   graph-lock: TSA annotations for lock/unlock functions
> >   Mark assert_bdrv_graph_readable/writable() GRAPH_RD/WRLOCK
> >   block: GRAPH_RDLOCK for functions only called by co_wrappers
> > 
> > Paolo Bonzini (1):
> >   graph-lock: Introduce a lock to protect block graph operations
> > 
> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks!

> ^ I am curious to see if I am allowed to have my r-b also on my patches :)

That's actually a good question. I wondered myself whether I should add
my R-b to patches that I picked up from you, but which already have my
S-o-b now, of course, and are possibly modified by me.

I would say you're allowed as long as you actually reviewed them in the
version I sent to make sure that I didn't mess them up. :-)
And similarly I'll probably add my R-b on patches that contain code from
you.

Kevin


