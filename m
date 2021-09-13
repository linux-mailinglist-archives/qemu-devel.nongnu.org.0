Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2C408D9E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:26:44 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlyt-00009S-L9
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlG7-0000tl-Dz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlG5-0001Bd-Ij
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L3c0yB0UM4jxehQaeIyZW3uxBAWU5b/NZ1bPA4wWlkI=;
 b=GHm/mzupX7I4HywyVpWeckOL1BG5FeXcTqWzUYQzMop62Uv2sV3BWrFNBAS8BX8QA0VA1T
 xSJ9oQ5uT+fj1fiYxgaNlAvJ8wo/VenmZHsM0Lpoi8+d59Hd/PYsIo0JZlESTMwYJBUsaw
 DE2F9zrsEQwB6Sf6fVMuDR+zNTqFf5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-UXULydYBMm-1QqpvI4lE1g-1; Mon, 13 Sep 2021 08:40:23 -0400
X-MC-Unique: UXULydYBMm-1QqpvI4lE1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D00319200C0;
 Mon, 13 Sep 2021 12:40:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22DE15D9CA;
 Mon, 13 Sep 2021 12:40:21 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:40:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YT9Gtdnb3HVLyt0k@stefanha-x1.localdomain>
References: <20210901160923.525651-1-stefanha@redhat.com>
 <YTnHwJ/0O4rk7M7g@redhat.com>
 <YTotkCiuqTeDgJJ0@stefanha-x1.localdomain>
 <YToxaOCMsLTLp4+M@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YToxaOCMsLTLp4+M@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GjdHS8kdhy3Wny20"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tingting Mao <timao@redhat.com>,
 qemu-devel@nongnu.org, Honghao Wang <wanghonghao@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GjdHS8kdhy3Wny20
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 05:08:08PM +0100, Daniel P. Berrang=E9 wrote:
> On Thu, Sep 09, 2021 at 04:51:44PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 09, 2021 at 09:37:20AM +0100, Daniel P. Berrang=E9 wrote:
> > > On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> > > > It was reported that enabling SafeStack reduces IOPS significantly
> > > > (>25%) with the following fio benchmark on virtio-blk using a NVMe =
host
> > > > block device:
> > > >=20
> > > >   # fio --rw=3Drandrw --bs=3D4k --iodepth=3D64 --runtime=3D1m --dir=
ect=3D1 \
> > > > =09--filename=3D/dev/vdb --name=3Djob1 --ioengine=3Dlibaio --thread=
 \
> > > > =09--group_reporting --numjobs=3D16 --time_based \
> > > >         --output=3D/tmp/fio_result
> > > >=20
> > > > Serge Guelton and I found that SafeStack is not really at fault, it=
 just
> > > > increases the cost of coroutine creation. This fio workload exhaust=
s the
> > > > coroutine pool and coroutine creation becomes a bottleneck. Previou=
s
> > > > work by Honghao Wang also pointed to excessive coroutine creation.
> > > >=20
> > > > Creating new coroutines is expensive due to allocating new stacks w=
ith
> > > > mmap(2) and mprotect(2). Currently there are thread-local and globa=
l
> > > > pools that recycle old Coroutine objects and their stacks but the
> > > > hardcoded size limit of 64 for thread-local pools and 128 for the g=
lobal
> > > > pool is insufficient for the fio benchmark shown above.
> > >=20
> > > Rather than keeping around a thread local pool of coroutine
> > > instances, did you ever consider keeping around a pool of
> > > allocated stacks ? Essentially it seems like you're syaing
> > > the stack allocation is the problem due to it using mmap()
> > > instead of malloc() and thus not benefiting from any of the
> > > performance tricks malloc() impls use to avoid repeated
> > > syscalls on every allocation.  If 'qemu_alloc_stack' and
> > > qemu_free_stack could be made more intelligent by caching
> > > stacks, then perhaps the coroutine side can be left "dumb" ?
> >=20
> > What is the advantage of doing that? Then the Coroutine struct needs to
> > be malloced each time. Coroutines are the only users of
> > qemu_alloc_stack(), so I think pooling the Coroutines is optimal.
>=20
> I mostly thought it might lead itself to cleaner implementation if the
> pooling logic is separate from the main coroutine logic. It could be
> easier to experiment with different allocation strategies if the code
> related to pooling is well isolated.

There is an advantage to pooling the Coroutine struct in addition to the
stack, so I'm not sure if it's worth reducing the scope of the pool.

Stefan

--GjdHS8kdhy3Wny20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/RrQACgkQnKSrs4Gr
c8jenwf/fRW2n1qn8AueRtQOfARep9YzXHLDBl8DvyegMeEDEAxHeqob1KXXn0wo
xee2PA+OVUVi3h6K8Zqdv3ieW1LYraUkbAz2oOXrb5y/k52dtkvdkpEzRPFRjzup
KoohtzYe7R6IvlqbGOgAwbqo82Yn6kGhA7KR4O8LKP+DQkYpX8py/jEyRIBPNsQd
T9eaw76UeAXjF5oKBsqCSjnyJYTKWPhtBJHCNnQIlXTtQu5xSDi4FFqEdXRfi4GB
Bbm/0mmJ99gIBbX75vxy0A++VHQlnTy3xpJRxgFrl1eDw4Y9Ht0Q+gxxIOzlr7SN
6cE2blIX2HeIDLnk07zg/0xDur1uGw==
=LXlI
-----END PGP SIGNATURE-----

--GjdHS8kdhy3Wny20--


