Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4683A2D6C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:49:04 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrL3P-0003Xh-E3
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrL2S-0002hT-IY
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrL2N-0004z1-VS
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623332879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c47TiGdmzQnMdhyeDmS9fCXdfiBJmDUSyNHSxxG9fAc=;
 b=SABzuZmFu/OoqLuqyStJUD+Ds8LCOiSpcGPRJhGqS5twwRccSJVF2CXXijGwwK2c4QaXHA
 4/qUx4wF3XIqTk7WSmmguWOTOBpQGU+1CH3hISu3hU+EHVnYBAc3CGwlgmMt9K+1Ii7ick
 0iI2UCU8jMKcJvrtIA0RETIrGVzo1jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-KOiLNEpbPN2bolOrGLO6aA-1; Thu, 10 Jun 2021 09:47:56 -0400
X-MC-Unique: KOiLNEpbPN2bolOrGLO6aA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0673100C660;
 Thu, 10 Jun 2021 13:47:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E75C5C1CF;
 Thu, 10 Jun 2021 13:47:51 +0000 (UTC)
Date: Thu, 10 Jun 2021 08:47:49 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
Message-ID: <20210610134749.orq6cgyrtrjylduc@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
 <5563d5eb-c90b-6f09-e550-3b39cd76b641@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <5563d5eb-c90b-6f09-e550-3b39cd76b641@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 03:30:17PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > The correct fix is for ovirt to additionally use the
> > > qemu:allocation-depth metadata context added in 5.2: after all, the
> > > actual determination for what is needed to recreate a qcow2 file is
> > > not whether a cluster is sparse, but whether the allocation-depth
> > > shows the cluster to be local.  But reproducing an image is more
> > > efficient when handling known-zero clusters, which means that ovirt
> > > has to track both base:allocation and qemu:allocation-depth metadata
> > > contexts simultaneously.  While NBD_CMD_BLOCK_STATUS is just fine
> > > sending back information for two contexts in parallel, it comes with
> > > some bookkeeping overhead at the client side: the two contexts need
> > > not report the same length of replies, and it involves more network
> > > traffic.
> 
> Aren't both context described in one reply? Or what do you mean by not the same length?

The example file demonstrates this.  We have:

base.raw    ABC-
top.qcow2   -D0-
guest sees  AD00

Querying base:allocation returns:
         0       65536    3  hole,zero
     65536       65536    0  allocated
    131072      131072    3  hole,zero

Querying qemu:allocation-depth returns:
         0       65536    0  unallocated
     65536      131072    1  local
    196608       65536    0  unallocated

That is, the query starting at 64k returns different lengths (64k for
base:allocation, 128k for qemu:allocation-depth), and the client has
to process the smaller of the two regions before moving on to the next
query.  But if the client then does a query starting at 128k, it
either has to remember that it previously has information available
from the earlier qemu:allocation-depth, or repeats efforts over the
wire.

The joy of having a single metadata context return both pieces of
information at once is that the client no longer has to do this
cross-correlation between the differences in extent lengths of the
parallel contexts.

> > We discussed in the past the option to expose also the dirty status of every
> > block in the response. Again this info is available using
> > "qemu:dirty-bitmap:xxx"
> > but just like allocation depth and base allocation, merging the results is hard
> > and if we could expose also the dirty bit, this can make clients life
> > even better.
> > In this case I'm not sure "qemu:allocation" is the best name, maybe something
> > more generic like "qemu:extents" or "qemu:block-status" is even better.
> > 
> 
> Oops. Could you please describe, what's the problem with parsing several context simultaneously?

There is no inherent technical problem, just extra work.  Joining the
work at the server side is less coding effort than recoding the
boilerplate to join the work at every single client side.  And the
information is already present.  So we could just scrap this entire
RFC by stating that the information is already available, and it is
not worth qemu's effort to provide the convenience context.

Joining base:allocation and qemu:allocation-depth was easy - in fact,
since both use bdrv_block_status under the hood, we could (and
probably should!) merge it into a single qemu query.  But joining
base:allocation and qemu:dirty-bitmap:FOO will be harder, at which
point I question whether it is worth the complications.  And if you
argue that a joint context is not worthwhile without dirty bitmap(s)
being part of that joint context, then maybe this RFC is too complex
to worry about, and we should just leave the cross-correlation of
parallel contexts to be client-side, after all.


> 
> This all sound to me as we are going to implement "joint" combined conexts for every useful combination of existing contexts that user wants. So, it's a kind of workaround of inconvenient protocol we have invented in the past.
> 
> Doesn't it mean that we instead should rework, how we export several contexts? Maybe we can improve generic export of several contexts simultaneously, so that it will be convenient for the client? Than we don't need any additional combined contexts.

The NBD protocol intentionally left wiggle room for servers to report
different extent lengths across different contexts.  But other than
qemu, I don't know of any other NBD servers advertising alternate
contexts.  If we think we can reasonbly restrict the NBD protocol to
require that any server sending parallel contexts to a client MUST use
the same extent lengths for all parallel contexts (clients still have
to read multiple contexts, but the cross-correlation becomes easier
because the client doesn't have to worry about length mismatches), and
code that up in qemu, that's also something we can consider.

Or maybe even have it be an opt-in, where a client requests
NBD_OPT_ALIGN_META_CONTEXT; if the server acknowledges that option,
the client knows that it can request parallel NBD_OPT_SET_META_CONTEXT
and the extents replied to each NBD_OPT_BLOCK_STATUS will be aligned;
if the server does not acknowledge the option, then the client has the
choice of requesting at most one meta context, or else dealing with
unmatched extent lengths itself.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


