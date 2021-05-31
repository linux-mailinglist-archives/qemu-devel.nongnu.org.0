Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7065B395ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:02:07 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lniUX-000199-5f
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lniS2-0008D0-Sl
 for qemu-devel@nongnu.org; Mon, 31 May 2021 09:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lniRx-0007zZ-Mw
 for qemu-devel@nongnu.org; Mon, 31 May 2021 09:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622469564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrkEPdz1inO2eVsg4JGWgYf35lmumTYiom5eNbnCqpM=;
 b=HBJ9O9lXXI2mzUpe85PAmo0CHReWisqVhYE6jxOHoeaGItAZtsYdJkZSoZU9Xnq2xGoFhK
 QIG7bhVFHw4sUKCHV9AMBXqR6AktBQD1t2pxFPYJ/O+DbVBpDoFqeVfPgZU+mPK37p5Zk5
 CnZQHWzfJGJkNtbq8fhNwcwZhPsGL0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-iTEciaCxPbST8qYiPagqxA-1; Mon, 31 May 2021 09:59:20 -0400
X-MC-Unique: iTEciaCxPbST8qYiPagqxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0361580D698;
 Mon, 31 May 2021 13:59:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522EE60936;
 Mon, 31 May 2021 13:59:18 +0000 (UTC)
Date: Mon, 31 May 2021 15:59:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/6] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <YLTrtE98m2zS3Spr@merkur.fritz.box>
References: <20210524163645.382940-1-pbonzini@redhat.com>
 <20210524163645.382940-3-pbonzini@redhat.com>
 <YK/ABCylKztcARUz@merkur.fritz.box>
 <5e4476a5-bfc6-b32b-3d80-bf075ba4d4b4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5e4476a5-bfc6-b32b-3d80-bf075ba4d4b4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: nsoffer@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.05.2021 um 22:14 hat Paolo Bonzini geschrieben:
> On 27/05/21 17:51, Kevin Wolf wrote:
> > Am 24.05.2021 um 18:36 hat Paolo Bonzini geschrieben:
> > > bs->sg is only true for character devices, but block devices can also
> > > be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> > > returns bytes in an int for /dev/sgN devices, and sectors in a short
> > > for block devices, so account for that in the code.
> > > 
> > > The maximum transfer also need not be a power of 2 (for example I have
> > > seen disks with 1280 KiB maximum transfer) so there's no need to pass
> > > the result through pow2floor.
> > > 
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > Looks like this is more or less a revert of Maxim's commit 867eccfe. If
> > this is what we want, should this old commit be mentioned in one way or
> > another in the commit message?
> 
> It is (but it is not intentional).
> 
> > Apparently the motivation for Maxim's patch was, if I'm reading the
> > description correctly, that it affected non-sg cases by imposing
> > unnecessary restrictions. I see that patch 1 changed the max_iov part so
> > that it won't affect non-sg cases any more, but max_transfer could still
> > be more restricted than necessary, no?
> 
> Indeed the kernel puts no limit at all, but especially with O_DIRECT we
> probably benefit from avoiding the moral equivalent of "bufferbloat".

Yeah, that sounds plausible, but on the other hand the bug report Maxim
addressed was about performance issues related to buffer sizes being too
small. So even if we want to have some limit, max_transfer of the host
device is probably not the right one for the general case.

> > For convenience, the bug report fixed with that patch is here:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1647104
> > 
> > Are we really trying to describe different things (limits for SG_IO and
> > for normal I/O) in one value with max_transfer, even though it could be
> > two different numbers for the same block device?
> 
> > > -static int sg_get_max_transfer_length(int fd)
> > > +static int sg_get_max_transfer_length(int fd, struct stat *st)
> > 
> > This is now a misnomer. Should we revert to the pre-867eccfe name
> > hdev_get_max_transfer_length()?
> 
> Yes.
> 
> > >   static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> > >   {
> > >       BDRVRawState *s = bs->opaque;
> > > +    struct stat st;
> > > +
> > > +    if (fstat(s->fd, &st)) {
> > > +        return;
> > 
> > Don't we want to set errp? Or do you intentionally ignore the error?
> 
> Yes, since we ignore errors from the ioctl I figured it's the same for fstat
> (just do not do the ioctls).
> 
> However, skipping raw_probe_alignment is wrong.
> 
> Thanks for the review!  Should I wait for you to go through the other
> patches?

I went through the whole series, but had no comments for the other
patches, so the rest should be good.

Kevin


