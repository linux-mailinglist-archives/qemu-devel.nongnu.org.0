Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E3331395
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:39:22 +0100 (CET)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIue-00064s-U9
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIsu-0004bf-Kz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIss-0000X7-3j
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mWfdv6iY33gjRNW+ufu4Ff4ySAEJNHo6gSMdU89HxU=;
 b=a2ZpMjoDkkxyvVCBJwhhm70k8JRwJ2fhnOpVvWS+awXgx+gyJ8rWrXtmGS+lx/SzPq0CJq
 H2NKQconoNo0RSW6sOl4ccBnKQs8R5hSFwBquu+N81tNx7DJIQj3t1H5hsf4HpBSX4faHA
 rsIK8rakn4MKsxZIaV578cHf3pxXTk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-3J6dPdRnPnGhAA6J5HPBJw-1; Mon, 08 Mar 2021 11:37:15 -0500
X-MC-Unique: 3J6dPdRnPnGhAA6J5HPBJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A291E1966322;
 Mon,  8 Mar 2021 16:37:13 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4909A39A63;
 Mon,  8 Mar 2021 16:37:13 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:37:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 1/4] hw/block/nvme: convert dsm to aiocb
Message-ID: <YEZSr7Y/Y4+NJY5V@stefanha-x1.localdomain>
References: <20210302111040.289244-1-its@irrelevant.dk>
 <20210302111040.289244-2-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210302111040.289244-2-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ltONoV340QYoT6ox"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ltONoV340QYoT6ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 12:10:37PM +0100, Klaus Jensen wrote:
> +static void nvme_dsm_cancel(BlockAIOCB *aiocb)
> +{
> +    NvmeDSMAIOCB *iocb =3D container_of(aiocb, NvmeDSMAIOCB, common);
> +
> +    /* break loop */
> +    iocb->curr.len =3D 0;
> +    iocb->curr.idx =3D iocb->nr;
> +
> +    iocb->ret =3D -ECANCELED;
> +
> +    if (iocb->aiocb) {
> +        blk_aio_cancel_async(iocb->aiocb);
> +        iocb->aiocb =3D NULL;
> +    }
> +}

Is the case where iocb->aiocb =3D=3D NULL just in case nvme_dsm_cancel() is
called after the last discard has completed but before the BH runs? I
want to make sure there are no other cases because nothing would call
iocb->common.cb().

>  static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeNamespace *ns =3D req->ns;
>      NvmeDsmCmd *dsm =3D (NvmeDsmCmd *) &req->cmd;
> -
>      uint32_t attr =3D le32_to_cpu(dsm->attributes);
>      uint32_t nr =3D (le32_to_cpu(dsm->nr) & 0xff) + 1;
> -
>      uint16_t status =3D NVME_SUCCESS;
> =20
>      trace_pci_nvme_dsm(nvme_cid(req), nvme_nsid(ns), nr, attr);
> =20
>      if (attr & NVME_DSMGMT_AD) {
> -        int64_t offset;
> -        size_t len;
> -        NvmeDsmRange range[nr];
> -        uintptr_t *discards =3D (uintptr_t *)&req->opaque;
> +        NvmeDSMAIOCB *iocb =3D blk_aio_get(&nvme_dsm_aiocb_info, ns->blk=
conf.blk,
> +                                         nvme_misc_cb, req);
> =20
> -        status =3D nvme_dma(n, (uint8_t *)range, sizeof(range),
> +        iocb->req =3D req;
> +        iocb->bh =3D qemu_bh_new(nvme_dsm_bh, iocb);
> +        iocb->ret =3D 0;
> +        iocb->range =3D g_new(NvmeDsmRange, nr);
> +        iocb->nr =3D nr;
> +        iocb->curr.len =3D 0;
> +        iocb->curr.idx =3D 0;
> +
> +        status =3D nvme_dma(n, (uint8_t *)iocb->range, sizeof(NvmeDsmRan=
ge) * nr,
>                            DMA_DIRECTION_TO_DEVICE, req);
>          if (status) {
>              return status;
>          }
> =20
> -        /*
> -         * AIO callbacks may be called immediately, so initialize discar=
ds to 1
> -         * to make sure the the callback does not complete the request b=
efore
> -         * all discards have been issued.
> -         */
> -        *discards =3D 1;
> +        nvme_dsm_aio_cb(iocb, 0);
> +        req->aiocb =3D &iocb->common;

Want to move this line up one just in case something in
nvme_dsm_aio_cb() accesses req->aiocb?

--ltONoV340QYoT6ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGUq8ACgkQnKSrs4Gr
c8jlvAgAhJ/yYbN/ClNUek0Mwzd6XK81pEB2Twp/1P/wuetUC1WNTwP86rImT/vV
YPsK3JdatOGprVOCJqyFC3eVYEnP+a8hSv042Pn5hQvw3RjSUyEbPJVJbUH5gqEV
0YKXnyM7l52A2BixjhAg7Wv7A/pS8rwvF/+7eqbGt3UEO+qO5jzipE2YNiccf2QI
yI32FGgaTXIF+9xpUBr8ICL14jNffqcpZi26K2iQ8U5h9rvWRlGjqeww1Y2bwvnf
6O+WDBXG1clFLSz0azwkFHBjCjakMfA5fj9mP2gGhwcwYqLsoOp6tAD8Cn39Zbwl
vVtE1ln8Vk7EiKz+RfhDz25NjzTP7w==
=iSsN
-----END PGP SIGNATURE-----

--ltONoV340QYoT6ox--


