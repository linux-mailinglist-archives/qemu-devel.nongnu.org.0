Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769226DD671
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:19:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmA9g-0001eL-Bz; Tue, 11 Apr 2023 05:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pmA9b-0001e4-Fq
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:19:10 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pmA9Z-0008Jc-L9
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681204738; i=lukasstraub2@web.de;
 bh=8l72hinu5Wqif6QOj2kxg5H4Ttz/LRoYwnXuuN+uqrs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=op9GhNmNkeMw35FLkd/iaVUnLjNpc/z1aPqaY7jJr2BbFYNeqVbIox1K4vrIFR4dv
 Q+r/axNGzKbatn27PwVQqDgbR/5To2iuFk5ko+PJ3KzOFzeGdxBUOSGDo5YgqHR+0h
 f3tlsAbrmKgzpwVHwcrNfDDVK+sezo7Dd7RpXhyyeSGPpDcngNSuJ1e1TiI7r98V14
 2wfPfXnd7/70w1B4Nsblefuhrh5mFjk6LiYFJ+KHdQJGYqAi18WyjjQPPp5bKOR3Zo
 S+t4S5r62XT9ixPIWyge5SWKcIrm5MKX7Yia0ymkRnCjOgR2WjF6OSuWpYaV5GeZuA
 3D+g0AI/X6dJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.100]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3Gga-1qUsee2zfG-010Yqk; Tue, 11
 Apr 2023 11:18:58 +0200
Date: Tue, 11 Apr 2023 09:18:49 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-8.0 v2 2/2] migration/ram.c: Fix migration with
 compress enabled
Message-ID: <20230411091840.27294990@gecko.fritz.box>
In-Reply-To: <20230406152125.184376bc@gecko.fritz.box>
References: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
 <2c4cac0ca620ea0304d88b8f5110fe290400c8c8.1680618040.git.lukasstraub2@web.de>
 <20230406152125.184376bc@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s2jn2i3T_z3oKOeK4ncd+Io";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:0D0y/uzo3lhrXTBmArGp0MXT/f8Av8kc3s2gv6ibrhKtTd5/fcs
 K17ADcR2avPWwY2TMjTPE5JydEX61GH+QAlZIB5mKJEZD21cE9067xs/GvlesU7N6zDtpfc
 /8A5x355k6JSoRHg11g35g676OWQK/V4DIIgY6pWiESM2DQjsOik77FTMt3g227sRk7wGS0
 aeHNrzxU2TJA1iDcAhUfg==
UI-OutboundReport: notjunk:1;M01:P0:P/PRsPjAq8Q=;QmKo4nC4Ka4RloeUzelra5kxUeI
 IOh4OqAbSa/aR9ziu7iWAVopNWOeWUXM7mmdNt08RNPJCffhgSlG3e1ZovG+DKzmM0vhN1eIK
 z7QknnVTFhaxJD4+6Hvjj7qUfyqNksK/ALs/x2fnLr+kVcvqon4KXi9cenduSV0KHXaod4c7O
 myCbVw4qvDGqjkxC1c19rITkD1BjlQ/cUbJextKSk2alzTenWWQI3bn6JVAx0ZuwTiOGXqMxu
 5LzuHdFnCgWRY7NJn8ZhHBK3mK7nXF7as6WmvMxto4X6W5XVy532ZsoSOGFy7P9QYVQyqfx1D
 WZsCdYtJW9AvLEkmFm5CfJzl2ihumL1m7n7nFaqiAF83lw4fQ0XtQUU6sBva1OF9MVAOOvIwd
 UB3XiJdR/oBsD4ON86RRfPRtNcBI1hfim9G9aXvKML4XzaMtLvVoKXJoHMe96fvliViPCSP9u
 vQtFRphuVJ+jDNKnz/O0qMB1CpDGhq43v6xLUPT7J/FI7jphmflU++Yaj/BPmL6qqkRw7OqEv
 4S1Ahz/eaYFE+ZRBqxc2lCQW6htyf8AfGntZ6MoRQk++9Q2Va984fVRRTPEvvKK7NH0cJMaHs
 cklrMPcB6ep7mscXU5o+djGZ127UAoREsEVN3s8WgQT4xA/qKXFXOTP0cCxyI+iUll+/aG6ZL
 WL/xASUpA+vm+uLKccBLDitF7GNzLWrIL90S7I23+agTjXClieJmNReBIiY9wV7teRAG94FHv
 +qNl/a8fbxDqcuaUsEjshlS+xlbRHxb9TsTYEm6u20N/vRVCGWyx57lOFH2IztbGJl1U4Iefj
 PunToxO9YrVFADNA5PdrTTwIxYwk0iiqPcgT1irX3AQX4EjJ6xALrkRi9n6XORE+xG2318GNp
 iKepCr4yx41vxGLVx+mJsZykBBqB6oNwmTe1OIF1OTuhgJKX1+R8H8x4augsy41dCNC46CcpN
 lCZWCTP76+9A90BYSZiUFi5zty0=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/s2jn2i3T_z3oKOeK4ncd+Io
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ping...

On Thu, 6 Apr 2023 15:21:55 +0000
Lukas Straub <lukasstraub2@web.de> wrote:

> Ping? This should go in rc4, there is not much time left to prepare a
> PULL...
>=20
> Best Regards,
> Lukas Straub
>=20
> On Tue, 4 Apr 2023 14:36:03 +0000
> Lukas Straub <lukasstraub2@web.de> wrote:
>=20
> > Since ec6f3ab9, migration with compress enabled was broken, because
> > the compress threads use a dummy QEMUFile which just acts as a
> > buffer and that commit accidentally changed it to use the outgoing
> > migration channel instead.
> >=20
> > Fix this by using the dummy file again in the compress threads.
> >=20
> > Fixes: ec6f3ab9f4 ("migration: Move last_sent_block into PageSearchStat=
us")
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > ---
> > v2:
> >  - Add Fixed: and Reviewed-by: tags
> >=20
> >  migration/ram.c | 24 +++++++++++-------------
> >  1 file changed, 11 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 96e8a19a58..9d1817ab7b 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -688,12 +688,11 @@ exit:
> >   * @offset: offset inside the block for the page
> >   *          in the lower bits, it contains flags
> >   */
> > -static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
> > -                               ram_addr_t offset)
> > +static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
> > +                               RAMBlock *block, ram_addr_t offset)
> >  {
> >      size_t size, len;
> >      bool same_block =3D (block =3D=3D pss->last_sent_block);
> > -    QEMUFile *f =3D pss->pss_channel;
> > =20
> >      if (same_block) {
> >          offset |=3D RAM_SAVE_FLAG_CONTINUE;
> > @@ -867,7 +866,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearc=
hStatus *pss,
> >      }
> > =20
> >      /* Send XBZRLE based compressed page */
> > -    bytes_xbzrle =3D save_page_header(pss, block,
> > +    bytes_xbzrle =3D save_page_header(pss, pss->pss_channel, block,
> >                                      offset | RAM_SAVE_FLAG_XBZRLE);
> >      qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
> >      qemu_put_be16(file, encoded_len);
> > @@ -1302,15 +1301,14 @@ void ram_release_page(const char *rbname, uint6=
4_t offset)
> >   * @block: block that contains the page we want to send
> >   * @offset: offset inside the block for the page
> >   */
> > -static int save_zero_page_to_file(PageSearchStatus *pss,
> > +static int save_zero_page_to_file(PageSearchStatus *pss, QEMUFile *fil=
e,
> >                                    RAMBlock *block, ram_addr_t offset)
> >  {
> >      uint8_t *p =3D block->host + offset;
> > -    QEMUFile *file =3D pss->pss_channel;
> >      int len =3D 0;
> > =20
> >      if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
> > -        len +=3D save_page_header(pss, block, offset | RAM_SAVE_FLAG_Z=
ERO);
> > +        len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_=
FLAG_ZERO);
> >          qemu_put_byte(file, 0);
> >          len +=3D 1;
> >          ram_release_page(block->idstr, offset);
> > @@ -1327,10 +1325,10 @@ static int save_zero_page_to_file(PageSearchSta=
tus *pss,
> >   * @block: block that contains the page we want to send
> >   * @offset: offset inside the block for the page
> >   */
> > -static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
> > +static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock=
 *block,
> >                            ram_addr_t offset)
> >  {
> > -    int len =3D save_zero_page_to_file(pss, block, offset);
> > +    int len =3D save_zero_page_to_file(pss, f, block, offset);
> > =20
> >      if (len) {
> >          stat64_add(&ram_atomic_counters.duplicate, 1);
> > @@ -1394,7 +1392,7 @@ static int save_normal_page(PageSearchStatus *pss=
, RAMBlock *block,
> >  {
> >      QEMUFile *file =3D pss->pss_channel;
> > =20
> > -    ram_transferred_add(save_page_header(pss, block,
> > +    ram_transferred_add(save_page_header(pss, pss->pss_channel, block,
> >                                           offset | RAM_SAVE_FLAG_PAGE));
> >      if (async) {
> >          qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
> > @@ -1473,11 +1471,11 @@ static bool do_compress_ram_page(QEMUFile *f, z=
_stream *stream, RAMBlock *block,
> >      uint8_t *p =3D block->host + offset;
> >      int ret;
> > =20
> > -    if (save_zero_page_to_file(pss, block, offset)) {
> > +    if (save_zero_page_to_file(pss, f, block, offset)) {
> >          return true;
> >      }
> > =20
> > -    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> > +    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PA=
GE);
> > =20
> >      /*
> >       * copy it to a internal buffer to avoid it being modified by VM
> > @@ -2355,7 +2353,7 @@ static int ram_save_target_page_legacy(RAMState *=
rs, PageSearchStatus *pss)
> >          return 1;
> >      }
> > =20
> > -    res =3D save_zero_page(pss, block, offset);
> > +    res =3D save_zero_page(pss, pss->pss_channel, block, offset);
> >      if (res > 0) {
> >          /* Must let xbzrle know, otherwise a previous (now 0'd) cached
> >           * page would be stale =20
>=20
>=20
>=20



--=20


--Sig_/s2jn2i3T_z3oKOeK4ncd+Io
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQ1JfkACgkQNasLKJxd
slg+kQ/+My5AOXGmGR0al5eM4U5lmQjDaAbvsyP3t6Efnsn+cxQqgCC30AFVYzci
laStqJTj+dDQCF69sAE1j7FNeuJwVEnyMX2Mc431ZDaiatlmgvniqESMQuxq6uYR
XAINJQOH2n4cU2NHNC7/PfL2T3KdeuXKinm9HV1vahEhxbrvIAjBy6DopqCapqLc
q7AKE5pYPlhgHHSJwDL67NRZMgfqhm09brmX46XaeWJRkgC6JYGjBx/4pyHzZFIJ
yNh/nzNVOgD6Eh7qlOHlTp4/iicT91qAX+t8sPmHmceOcoQy7qKhuas3ZYvrHPt+
CvcFcV+obqDlUiNb8fxx02Lz6RsbLpTu2gRtGETWQvgd71rS4HDWLUHwrnwWvjm2
5FqRpu0fMq3by343Xb058ftJmFu0y2gN7cu1u17JzXsXF9MEzN3zWin6/1hR1Hqp
7YPZE67n+7iMA5dnLjRypKVjnWIJ6SuR8zIlP4FTu07ZdhBPc3XWV10nfLFpHk/W
fPqVWYh/T+HTrsBFEH21OWhnwVzshmiuLgI0EiO877ZOdx5XBuBbMtDEfDwDLHfw
dgSWtLIYvV9gKs1k3Kq1goIWgQNa2noZ90roNlQvfOqDogs0/0i6iPYY6NHDdgRj
5ikrhxiYbaEFzPfpXFKgFvQIk262jVWve8R8L6rnlf83EvMxyTI=
=zoyL
-----END PGP SIGNATURE-----

--Sig_/s2jn2i3T_z3oKOeK4ncd+Io--

