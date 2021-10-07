Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619342546F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:39:33 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTcS-0001uC-3d
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTw-00039a-PE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTs-0002vV-U4
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=59JyHPh1235J7B9MSuwBNuqtMi/j5u8kKn1zV4EH3U8=;
 b=ETPrnxmKjSCgNx9fo1brLugVaf94I1DouPFOOVG7CTKGLAiWkMOz5nuO5grwKNfJCrrl7C
 1bl+NPTGPUNJbTunTByYID0OOpMMK8RfK+F1XyANdQ1ts9h7ZJ5BJP3ZI8VMXWz5KZosoa
 +2jbsxMigYYKF+HlCfHj4+kKwBEp5tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-mWLRLA2jOpiUaYs3dW3S3A-1; Thu, 07 Oct 2021 09:30:35 -0400
X-MC-Unique: mWLRLA2jOpiUaYs3dW3S3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B12971006AAC;
 Thu,  7 Oct 2021 13:30:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF8D5F504;
 Thu,  7 Oct 2021 13:30:18 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:29:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] block/nvme: Extract nvme_free_queue() from
 nvme_free_queue_pair()
Message-ID: <YV72VI1nSnGlqhrv@stefanha-x1.localdomain>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006164931.172349-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KW4duZwl5nPI5hEm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KW4duZwl5nPI5hEm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:49:29PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Instead of duplicating code, extract the common helper to free
> a single queue.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KW4duZwl5nPI5hEm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe9lQACgkQnKSrs4Gr
c8iVrgf/ebO8or0ivDAzlCm8kDjN7RV17iC34DZVUXbes+u7a64rKfoA5vMHJSIs
iThXohyZ/TOoe3s7v1U4M0DSq0WXEmNUuDtqiIq8KmeQtFmxdOGj0u1K2zzN/xXl
2b6MgWb9sqKHW4etKgomsmsAg5/4HF+ganjSwIzgs5C8Mq+HZw7kOiAu1xnR83vU
ByTb+59C2RjgaH/Z3jNyUM4LMRJErpE9ahrpcgPQ82qsntcPiBivY1senES/eiG9
OOlUNqLAzGSU0tLBk13Pf38S6PywlhwKSNpPV6YxeVc6A/wtJf9/Db2IN1LZRy3X
E4YADDQV5eEggDEuO713u5AHeixFZg==
=sLY7
-----END PGP SIGNATURE-----

--KW4duZwl5nPI5hEm--


