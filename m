Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EAD1FCB3D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 12:48:33 +0200 (CEST)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVcO-0005Oa-2W
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 06:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlVbC-0004Uz-5w
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:47:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36185
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlVbA-0002co-7s
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592390835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWTWT6SgDOLYZj8IHpZCjhLkNFtVGcdoHMHHxY+3Prc=;
 b=eL8nk2LeB0kGP9u4ha9t0ayyyjZDj/bNLELE8OB92NALb7VC6v/DhcyOFRITT8vb/joUON
 zs53CPYgBX3E9Bgy5AX5ardYRKXBXOQZyxJK8WC9GSBrBZPoszwbdaptDvPWlUr6L/F/aY
 PbKm8HBWnj0VRKBVe4hrZ5tic/ubdV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490--4S6YYXAPFqJ9TlqdeFgEw-1; Wed, 17 Jun 2020 06:47:13 -0400
X-MC-Unique: -4S6YYXAPFqJ9TlqdeFgEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A05F594B24;
 Wed, 17 Jun 2020 10:47:12 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FC919C71;
 Wed, 17 Jun 2020 10:47:10 +0000 (UTC)
Date: Wed, 17 Jun 2020 12:47:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] block: file-posix: Fail unmap with NO_FALLBACK on block
 device
Message-ID: <20200617104709.GA5166@linux.fritz.box>
References: <20200613170826.354270-1-nsoffer@redhat.com>
 <CAMRbyyswkaedF0dN2nPb3H8fj5+pmhLWh9GHGor4wUk_Su=b8A@mail.gmail.com>
 <20200616153241.GF4305@linux.fritz.box>
 <CAMRbyys3fL_vqswb72-F_vE8pBQ1SkZZmmMeUA_TuTwsew6iSw@mail.gmail.com>
 <CAMRbyyvD6kRdaitm6Oc6LAnF6_e+Y9y+jTPKNVq8ENLEKYyKng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyvD6kRdaitm6Oc6LAnF6_e+Y9y+jTPKNVq8ENLEKYyKng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 23:30:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: nirsof <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>, pl@kamp.de,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.06.2020 um 22:01 hat Nir Soffer geschrieben:
> On Tue, Jun 16, 2020 at 8:39 PM Nir Soffer <nsoffer@redhat.com> wrote:
> >
> > On Tue, Jun 16, 2020 at 6:32 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 15.06.2020 um 21:32 hat Nir Soffer geschrieben:
> > > > We can zero 2.3 g/s:
> > > >
> > > > # time blkdiscard -z test-lv
> > > >
> > > > real 0m43.902s
> > > > user 0m0.002s
> > > > sys 0m0.130s
> > >
> > > > We can write 445m/s:
> > > >
> > > > # dd if=/dev/zero bs=2M count=51200 of=test-lv oflag=direct conv=fsync
> > > > 107374182400 bytes (107 GB, 100 GiB) copied, 241.257 s, 445 MB/s
> > >
> > > So using FALLOC_FL_PUNCH_HOLE _is_ faster after all. What might not be
> > > faster is zeroing out the whole device and then overwriting a
> > > considerable part of it again.
> > >
> > > I think this means that we shouldn't fail write_zeroes at the file-posix
> > > level even if BDRV_REQ_NO_FALLBACK is given. Instead, qemu-img convert
> > > is where I see a fix.
> > >
> > > Certainly qemu-img could be cleverer and zero out more selectively. The
> > > idea of doing a blk_make_zero() first seems to have caused some
> > > problems, though of course its introduction was also justified with
> > > performance, so improving one case might hurt another if we're not
> > > careful.
> > >
> > > However, when Peter Lieven introduced this (commit 5a37b60a61c), we
> > > didn't use write_zeroes yet during the regular copy loop (we do since
> > > commit 690c7301600). So chances are that blk_make_zero() doesn't
> > > actually help any more now.
> > >
> > > Can you run another test with the patch below?
> >
> > Sure, I can try this.
> 
> Tried it, and it performs the same as expected.

Thanks.

> > > I think it should perform
> > > the same as yours. Eric, Peter, do you think this would have a negative
> > > effect for NBD and/or iscsi?
> > >
> > > The other option would be providing an option and making it Someone
> > > Else's Problem.
> > >
> > > Kevin
> > >
> > >
> > > diff --git a/qemu-img.c b/qemu-img.c
> > > index d7e846e607..bdb9f6aa46 100644
> > > --- a/qemu-img.c
> > > +++ b/qemu-img.c
> > > @@ -2084,15 +2084,6 @@ static int convert_do_copy(ImgConvertState *s)
> > >          s->has_zero_init = bdrv_has_zero_init(blk_bs(s->target));
> > >      }
> > >
> > > -    if (!s->has_zero_init && !s->target_has_backing &&
> > > -        bdrv_can_write_zeroes_with_unmap(blk_bs(s->target)))
> > > -    {
> > > -        ret = blk_make_zero(s->target, BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK);
> > > -        if (ret == 0) {
> > > -            s->has_zero_init = true;
> > > -        }
> > > -    }
> >
> > This will work of course, but now we will not do bulk zero for any target
> 
> I would like to have a minimal change to increase the chance that we
> can consume this very soon in oVirt.

I think this one would be pretty minimal.

Maybe we can later bring this code back, but with an implementation of
blk_make_zero() that doesn't use the generic write_zeroes operation,
but with a specific callback like Eric suggested.

> > I think we never do this for regular files anyway since we truncate
> > files, and there is nothing to zero, but maybe there is some case
> > when this is useful?

Yes, regular files have s->has_zero_init == true anyway.

> > BTW, do we use BDRV_REQ_NO_FALLBACK elsewhere? maybe we can remove
> > it.

qcow2 uses it when zeroing out parts of a newly allocated cluster on
partial writes. Though that code is questionable, too, and XFS people
suggest that we should stop using it.

Kevin


