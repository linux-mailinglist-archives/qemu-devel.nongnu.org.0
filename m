Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C633139E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:42:36 +0100 (CET)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIxn-0000ow-TU
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIuK-0006N3-O9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIuJ-00019Y-Ae
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o0fcOMpU2KEXvzQYeFxhBqN1BsrejK4zyKGa2wXkExk=;
 b=ZVoAp3Cnsy/BIDARc+LEtYGY+XEUA1iXGRYraF4u8FCzArhTi1oKhvwTVqsxoWqmx2gIbr
 76YCCwNqSqrp04MNBYac7t4oPcVu+sFCX6zna2FgJPzG6cHt0F6ZFUiouoqicqsqvMcKQk
 QPYEYqzVq/CPctWVx3gEs+Bls3+oTXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-S7e5xCbfMcKnYuGBliYUPQ-1; Mon, 08 Mar 2021 11:38:54 -0500
X-MC-Unique: S7e5xCbfMcKnYuGBliYUPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1CCB1084D69;
 Mon,  8 Mar 2021 16:38:52 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4735C5C5FC;
 Mon,  8 Mar 2021 16:38:52 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:38:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 0/4] hw/block/nvme: convert ad-hoc aio tracking to
 aiocbs
Message-ID: <YEZTFkK3pxoMpcMC@stefanha-x1.localdomain>
References: <20210302111040.289244-1-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210302111040.289244-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2SXR6puLrj0iWDVr"
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

--2SXR6puLrj0iWDVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 12:10:36PM +0100, Klaus Jensen wrote:
> Marking RFC, since I've not really done anything with QEMU AIOs and BHs
> on this level before, so I'd really like some block-layer eyes on it.

I took a brief look and it seems like a nice conversion of the code.

Stefan

--2SXR6puLrj0iWDVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGUxYACgkQnKSrs4Gr
c8hW+wf/c3P1r2HX/WjfcErJnipobB615DsIY9bp3p5LWcSib3nwAf9VUBdQ+3yD
p0ZSdZDP9ASWVYtbjniAQ7oLHwSrNLT8Uv2ERNnl8uToGvSJ/X+wRZZ6z8tL1cJI
1Ysy9ZcEH8kptCKQ6INdtGuvxnmW/jwTp124ysdIjsuvR+5T+1P4el1/bnY6YNeH
oqRtH9HSKy2m0q2G4MY72I3Xisd8l0ZCsA1aXZNpHTDVsAD61kC/roBZDWhob7lH
lOeXhHklNfubfWJEocxG/QW2BiENehs6V69WeqvzFKULV/IMoOrLLKlUcA1/b6O1
C5q7lcQAOtChSovQrGcINvMWHTkWyQ==
=sqFA
-----END PGP SIGNATURE-----

--2SXR6puLrj0iWDVr--


