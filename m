Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C3466460
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 14:14:04 +0100 (CET)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msluV-0006FX-4l
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 08:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mslqZ-00049p-Jr
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 08:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mslqW-0002ra-Ti
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 08:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638450596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LMUoAg1a3kC8e3vE2fBKMHl7PlQsuT5a8h3MUw27EZY=;
 b=iss8Ct1Bp7Bp2paxLe+JmjlijGnHQBLozk5YsDU1nIjfoGtLJmuXTyD4qSGD5iMp7FSGAZ
 dQexY3S4RgOOzwtvlIRhqEJMyDgqdYnVnQL6uhKdjDU9K1K7wZxdcwOvh92SYHwHDEhwVX
 PSO5VYAnKHAwfPlL2WSWEzGQ6JuNwyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-23-ct93dGd5NESpclHDY52ugw-1; Thu, 02 Dec 2021 08:09:53 -0500
X-MC-Unique: ct93dGd5NESpclHDY52ugw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B578D0751;
 Thu,  2 Dec 2021 13:09:32 +0000 (UTC)
Received: from localhost (unknown [10.39.195.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C2010013D6;
 Thu,  2 Dec 2021 13:09:31 +0000 (UTC)
Date: Thu, 2 Dec 2021 13:09:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] aio-posix: split poll check from ready handler
Message-ID: <YajFg9YW9wKulgqU@stefanha-x1.localdomain>
References: <20211130112057.252679-1-stefanha@redhat.com>
 <20211201115508.tjcwyft7bkfc2mbi@steredhat>
MIME-Version: 1.0
In-Reply-To: <20211201115508.tjcwyft7bkfc2mbi@steredhat>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tSpd1/AoHywh8+rp"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tSpd1/AoHywh8+rp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 12:55:08PM +0100, Stefano Garzarella wrote:
> On Tue, Nov 30, 2021 at 11:20:57AM +0000, Stefan Hajnoczi wrote:
> > @@ -657,10 +704,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
> >     }
> >=20
> >     progress |=3D aio_bh_poll(ctx);
> > -
> > -    if (ret > 0) {
> > -        progress |=3D aio_dispatch_ready_handlers(ctx, &ready_list);
> > -    }
> > +    progress |=3D aio_dispatch_ready_handlers(ctx, &ready_list);
>=20
> I honestly don't know this code well, so this change isn't clear to me.
>=20
> IIUC this is necessary because we now use REVENTS_POLL_READY, so even if
> `wait` is interrupted, we want to run the handlers ready so far.
> Or maybe is it an unrelated optimization?

Previously we didn't need to run aio_dispatch_ready_handlers() in
polling mode (ret would be 0). Now we do, so the conditional needs to be
removed.

There is no change for the ctx->fdmon_ops->wait() -EINTR case. fdmon
won't add handlers to ready_list when returning -EINTR and previously
polling would run handlers immediately. In order to preserve that
behavior we now need to call aio_dispatch_ready_handlers()
unconditionally because polling may have added handlers.

Stefan

--tSpd1/AoHywh8+rp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGoxYMACgkQnKSrs4Gr
c8hs7gf/fJiEwflDZZzhzv/uDQBbxskvWXTqLQTvS70SD0sSmD9Q3dCbg25RtJj7
cUwb+wRObuUpkAe+0ucspwRyM9fOpvzhyIZAUCu+bb2qUlocder89TXGqFbMUDFZ
1CCp/mu0xk0XXKvYG5XTYP1fU5ovMtuSnsZK7pErbAfE1jAHlUCIrBun8OMw3A2K
j7Savp3ELvktvRTux5BdoWrzEeEvGvNt4nRKApPfYLakXURiX0ZcGDJtrs/TbwGJ
MAuJrTNEmpFw0U6kH4LAsMIa2iU7EZVG6JCZgAHniUK5CVKyW9yq9bomlLeUDvKT
04sTZbNMVr+ZpVVXZZefhbfgpfiXyw==
=/Ev/
-----END PGP SIGNATURE-----

--tSpd1/AoHywh8+rp--


