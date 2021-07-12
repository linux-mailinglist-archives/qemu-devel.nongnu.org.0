Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A7C3C4606
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:22:04 +0200 (CEST)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rCU-0007Nj-RQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m2rBd-0006ge-C7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m2rBY-0001Yl-8o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626078061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=StU/ugpBo7T1w+eEjCMS6OxEs0Lu7tINWP57631xVFE=;
 b=NX/aA7RpsBklnNp1IBcGRWPIC/M9xeDiN3Eb6QRz5Z8f3hCcDXegFSaq1y6tlQxupbGkwf
 f50MKPPhj/+jwieY95+HQgaM7aaZCXIdWjXUXE+VuU/1g2uA9fsi9s0855Y99XQ/JHzTDE
 LRcMrI3RolWNt9ScrYUoyjJeZGQKZAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-VMMlbL5UOJq1kfCWcgcYVw-1; Mon, 12 Jul 2021 04:21:00 -0400
X-MC-Unique: VMMlbL5UOJq1kfCWcgcYVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE826100C660;
 Mon, 12 Jul 2021 08:20:59 +0000 (UTC)
Received: from redhat.com (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375875D6AD;
 Mon, 12 Jul 2021 08:20:38 +0000 (UTC)
Date: Mon, 12 Jul 2021 10:18:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] block: Add option to use driver whitelist even in tools
Message-ID: <YOv61o84+UTgq7PX@redhat.com>
References: <20210709164141.254097-1-kwolf@redhat.com>
 <20210709174517.bauuzc42l5zjawph@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210709174517.bauuzc42l5zjawph@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.07.2021 um 19:45 hat Eric Blake geschrieben:
> On Fri, Jul 09, 2021 at 06:41:41PM +0200, Kevin Wolf wrote:
> > Currently, the block driver whitelists are only applied for the system
> > emulator. All other binaries still give unrestricted access to all block
> > drivers. There are use cases where this made sense because the main
> > concern was avoiding customers running VMs on less optimised block
> > drivers and getting bad performance. Allowing the same image format e.g.
> > as a target for 'qemu-img convert' is not a problem then.
> > 
> > However, if the concern is the supportability of the driver in general,
> > either in full or when used read-write, not applying the list driver
> > whitelist in tools doesn't help - especially since qemu-nbd and
> > qemu-storage-daemon now give access to more or less the same operations
> > in block drivers as running a system emulator.
> > 
> > In order to address this, introduce a new configure option that enforces
> > the driver whitelist in all binaries.
> 
> Is it feasible that someone would want two separate lists: one for
> qemu (which runs run efficiently) and another for tools (which ones do
> we support at all)?  As written, your patch offers no chance to
> distinguish between the two.

Possibly. However, supporting a second list would require a much larger
code change than this patch, so I'd say this is a problem we should only
solve when someone actually has it.

> Also, is now a good time to join the bandwagon on picking a more
> descriptive name (such as 'allow-list') for this terminology?

I don't have an opinion on the time, but I do have an opinion on using a
separate email thread for it. :-)

Initially I tried to find a way not to use "whitelist" in the new option
name, but that only made things inconsistent and confusing, and renaming
the existing options is definitely out of scope for this patch.

> > +++ b/block.c
> > @@ -6162,6 +6162,9 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
> >  
> >  void bdrv_init(void)
> >  {
> > +#ifdef CONFIG_BDRV_WHITELIST_TOOLS
> > +    use_bdrv_whitelist = 1;
> 
> Pre-existing, but this variable seems like a natural candidate to be
> bool instead of int.

Yes, I guess we could have a cleanup patch there.

Kevin


