Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8792B6959
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:06:30 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3Uz-0003t9-QQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3TK-0002q0-Cq
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:04:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3TE-000799-48
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605629075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QAvCna+clDX4lZQI5nvorTls2cvWVMz8okgtfWJTHKI=;
 b=FQJHw8vHypA2+H+Pz655M2SuEVMgsgpERoyoXGS3FLijxdIcIhoq9aWUsOrxfw69cXnN2J
 rlQpUtlXc8EBD3MxqB8B5iVIEkyFi/FJKwu5D0IulTkQBRLoXI/XtNnCJFfU8+4a9Ots1Q
 LRAWnFBushIVEmPx19DGyGFRIWmHmy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-Rvj2yrciNbW8ZnE6T7_S1Q-1; Tue, 17 Nov 2020 11:04:32 -0500
X-MC-Unique: Rvj2yrciNbW8ZnE6T7_S1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA53A8042A7;
 Tue, 17 Nov 2020 16:04:30 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452BD1841D;
 Tue, 17 Nov 2020 16:04:27 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:04:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 06/10] vhost scsi: make SCSI cmd completion per vq
Message-ID: <20201117160426.GO131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-8-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-8-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/UvyDgxjlFfP/4zZ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/UvyDgxjlFfP/4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:19:06PM -0600, Mike Christie wrote:
> In the last patches we are going to have a worker thread per IO vq.
> This patch separates the scsi cmd completion code paths so we can
> complete cmds based on their vq instead of having all cmds complete
> on the same worker thread.
>=20
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/vhost/scsi.c | 48 +++++++++++++++++++++++++---------------------=
--
>  1 file changed, 25 insertions(+), 23 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/UvyDgxjlFfP/4zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z9IoACgkQnKSrs4Gr
c8j3GQf/Qf0GdIULIC6ID0rnGPCWs44LKDFOtvHlByy3GfUC9uN86EvbUUVr//2v
sWCmnejk/fX8lr9iwwbw3v2LBio+avFi47iOd5HxLRW23EAHdkzbgP4DPQDQGVGg
RW5h5+SJFSvsZavgx58zu2zKIIEL7zmJ/ik57DqjmDyDEBeBZmibE/PNdeHLzlt4
/nWAIdG2eFuNP8vXPy49799ilcJd5A6ONmNwie9Xve7ptRWM4SLU32Jb6yPDsL6W
AHwTMdvcWbTxjGJuUdIhtnwivYUP203mX2EMxW2x/29t02eULUDIww/4Bj4RoC7F
FmaH54Wk0eoNDs+DYLL9Y3+VQkeL5Q==
=5DGA
-----END PGP SIGNATURE-----

--/UvyDgxjlFfP/4zZ--


