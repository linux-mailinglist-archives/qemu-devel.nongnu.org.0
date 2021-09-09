Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C0405A78
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:56:05 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMPE-00073q-9L
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOMMU-0005m4-56
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOMMQ-0004Kc-97
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631202788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ho4fGLzWKv9i5ni42SoOi8bAMj5QcYavlDRdxfG21UE=;
 b=RUYC/Gu3AlqBRaHRytueyI//IBZod8Bqtgrt+z6HjHIH6IimribiMXt8ai2tPlZB7/zBsJ
 6SCA44XbTlzUJWcVtQdvYCtuIHVPKsa+7VQIS6O1kG1irVD2wBMOAwhOQMOo9qm3KyXc3u
 7s0g334UpEgBdknc7PF1jJnqBQVjuPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-NZG9bm5iOTyitadk-zX-qw-1; Thu, 09 Sep 2021 11:53:05 -0400
X-MC-Unique: NZG9bm5iOTyitadk-zX-qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703C984A5E5;
 Thu,  9 Sep 2021 15:53:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA0C5D9F4;
 Thu,  9 Sep 2021 15:53:03 +0000 (UTC)
Date: Thu, 9 Sep 2021 16:53:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YTot306rqLhNO4wA@stefanha-x1.localdomain>
References: <20210901160923.525651-1-stefanha@redhat.com>
 <YTCG/pLmM4d0TTeH@stefanha-x1.localdomain>
 <677df3db-fb9d-f64d-62f5-98857db5e6e6@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <677df3db-fb9d-f64d-62f5-98857db5e6e6@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iesmLzelmYBl8amX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, atheurer@redhat.com, jhopper@redhat.com,
 Tingting Mao <timao@redhat.com>, qemu-devel@nongnu.org,
 Honghao Wang <wanghonghao@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--iesmLzelmYBl8amX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 10:30:09PM -0400, Daniele Buono wrote:
> Stefan, the patch looks great.
> Thank you for debugging the performance issue that was happening with
> SafeStack.
>=20
> On 9/2/2021 4:10 AM, Stefan Hajnoczi wrote:
> > On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> > > It was reported that enabling SafeStack reduces IOPS significantly
> > > (>25%) with the following fio benchmark on virtio-blk using a NVMe ho=
st
> > > block device:
> > >=20
> > >    # fio --rw=3Drandrw --bs=3D4k --iodepth=3D64 --runtime=3D1m --dire=
ct=3D1 \
> > > =09--filename=3D/dev/vdb --name=3Djob1 --ioengine=3Dlibaio --thread \
> > > =09--group_reporting --numjobs=3D16 --time_based \
> > >          --output=3D/tmp/fio_result
> > >=20
> > > Serge Guelton and I found that SafeStack is not really at fault, it j=
ust
> > > increases the cost of coroutine creation. This fio workload exhausts =
the
> > > coroutine pool and coroutine creation becomes a bottleneck. Previous
> > > work by Honghao Wang also pointed to excessive coroutine creation.
> > >=20
> > > Creating new coroutines is expensive due to allocating new stacks wit=
h
> > > mmap(2) and mprotect(2). Currently there are thread-local and global
> > > pools that recycle old Coroutine objects and their stacks but the
> > > hardcoded size limit of 64 for thread-local pools and 128 for the glo=
bal
> > > pool is insufficient for the fio benchmark shown above.
> > >=20
> > > This patch changes the coroutine pool algorithm to a simple thread-lo=
cal
> > > pool without a size limit. Threads periodically shrink the pool down =
to
> > > a size sufficient for the maximum observed number of coroutines.
> > >=20
> > > This is a very simple algorithm. Fancier things could be done like
> > > keeping a minimum number of coroutines around to avoid latency when a
> > > new coroutine is created after a long period of inactivity. Another
> > > thought is to stop the timer when the pool size is zero for power sav=
ing
> > > on threads that aren't using coroutines. However, I'd rather not add
> > > bells and whistles unless they are really necessary.
>=20
> I agree we should aim at something that is as simple as possible.
>=20
> However keeping a minumum number of coroutines could be useful to avoid
> performance regressions from the previous version.
>=20
> I wouldn't say restore the global pool - that's way too much trouble -
> but keeping the old "pool size" configuration parameter as the miniumum
> pool size could be a good idea to maintain the previous performance in
> cases where the dynamic pool shrinks too much.

Good point. We're taking a risk by freeing all coroutines when the timer
expires. It's safer to stick to the old pool size limit to avoid
regressions.

I'll send another revision.

Stefan

--iesmLzelmYBl8amX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE6Ld4ACgkQnKSrs4Gr
c8jmoAf8CClFCEFVKx+XpBJtsyPHTDVSxdbUjEYJNqm8izxK/4a+yiHAPRQSADG+
Ya0pmCmsIthhgXjZj9hp03ch12PJe+NJN7A0xah9g0/DR3TLMDRfX+T72wv1DBa3
L1tRhJubbwrq/ntEegRMp0h/Yu4ZvCHfpgqnPpRdp0Tkn017cgu+nr+dkp6L/1MC
hfy6OKiXPWaBWRx/qI9oUx2puWgPuXGOFJ98amDqmxmY6JBmh1StJsQWa/rw4kko
uiV42WasrfK2ubEMZyRSXfDEY4pOE0eQsZ4LKORdB14cxVXZ4vxwebaGtORaKaQl
oIDuV6TwaFDs60yIw2XWV0nEzq8CWg==
=iE+0
-----END PGP SIGNATURE-----

--iesmLzelmYBl8amX--


