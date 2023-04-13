Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD606E0D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:39:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwEA-0002gR-FA; Thu, 13 Apr 2023 08:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmwE4-0002g3-O4
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:38:56 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmwDw-0001DB-JX
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:38:56 -0400
X-UUID: ae93474dd77447289325ee7b2e9316a6-20230413
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:cda5e132-493d-4d6a-8d69-6d24dea6dda8, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-INFO: VERSION:1.1.22, REQID:cda5e132-493d-4d6a-8d69-6d24dea6dda8, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-4
X-CID-META: VersionHash:120426c, CLOUDID:fbd9f483-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:230413191719XOY917KD,BulkQuantity:2,Recheck:0,SF:19|42|24|17|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: ae93474dd77447289325ee7b2e9316a6-20230413
X-User: zenghao@kylinos.cn
Received: from [172.20.12.253] [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1446428898; Thu, 13 Apr 2023 20:38:35 +0800
Message-ID: <2208189d09c8b598f83e71b728c37e805a6c7e05.camel@kylinos.cn>
Subject: Re: [PATCH v4] cxl-cdat:Fix open file not closed in ct3_load_cdat
From: Hao Zeng <zenghao@kylinos.cn>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: fan.ni@samsung.com, qemu-devel@nongnu.org, philmd@linaro.org, Peter
 Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 20:38:34 +0800
In-Reply-To: <20230413121708.00005a43@Huawei.com>
References: <20230413093328.3689564-1-zenghao@kylinos.cn>
 <20230413121708.00005a43@Huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Thu, 2023-04-13 at 12:17 +0100, Jonathan Cameron wrote:
> On Thu, 13 Apr 2023 17:33:28 +0800
> Hao Zeng <zenghao@kylinos.cn> wrote:
>=20
> > opened file processor not closed,May cause file processor leaks
>=20
> Patch description needs to say more on how this is fixed.
> Perhaps something like:
> "Open file descriptor not closed in error paths. Fix by replace
> =C2=A0open coded handling of read of whole file into a buffer with
> =C2=A0g_file_get_contents()"
>=20
> Fixes tag is part of the tag block so blank line here
>=20
> > Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange
> > implementation")
> >=20
> An no blank line here.
>=20
> > Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >=20
> > ---
> > ChangeLog:
> > =C2=A0=C2=A0=C2=A0 v3-v4:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Modify commit information,No=
 code change.
> > =C2=A0=C2=A0=C2=A0 v2->v3:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Submission of v3 on the basi=
s of v2, based on Philippe
> > Mathieu-Daud=C3=A9's suggestion
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Pointless bzero in g_malloc=
0, however this code would be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 simplified using g_fil=
e_get_contents()."
> > =C2=A0=C2=A0=C2=A0 v1->v2:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Patch 1: No change in patc=
h v1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Patch 2: Fix the check on =
the return value of fread() in
> > ct3_load_cdat
> > ---
> > =C2=A0hw/cxl/cxl-cdat.c | 30 ++++++++----------------------
> > =C2=A01 file changed, 8 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> > index 137abd0992..42c7c2031c 100644
> > --- a/hw/cxl/cxl-cdat.c
> > +++ b/hw/cxl/cxl-cdat.c
> > @@ -110,29 +110,17 @@ static void ct3_load_cdat(CDATObject *cdat,
> > Error **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0 g_autofree CDATEntry *cdat_st =3D NULL;
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t sum =3D 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0 int num_ent;
> > -=C2=A0=C2=A0=C2=A0 int i =3D 0, ent =3D 1, file_size =3D 0;
> > +=C2=A0=C2=A0=C2=A0 int i =3D 0, ent =3D 1;
> > +=C2=A0=C2=A0=C2=A0 gsize file_size =3D 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0 CDATSubHeader *hdr;
> > -=C2=A0=C2=A0=C2=A0 FILE *fp =3D NULL;
> > -
> > +=C2=A0=C2=A0=C2=A0 GError *error =3D NULL;
>=20
> Blank line here.
>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Read CDAT file and create its cache */
> > -=C2=A0=C2=A0=C2=A0 fp =3D fopen(cdat->filename, "r");
> > -=C2=A0=C2=A0=C2=A0 if (!fp) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Una=
ble to open file");
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > -=C2=A0=C2=A0=C2=A0 }
> > -
> > -=C2=A0=C2=A0=C2=A0 fseek(fp, 0, SEEK_END);
> > -=C2=A0=C2=A0=C2=A0 file_size =3D ftell(fp);
> > -=C2=A0=C2=A0=C2=A0 fseek(fp, 0, SEEK_SET);
> > -=C2=A0=C2=A0=C2=A0 cdat->buf =3D g_malloc0(file_size);
> > -
> > -=C2=A0=C2=A0=C2=A0 if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Fil=
e read failed");
> > +=C2=A0=C2=A0=C2=A0 if (!g_file_get_contents(cdat->filename, (gchar **)=
&cdat->buf,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &file_size, &error)) {
>=20
> Align parameters with start of 'cdat' (just after the opening
> bracket)
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Fil=
e read failed: %s", error-
> > >message);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_error_free(error);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > -
> > -=C2=A0=C2=A0=C2=A0 fclose(fp);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (file_size < sizeof(CDATTableHeader)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT=
: File too short");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > @@ -218,7 +206,5 @@ void cxl_doe_cdat_release(CXLComponentState
> > *cxl_cstate)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdat->free_cdat_table(=
cdat->built_buf, cdat-
> > >built_buf_len,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdat->private);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0 if (cdat->buf) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(cdat->buf);
> > -=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 g_free(cdat->buf);
>=20
> Keep the protection if moving to g_free().=C2=A0 Not all paths to this
> function allocate cdat->buf
> Protection was not needed when the call was free() though.=20
>=20
> I have a followup patch that will deal with the other issues Peter
> pointed out. I'll
> send that once yours has been finalized.
>=20
> Thanks,
>=20
> Jonathan
>=20
>=20
>=20
> > =C2=A0}
>=20
Dear Jonathan

   Thank you for taking the time to reply to my email. I appreciate
your the valuable information you have provided.
   Already submitted in v5 according to the modifications.

Best regards
Hao

