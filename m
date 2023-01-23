Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77009677DBF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxaf-0001uX-Hk; Mon, 23 Jan 2023 09:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pJxad-0001sD-Ex
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:14:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pJxab-0002nD-VD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674483265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTIHqlfoypbKdhkSMZ8YX1xl+OLo38M2sfXwQbF2nzM=;
 b=VLu489GuUB/S2azzu+um2qBHefaJvdJGFnJq/UEctc4yn0YpT5N31WnZAhyfV0dX448zQY
 ACnrIesnbOeVjHKXBe69pxS7F4UwRku3ehJ/y1zZOiiQM0MXYJMmdcSv/IAeXR/7tcaJJV
 LZL+Mn3bc4OXanq9iooVdguagS+rQ9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-ONVhkuP3P52KRpx2YLYwuA-1; Mon, 23 Jan 2023 09:14:22 -0500
X-MC-Unique: ONVhkuP3P52KRpx2YLYwuA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7DB101A5B4;
 Mon, 23 Jan 2023 14:14:21 +0000 (UTC)
Received: from angien.pipo.sk (ovpn-208-29.brq.redhat.com [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F50492C3C;
 Mon, 23 Jan 2023 14:14:20 +0000 (UTC)
Date: Mon, 23 Jan 2023 15:14:17 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] block/blkio: Fix inclusion of required headers
Message-ID: <Y86WOQDpLYMHhXGR@angien.pipo.sk>
References: <2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com>
 <87h6whbb9a.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6whbb9a.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
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

On Mon, Jan 23, 2023 at 15:01:37 +0100, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
> > After recent header file inclusion rework the build fails when the blkio
> > module is enabled:
> >
> > ../block/blkio.c: In function ‘blkio_detach_aio_context’:
> > ../block/blkio.c:321:24: error: implicit declaration of function ‘bdrv_get_aio_context’; did you mean ‘qemu_get_aio_context’? [-Werror=implicit-function-declaration]
> >   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
> >       |                        ^~~~~~~~~~~~~~~~~~~~
> >       |                        qemu_get_aio_context
> > ../block/blkio.c:321:24: error: nested extern declaration of ‘bdrv_get_aio_context’ [-Werror=nested-externs]
> > ../block/blkio.c:321:24: error: passing argument 1 of ‘aio_set_fd_handler’ makes pointer from integer without a cast [-Werror=int-conversion]
> >   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
> >       |                        ^~~~~~~~~~~~~~~~~~~~~~~~
> >       |                        |
> >       |                        int
> > In file included from /home/pipo/git/qemu.git/include/qemu/job.h:33,
> >                  from /home/pipo/git/qemu.git/include/block/blockjob.h:30,
> >                  from /home/pipo/git/qemu.git/include/block/block_int-global-state.h:28,
> >                  from /home/pipo/git/qemu.git/include/block/block_int.h:27,
> >                  from ../block/blkio.c:13:
> > /home/pipo/git/qemu.git/include/block/aio.h:476:37: note: expected ‘AioContext *’ but argument is of type ‘int’
> >   476 | void aio_set_fd_handler(AioContext *ctx,
> >       |                         ~~~~~~~~~~~~^~~
> > ../block/blkio.c: In function ‘blkio_file_open’:
> > ../block/blkio.c:821:34: error: passing argument 2 of ‘blkio_attach_aio_context’ makes pointer from integer without a cast [-Werror=int-conversion]
> >   821 |     blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
> >       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
> >       |                                  |
> >       |                                  int
> >
> 
> My apologies...
> 
> Why are modules disabled by default?

libblkio is too new and is not yet packaged too widely. IIUC it's
supposed to be included e.g. in Fedora 38, so you most likely don't have
the dependancy.

I actually installed it explicitly since I wanted to give it a try.


