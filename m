Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607124C13A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:07:56 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mAV-0001av-0n
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8m4S-0003FZ-BA
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:01:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8m4O-0005XC-Qt
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597935695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0RbsYyAWTdRGYw/nmvE9c7moVsta/F2/Jd75REIDN7E=;
 b=IUK38mH+cu65NnuNl9OfC36z2+4nY2G1G0i50G6MAekLDCE9VTCC6rc9X1V0IiQaZG/V1g
 /8NCLjERyXrcYpAkkzgr62+oKWFL+qhcw7VOb1jAyl2TMbh0OmHgD3L6J/yZC+Ffd2eElX
 omnUCrCloJNHYEjU50JBP0pWmOe12W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-YRAcoaanNBychRL6wmA8Hw-1; Thu, 20 Aug 2020 11:01:32 -0400
X-MC-Unique: YRAcoaanNBychRL6wmA8Hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C79C186A594;
 Thu, 20 Aug 2020 15:01:31 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB20A74E08;
 Thu, 20 Aug 2020 15:01:21 +0000 (UTC)
Date: Thu, 20 Aug 2020 16:01:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v4 1/5] block/nvme: Use an array of EventNotifier
Message-ID: <20200820150120.GB25991@stefanha-x1.localdomain>
References: <20200819160318.835292-1-philmd@redhat.com>
 <20200819160318.835292-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200819160318.835292-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 08:28:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 06:03:14PM +0200, Philippe Mathieu-Daud=E9 wrote:
> In preparation of using multiple IRQ (thus multiple eventfds)
> make BDRVNVMeState::irq_notifier an array (for now of a single
> element, the admin queue notifier).
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8+kEAACgkQnKSrs4Gr
c8ggfQf/eXBesqTa1dYKDiFGGPojm72oH8VYO51ECI0JBOhxNucm4/gu0ZLG0XyJ
8T8O3y57nLJiGbYV3adZyskBvRdhQ8PJ+KyiMHbhXjVOFhxXPmY/uHl9bYJzsC+X
XbQI09Clh/jxf2VkWzn8EMPNFsZB8PwVausw4fycI1ZrqP5AsB+nzusmlc0shlW7
RqXE/j+eFolPB2jAYps/hEUeJFvmleMELVttho/F18t063JSH9qwvXHnSncWBs/4
VVPr2Q2wMJNufrqDGck2bGxLdWKqkHknZdXmDdtVs1lCYtA5vwm9TV19+PE+TxvO
jVi7+Z+VB0eUwtGSRYKANsDMQRltCA==
=YG5A
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--


