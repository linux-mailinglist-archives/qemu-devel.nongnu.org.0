Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8F261381
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 17:29:36 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFfYt-0004tm-1t
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kFfXT-00037c-2d
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:28:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46805
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kFfXP-00086a-ES
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599578881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IwVSEx6YZ2XG30mSvVOC1qzzypf0Z70MJsIuWqjOecM=;
 b=EEwTZ+C6lHg83mpg9jaGIKMPmzmtZmlb7gLffDjFMOhNtIY9nzcz7PL/E2U88N1hZBjvEV
 qpSqvaUxSVvc+GpTozhZw4DVX060MXZCbXLTf1ViZxFkbsf3z7U8SmUY1oKUYxqkY00Dym
 auFvU35h6jbXlFWnZ/tPHXSjeVk7cuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-gzXo_5-EOuKONC8VQk-Kzw-1; Tue, 08 Sep 2020 11:27:56 -0400
X-MC-Unique: gzXo_5-EOuKONC8VQk-Kzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2620E1006B0E;
 Tue,  8 Sep 2020 15:27:45 +0000 (UTC)
Received: from localhost (ovpn-112-16.ams2.redhat.com [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00FD65D9E8;
 Tue,  8 Sep 2020 15:27:43 +0000 (UTC)
Date: Tue, 8 Sep 2020 16:27:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v4 9/9] scsi/scsi_bus: fix races in REPORT LUNS
Message-ID: <20200908152740.GF7154@stefanha-x1.localdomain>
References: <20200831150124.206267-1-mlevitsk@redhat.com>
 <20200831150124.206267-10-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200831150124.206267-10-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 06:01:24PM +0300, Maxim Levitsky wrote:
> Currently scsi_target_emulate_report_luns iterates
> over child devices list twice, and there is guarantee, that
> it will not be changed meanwhile.
>=20
> This reason for two loops is that it needs to know how much memory
> to allocate.
>=20
> Avoid this by iterating once, and allocating the memory for the output
> dynamically with reserving enought memory so that in practice it won't
> be reallocated often.
>=20
> Bugzilla for reference: https://bugzilla.redhat.com/show_bug.cgi?id=3D186=
6707

"Buglink:" is the tag name documented in
https://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_commit_mes=
sage

>  static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
>  {
>      BusChild *kid;
> -    int i, len, n;
>      int channel, id;
> -    bool found_lun0;
> +    uint8_t tmp[8] =3D {0};
> +    int len =3D 0;
> +
> +    /* reserve space for 63 LUNs*/
> +    GByteArray *buf =3D g_byte_array_sized_new(512);
> =20
>      if (r->req.cmd.xfer < 16) {
>          return false;

buf is leaked.

> @@ -460,46 +466,36 @@ static bool scsi_target_emulate_report_luns(SCSITar=
getReq *r)
>      }
>      channel =3D r->req.dev->channel;
>      id =3D r->req.dev->id;
> -    found_lun0 =3D false;
> -    n =3D 0;
> =20
> -    rcu_read_lock();
> =20
> -    QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
> -        DeviceState *qdev =3D kid->child;
> -        SCSIDevice *dev =3D SCSI_DEVICE(qdev);
> +    /* add size (will be updated later to correct value */
> +    g_byte_array_append(buf, tmp, 8);
> +    len +=3D 8;

Can g_byte_array_size() be used instead of keeping a len local variable?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9XouwACgkQnKSrs4Gr
c8jgUgf8DZ4cFLScaBpyWW6LaHAJ2wat7NsP6M1CG4nQ++HcjY+UpWqZFPs0sC5c
D6iym1aXcYwVvxyLyLvDifPKm6Bc529InTwDIbsUPIAEaonUl+KyZCfpt+kysL1n
qR5/BjJt+A1Uxyrh6ZsaPZAnvIf58YHjtdW/SSlwykBZVDjp3uMVB+ucORkkuw17
KSRk0vO0I5iB8MyjQ55NMDTcNlSopvVUAEJImFMZ2JDxC0GgFGJhHkJt3F1dKqkz
xsBOLV27o79ZmcytKhmc4nTvzMP1PzlQf0Z7T1NDHiQcdxaisvpNPO3fZG22OFXO
x+/nQr2ocIsJEVo464eDGgDb7UshEg==
=7v/y
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--


