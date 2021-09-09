Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C998C404683
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:41:57 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEh4-0001Bu-IT
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEfx-000098-FN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEfv-0006Ip-Qa
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631173246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTPCQ/QlC18bdj2vYUcuZ8oO4Zk0YG3bgqqAggIxEMI=;
 b=J86yNLZm0lj1AvY1pnNdmYtqZcG85SinEHKHvdhau8TptMmt3VUI/+mMhBgLSTMOo78e7J
 dB8JvFIKA4pCO/kzQFcTAZVJZjvpy4oOAGGoEZb1DVU448kWDhgyAIDATpKhcdtxl4nwNk
 I+s3K2tHaD6v69MPtzvjvoRCWS+OK34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-1JOEWD6xN56XGpQns_LsRQ-1; Thu, 09 Sep 2021 03:40:45 -0400
X-MC-Unique: 1JOEWD6xN56XGpQns_LsRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F59102CB73;
 Thu,  9 Sep 2021 07:40:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2A6C60C7F;
 Thu,  9 Sep 2021 07:40:38 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:40:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 09/11] vfio-user: handle device interrupts
Message-ID: <YTm6dcOJk/HhtH0e@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <a2f26e37bab99d353341c024f13db2774034acbf.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a2f26e37bab99d353341c024f13db2774034acbf.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+yvPRY37mBSSm/2F"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+yvPRY37mBSSm/2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:28PM -0400, Jagannathan Raman wrote:
> Forward remote device's interrupts to the guest
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/remote/iohub.h |  2 ++
>  hw/remote/iohub.c         |  5 +++++
>  hw/remote/vfio-user-obj.c | 30 ++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  1 +
>  4 files changed, 38 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+yvPRY37mBSSm/2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5unUACgkQnKSrs4Gr
c8gSwgf/TwEbSUvfdkYEA/IlJtQ5HtuAo7YGjFWXZwzElt33vJnabOzf5BBHMHiI
Ui2jf8wiU1D6D8n37DeCoKqel+VvnE8pLBZbSXKW8orR3NslNNi16lmjIWZbVGf+
nQN5gWhf9shduDVXm92vgXJPcIj6z29Yyarq8RGVjq4EJL4ctXQ0oQzqIrYr+2mx
TmzhvUdmjGbbtdJ7d4gESnm40efKg+gFWstVwoEN4lucaT1Qpnr5f5CGnux41y8G
HlCrNgGv4h7rpCzWq9AGmpqnHMdwIrmhjwSTlfLsXpAbXEPidUnwtBsnz3bXTP48
3AX9o5KbsTGSwXB6wKlRRWoeEjCW6Q==
=O3Pk
-----END PGP SIGNATURE-----

--+yvPRY37mBSSm/2F--


