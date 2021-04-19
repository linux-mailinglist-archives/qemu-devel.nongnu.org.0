Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696073642BD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:14:18 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYTjF-000569-HM
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYTiR-0004cB-Vc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYTiN-0002fH-FD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618838002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lIr7GxvfNhYGQtNKiHHc/g4LsxySWyAiO/wJuv1Cbes=;
 b=HuPCRTgo6D6WfYW3ZvMxU3EAi8DZoL1Ry6y5+w1YlpkOP0k1cd62KRN0+tTpOoRl32aNUC
 Qg9mH9DqsP7sLE+3eh8emyyZ5TuRQcU/wWAggPE6CDzjnh5RoonAlcoBUnt43Lcv1a3Qru
 U7+/zszem04PnwqR8+CIBTem5coHMC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Z0JW1j_oM9y4FzZNuINk3Q-1; Mon, 19 Apr 2021 09:13:20 -0400
X-MC-Unique: Z0JW1j_oM9y4FzZNuINk3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FD2107ACFC;
 Mon, 19 Apr 2021 13:13:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-122.ams2.redhat.com [10.36.114.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDDA60C5C;
 Mon, 19 Apr 2021 13:13:17 +0000 (UTC)
Date: Mon, 19 Apr 2021 15:13:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] block/file-posix: Fix problem with fallocate(PUNCH_HOLE)
 on GPFS
Message-ID: <YH2B65hwSGmDGJek@merkur.fritz.box>
References: <20210416052333.1548853-1-thuth@redhat.com>
 <CAMRbyytmcZHggOtxJ09Lu4QEke-B=Hz_+cf_HLqRV9joQWaG=Q@mail.gmail.com>
 <0b9b354c-c708-af16-105a-0e738eafa69e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0b9b354c-c708-af16-105a-0e738eafa69e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.04.2021 um 07:06 hat Thomas Huth geschrieben:
> On 16/04/2021 22.34, Nir Soffer wrote:
> > On Fri, Apr 16, 2021 at 8:23 AM Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > A customer reported that running
> > > 
> > >   qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2
> > > 
> > > fails for them with the following error message when the images are
> > > stored on a GPFS file system:
> > > 
> > >   qemu-img: error while writing sector 0: Invalid argument
> > > 
> > > After analyzing the strace output, it seems like the problem is in
> > > handle_aiocb_write_zeroes(): The call to fallocate(FALLOC_FL_PUNCH_HOLE)
> > > returns EINVAL, which can apparently happen if the file system has
> > > a different idea of the granularity of the operation. It's arguably
> > > a bug in GPFS, since the PUNCH_HOLE mode should not result in EINVAL
> > > according to the man-page of fallocate(), but the file system is out
> > > there in production and so we have to deal with it. In commit 294682cc3a
> > > ("block: workaround for unaligned byte range in fallocate()") we also
> > > already applied the a work-around for the same problem to the earlier
> > > fallocate(FALLOC_FL_ZERO_RANGE) call, so do it now similar with the
> > > PUNCH_HOLE call.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   block/file-posix.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > index 20e14f8e96..7a40428d52 100644
> > > --- a/block/file-posix.c
> > > +++ b/block/file-posix.c
> > > @@ -1675,6 +1675,13 @@ static int handle_aiocb_write_zeroes(void *opaque)
> > >               }
> > >               s->has_fallocate = false;
> > >           } else if (ret != -ENOTSUP) {
> > > +            if (ret == -EINVAL) {
> > > +                /*
> > > +                 * File systems like GPFS do not like unaligned byte ranges,
> > > +                 * treat it like unsupported (so caller falls back to pwrite)
> > > +                 */
> > > +                return -ENOTSUP;
> > 
> > This skips the next fallback, using plain fallocate(0) if we write
> > after the end of the file. Is this intended?
> > 
> > We can treat the buggy EINVAL return value as "filesystem is buggy,
> > let's not try other options", or "let's try the next option". Since falling
> > back to actually writing zeroes is so much slower, I think it is better to
> > try the next option.
> 
> I just did the same work-around as in commit 294682cc3a7 ... so if we agree
> to try the other options, too, we should change that spot, too...

Yes, changing both places to fall back to the next option feels right to
me.

> However, what is not clear to me, how would you handle s->has_write_zeroes
> and s->has_discard in such a case? Set them to "false"? ... but it could
> still work for some blocks with different alignment ... but if we keep them
> set to "true", the code tries again and again to call these ioctls, maybe
> wasting other precious cycles for this?

That it could still work for other requests is a good point. So I think
EINVAL shouldn't disable s->has_*, but otherwise behave the same as
ENOTSUP.

You're right that we're potentially wasting cycles for trying unaligned
requests again and again, but that they fail isn't our fault and the
benefit of having efficient zero writes with aligned requests seems more
important that losing a few cycles on unaligned requests.

> Maybe we should do a different approach instead: In case we hit a EINVAL
> here, print an error a la:
> 
>  error_report_once("You are running on a buggy file system, please complain
> to the file system vendor");
> 
> and return -ENOTSUP ... then it's hopefully clear to the users why they are
> getting a bad performance, and that they should complain to the file system
> vendor instead to get their problem fixed.

Sounds like a reasonable thing to do (probably in addition to the above)
when we know that a file system bug prevents us from getting optimal
performance.

Kevin


