Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB06F65E8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:37:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTWy-0004KV-6X; Thu, 04 May 2023 03:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puTWt-0004Ho-6b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:37:31 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puTWq-0004mq-Lp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:37:30 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504073722euoutp029c9dfb5b65b276419ff45c09c84fbfc3~b4JsZ-tt10513905139euoutp02_
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 07:37:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230504073722euoutp029c9dfb5b65b276419ff45c09c84fbfc3~b4JsZ-tt10513905139euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683185842;
 bh=WtOLKNnvBv6wa9drVeRIpYd/NZWVEyMETS3NpXSynXA=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=flVliDtKMTIm+9UeojnjK5pG/hzPRJBsbCe2LAkp0UK0VcfFwoPQjUKv8bs4csHFl
 /c6kzMCG8nGhsr2DXs2BuRORWjJ8SwpZeM2oGcj5px1pIjPAZPlCySnsSblTJaOBwZ
 mz0eMyIpOTOZ9pz7ErSfuzwPc2rsFShmCrdMMdug=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230504073722eucas1p1cd1bcd0babfa80fe70c25e81310d28d5~b4Jr89yao0237502375eucas1p1A;
 Thu,  4 May 2023 07:37:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.9A.42423.1B063546; Thu,  4
 May 2023 08:37:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230504073721eucas1p23703ac2f83ff151b335f8460baf31830~b4JrieMRn2723627236eucas1p2m;
 Thu,  4 May 2023 07:37:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230504073721eusmtrp1fd81d16a80f288f4671fbad6159bd148~b4Jrh43e31144911449eusmtrp16;
 Thu,  4 May 2023 07:37:21 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-ae-645360b135f5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 28.55.14344.1B063546; Thu,  4
 May 2023 08:37:21 +0100 (BST)
Received: from AMDN5139 (unknown [106.210.135.112]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230504073721eusmtip25a76396a0f285140e4ef34bb52bb228c~b4JrAYyrV1850118501eusmtip2r;
 Thu,  4 May 2023 07:37:20 +0000 (GMT)
From: "Tomasz Dzieciol/VIM Integration \(NC\) /SRPOL/Engineer/Samsung
 Electronics" <t.dzieciol@partner.samsung.com>
To: "'Akihiko Odaki'" <akihiko.odaki@daynix.com>, "'Sriram Yagnaraman'"
 <sriram.yagnaraman@est.tech>, <qemu-devel@nongnu.org>
Cc: <jasowang@redhat.com>, <k.kwiecien@samsung.com>, <m.sochacki@samsung.com>
In-Reply-To: <918fad48-4c0e-f68b-7144-9ef7822cd218@daynix.com>
Subject: RE: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Date: Thu, 4 May 2023 09:37:20 +0200
Message-ID: <006501d97e5b$42dfd7b0$c89f8710$@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: pl
Thread-Index: AQEd3+2yH27pherbGsInQNBOK9ndlAKi6rc9AwLIhmwB9c1WVwH0vaY0ArNKAwcB9SBlLbBPMHpA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7obE4JTDA4ttbD4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGevvaBS0i1Rc7OxlbGDcItzFyMkhIWAicWTzVuYuRi4OIYEVjBLHpx2E
 cr4wSvyduZYNwvnMKLHs0gtGmJbDt/6zg9hCAssZJdrv80DYLxglvk1xBLHZBEolFnYfZAKx
 RQTqJa6c/cHaxcjBwSzgL3FsYRhImFPATuLJxhdgY4QFHCS6Z/4HK2cRUJG4MqeLGcTmFXCU
 uNo6nRHCFpQ4OfMJC4jNLKAtsWzha2aIcxQkfj5dxgoRF5G48aiFEWSViECUxJO2WJDzJQQe
 cEjMnd0Hdb6LxOZZG9khbGGJV8e3QNkyEqcn97BA2OUSP89uY4dobmGU2DN1MlSRtcSlrT+h
 ftGUWL9LH8SUALpz42EuCJNP4sZbQYhr+CQmbZvODBHmlehoE4KYoSPxbdNMtgmMyrOQ/DUL
 yV+zkPwyC2HVAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIEJ5/S/4592MM599VHv
 ECMTB+MhRgkOZiUR3g+FfilCvCmJlVWpRfnxRaU5qcWHGKU5WJTEebVtTyYLCaQnlqRmp6YW
 pBbBZJk4OKUamCYHTqxTkTKdtnbu6Z2RhS3/pz8M79v7sODD9omHAxvfO7a6V9Zv+H3PVPik
 fcz/XflJ/x/Nd3biYZzT2XhSx39lakNn7nTjbTmXTUXc5DiL5/mfayvebcEQ+2ROypX+/4oV
 BuGv6xcITjmW8MzYrzo86uWGveqRBtLzTUxKFm/kaD2d90S0Ye2197u4zOIFi5dc/XLu++80
 k723rKZL7dVL6olNvKSz123WByfLe5Iv2K7Ku/i8rRGfkN27q0jq6MSbU17Jd3E1hP7J5Un9
 lfF29p8FDw76uUXn5Dn0n+EMUKy/1HJFcb3BmoMHNc42V+kb3GnOvZKys1ZFvntiZHHix0Z7
 vVMVNZdVTC98V2Ipzkg01GIuKk4EAHPTn6ynAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7obE4JTDHbPkrH4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gb2f+pkL
 PvNVXN+zhr2BcQdPFyMnh4SAicThW//Zuxi5OIQEljJKLHqzkhkiISWxrwckAWILS/y51sUG
 UfSMUWLGyRdsIAk2gWKJjTfaGEESIgKNjBIfP7WAdTALBEpsvXudEaLjMrPEp0cNjCAJTgE7
 iScbX4AVCQs4SHTP/M8EYrMIqEhcmdMFtppXwFHiaut0RghbUOLkzCcsEEO1JXoftjLC2MsW
 voY6VUHi59NlrBBxEYkbj1qAajiALoqSeNIWO4FReBaSSbOQTJqFZNIsJN0LGFlWMYqklhbn
 pucWG+kVJ+YWl+al6yXn525iBMbhtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8Hwr9UoR4UxIr
 q1KL8uOLSnNSiw8xmgK9NpFZSjQ5H5gI8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1Kz
 U1MLUotg+pg4OKUamNI2nqiNr1sXOHH/EulNArLz5zF9TuqXuZCq7+j65mMmy6sGO07H7aoq
 DVOmPV3Cf5VtwZ+Pp8WOd86vy194Rn3H9akrV0tKsd18v1v66/07TnWtx0o914ra1bHY3j0/
 0elj34QDL6N7ZwRfu3ThS/i5b2bFpr/fSe6ao3lrzx+7FJU5K14dDvPf8cycZ5lqa8/uwpTg
 I181Xkwxvf2kX37b7eeftBjnmuzZr5rCteLNo6rO1C9LE2eccH6UHf5w6pxl540Mkt4tX7P7
 9qxCf3YDpSMchRY8O1g0S37UPzxblNy0iD386cLmLxHPutLCojeu050ityZr/nq+xbvPKly8
 cXN94JFZ+/WD5SYI9lrsVWIpzkg01GIuKk4EAK/9Q3JMAwAA
X-CMS-MailID: 20230504073721eucas1p23703ac2f83ff151b335f8460baf31830
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <DBBP189MB14338337B5EE87A7280E553795699@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <000001d97cfe$800e79b0$802b6d10$@partner.samsung.com>
 <DBBP189MB1433AA631D3115FFE5D449E7956C9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <918fad48-4c0e-f68b-7144-9ef7822cd218@daynix.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I will remove checking RXCSUM.IPPCSE flag then.

-----Original Message-----
From: Akihiko Odaki <akihiko.odaki=40daynix.com>=20
Sent: =C5=9Broda,=203=20maja=202023=2017:11=0D=0ATo:=20Sriram=20Yagnaraman=
=20<sriram.yagnaraman=40est.tech>;=20Tomasz=20Dzieciol/VIM=20Integration=20=
(NC)=20/SRPOL/Engineer/Samsung=20Electronics=20<t.dzieciol=40partner.samsun=
g.com>;=20qemu-devel=40nongnu.org=0D=0ACc:=20jasowang=40redhat.com;=20k.kwi=
ecien=40samsung.com;=20m.sochacki=40samsung.com=0D=0ASubject:=20Re:=20=5BPA=
TCH=20v3=201/2=5D=20igb:=20RX=20descriptors=20handling=20cleanup=0D=0A=0D=
=0AOn=202023/05/03=2016:46,=20Sriram=20Yagnaraman=20wrote:=0D=0A>=20=0D=0A>=
=20=0D=0A>>=20-----Original=20Message-----=0D=0A>>=20From:=20Tomasz=20Dziec=
iol/VIM=20Integration=20(NC)=20/SRPOL/Engineer/Samsung=20=0D=0A>>=20Electro=
nics=20<t.dzieciol=40partner.samsung.com>=0D=0A>>=20Sent:=20Tuesday,=202=20=
May=202023=2016:01=0D=0A>>=20To:=20Sriram=20Yagnaraman=20<sriram.yagnaraman=
=40est.tech>;=20qemu-=20=0D=0A>>=20devel=40nongnu.org;=20akihiko.odaki=40da=
ynix.com=0D=0A>>=20Cc:=20jasowang=40redhat.com;=20k.kwiecien=40samsung.com;=
=20=0D=0A>>=20m.sochacki=40samsung.com=0D=0A>>=20Subject:=20RE:=20=5BPATCH=
=20v3=201/2=5D=20igb:=20RX=20descriptors=20handling=20cleanup=0D=0A>>=0D=0A=
>>=20Not=20Linux/DPDK/FreeBSD=20for=20IGB.=0D=0A>>=0D=0A>>=20Change=20here=
=20adds=20additional=20condition=20(RXCSUM.IPPCSE=20set)=20to=20enable=20=
=0D=0A>>=20putting=20IP=20ID=20into=20descriptor,=20besides=20clearing=20RX=
CSUM.PCSD=20(required=20=0D=0A>>=20according=20to=20Intel=2082576=20datashe=
et)=20that=20was=20not=20present=20in=20the=20e1000e=20code.=0D=0A>>=0D=0A>=
=20=0D=0A>=20Yes,=20we=20can't=20even=20use=20ethtool=20to=20set=20this=20f=
ield.=0D=0A>=20My=20suggestion=20is=20to=20not=20add/maintain=20code=20that=
=20we=20cannot=20test.=20I=20leave=20it=20up=20to=20Akhikho=20to=20decide=
=20if=20we=20really=20need=20to=20implement=20IPPCSE.=0D=0A>=20The=20defaul=
t=20value=20of=20RXCSUM.IPPCSE=20is=20unset,=20so=20we=20could=20as=20well=
=20ignore=20this=20field=20until=20there=20is=20a=20user=20who=20sets=20thi=
s.=0D=0A=0D=0AIn=20general=20I=20won't=20reject=20a=20patch=20to=20implemen=
t=20a=20feature=20not=20used=20by=20a=20known=20guest,=20but=20I=20don't=20=
recommend=20that.=20It=20just=20doesn't=20make=20sense=20to=20spend=20time=
=20to=20write=20code=20that=20can=20turn=20out=20so=20buggy=20that=20it=20i=
s=20unusable=20in=20practice,=20which=20is=20often=20the=20case=20with=20un=
tested=20code.=0D=0A=0D=0A

