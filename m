Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300036DE9AF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 04:56:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmQeD-0007Ih-La; Tue, 11 Apr 2023 22:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmQe6-0007IF-Up
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 22:55:43 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmQe1-0003xx-6h
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 22:55:42 -0400
X-UUID: 7dc5f6916bd847fc83eafa9fe4997a1f-20230412
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:425d2d00-e49d-40a7-8e5b-33a64422cc8b, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-15
X-CID-INFO: VERSION:1.1.22, REQID:425d2d00-e49d-40a7-8e5b-33a64422cc8b, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-15
X-CID-META: VersionHash:120426c, CLOUDID:beeec183-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:2304112340222P4FCU5F,BulkQuantity:2,Recheck:0,SF:19|44|24|17|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7dc5f6916bd847fc83eafa9fe4997a1f-20230412
X-User: zenghao@kylinos.cn
Received: from [172.20.12.253] [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 308790892; Wed, 12 Apr 2023 10:55:18 +0800
Message-ID: <2a57b2c95d40d090c5122a6774ab9472bf61dcdf.camel@kylinos.cn>
Subject: Re: [PATCH] Subject:[PATCH] cxl-cdat:Fix open file not closed in
 ct3_load_cdat
From: Hao Zeng <zenghao@kylinos.cn>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: jonathan.cameron@huawei.com, fan.ni@samsung.com, qemu-devel@nongnu.org, 
 xieming@kylinos.cn
Date: Wed, 12 Apr 2023 10:54:11 +0800
In-Reply-To: <CAFEAcA8c7F1WKx6_bpNiat967g2wF-KtWQwSwPVoLt-YCqYaWw@mail.gmail.com>
References: <20230403084245.54861-1-zenghao@kylinos.cn>
 <CAFEAcA8c7F1WKx6_bpNiat967g2wF-KtWQwSwPVoLt-YCqYaWw@mail.gmail.com>
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

On Tue, 2023-04-11 at 16:39 +0100, Peter Maydell wrote:
Dear Peter
Thank you for taking the time to reply to my email. I appreciate your
the valuable information you have provided.

> On Mon, 3 Apr 2023 at 13:51, zenghao <zenghao@kylinos.cn> wrote:
> >=20
> > opened file processor not closed,May cause file processor leaks
> >=20
> > Fixes:aba578bdace5303a441f8a37aad781b5cb06f38c
> >=20
> > Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> > Suggested-by: Xie Ming <xieming@kylinos.cn>
> > ---
> > =C2=A0hw/cxl/cxl-cdat.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> > index 137abd0992..ba7ed1aafd 100644
> > --- a/hw/cxl/cxl-cdat.c
> > +++ b/hw/cxl/cxl-cdat.c
> > @@ -128,6 +128,7 @@ static void ct3_load_cdat(CDATObject *cdat,
> > Error **errp)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (fread(cdat->buf, file_size, 1, fp) =3D=3D =
0) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT=
: File read failed");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fclose(fp);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Coverity also spotted this, as CID 1508069.
>=20
> The other bug in this code (CID 1507822) is that the
> check on the return value of fread() is wrong. fread()
> returns the number of items read or written, so
> checking for =3D=3D 0 only catches "no data read at all",
> not "only read half the data". This check should be
> =C2=A0if (fread(cdat->buf, file_size, 1, fp) !=3D file_size) {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0}
> I think.
> =20
> thanks
> -- PMM
I couldn't agree more with your thoughts.
I will fix the bug in a separate commit.(CID 1507822)

Best regards
Hao


