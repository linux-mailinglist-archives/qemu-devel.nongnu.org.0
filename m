Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26D22FE81A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:53:43 +0100 (CET)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xaw-00011T-Rm
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2XZl-0008Ca-Lt
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2XZi-0008Rr-FG
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611226345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yn4zBVSTVT1GTDsWRie1gU481Kfn7/CJCNMVxfXsRxU=;
 b=fDLvGSNOcIg1SkBGbdbourQbm8qB9a4E1/0DDdy2vyQotifoB4lGEwv2B0kBwSFAmpXSoz
 +rKh+W3jUumLQ/wvPO2pBRKGC+FSl59NZjk9m9q5Y457ktd3icPb+4ADrEwqcUxuTV/3dw
 b8ndzQCl87Ukff7kUKMdq0aHM0Q3QJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Yktm-gylOwagmZQuphFKEA-1; Thu, 21 Jan 2021 05:52:21 -0500
X-MC-Unique: Yktm-gylOwagmZQuphFKEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8571005586;
 Thu, 21 Jan 2021 10:52:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-104.ams2.redhat.com [10.36.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FBB70464;
 Thu, 21 Jan 2021 10:52:18 +0000 (UTC)
Date: Thu, 21 Jan 2021 11:52:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
Message-ID: <20210121105217.GA5466@merkur.fritz.box>
References: <cover.1610715661.git.berto@igalia.com>
 <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.01.2021 um 11:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 15.01.2021 16:02, Alberto Garcia wrote:
> > Hi,
> > 
> > during the past months we talked about making x-blockdev-reopen stable
> > API, and one of the missing things was having support for changing
> > bs->file. See here for the discusssion (I can't find the message from
> > Kashyap that started the thread in the web archives):
> > 
> >     https://lists.gnu.org/archive/html/qemu-block/2020-10/msg00922.html
> > 
> > I was testing this and one of the problems that I found was that
> > removing a filter node using this command is tricky because of the
> > permission system, see here for details:
> > 
> >     https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00092.html
> > 
> > The good news is that Vladimir posted a set of patches that changes
> > the way that permissions are updated on reopen:
> > 
> >     https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00745.html
> > 
> > I was testing if this would be useful to solve the problem that I
> > mentioned earlier and it seems to be the case so I wrote a patch to
> > add support for changing bs->file, along with a couple of test cases.
> > 
> > This is still an RFC but you can see the idea.
> 
> Good idea and I glad to see that my patches help:)
> 
> Hmm, still, removing a filter which want to unshare WRITE even when
> doesn't have any parents will be a problem anyway, so we'll need a new
> command to drop filter with a logic like in bdrv_drop_filter in my
> series.
> 
> Or, we can introduce multiple reopen.. So that x-blockdev-reopen will
> take a list of BlockdevOptions, and do all modifications in one
> transaction. Than we'll be able to drop filter by transactional update
> of top node child and removing filter child link.

Internally, we already have reopen queues anyway, so it would make sense
to me to expose them externally and take a list of BlockdevOptions.
This way we should be able to do even complex changes of the graph where
adding some edges requires the removal of other edges in a single atomic
operation.

Kevin


