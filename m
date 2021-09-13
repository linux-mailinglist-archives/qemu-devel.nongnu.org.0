Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFB408B1D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:35:51 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlBe-0000rm-Bp
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPkqM-00038D-3U
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPkqI-0007t8-Lq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631535224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MT/fH3L17p/XDLnDLYuSCKrDvuIFWCZgm1euP6y01oQ=;
 b=UCMcv+I/SU9MtD/a1DjpAcS3SNCUfomzLBvA1opWGXajhKW3+87YhSAjjIVk1oII6z9y0X
 87LpKBstKlSeo4ulppeGHE55gQp0nfxiD6MUayF1zgIXyqlUDeXJsYcTtRSebwcs4B41Zt
 s2Ke5GCzgkWLAhHsSVMXHFohoIyL4Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-k9qOxwenPI2hHBzjOX1wJQ-1; Mon, 13 Sep 2021 08:13:41 -0400
X-MC-Unique: k9qOxwenPI2hHBzjOX1wJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDD381084689;
 Mon, 13 Sep 2021 12:13:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2B48189BB;
 Mon, 13 Sep 2021 12:13:34 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:13:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 06/11] vfio-user: handle PCI config space
 accesses
Message-ID: <YT9AbRun6dPEGEVJ@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <5f371fa15eb347317ce9ce56a329a24c713129e0.1630084211.git.jag.raman@oracle.com>
 <YTm3VGiIeRh3+JBs@stefanha-x1.localdomain>
 <23A4AF68-0D0C-475F-B522-6ADAC0CED2AC@oracle.com>
MIME-Version: 1.0
In-Reply-To: <23A4AF68-0D0C-475F-B522-6ADAC0CED2AC@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wO5+dVZQnfKUJQ0v"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wO5+dVZQnfKUJQ0v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 04:22:56PM +0000, Jag Raman wrote:
>=20
>=20
> > On Sep 9, 2021, at 3:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >=20
> > On Fri, Aug 27, 2021 at 01:53:25PM -0400, Jagannathan Raman wrote:
> >> +static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const=
 buf,
> >> +                                     size_t count, loff_t offset,
> >> +                                     const bool is_write)
> >> +{
> >> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> >> +    uint32_t pci_access_width =3D sizeof(uint32_t);
> >> +    size_t bytes =3D count;
> >> +    uint32_t val =3D 0;
> >> +    char *ptr =3D buf;
> >> +    int len;
> >> +
> >> +    while (bytes > 0) {
> >> +        len =3D (bytes > pci_access_width) ? pci_access_width : bytes=
;
> >> +        if (is_write) {
> >> +            memcpy(&val, ptr, len);
> >> +            pci_default_write_config(PCI_DEVICE(o->pci_dev),
> >> +                                     offset, val, len);
> >> +            trace_vfu_cfg_write(offset, val);
> >> +        } else {
> >> +            val =3D pci_default_read_config(PCI_DEVICE(o->pci_dev),
> >> +                                          offset, len);
> >> +            memcpy(ptr, &val, len);
> >=20
> > pci_default_read_config() returns a host-endian 32-bit value. This code
> > looks wrong because it copies different bytes on big- and little-endian
> > hosts.
>=20
> I=E2=80=99ll collect more details on this one, trying to wrap my head aro=
und it.
>=20
> Concerning config space writes, it doesn=E2=80=99t look like we need to
> perform any conversion as the store operation automatically happens
> in the CPU=E2=80=99s native format when we do something like the followin=
g:
> PCIDevice->config[addr] =3D val;

PCIDevice->config is uint8_t*. Endianness isn't an issue with single
byte accesses.

>=20
> Concerning config read, I observed that pci_default_read_config()
> performs le32_to_cpu() conversion. May be we should not rely on
> it doing the conversion.

Yes, ->config_read() returns a host-endian 32-bit value and
->config_write() receives a host-endian 32-bit value (it has a
bit-shifting loop that implicitly handles endianness conversion).

Stefan

--wO5+dVZQnfKUJQ0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/QG0ACgkQnKSrs4Gr
c8hEywf/Vsg9BNBxKc5XhDtZ9s27Y63yEVUP5Uq0QHg3vThsQPWAY3zjTJyV1njq
uOjLaEvyNioWNlRE405kyPZ7CjEf34p37NGvFP2/JI67v3/RN2Jg7yBILIR14jM8
s8alfWD1c8LqUT3RecAioCPoJA9ZcZQEnhCTeGj+S5uALlgCg0f0Moa0zAQHq45r
qaMSAdEp8qn2HfJlTKFf0moZaH1Ux68afRj8BXUCRjS+24W/54Csg2EiR00B4AE+
b2+R8JWyilyuuZgHRlsfH8OoVebRXXkYzzckcaZYqOZXeZJ/VBO+FMAodfbgxzzC
5f9+qRukGI9KaC5yJhYNAuTkSP2G/g==
=Txf0
-----END PGP SIGNATURE-----

--wO5+dVZQnfKUJQ0v--


