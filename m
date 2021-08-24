Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF103F5ECA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:15:59 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWHV-0008Hg-Sn
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWFu-0006KW-Lq
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWFo-0007Ve-SX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QE+M34kcTP9WCNm+Yo11ot6qt4mZK3JirqZW1/f6zM=;
 b=IP885ca/jRebAcQL/GGLVdjMmuQ3k4yREN37l4UsTqbEBv6Rzp35EQgksbY3ABjBtD2F0W
 ngS1xk6QhCJz8EdejrF2WC97Y/3jEE1Pxr0NVx863Bu6zUHX0bSIUM38rydBAWdCXhWq9A
 50N6OcZi9OkJBfClCx6Mgz634VCxImc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-o8SuB3W8OjSAGy-EEHllzQ-1; Tue, 24 Aug 2021 09:14:08 -0400
X-MC-Unique: o8SuB3W8OjSAGy-EEHllzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ADF3195D562;
 Tue, 24 Aug 2021 13:14:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8004010190AA;
 Tue, 24 Aug 2021 13:13:55 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:13:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
Message-ID: <YSTwkvOJj1lqXhpH@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O53VH+xqE05Cq3WD"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--O53VH+xqE05Cq3WD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Introduce flatview_access_allowed() to check bus permission
> before running any bus transaction. For now this is a simple
> stub.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index e534dc69918..0d31a2f4199 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2754,6 +2754,27 @@ static bool prepare_mmio_access(MemoryRegion *mr)
>      return release_lock;
>  }
> =20
> +/**
> + * flatview_access_allowed
> + * @mr: #MemoryRegion to be accessed
> + * @attrs: memory transaction attributes
> + * @addr: address within that memory region
> + * @len: the number of bytes to access
> + * @result: optional pointer to a MemTxResult or NULL
> + *
> + * Check if a memory transaction is allowed. If an error occurs this
> + * method will return false to indicate denial, as well as setting
> + * @result to contain corresponding #MemTxResult.
> + *
> + * Returns: true if transaction is allowed, false if denied.
> + */
> +static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs =
attrs,
> +                                           hwaddr addr, hwaddr len,
> +                                           MemTxResult *result)
> +{
> +    return true;
> +}

The callers below don't benefit from the result pointer argument. The
code would be clearer if they did:

  if (!flatview_access_allowed(...)) {
      return MEMTX_BUS_ERROR;
  }

> +
>  /* Called within RCU critical section.  */
>  static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>                                             MemTxAttrs attrs,
> @@ -2768,7 +2789,9 @@ static MemTxResult flatview_write_continue(FlatView=
 *fv, hwaddr addr,
>      const uint8_t *buf =3D ptr;
> =20
>      for (;;) {
> -        if (!memory_access_is_direct(mr, true)) {
> +        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
> +            /* 'result' contains the error, keep going. */
> +        } else if (!memory_access_is_direct(mr, true)) {
>              release_lock |=3D prepare_mmio_access(mr);
>              l =3D memory_access_size(mr, l, addr1);
>              /* XXX: could force current_cpu to NULL to avoid
> @@ -2810,9 +2833,13 @@ static MemTxResult flatview_write(FlatView *fv, hw=
addr addr, MemTxAttrs attrs,
>      hwaddr l;
>      hwaddr addr1;
>      MemoryRegion *mr;
> +    MemTxResult result =3D MEMTX_OK;
> =20
>      l =3D len;
>      mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
> +    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
> +        return result;
> +    }
>      return flatview_write_continue(fv, addr, attrs, buf, len,
>                                     addr1, l, mr);
>  }
> @@ -2831,7 +2858,9 @@ MemTxResult flatview_read_continue(FlatView *fv, hw=
addr addr,
> =20
>      fuzz_dma_read_cb(addr, len, mr);
>      for (;;) {
> -        if (!memory_access_is_direct(mr, false)) {
> +        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
> +            /* 'result' contains the error, keep going. */
> +        } else if (!memory_access_is_direct(mr, false)) {
>              /* I/O case */
>              release_lock |=3D prepare_mmio_access(mr);
>              l =3D memory_access_size(mr, l, addr1);
> @@ -2871,9 +2900,13 @@ static MemTxResult flatview_read(FlatView *fv, hwa=
ddr addr,
>      hwaddr l;
>      hwaddr addr1;
>      MemoryRegion *mr;
> +    MemTxResult result =3D MEMTX_OK;
> =20
>      l =3D len;
>      mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
> +    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
> +        return result;
> +    }
>      return flatview_read_continue(fv, addr, attrs, buf, len,
>                                    addr1, l, mr);
>  }
> --=20
> 2.31.1
>=20

--O53VH+xqE05Cq3WD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk8JIACgkQnKSrs4Gr
c8hF6Af/ScsnqIj9L0t2/ieWLqF57Gia0cUxxwheFNxzLtH6WU7DLArHC9Fe4jJe
8rVHsa5BOEVVB9YfMDJKZb0aS/d9n9wpbPY3ts2Kpgto3mP09DQIU+CddXjEUapI
zq3uD0O5r/1JVd517ZZIhpok4KK+3EC/pwpbZwwBeR2XEme9VVi7J45fLlJgR2k5
Ms03UQY8cRUCQcE1bQk8nSU160PwTDsSiwpEiVXrwdtXa56BLtt2TvxAlDGFd4lJ
27jwSe++wlMwP21DGxMPULl4EyKHW3EcGYxsUjgKlmj2joD8kLzQzuRB7q2wAb7z
0hxFeZm5JQCfV4giwvg+p27MMRXwDg==
=YgB+
-----END PGP SIGNATURE-----

--O53VH+xqE05Cq3WD--


