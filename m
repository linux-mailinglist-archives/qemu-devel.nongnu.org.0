Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319B63F0D7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iUu-0001vP-4G; Thu, 01 Dec 2022 07:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iUk-0001sS-NY
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iUi-0002NL-Pc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669897007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7X1hfAfGzSCPqneAOxzBGPPirHQK0Qa2ozZsSlCDiA=;
 b=Bx/mHy093K3kWsuIIuE+GQG7gcTF68R8QWstSPxebvuxWvuD/8mmp5p1la/e+Isf0ke7mx
 e/odMzwfDElBxVxKrtDCu3FV1QeAtm1TKcUHEWo9DQdhpBaU2+FCSRxkNc1L8D3lCQzWOc
 0G1zKUc3WFPCK8olVMccTdlsxKqw2kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-PXDJqkPgM6-BDFIONzWz8w-1; Thu, 01 Dec 2022 07:16:44 -0500
X-MC-Unique: PXDJqkPgM6-BDFIONzWz8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C2381C05B10;
 Thu,  1 Dec 2022 12:16:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2860249BB68;
 Thu,  1 Dec 2022 12:16:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC21B21E6921; Thu,  1 Dec 2022 13:16:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Lieven <pl@kamp.de>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,  Hanna
 Reitz <hreitz@redhat.com>,  libvir-list@redhat.com,  Kevin Wolf
 <kwolf@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 3/3] ui: remove deprecated 'password' option for SPICE
References: <20221201101959.419545-1-berrange@redhat.com>
 <20221201101959.419545-4-berrange@redhat.com>
Date: Thu, 01 Dec 2022 13:16:40 +0100
In-Reply-To: <20221201101959.419545-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 1 Dec 2022 05:19:59
 -0500")
Message-ID: <87sfhzgvyv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This has been replaced by the 'password-secret' option,
> which references a 'secret' object instance.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/about/deprecated.rst       |  8 --------
>  docs/about/removed-features.rst |  7 +++++++
>  qemu-options.hx                 |  9 +--------
>  ui/spice-core.c                 | 15 ---------------
>  4 files changed, 8 insertions(+), 31 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 2cc8924fe9..ee4301f96d 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -73,14 +73,6 @@ Input parameters that take a size value should only us=
e a size suffix
>  the value is hexadecimal.  That is, '0x20M' is deprecated, and should
>  be written either as '32M' or as '0x2000000'.
>=20=20
> -``-spice password=3Dstring`` (since 6.0)
> -''''''''''''''''''''''''''''''''''''''
> -
> -This option is insecure because the SPICE password remains visible in
> -the process listing. This is replaced by the new ``password-secret``
> -option which lets the password be securely provided on the command
> -line using a ``secret`` object instance.
> -
>  ``-smp`` ("parameter=3D0" SMP configurations) (since 6.2)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>=20=20
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-feature=
s.rst
> index 63df9848fd..e04e095320 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -408,6 +408,13 @@ pcspk-audiodev=3D<name>``.
>=20=20
>  Use ``-device`` instead.
>=20=20
> +``-spice password=3Dstring`` (removed in 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''
> +
> +This option is insecure because the SPICE password remains visible in

Nitpicking...  since the option doesn't exist anymore, it can't *be*
insecure.  It sure *was* insecure.

> +the process listing. This is replaced by the new ``password-secret``
> +option which lets the password be securely provided on the command
> +line using a ``secret`` object instance.
>=20=20
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------

[...]

Reviewed-by: Markus Armbruster <armbru@redhat.com>


