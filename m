Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7432D2C6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:23:36 +0100 (CET)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHn0w-0008Bp-Sr
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHmzn-0007f5-O3
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHmzk-0000Gy-5Q
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614860539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fLbFvGbjjd2zMHnrWM8NqrBrmdUaIJlgzGaD7D1oyoA=;
 b=VH0SojqO8kJ1Ae4GRRrZ7/qPEX1Ppe1KRecDJfBnJ2vPOg7oai8WvJtJQrkWjObED6C3Pf
 YNPGdNQWM8wx+P94iAcJKcyUrJ4Vyc/EVdtceoV0va8J74/UTtaJG+QGvppWH+g6L0/hNy
 gRi/NV5b/pd5DrYH1/oB0f5mA+McmWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-IgOdNqY2PteDfp8NwNrgNg-1; Thu, 04 Mar 2021 07:22:15 -0500
X-MC-Unique: IgOdNqY2PteDfp8NwNrgNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6EAA1940920;
 Thu,  4 Mar 2021 12:22:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C315D71B;
 Thu,  4 Mar 2021 12:22:12 +0000 (UTC)
Date: Thu, 4 Mar 2021 13:22:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] nbd: server: Report holes for raw images
Message-ID: <20210304122211.GB9607@merkur.fritz.box>
References: <20210219160752.1826830-1-nsoffer@redhat.com>
 <f136b2e8-3510-a150-27f9-e69ba14e39aa@redhat.com>
 <81464e3d-c0ee-ac12-c43b-d0f7180db482@redhat.com>
 <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Nir Soffer <nirsof@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 19.02.2021 19:58, Eric Blake wrote:
> > On 2/19/21 10:42 AM, Eric Blake wrote:
> > 
> > > > To me, data=false looks compatible with NBD_STATE_HOLE. From user point
> > > > of view, getting same results from qemu-nbd and qemu-img is more
> > > > important than being more correct about allocation status.
> > > 
> > > More to the point, here is our inconsistency:
> > > 
> > > In nbd/server.c, we turn !BDRV_BLOCK_ALLOCATED into NBD_STATE_HOLE
> > > 
> > > In block/nbd.c, we turn !NBD_STATE_HOLE into BDRV_BLOCK_DATA
> > > 
> > > The fact that we are not doing a round-trip conversion means that one of
> > > the two places is wrong.  And your argument that the server side is
> > > wrong makes sense to me.
> > 
> > In fact, when I went back and researched when this was introduced (see
> > commit e7b1948d51 in 2018), we may have been aware of the inconsistency
> > between client and server, but didn't make up our minds at the time:
> > https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03465.html
> > "? Hm, don't remember, what we decided about DATA/HOLE flags mapping.."
> > 
> > > 
> > > I'll wait a few days for any other reviewer commentary before taking
> > > this through my NBD tree.
> > > 
> > 
> 
> 
> I can add the following.
> 
> First, link to my research of block_status in Qemu:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg05136.html
> 
> And about HOLE and ZERO..
> 
> As I've noted in the research above, SCSI may return HOLE & !ZERO:
> 
> from SCSI: Logical Block Provisioning Read Zeros (LBPRZ) bit 1     If
> the logical block provisioning read zeros (LBPRZ) bit is set to one,
> then, for an unmapped LBA specified by a read operation, the
> deviceserver shall send user data with all bits set to zero to the
> data-in buffer.  0     If the TPRZ bit is set to zero, then, for an
> unmapped LBA specified by a read operation, the device server may send
> user data with all bitsset to any value to the data-in buffer.
> 
> So we can have an unmapped area that can be read as any random data.
> Same thing can be said about null-co driver with read-zeroes=false
> 
> Also, qcow2 support ALLOCATED ZERO clusters which reads as zero but
> data is allocated - they are reasonable to report as ZERO & !HOLE
> 
> And of-course UNALLOCATED ZERO clusters in qcow2 and lseek-holes are
> reasonable to report as ZERO & HOLE,  because they reads as zero and
> "future writes to that area may cause fragmentation or encounter an
> NBD_ENOSPC"..
> 
> So, all combination are reasonable, we just need to fix Qemu NBD
> server to report correct statuses in all these cases.
> 
> It seems that ZERO/HOLE specification is a lot more reasonable than
> what we have with ZERO/DATA/ALLOCATED in Qemu, and may be true way is
> move internal block_status to use NBD terms.

Is there not a 1:1 correspondence between our internal flags and the NBD
ones? ZERO is exactly the same, and HOLE is the inversion of DATA.

ALLOCATED is important internally when finding the node in a backing
file chain that actually defines the content, but for a user it doesn't
make a difference. This is why it isn't exposed in NBD.

So I think both QEMU and NBD use the flags that make sense in the
respective context.

Kevin


