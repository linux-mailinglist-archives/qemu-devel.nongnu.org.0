Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018894139CA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 20:10:18 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSkDh-0004fX-IO
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 14:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSkCR-0003ri-TH
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 14:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSkCO-0006vZ-P1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 14:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632247734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7iNZGRkUbkorEGUAPufyz6l1Ev/TZiJeBSsJN8Fit0A=;
 b=brP8klsdHo2LtCK7EhgpFfPHCaDJ+lhkj1MYEf0AGYf48qJ40lVxtEZESqiJ7c5rDYF/To
 fPeAaAijTgeSGgUjO1yjQfTokSEhAK+cxEotaTrkFVfyGVlFwlxbYmSmwOToAb/W6NGDjk
 L8gb0oEUI+0kb1yxrRZGl9kd7B8pgGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-nCwim-0yOueRVCTA7rtWPw-1; Tue, 21 Sep 2021 14:08:47 -0400
X-MC-Unique: nCwim-0yOueRVCTA7rtWPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F20180830E;
 Tue, 21 Sep 2021 18:08:46 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 820335C3DF;
 Tue, 21 Sep 2021 18:08:45 +0000 (UTC)
Date: Tue, 21 Sep 2021 13:08:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] nbd/client: Request larger block status by default
Message-ID: <20210921180843.6tfubsqvf56hkyro@redhat.com>
References: <20210921161703.2682802-1-eblake@redhat.com>
 <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 08:25:11PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 21.09.2021 19:17, Eric Blake wrote:
> > Now that commit 5a1cfd21 has clarified that a driver's block_status
> > can report larger *pnum than in the original request, we can take
> > advantage of that in the NBD driver.  Rather that limiting our request
> > to the server based on the maximum @bytes our caller mentioned, we
> > instead ask for as much status as possible (the minimum of our 4G
> > limit or the rest of the export); the server will still only give us
> > one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
> > but now the block layer's caching of data areas can take advantage of
> > cases where the server gives us a large answer to avoid the need for
> > future NBD_CMD_BLOCK_STATUS calls.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---

> 
> I remember we already discussed that, but can't find.
> 
> The problem is that it's not for free:
> 
> In server code in blockstatus_to_extents, we loop though the disk, trying to merge extents of the same type.
> 
> With full allocated qcow2, we'll have to load all L2 tables and handle them, to merge all block status into one big "allocated" extent.
> 

We don't have to loop that far.  The NBD protocol allows the server to
stop looping at whatever point makes sense, as long as it makes
progress.

> Maybe, we need some additional negotiation flag, to allow BLOCK_STATUS command with NBD_CMD_FLAG_REQ_ONE flag to return an extent larger than required when that information is available for free?

That's one possibility.  Another does not add anything to the NBD
protocol, but instead limits the code that tries to loop over block
status to deteremine a larger "allocated" answer to return to instead
stop looping after a finite number of extents have been merged
together.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


