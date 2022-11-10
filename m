Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00992624D73
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:07:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFgp-0007lA-L7; Thu, 10 Nov 2022 17:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFgm-0007kN-NK; Thu, 10 Nov 2022 17:06:24 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFgl-0007S0-09; Thu, 10 Nov 2022 17:06:24 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 459835C0079;
 Thu, 10 Nov 2022 17:06:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 17:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668117982; x=1668204382; bh=NO
 lvvNySrz6luCooXVs1HUi6Iv//XWSmYWZs9eNn7fU=; b=Zq1yCVuUedPtP5+1A8
 y8eX0+ZCWHyNsdyKTHMIYuh0szXX564tYFI5KG/8hHNbsZKjiWo9ONQtu9wFJmrw
 VmOCN26XQiv2niUXiud9bOst8RR3kcxAuHiMvQnOWXflOKKYHqlPURN0ff9opnhT
 ewCJlWS1TPg0Xu0K1iDtIPCKGw1OmC2YfMm4DmcOjBfE0pBSfoqzHh6kB/tclOfu
 cqNZqdZ8Q9e1l6o0qdIiV2TPyyu4Ah6LsnpRPlPKK2r1j4hRcbHHeGwuTsR7NhNZ
 JggeEdGkZMUd8V7A4ZW7uWNxCWYiG3cNVn9N6Iz5ja6i1RxziUJVMGKDIc0Azn1G
 Qnow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668117982; x=1668204382; bh=NOlvvNySrz6luCooXVs1HUi6Iv//
 XWSmYWZs9eNn7fU=; b=J0IK91r2oyL2aDNLCdA7ZhA86npnekl5hwoJxFMYW/2r
 kHOm/jYmaFD4A+O69H8ClEVLWeQrmc1ctdR7fIx964k1cqCB/ZLm8v/fVC5z4Z6j
 0l/dYiOLKoi6sL/9Br235MrHQEizuW0ARE2HSu5UUDBHrn3OPJtSNfdUlPSEtdL6
 FL9aBc4xFvD9ZHMk87PUvYZvxWIS92Bgvk7mojIp7B8y9Mwij6Zm4qYB9fM6Tx0Y
 sGgaSiZCJhopjRrwDCGjjiqyJdX+1vLdreiwrnpOA/aRxyEZHR/mTUS10g6fQBY+
 w/89jhdm25hiEhhWMtGadgYUzBvZkJ1ubAy7i5ymyQ==
X-ME-Sender: <xms:3nVtY5mGKTC_-gXJ8ly1TsihAeJO4q36yK1mp1WNsUD66E7Ut4ccRw>
 <xme:3nVtY03hnduB4mcP2fCbCwX1F1VqAebSV1DdYPDJlpcf5Ef3cfCe9_1QvN2kGFeGp
 6mXp-K1FM4xcGGginQ>
X-ME-Received: <xmr:3nVtY_pzAMtI7nfrEwvlV2mTzCUW9FCUUuwgLodOc59UlPO2PgdbNaCk5FMpSTzp7Ka0nyCKpcK1hPkUxbclFqIJJvq4WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:3nVtY5lpv9KFJrsh1UN340UjWdq3txEXaHOEZU8HzUHYi05aW78_GQ>
 <xmx:3nVtY30wr_cfp3Rwv6b3x892LRl3uYqmRaMzgpyY84axaMr-JV5vOw>
 <xmx:3nVtY4uPSnUZmr-tnCmwgGsajDKLrz_9wM2lv869JXQpoLkUyOrJXA>
 <xmx:3nVtYyTCAyCngqGp19482l0R5ZWI7FscmYxNKIAz-Sy6ZkEi55npgg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 17:06:20 -0500 (EST)
Date: Thu, 10 Nov 2022 23:06:19 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Message-ID: <Y21129jYFddcRTFH@cormorant.local>
References: <20221110062335.18401-1-its@irrelevant.dk>
 <20221110062335.18401-3-its@irrelevant.dk>
 <87edubjfj0.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MTUzO38eRFRf7K1j"
Content-Disposition: inline
In-Reply-To: <87edubjfj0.fsf@pond.sub.org>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--MTUzO38eRFRf7K1j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 10 11:00, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Replace the local Error variable with errp and ERRP_GUARD() and change
> > the return value to bool.
> >
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 23 ++++++++++-------------
> >  1 file changed, 10 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index a5c0a5fa6ce2..e23af4db91ae 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -7343,15 +7343,14 @@ static int nvme_add_pm_capability(PCIDevice *pc=
i_dev, uint8_t offset)
> >      return 0;
> >  }
> > =20
> > -static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
> > +static bool nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **err=
p)
> >  {
> > +    ERRP_GUARD();
> >      uint8_t *pci_conf =3D pci_dev->config;
> >      uint64_t bar_size;
> >      unsigned msix_table_offset, msix_pba_offset;
> >      int ret;
> > =20
> > -    Error *err =3D NULL;
> > -
> >      pci_conf[PCI_INTERRUPT_PIN] =3D 1;
> >      pci_config_set_prog_interface(pci_conf, 0x2);
> > =20
> > @@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice=
 *pci_dev, Error **errp)
> >      }
> >      ret =3D msix_init(pci_dev, n->params.msix_qsize,
> >                      &n->bar0, 0, msix_table_offset,
> > -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> > -    if (ret < 0) {
> > -        if (ret =3D=3D -ENOTSUP) {
> > -            warn_report_err(err);
> > -        } else {
> > -            error_propagate(errp, err);
> > -            return ret;
> > -        }
> > +                    &n->bar0, 0, msix_pba_offset, 0, errp);
> > +    if (ret =3D=3D -ENOTSUP) {
> > +        warn_report_err(*errp);
> > +        *errp =3D NULL;
> > +    } else {
>=20
> Uh, shouldn't this be
>=20
>        } else if (ret < 0) {
>=20
> ?
>=20

Yikes. Yes.

--MTUzO38eRFRf7K1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNtddsACgkQTeGvMW1P
DekCDgf/VnZ+emGhERF+aX4mG3sNY9PxGYgiEF/cVMxt5NkXny4wq7FMOGm8LZel
P0yUtRFTN8iXMCfsc2REka+1g2zji334C3Q09XFV1s2Rl6XiWxSZWQiNnkFqnCpY
vfDaCelnyb/SPBtnnZjPh0i1hWFVVbEiNf960aM/PAZtVIbOfjXnEVnqmedr56xT
1bFoBNp+urjeMM5KMIQeIagguluU6qH2dcpIC3VYYeQah6bPKjPN0Um27cGEfFRQ
1s6gs3I8RDMV8hTFVXt6/PSOjTEG+AzqXJVZ7PTMo8omSjslIEGAVN5n8ENrcAlG
AHRIO6jEwGaIP4wjOmTAQ1eLIMTVuQ==
=14/K
-----END PGP SIGNATURE-----

--MTUzO38eRFRf7K1j--

