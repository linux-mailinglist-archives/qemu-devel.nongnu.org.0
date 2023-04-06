Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C516D9C22
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:22:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRRV-00051e-0Y; Thu, 06 Apr 2023 11:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pkRRP-00050q-2t
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:22:23 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pkRRN-0007ya-3W
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680794533; i=lukasstraub2@web.de;
 bh=VZGU/QL5RMFANdwCR0hkb2hO6/V4aut4mkFMz77xaow=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kP7+50Loe87Tw4Rz1CXgys6ldTIlYNEB9SEJ5/S3hGpciQNhFl937fX5pRgDmEtAo
 nBiWLXtBHdv9yKbXfA8A7StjltmY1JbokSydZAlfkSyJo1oBBHMMSnrG16SQNrbdhp
 rKZ2qNMK0Vf7WPCxA39sliOt4jti8ronph0yBm5VjxlIpcX0d6Hz5/SZnXphv549x8
 mkItv/IOtuNKaQostn9NJAr3WnSiRVi/LSzKiM95Ag38CxsJKNxg6MFgmXn86j8iCp
 c49y4nHq99M4rGygYH8o+Gz/K2iOSoY4imKNH5UtX53ADW3TjuYkkMnfc4YzCCihao
 7MKYiPUc8sxAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.105]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mav2X-1qH22I10u3-00c8tQ; Thu, 06
 Apr 2023 17:22:13 +0200
Date: Thu, 6 Apr 2023 15:21:55 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-8.0 v2 2/2] migration/ram.c: Fix migration with
 compress enabled
Message-ID: <20230406152125.184376bc@gecko.fritz.box>
In-Reply-To: <2c4cac0ca620ea0304d88b8f5110fe290400c8c8.1680618040.git.lukasstraub2@web.de>
References: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
 <2c4cac0ca620ea0304d88b8f5110fe290400c8c8.1680618040.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n+huVA2oSz3D2tnB22_dd8U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:n3r5aWKCSprh6Ib+0UQsoU/AmWjz1cgqNdHB8EjR21rtQUON28e
 yZ5yK9Zs+V/M6F5w5xT8iY1LU6330+gOwhz1zXclDxXI1f4vM5CLjpbUs1k16TxgZaUD+vt
 0v9siz9JsWZh+ftaZ6aXdFlbr8x2q5pvFUGsQzQf03L7H8o0vfCpV+/otBDhviW3AVih5h4
 Orl3AN86blt5JK9RQTPkA==
UI-OutboundReport: notjunk:1;M01:P0:wSZi9OhfTcs=;axkOUzk29BlG8cJ40S8mVXZZgpC
 Y3dRUQ8bQR8L+WwYzWNlMDGMk0NtsvfYimnd87q6L6npGOdMDeMVqeRk5B4HIuR5kWtkWUDhN
 xydym9roilYfGki6KZ57QHoHyGltdZa4n58dlWXwWfdJ05h3rLb64EExLN6wWNGnYSm00ubw/
 RscTxmjl5+kn3XfCZNyyHD9aXz7H6CPdzneLA+lobUpi2+LNfzsNwwLrAkvWw8hxC8oEjhMyx
 qKhOliB7dhITFRlGlFOnLhUGw7XEjYLwQIGozLlgwLGRlAiPyX0CABEM8WLfAcmm7ca62AaPE
 xekqfHmvEd/ngTj1Cfk7K1AwPX60wRkFczAa+qUbT6dBYqQEKRuLZHwKd7c+a+4kDG7pJ59h0
 5G610m/trcDChDw3+//JtWrpZyZawys0i0OfMBuyEaBK6B08LORePkFPc/OyzfxyhPCGKdtEU
 6p7DXwgDQn0h2bJ3s5w3tXNhwIKjZ3cF5vnIP4LiZYMP+uJUzJUb9l64G4ha3ye6cMTFSP54Y
 NR/2VWANkqrlxap3uZhWpW0Tv0vSx3FCOaQgk45H4WPXdeVhK3MyDnorzfK3LU79/3+J6He7N
 ln2aHOsIU3hJbptjtmiHjMw4gdLFWsK8HP5pcIUlXMUypUw/KPPDanmdmHxsHRe5CdgIMZ6WR
 +8x5msusQVTtrGW0u4ULPTHsaHoZOXejiWTT2Y3aPcGKUA1JIOXQCUCpFXIq5qh+JK1SbiiGe
 u64FOMU45JVQ8ROt+f2WMtCAGmMHLoYly0cgZuEOXSKTtWoXOLiBvBIvuG/HCKw3CZziqfZag
 4UVrSdDiNGfRrj8NaG2SmZAJ2WI5WPxac4/w553UovUpvKTbVSAl3EJ7ZcAY0IdSctEuohpGK
 F6wuHPiWxRqsXhEPbhHdIRN8qhtvO8oqmGLsu81cm2zhUkZcv+dGXO+ErXWk9PvM1tSWLCIvJ
 7l8z+q2NnMhkFSGiDlTU+lrDOBs=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--Sig_/n+huVA2oSz3D2tnB22_dd8U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ping? This should go in rc4, there is not much time left to prepare a
PULL...

Best Regards,
Lukas Straub

On Tue, 4 Apr 2023 14:36:03 +0000
Lukas Straub <lukasstraub2@web.de> wrote:

> Since ec6f3ab9, migration with compress enabled was broken, because
> the compress threads use a dummy QEMUFile which just acts as a
> buffer and that commit accidentally changed it to use the outgoing
> migration channel instead.
>=20
> Fix this by using the dummy file again in the compress threads.
>=20
> Fixes: ec6f3ab9f4 ("migration: Move last_sent_block into PageSearchStatus=
")
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
> v2:
>  - Add Fixed: and Reviewed-by: tags
>=20
>  migration/ram.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 96e8a19a58..9d1817ab7b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -688,12 +688,11 @@ exit:
>   * @offset: offset inside the block for the page
>   *          in the lower bits, it contains flags
>   */
> -static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
> -                               ram_addr_t offset)
> +static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
> +                               RAMBlock *block, ram_addr_t offset)
>  {
>      size_t size, len;
>      bool same_block =3D (block =3D=3D pss->last_sent_block);
> -    QEMUFile *f =3D pss->pss_channel;
> =20
>      if (same_block) {
>          offset |=3D RAM_SAVE_FLAG_CONTINUE;
> @@ -867,7 +866,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchS=
tatus *pss,
>      }
> =20
>      /* Send XBZRLE based compressed page */
> -    bytes_xbzrle =3D save_page_header(pss, block,
> +    bytes_xbzrle =3D save_page_header(pss, pss->pss_channel, block,
>                                      offset | RAM_SAVE_FLAG_XBZRLE);
>      qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
>      qemu_put_be16(file, encoded_len);
> @@ -1302,15 +1301,14 @@ void ram_release_page(const char *rbname, uint64_=
t offset)
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_zero_page_to_file(PageSearchStatus *pss,
> +static int save_zero_page_to_file(PageSearchStatus *pss, QEMUFile *file,
>                                    RAMBlock *block, ram_addr_t offset)
>  {
>      uint8_t *p =3D block->host + offset;
> -    QEMUFile *file =3D pss->pss_channel;
>      int len =3D 0;
> =20
>      if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
> -        len +=3D save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZER=
O);
> +        len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FL=
AG_ZERO);
>          qemu_put_byte(file, 0);
>          len +=3D 1;
>          ram_release_page(block->idstr, offset);
> @@ -1327,10 +1325,10 @@ static int save_zero_page_to_file(PageSearchStatu=
s *pss,
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
> +static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *=
block,
>                            ram_addr_t offset)
>  {
> -    int len =3D save_zero_page_to_file(pss, block, offset);
> +    int len =3D save_zero_page_to_file(pss, f, block, offset);
> =20
>      if (len) {
>          stat64_add(&ram_atomic_counters.duplicate, 1);
> @@ -1394,7 +1392,7 @@ static int save_normal_page(PageSearchStatus *pss, =
RAMBlock *block,
>  {
>      QEMUFile *file =3D pss->pss_channel;
> =20
> -    ram_transferred_add(save_page_header(pss, block,
> +    ram_transferred_add(save_page_header(pss, pss->pss_channel, block,
>                                           offset | RAM_SAVE_FLAG_PAGE));
>      if (async) {
>          qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
> @@ -1473,11 +1471,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_s=
tream *stream, RAMBlock *block,
>      uint8_t *p =3D block->host + offset;
>      int ret;
> =20
> -    if (save_zero_page_to_file(pss, block, offset)) {
> +    if (save_zero_page_to_file(pss, f, block, offset)) {
>          return true;
>      }
> =20
> -    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> +    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE=
);
> =20
>      /*
>       * copy it to a internal buffer to avoid it being modified by VM
> @@ -2355,7 +2353,7 @@ static int ram_save_target_page_legacy(RAMState *rs=
, PageSearchStatus *pss)
>          return 1;
>      }
> =20
> -    res =3D save_zero_page(pss, block, offset);
> +    res =3D save_zero_page(pss, pss->pss_channel, block, offset);
>      if (res > 0) {
>          /* Must let xbzrle know, otherwise a previous (now 0'd) cached
>           * page would be stale



--=20


--Sig_/n+huVA2oSz3D2tnB22_dd8U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQu45MACgkQNasLKJxd
sljP0BAAmXGGvAIUZQ90ZmO4PCbTvamLWi/xRs+q5iY4uSQa7PeiIfL/lrFYRaw3
2o3gHu+gld9F8khhkH6IW8uE8vvCoZyS/R65/g+0fVShWKHQptzELcttubKJR7qW
T5c/Zl/BzjgRB+04jLG/HTCdu3OQYb38g7WHmpfm9mWAatc6dbMZp4ldBu6Fl42l
1/144YwBoUcA6mWIBZaSo4X0mVJP/T62kAgVlGDV0q6oeFb1WUUfCukIzrh1JyeL
Sae2WSIB+pDcPUx5BR9MiuK0MpoRfWDGQXwp6JMKZ2yeBP8akXkf7tXkzKN5Zwb9
KI7U1aiPEUvyJWEVpmKJVZsknQjcuWuwzG8Uz6aUtt2E2MQXr9zzX4rcG+CjcSMv
DJrocCgxq5/6sFrrslMWZjLj4IzsBoInIT5G8N5rJbRXBcb+peU6ZWzsujzBMa8M
LI1e9hQnjCRf4gH5+kdprGuiXqnDGQgipb5CCWUSiJqWXBC36NEclrJSssYmdiNs
TJFxwf1jgRA/Uquoj8qBPsYPIYUZoEihNXSwesuumMjmAVQfOabOl2Fwof0SIZUW
RkWfBQBhEPf8Uw3vPUoUV2lH10oYE1GcUu4qq9/R2A3+cMvAhwBrXtv4xzUBGlKa
MnXdur5AGmmwwXxkqhakEXRqYMGLQwijRG4iIC4VB7TpuqTWhRc=
=2g8z
-----END PGP SIGNATURE-----

--Sig_/n+huVA2oSz3D2tnB22_dd8U--

