Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE64B22B0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 16:54:47 +0200 (CEST)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8myE-0006ZQ-WC
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 10:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8mv5-0002r6-Cs
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8mv4-000129-9X
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:51:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54460)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8mv1-00010a-H5; Fri, 13 Sep 2019 10:51:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99665300BEA6;
 Fri, 13 Sep 2019 14:51:26 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A8A9600C6;
 Fri, 13 Sep 2019 14:51:25 +0000 (UTC)
Date: Fri, 13 Sep 2019 16:51:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190913145123.GL8312@dhcp-200-226.str.redhat.com>
References: <20190913125909.15348-1-mlevitsk@redhat.com>
 <20190913125909.15348-2-mlevitsk@redhat.com>
 <5d578974-d02d-8b05-8d51-85715d1d4468@virtuozzo.com>
 <5fdc4891c02c7977762bb76fd877e4383e04be0c.camel@redhat.com>
 <20190913142450.GI8312@dhcp-200-226.str.redhat.com>
 <fcde308649669fa3379d8477b06194634e0ccd44.camel@redhat.com>
 <7ab84515-3097-fd0d-4b81-2f10d247f91a@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab84515-3097-fd0d-4b81-2f10d247f91a@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 14:51:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 1/3] block/qcow2: refactoring of
 threaded encryption code
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.09.2019 um 16:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 13.09.2019 17:37, Maxim Levitsky wrote:
> > On Fri, 2019-09-13 at 16:24 +0200, Kevin Wolf wrote:
> >> Am 13.09.2019 um 16:07 hat Maxim Levitsky geschrieben:
> >>> On Fri, 2019-09-13 at 14:01 +0000, Vladimir Sementsov-Ogievskiy wrote:
> >>>> 13.09.2019 15:59, Maxim Levitsky wrote:
> >>>>> This commit tries to clarify few function arguments,
> >>>>> and add comments describing the encrypt/decrypt interface
> >>>>>
> >>>>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> >>>>> ---
> >>>>>    block/qcow2-cluster.c |  9 ++++---
> >>>>>    block/qcow2-threads.c | 62 ++++++++++++++++++++++++++++++++++---------
> >>>>>    block/qcow2.c         |  5 ++--
> >>>>>    block/qcow2.h         |  8 +++---
> >>>>>    4 files changed, 61 insertions(+), 23 deletions(-)
> >>>>>
> >>>>> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> >>>>> index f09cc992af..46b0854d7e 100644
> >>>>> --- a/block/qcow2-cluster.c
> >>>>> +++ b/block/qcow2-cluster.c
> >>>>> @@ -463,8 +463,8 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
> >>>>>    }
> >>>>>    
> >>>>>    static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
> >>>>> -                                                uint64_t src_cluster_offset,
> >>>>> -                                                uint64_t cluster_offset,
> >>>>> +                                                uint64_t guest_cluster_offset,
> >>>>> +                                                uint64_t host_cluster_offset,
> >>>>>                                                    unsigned offset_in_cluster,
> >>>>>                                                    uint8_t *buffer,
> >>>>>                                                    unsigned bytes)
> >>>>> @@ -474,8 +474,9 @@ static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
> >>>>>            assert((offset_in_cluster & ~BDRV_SECTOR_MASK) == 0);
> >>>>>            assert((bytes & ~BDRV_SECTOR_MASK) == 0);
> >>>>>            assert(s->crypto);
> >>>>> -        if (qcow2_co_encrypt(bs, cluster_offset,
> >>>>> -                             src_cluster_offset + offset_in_cluster,
> >>>>> +        if (qcow2_co_encrypt(bs,
> >>>>> +                             host_cluster_offset + offset_in_cluster,
> >>>>> +                             guest_cluster_offset + offset_in_cluster,
> >>>>
> >>>> oops, seems you accidentally fixed the bug, which you are going to fix in the next
> >>>> patch, as now correct offsets are given to qcow2_co_encrypt :)
> >>>>
> >>>> and next patch no is a simple no-logic-change refactoring, so at least commit message
> >>>> should be changed.
> >>>
> >>> Yep :-( I am trying my best in addition to fixing the bug, also clarify the area to
> >>> avoid this from happening again.
> >>>
> >>> What do you think that I fold these two patches together after all?
> >>
> >> No, just make sure that your refactoring patch is really just
> >> refactoring without semantic change, i.e. make sure to preserve the bug
> >> in this patch.
> >>
> >> Maybe you should actually have two refactoring patches (this one without
> >> the addition of offset_in_cluster, and patch 2) and an additional
> >> one-liner for the actual fix.
> >>
> >> Kevin
> > 
> > Let me do it simplier I'll just split it to one liner patch that fixes it
> > and second patch that does all the refactoring.
> > 
> 
> [me typing actually the same suggestion in parallel, but you were the first]
> 
> I think it's the best: firstly fix the bug in a simple patch and then
> refactor to make code better.
> 
> I expect something like simply
> s/cluster_offset/start_of_cluster(cluster_offset + offset_in_cluster) in
> qcow2_co_encrypt call from do_perform_cow_encrypt,
> yes?

Yes, I think that's the right fix.

Kevin

