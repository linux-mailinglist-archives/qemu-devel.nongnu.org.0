Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B721C3D83
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 16:49:54 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVcPo-0006Dt-Vd
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jVcLa-0000Jw-1c
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:45:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26615
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jVcLY-0008Gr-2f
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588603526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpmhCMHGevMhcKBEo/HSirwf/Ddc7V/B1y41sLvuMM0=;
 b=VV9u6wqHi/Cd9AzNh+SKtHsILTyTEthxcWzLa3tDjFuJxMkWsn+ujvmvoq1K6dVKwdRfrI
 sspPebeCz272sGoL7VfU4Xq3SFPlV8Gsrl1IcK3FSM1IHXDdM2yZ5/Q5NDUnURiwbCczVI
 gUr9BCiN9b2llqZ+X+I0T06fkCRu+VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-FXSnFq2QMs2yGzbaALCGnA-1; Mon, 04 May 2020 10:45:24 -0400
X-MC-Unique: FXSnFq2QMs2yGzbaALCGnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20AF118FE860;
 Mon,  4 May 2020 14:45:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EED065C1B2;
 Mon,  4 May 2020 14:45:20 +0000 (UTC)
Date: Mon, 4 May 2020 16:45:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH v2] qcow2: Avoid integer wraparound in qcow2_co_truncate()
Message-ID: <20200504144519.GC6129@linux.fritz.box>
References: <20200504142308.10446-1-berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20200504142308.10446-1-berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.05.2020 um 16:23 hat Alberto Garcia geschrieben:
> After commit f01643fb8b47e8a70c04bbf45e0f12a9e5bc54de when an image is
> extended and BDRV_REQ_ZERO_WRITE is set then the new clusters are
> zeroized.
>=20
> The code however does not detect correctly situations when the old and
> the new end of the image are within the same cluster. The problem can
> be reproduced with these steps:
>=20
>    qemu-img create -f qcow2 backing.qcow2 1M
>    qemu-img create -f qcow2 -F qcow2 -b backing.qcow2 top.qcow2
>    qemu-img resize --shrink top.qcow2 520k
>    qemu-img resize top.qcow2 567k
>=20
> In the last step offset - zero_start causes an integer wraparound.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Can you add the reproducer to qemu-iotests?

>  block/qcow2.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> v2:
> - Don't call qcow2_cluster_zeroize() if offset =3D=3D zero_start
>=20
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 2ba0b17c39..7ca0327995 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -4234,15 +4234,20 @@ static int coroutine_fn qcow2_co_truncate(BlockDr=
iverState *bs, int64_t offset,
>      if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
>          uint64_t zero_start =3D QEMU_ALIGN_UP(old_length, s->cluster_siz=
e);
> =20
> +        /* zero_start should not be after the new end of the image */
> +        zero_start =3D MIN(zero_start, offset);

I think this is a bit confusing because zero_start implies that this is
the aligned offset where qcow2_cluster_zeroize() would start. At first I
though this wasn't needed at all any more because you already check
offset > zero_start below. So if MIN() makes a difference, the if block
won't be executed anyway.

It would, however, make a difference for calculating the explicit zero
write for the unaligned head:

    uint64_t len =3D zero_start - old_length;

Maybe it would be easier to understand if we changed only that line?

    uint64_t len =3D MIN(zero_start, offset) - old_length;

Kevin


