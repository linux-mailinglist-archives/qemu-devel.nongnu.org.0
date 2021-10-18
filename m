Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37163431FD7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:34:43 +0200 (CEST)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTir-0004Bv-RN
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mcThq-0003Fc-J2; Mon, 18 Oct 2021 10:33:38 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:39976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mcTho-0000gi-A9; Mon, 18 Oct 2021 10:33:38 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19ID4Pu0016136; 
 Mon, 18 Oct 2021 07:33:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=NW7USPzzSKyXV9AmwvStT489aQh/s3Ie5cKIoHn4c20=;
 b=n2cXtoCkx9IsKzFaXjtgWQJaUibEQzLZldKvE0/3Gt7yPV2SWkFiDAvAaaPe+m93UpOe
 CQ3xCK8necsuxh06P5NB24dzYSwI4klDSYepFXZAeqiK6UZ59J4oM6wBAIJKfsRSPfU/
 IHXvU4cejld5NnNeM78pfXyIDJRwfLjmf+orKerJ3v/2LrwZ82tX+IxaqfJG3QZSKalV
 R6UJyb/cH7Hf1nCJ6WwI3BYWXsS3p9dtmFmsHps/miCeI0Mh0tSyjpTKW6CahcVokMa6
 lXf33RUqD1kXvMP1uN80fyuTE26Oo4+EUEsfb17YlJIVzQsO2iGxwzAJP1elr7hzPZZa LA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bs9g4g68y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 07:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvfEhI8PV/iMsi65xab3vCQJVZHCcExijzpRGF4UDz6gxblbzuOsSSDBfZX0h52TObnosWyNIs0pYp4lRy3ZCNmxJvi15rqaynF8f1fTo2QqMY3rmVqsePUoedZW4cd3aVcFMu5XQ7Nno/FM+2dQuMPnMQ8GZ6pUSRfgtWPbn/TjTVHPhytbqc8fS7QHG2aUnjuc/cFJh5bPVd6SzkmM7uLzwGb4aGXooSTNqVAkURlAV1ctJlyKemkYYpgnVurF/PjeOIZgCqFjhxfO5p/mUgWuZPGUhkHjMhq8TsrbopjCUogpba0eWrOzvO0y9t0vfQafM70zCfWZyOVvJo29uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW7USPzzSKyXV9AmwvStT489aQh/s3Ie5cKIoHn4c20=;
 b=XNyLpZEtXU1yusgVBHhTz+FIf4hlHgAYuBDBN4uvGsMU+RGWmFLHw6k1UZNkTWjn5yjNjlVHixBUuymtFy+Ct+M4sfjBxQGWh/I69aEx35qRhnXv0N2mhrt3SoAZfo4om4wtUPO+iTleiUxPNtWglI643tr5g9GCuZpf57jVWMC1FugL6G/+kyueu02s6qBJ+35F8QV8yMwN976RUldxoL51VE56xxn9wVZ5xPm3gqbOnVvJ8l7SDjI7i1msNLvabhlEeeyyXM5JRDIv+A5x21gsTDwDa2f5FkgvePSXC3+G1pU6ZCIzpSigoCli6gV/Ti5F9TU4zrt0gYlaGjSWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4417.namprd02.prod.outlook.com (2603:10b6:208:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 14:33:23 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:33:23 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Index: AQHXvtwaeFZLuGJV1Eq0Q9rMxfifyavQrxMAgAFB1YCABt9tgIAADCOA
Date: Mon, 18 Oct 2021 14:33:23 +0000
Message-ID: <20211018143319.GA11006@raphael-debian-dev>
References: <20211011201047.62587-1-david@redhat.com>
 <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
 <20211014045239.GA21284@raphael-debian-dev>
 <20211018094924-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211018094924-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98477259-1590-42cd-ef6a-08d992443d7a
x-ms-traffictypediagnostic: BL0PR02MB4417:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB441748B26F425BCA3008A8F0EABC9@BL0PR02MB4417.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNffqyfu41WvTHNHwkcTc6LRQHOsSUHXOOrcZRKAVcPChCjmT4ZgNzEgqe3KmtbnzmFLIGtnEiVLQ9XoyyZG5YSYcENHhH1sDlX/RgeTAqzF6ISut12qEQxx0dgh30Oh2owydutzENj9MdPTaAlfP3RXOcy0IYFmRSCeEnMAmYsI9c4EoAuWkzFsdCTFP6pGXcimD8S9YI1BiWzbX5tPYjsWCt3703P8V1rJ8Gm8zH1gMQC6Alms85zPfWMyu+80tU6G7R33+OOk/c6fQkjLfdJB41gdBVODGpF451ZRqfsDHU9Pb2Uu2pC6OciHQTwHnX4+ugHwPpRM2AHiNH322kk5tdZNcbW9mYRmbmCo2zefaVB4Jb3mTkbkL6/9DneZhhhOQKGqngafjldp3xRCzATlH0pQFGbM9sJXwhZhOlTsmXUrLtV0jtj4FY5thy5JQSFJwEzYCLJjPkT4/MBE8vV0tXfXT0bvU8ETdHzQfaW4nQrf8RByfmBdJXpNDxtr/Gn4RR1g3E61pjrKChAMAOT1gri2XjlJdme+3P5YiZI/tq+SVf5uMfypscQz4E7PccoHAgUJr4kUcmZzCDkvzfa9d+Ln5iqJdtpbbRhc3OdbV9t7rpOtMwThNkMWZbpkF+pBTUQwUKVWFZBPn0tpIBUqBWBApYdg2eYHJtJGAO4+akfB3PS/f7US1Rj8UtoL7W8oZbuUtC9whFX9rLs/Dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(8676002)(71200400001)(5660300002)(66446008)(33656002)(2906002)(38070700005)(38100700002)(91956017)(186003)(44832011)(6506007)(66946007)(66556008)(66476007)(64756008)(76116006)(9686003)(33716001)(1076003)(6916009)(122000001)(26005)(83380400001)(508600001)(6512007)(86362001)(54906003)(8936002)(6486002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7XJIE7/T1DEWCd3OJl5sHn2PIIMYTBixSYVhmvLVcpMxkeSG+H9pU8vHfg?=
 =?iso-8859-1?Q?ZeOiCERAbV/6GyQiCi+9Qi//7MuOQ9A3n+YoIov8grmNrv4IWChPuYkgh4?=
 =?iso-8859-1?Q?Eu+BmL/25izCWfXkrAMcTjvzq5wbGn5xDIEVCx/iY9zBBo+wzeHljZlqzm?=
 =?iso-8859-1?Q?djLZu2nUb3PJbXpcW1UnxyrzDms5fZxa/Xbw7M4WYWs9/onChRPjwVjWjN?=
 =?iso-8859-1?Q?rIIiw70aOQyTqodlViNyHtc+SXoY4tIaVX2G5hkDm0baZ1j4rWOdp6/LhQ?=
 =?iso-8859-1?Q?OEy23Ui6kTFNRxlDVVFLzVjIc9x6QVXwCob5f9Xb6u5dAzvw1FqMC+dYwl?=
 =?iso-8859-1?Q?C/faieMK46E02zJAdEZVVfs9QrJz1W16SJ/s6ToSGvdEymrvgPTIZY6xrr?=
 =?iso-8859-1?Q?fqdGgrTSCMLE8PeWempmKN/YezA8mrFSGKgVDDVX4IyrDbKlsXQ3Qyn7OC?=
 =?iso-8859-1?Q?4HVcLm8Q1quBkcQJVnwxmqmUVqVSWtH2ubYnDH+FdQNr4B+vV8DUvwcnh6?=
 =?iso-8859-1?Q?DtAHRXiAIC9bEQ72KRrmg8Dx+kQDWPyLv9pYa6YdR/Ydg6U+fHTaMw3CIP?=
 =?iso-8859-1?Q?dek7TUu/KBTAAI96sJvOSBlVqfrkNu4+/etWwV8LYQ8Wa1qvoH2XYlkxyc?=
 =?iso-8859-1?Q?g+2ffchFcHbVeJZ7w63n4LNPR/md+Vu9Aa0SHsdFLu82GjCGO+TyuyoLYC?=
 =?iso-8859-1?Q?POpbhvgM5d862YXiuzqzb54KeY/P6flNRjiPTDZVfi22/1hthoFg8Unw+B?=
 =?iso-8859-1?Q?lxzlnlItc/FuOKMSkBAK/F0nEvyT8CW7+fUEhjGiU+YEdbRNHMH4ov3gB1?=
 =?iso-8859-1?Q?cnAvwk11UrUMTI2PMuP1T6Vv/RVmnd0iUNBgjIGfuGC6uDPE6PRp9EmOHn?=
 =?iso-8859-1?Q?B1pKJGI0h9fPYHiHTGkYV+mQG3s5mBDrATOEX1FcKFXdyhjtd5IvE6lcFs?=
 =?iso-8859-1?Q?we4CHlQbQA/Z+4/HFxVFju09Gl6Sr31WjEX9jnVKVWySqm4Y3UhmqHSNpP?=
 =?iso-8859-1?Q?kHWIek4TN/Bmwy9cbXaaUK2TlQrzdKOY67UW/teBSI13d9Zs+Mexb+Du52?=
 =?iso-8859-1?Q?TlbX6oGQVW+ZYAbugd78gdFQUt1mu9/idkHAX26Ouo9tqBhlkSXcfFbsOq?=
 =?iso-8859-1?Q?ceHRD5TI8XmXcHCi8Hjxp3ZJOCnJuTx2Hh+VbqjjI3BVZZcAfiyvl9dPLr?=
 =?iso-8859-1?Q?qh3c9nTaD9IS5PFmm4tvyqNisucHG56xvVYXnszi9BuME7JwuWy3UrMf0u?=
 =?iso-8859-1?Q?6iismQexeqi28P4C0V3ESG9/bv6mxs5uY3ga3JBJK1PbP4F/+iYgpw7uTj?=
 =?iso-8859-1?Q?m97wpM4X+EfS47s1Jfp/Hv8txSVcvbITrQdexdYeiAB+W7E1Z4azQJiQ8m?=
 =?iso-8859-1?Q?kihMijrmFTJYHx3Vsmv8RYmU472xKL1g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4A45E19C54FFBA40901BABC8902DF17B@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98477259-1590-42cd-ef6a-08d992443d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 14:33:23.5229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVVZQgx1otpFxN2fQ+2Hhx+8Shj2JG3sM2jVxhvTa95iieGg28nXD/SjHlKcoqKI7My/GK9m9LtPdT2MprLm82sG2dsYeUwn6j/Y1mv8taw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4417
X-Proofpoint-GUID: 86o0R5okqSGXwSrL3dj1draayPTJWURc
X-Proofpoint-ORIG-GUID: 86o0R5okqSGXwSrL3dj1draayPTJWURc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_06,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Coiby Xu <coiby.xu@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 09:49:53AM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 14, 2021 at 04:52:48AM +0000, Raphael Norwitz wrote:
> > On Wed, Oct 13, 2021 at 10:40:46AM +0100, Stefan Hajnoczi wrote:
> > > On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> > > > We end up not copying the mmap_addr of all existing regions, result=
ing
> > > > in a SEGFAULT once we actually try to map/access anything within ou=
r
> > > > memory regions.
> > > >=20
> > > > Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-u=
ser")
> > > > Cc: qemu-stable@nongnu.org
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > > Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> > > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Coiby Xu <coiby.xu@gmail.com>
> > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > > ---
> > > >  subprojects/libvhost-user/libvhost-user.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subproject=
s/libvhost-user/libvhost-user.c
> > > > index bf09693255..787f4d2d4f 100644
> > > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > > @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) =
{
> > > >              shadow_regions[j].gpa =3D dev->regions[i].gpa;
> > > >              shadow_regions[j].size =3D dev->regions[i].size;
> > > >              shadow_regions[j].qva =3D dev->regions[i].qva;
> > > > +            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_a=
ddr;
> > > >              shadow_regions[j].mmap_offset =3D dev->regions[i].mmap=
_offset;
> > > >              j++;
> > > >          } else {
> > >=20
> > > Raphael: Some questions about vu_rem_mem_reg():
> > >=20
> > > - What ensures that shadow_regions[VHOST_USER_MAX_RAM_SLOTS] is large
> > >   enough? The add_mem_reg/set_mem_table code doesn't seem to check
> > >   whether there is enough space in dev->regions[] before adding regio=
ns.
> > >
> >=20
> > Correct - it does not check if there is enough space as is. I can add t=
hat.
>=20
>=20
> Just making sure - you are now working on series supreceding this patch?
> Is that right?

I was just going to fix the missing input validation. This looks like a
standalone issue and in my opinon the fix should go in as is. I will
base my changes on top of it.=20

>=20
> > > - What happens when the master populated dev->regions[] with multiple
> > >   copies of the same region? dev->nregions is only decremented once a=
nd
> > >   no longer accurately reflects the number of elements in
> > >   dev->regions[].
> >=20
> > That case is also not accounted for. I will add it.
> >=20
> > >=20
> > > libvhost-user must not trust the vhost-user master since vhost-user
> > > needs to provide process isolation. Please add input validation.
> > >=20
> >=20
> > Got it - let me start working on a series.
> >=20
> > > Stefan
> =

