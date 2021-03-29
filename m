Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933D34D600
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:27:00 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvfH-0003IS-3j
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvdU-0001qp-N3
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvdQ-0002mt-Hy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617038702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFh21w/KsAThfgPiqfbWxDg/6jdAG310wpe2rebwwMA=;
 b=FhGW8awzMZREFp5sQHbLTc71O8Px0/bL1I4xIQU2kghKEx1J1IWkiyKu0FbeJ1JGSbGVZq
 DbkbQ8ASty5ou+CZpbPQ5Js0EtYMUTce7JX7SXKj559+wLGJfiBSjkGvRcBNJpJ2j2a0RL
 wmhTNp/0yrslY3TyztkSkSYliDxNyBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-IscaumHgOEa5QiKeZVUbkg-1; Mon, 29 Mar 2021 13:24:47 -0400
X-MC-Unique: IscaumHgOEa5QiKeZVUbkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3432817469;
 Mon, 29 Mar 2021 17:24:45 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29F1F60C5B;
 Mon, 29 Mar 2021 17:24:42 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:24:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 4/8] virtio-pci: Batch add/del ioeventfds in a single MR
 transaction
Message-ID: <YGINWHUDN0hw/92j@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-5-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-5-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0H4erGExLlOp+oiA"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0H4erGExLlOp+oiA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 25, 2021 at 04:07:31PM +0100, Greg Kurz wrote:
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 1b1942d521cc..0279e5671bcb 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2368,7 +2368,7 @@ void memory_region_add_eventfd_full(MemoryRegion *mr,
>      if (size) {
>          adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
>      }
> -    if (transaction) {
> +    if (!transaction) {
>          memory_region_transaction_begin();
>      }
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> @@ -2383,7 +2383,7 @@ void memory_region_add_eventfd_full(MemoryRegion *mr,
>              sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
>      mr->ioeventfds[i] = mrfd;
>      ioeventfd_update_pending |= mr->enabled;
> -    if (transaction) {
> +    if (!transaction) {
>          memory_region_transaction_commit();
>      }

Looks like these two hunks belong in a previous patch.

--0H4erGExLlOp+oiA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiDVgACgkQnKSrs4Gr
c8ib/Af8DAUAD12zhzLw2hVfWyG247JkofzUUan/8mjSq9OKk3w/idhyKbZZojAI
nO6BFoq3hyqFQvRpnWCLZkk+WZVchkCnEbhGERFC3q8BQKlwtzdWq/u8LkdyLn9E
hc3Y496MoYdmHAvtmAXuw8IcnadrO/ankNBk0JMFjqIiU1dSiCPZtTSPRoOr27R8
vWGUtXa+jXHehRv/9UuUD2Gzhf9flDJU6smIx/Hkx1cYOzy0zzDOqLU2bepmqe0n
SUX8AsiBxULppJHak+grTf3UIXsaYpl8t+i1r0BvjtiPE73TJcVLd/ggaCNasb62
rijL28iHudXE67FBn+SIj+2kCup+yA==
=5b8q
-----END PGP SIGNATURE-----

--0H4erGExLlOp+oiA--


