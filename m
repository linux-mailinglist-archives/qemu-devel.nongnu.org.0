Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0B42502F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:35:46 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPoX-00088j-6k
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPmk-0007De-Uf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPmh-0007aI-Vl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKROfRZL2N1WWE4Jn6JC8IuwUdDjOuDDO/ODLLSBFOQ=;
 b=E7GtdgnJcddQPpvDQatvOl63uaXyUFLYCtCUPZkxxT+YhwXvk0CP5Hxua2fsOljKN9MP9E
 nsZOH8MFuG7yhtKRErZ/Z0Ui3DwM1U17hS2oFfzhJhjex8rnR9Z5m/Bevj63db/2PEsbec
 fZYiY/zW8T0qGJRDTqzxu7kRcy49O/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-qnyk6qOcNmeKNUXRY85hTA-1; Thu, 07 Oct 2021 05:33:48 -0400
X-MC-Unique: qnyk6qOcNmeKNUXRY85hTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB5545DCA;
 Thu,  7 Oct 2021 09:33:47 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15B22635E;
 Thu,  7 Oct 2021 09:33:40 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:33:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
Message-ID: <YV6+8+NiBO8uG/GC@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1FR6fmp4E/qqnY6p"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1FR6fmp4E/qqnY6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:31:54AM -0400, Emanuele Giuseppe Esposito wrote:
> +int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
> +                     const void *buf, int64_t bytes);

Why is this bit of a surprise since the other synchronous I/O functions
aren't included in this header. Why did you put it here? This one may be
safe to move to the I/O API.

> +int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> +                      int64_t bytes, int64_t *pnum, int64_t *map,
> +                      BlockDriverState **file);

This function just called bdrv_block_status_above(), which is in the I/O
API. I think it's safe to move this to the I/O API or else
bdrv_block_status_above() shouldn't be there :).

--1FR6fmp4E/qqnY6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFevvMACgkQnKSrs4Gr
c8jO0Qf/ZhBvwGCn1twvpsoEuDPTfA7jw/u6k5y33nMX35WmUDMlVoeYFEAkyhcE
S70PDEer3CV+euNZG2YnUDmyK5M9PDFpzvwMYUaqjl/DjTXvn5t0UIkMNXl1NZx1
1DV0jPYBO4dgjjNNwpWxousEj/8lIGWtcaf85iU/G4duma4wsQLLNhbiEPlGHRC6
J86ci85BlJo51/DDvpOWRnyjXGlLQ2hukWoHNWbViry/AhFpwC/8R2KF6z4dYsnW
2ZubspHVksN5coWJsp6IcS5OmdkFW0R93uXydrOAod4ppO0zeKL/8TfFQmb8UDOj
mUVpy/0jumATTgeNjHcuIYI6WJK/lQ==
=lZhv
-----END PGP SIGNATURE-----

--1FR6fmp4E/qqnY6p--


