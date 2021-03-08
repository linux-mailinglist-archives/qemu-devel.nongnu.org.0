Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6595330B12
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:28:39 +0100 (CET)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD7u-0001K8-Om
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJD79-0000tO-4l
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:27:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJD77-0005A0-Mg
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615199268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VX0sMkJJXMbQSRKyFmr4gBAzV2dm+6QIBg7iMXTYggI=;
 b=gmX4bqhHYsCBRi6fIG6p4QNpFs7jC0Ubp3h62Lj/j67a8vQy9nvj4BETmAk9CrCxAYbusv
 akfgwFKWdkJVlyZxkMQTwe9Uq7c23U2/PzTzfm3dFRrfozlTd530gABDYeQmaEmBUHCk0/
 oKbFfzeOsd4jHzo3SQHJynq7uLWOLXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-P0gf_rvuMjubp_XEULTg8Q-1; Mon, 08 Mar 2021 05:27:46 -0500
X-MC-Unique: P0gf_rvuMjubp_XEULTg8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 168E41074644;
 Mon,  8 Mar 2021 10:27:45 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A42695D9D0;
 Mon,  8 Mar 2021 10:27:43 +0000 (UTC)
Date: Mon, 8 Mar 2021 10:27:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: wanghonghao <wanghonghao@bytedance.com>
Subject: Re: [PATCH v3 2/2] coroutine: take exactly one batch from global
 pool at a time
Message-ID: <YEX8HlJXUgfPYlQk@stefanha-x1.localdomain>
References: <20201016112640.91141-1-wanghonghao@bytedance.com>
 <20201016112640.91141-2-wanghonghao@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20201016112640.91141-2-wanghonghao@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AJnl6+k5UvT7qjG0"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AJnl6+k5UvT7qjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 07:26:40PM +0800, wanghonghao wrote:
> This patch replace the global coroutine queue with a lock-free stack of w=
hich
> the elements are coroutine queues. Threads can put coroutine queues into =
the
> stack or take queues from it and each coroutine queue has exactly
> POOL_BATCH_SIZE coroutines. Note that the stack is not strictly LIFO, but=
 it's
> enough for buffer pool.
>=20
> Coroutines will be put into thread-local pools first while release. Now t=
he
> fast pathes of both allocation and release are atomic-free, and there won=
't
> be too many coroutines remain in a single thread since POOL_BATCH_SIZE ha=
s been
> reduced to 16.
>=20
> In practice, I've run a VM with two block devices binding to two differen=
t
> iothreads, and run fio with iodepth 128 on each device. It maintains arou=
nd
> 400 coroutines and has about 1% chance of calling to `qemu_coroutine_new`
> without this patch. And with this patch, it maintains no more than 273
> coroutines and doesn't call `qemu_coroutine_new` after initial allocation=
s.
>=20
> Signed-off-by: wanghonghao <wanghonghao@bytedance.com>
> ---
>  util/qemu-coroutine.c | 63 ++++++++++++++++++++++++++++---------------
>  1 file changed, 42 insertions(+), 21 deletions(-)

Hi,
I noticed this patch received no reviews. If you would still like to get
it merged, please rebase to qemu.git/master and resend the patch series.

Feel free to reply to your patches to remind maintainers if they have
not reviewed it after a few days.

Thanks,
Stefan

--AJnl6+k5UvT7qjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBF/B4ACgkQnKSrs4Gr
c8jL2Af9HgoZOalhySp57S6hSijlLi6qBaFHjVygJK9n9LEq4tUfrIwq2Kz5LzoO
gv4WQ+JCEXERj/lr+6AmbKBfQsYNydPjezBHxIzl7rPvmBrOy3afMpnsbk3YFyEc
rz+Ziki8YUFESOgHLCYheHqqC2i1VqHbR7HWiv4XgqHinaTUSn/D7D6je4nQCqP0
TuIZeEq3avKrjj2QBl6NzkWzpCfuKug6Bj8K6ZEdfOBNqcYCZjmleNvykipNnLM3
aD9H72bcHzCcwcuyghizDQpnx1TfuTmDf6L2xKM2vRFUEBePD8Z+w1GHymqc/MSd
4nNwUs0EnZec48cJKGApzQ7WDmgO4Q==
=VHyR
-----END PGP SIGNATURE-----

--AJnl6+k5UvT7qjG0--


