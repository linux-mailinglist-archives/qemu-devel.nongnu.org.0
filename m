Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D848A317
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:43:31 +0100 (CET)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Ny-0004lU-Qp
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73JV-00084N-LE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:38:53 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:10478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73JT-0001C8-OQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:38:53 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AKGO7Z028176;
 Mon, 10 Jan 2022 14:38:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=SxHfg8bLeVKpHpZoqs0bbD8nKTP42mfjfb6OsGpmGDY=;
 b=nVfwWM5Sbrh8rlYmJasaLg5aQCXEDjY+st4aulXtWV/Xa8C70kjPcfu8K6UVSR0p6geW
 7meHjvv+nubegpPUeMTvLy/wkMEKWh0l+ObrEqKMOYf2iZgAOamisXamzexb30TjnJ8P
 eSnPkIWVEItu+IXqDkFVmvKzNu6wrdPlLrQ/kRQrD1BnqPD5LKSUvgnZangZJgMuSGah
 AwhryP39CoJKJgK0825u0HnjGM+0NNLtKGwAQBu1cumaz32nxL8GFrU5lxdLS71ee313
 Qo8KwSvQ7Z9BSFheQXo6FBcEfRyQOwTVtnVuBlo7Jgf1MRzFTJm/ruj7/pBQ8L8tk8hI gA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dgc2b1wup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 14:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0cDOzxMsWek1TPciyhQhsV4F2sD7yy1GtJH7wZesT/y66IdHifUN8Xrj75yT/mv5c1Wjvw16QoB2I0ngzMpdYUKWR10q1sUkP2MzLxk5DlbIsGyO6hBv0gaOFMx22jmnkM4hs4Am73DQovt3kLZ1ZDvvHR/3vOpiNKE40wlB3JTOlqBrBkhACzvhz30vfmOZMaNAY46Vv3UJQPLNqsJeUH2dxH0p5+LV9DIDgWyHdNlEG6YclSV5hA5dOF8v+4sxA0D8sbi57Cb3J63EvbKJAaGMRw98r3X9E0I9vseusSC/x6uw3CkBlVeG39xY3gE0iDW5tAbowYsE0kztQwq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxHfg8bLeVKpHpZoqs0bbD8nKTP42mfjfb6OsGpmGDY=;
 b=jR0KZDAtN82wVfUEca/INXvhfpgWyT+o6BygXr+Q4wQ8oshRVaewna7WwbIa1/Rz3cPLnixZgkP7o26JWRBU3+E5JseO1f+gW6ozTKHcAKnRSJXZgWrQYF4rAwxsQG11rKxXUeTRHVJXGpavrGolW6gGppanpH4UhTrExEfPiqw2sId2cw1m9vAm1flWsLt+fiyfAhgGFCFWmBzpcsZ8VV2ihpzzbAtDrDnYvQhp9G07wEwehltg0wbBAz9qBZxyP+4qLfVzpR44yETYB3dhtsJoufnCHfJ4cqE8n+SQOfAOaxqGGKJYbfryH2Xw3hKWTs56aufArw0U6UpWziYTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5508.namprd02.prod.outlook.com (2603:10b6:208:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 22:38:46 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:38:46 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
Thread-Topic: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
Thread-Index: AQHYAslKMYrBF8S8f06BB/viZEFlKKxb+sSAgADlTYA=
Date: Mon, 10 Jan 2022 22:38:46 +0000
Message-ID: <20220110223843.GC7976@raphael-debian-dev>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-6-raphael.norwitz@nutanix.com>
 <7e5aa393-cc05-d209-6e0e-f314cd5a0c2d@redhat.com>
In-Reply-To: <7e5aa393-cc05-d209-6e0e-f314cd5a0c2d@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87bd5644-9f66-4239-139b-08d9d489f6ba
x-ms-traffictypediagnostic: BL0PR02MB5508:EE_
x-microsoft-antispam-prvs: <BL0PR02MB5508AFC3FB482D59FB01F940EA509@BL0PR02MB5508.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0W4w1G6kQaIBf0c7Y8mvOtSrKENifuSjkJN++nPDJgrUJFfa87uI2Ms1CpYqIqmgoN2Ix7v5UlYQXRf3w++fPTa17DNGgNQDYn0JzBUP75kI6IGM/qrXNqbDco+uCc7eyBfQUah0bZe4rXeDB0X6CS8lOjkNMOgv52ypaHKlj5YAtQISOejboPVRYKXhKGkHH55sp4bmZmKY84fM3M4gLzSNfYwNXeV3VarPY1nj406oPehut5K4ENmwxERzNMANbtB6/z+CrDT8CFsAvTLsGvAXs+cIDp+KpWWnVQAgHnFYdUXfC2WvE/Y50+6BPRsLq5IHm/lxlSxeSnmUfiwPlBTJ2Iokb4rIFPJkZGSHKfcrNhB7NmEoJ99RSVinVxHJGdKxnUwn+M4GJHFcvhvaj91tuQmjUyXNvbQWCPAp73FZ2FRX1FwfAMl1U/g0Vwx4897DtgNxMtbuOGMOai2GyriDwhjF4V6yewBgjuSEiGRvnkp7lUYDSGOjldqRCqJRMbtxMj/wWivBB411URt4izs4/q3/eFBCjk6L5fMNl4i0IOYWBxHiTymikQHFebaYjYjyYwrC8VuOUb46HS5UH5zA5eKPrThKP3/QNb8dyhPjVmH97zqWNmTtnEqaCMjzAnxaR4GiPJNYbWFvnQD/HYhKa0QGoFSNOx+2UQuTdaH+3frCHsHUO6Op0dP88tN4R57PQZ+JgdocP5jpLSVqeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(5660300002)(6512007)(508600001)(9686003)(122000001)(26005)(33716001)(38100700002)(38070700005)(44832011)(186003)(54906003)(83380400001)(6486002)(33656002)(71200400001)(91956017)(4326008)(316002)(8936002)(53546011)(76116006)(1076003)(6916009)(8676002)(2906002)(64756008)(66946007)(66556008)(66446008)(66476007)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DDNq6MzNnD8+V+uAqQDMhCrdXBqtHNUI7zr2/DQIeeGueplEOqQ0b8LUxUWw?=
 =?us-ascii?Q?rsXi4yNSvP7MFbnslDLTtokhnS5GpkwWdE/Y6rbosLlv7/5JYDxCTDoSdVrn?=
 =?us-ascii?Q?Oxy/HFw+2FfmhKfESVk5kr6csIPTLR8LT2N+WMAarfK5HVpsXazozfGrnoFE?=
 =?us-ascii?Q?PPH2lcz41oEqr5qfohA0veZUcwqX0zs8R9dZAfV3kkbpICJp25EXRzP0l6bj?=
 =?us-ascii?Q?E7tf6FtdA3Zb9QFz1bG4k0zaVX1uEpm+11oB+pDOX/TzKJMvlEld3iCb47JB?=
 =?us-ascii?Q?gw5heMbkqo+QWa+p4yD/l6IspXAN4sOAJATxIuMhVQatkI7H4saUXkGYilC1?=
 =?us-ascii?Q?V4/74w9+0ObmzNVuj2Rn+2lbD4dxZkmr6H8lC47lAkpg38GD3RMnNd6Uery6?=
 =?us-ascii?Q?2GXmnsm0GmD4qpkDyLLBsqLVjagcfbWuXCIyh0gLX0YTUVX1mayoKOKEyrd4?=
 =?us-ascii?Q?j9aMwmhLEKMXHo1/DkKBYvEwrxic3NMLkP4A5nEfEnS0l+vSirXFlTGzvKkt?=
 =?us-ascii?Q?IKqS4UrBre17RMLtNxRc0pGmCNXlBxjrCD6BYiP/ZQ14iGCMYzq5e5hc2T5I?=
 =?us-ascii?Q?u/flXy+3g9FWAnBNUU7jaHRdkifBY+CV0lkC1k75a9InRpKV1clfRU9Yk7Nm?=
 =?us-ascii?Q?BhHyWGOWxXLcS9emCN3vuJqiTR+0W5i365LE5ukn635msUNtNNCuf0UdSgUq?=
 =?us-ascii?Q?UZE3FUe6t/Ii0ah5c6/h8gBx9dqE1VwcfxpP0GGd4eguO+qrJ8raR4GXihqd?=
 =?us-ascii?Q?uuwjoT0aKv4aPwRLQ3wI3pBMOr2/9jXAkJmZE632MoGtETTgHP9FdGgmHMWo?=
 =?us-ascii?Q?gKtBxfejD8nDIbuokwGDA6t+EOzB3jMpvrV4xSBowFEui03gfiqhMyr3YTyV?=
 =?us-ascii?Q?diifEctxEvQkge6jzw2O9GmjRH4w8P0Ngs7yMp/+mUPOlgNLZghc2iIFARc5?=
 =?us-ascii?Q?iRqC58RKtHiAOUuIxDLhPp4Jlcg25QRy8zMi58FTM2Vd4/w/4/vAE3aAjIm+?=
 =?us-ascii?Q?+Thep79+XAVEJnfFCD4c7m6ZdHbSvA1h/TxY954a+gwfNvjRkxXGGTYU7McY?=
 =?us-ascii?Q?GqweNxUWfRDIHPMPNCnSFqhpeOLk/7UToV/5AqnOsH/6pv602jh7xzRl+WCj?=
 =?us-ascii?Q?/lh8OY+vwdceNvVgwckTh0ujyWCgyzqpENnzFXvuOUhS5ajIObKQQ4RQjD6R?=
 =?us-ascii?Q?3QRV5ncAydwE2G7HJiFzKkjv3+tgQWKaXPt/O9Kg0+tIhcFDpWUagBXlvi2c?=
 =?us-ascii?Q?N08Xhpbs9uplkv2SoHfL9MFSVlTe4t4xCJSAK1i2Rfx0NwZcCcgoHXTWEIvP?=
 =?us-ascii?Q?OKAtOE4QA2Dk0i+U6ADYPVyr0FVAyd7SoUZQeWb63iNBCpopGhmcaoINALq3?=
 =?us-ascii?Q?/wUsml0KWlkCudH9Cv8Uc5w3eNwlXdrTWfiL235iq2Q7BOTx9TV59XUZdbed?=
 =?us-ascii?Q?mdyQmAglc7WPoQWfkOTYKourApggWMDciEgdk40jWtJ8aIbBbIhKNdMFR9xB?=
 =?us-ascii?Q?RKtooiZaV0ouzFfMZG395NsdAsAVfirdVWgAAzou53BWpNjZfuOvjBrOvnqW?=
 =?us-ascii?Q?YpWy+fUgHg8wzgQh9/gOHxma9MTJJl3MjfiUrYOqRHOGxwpzJVyjEG0lxbVs?=
 =?us-ascii?Q?cfeWi0/fjMI9RsJwr82Bd08DCplk+7dZDZkfQdkEm5wSrvUdxgZtkcBHlNhG?=
 =?us-ascii?Q?xO68nSPSevcux8QZ6LK7hiE5J9A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ADAB5368D7173443845FDE15C2BC1D58@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bd5644-9f66-4239-139b-08d9d489f6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 22:38:46.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMuoOce0AoecEEV9bklxHnhk1PbLBtTSv2lz23duFBNU/DHwCk9emGhxC55kI4lKY2kGqcpQoKIGh7bCHBthHrQEEikyzSLygWwCZMpuhs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5508
X-Proofpoint-ORIG-GUID: iaj8wMZEODWbT-Qy1rLI3pyZjP-2VuTf
X-Proofpoint-GUID: iaj8wMZEODWbT-Qy1rLI3pyZjP-2VuTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_10,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 09:58:01AM +0100, David Hildenbrand wrote:
> On 06.01.22 07:47, Raphael Norwitz wrote:
> > Today if QEMU (or any other VMM) has sent multiple copies of the same
> > region to a libvhost-user based backend and then attempts to remove the
> > region, only one instance of the region will be removed, leaving stale
> > copies of the region in dev->regions[].
> >=20
> > This change resolves this by having vu_rem_mem_reg() iterate through al=
l
> > regions in dev->regions[] and delete all matching regions.
> >=20
> > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 26 ++++++++++++-----------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index 0fe3aa155b..14482484d3 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -809,6 +809,7 @@ static bool
> >  vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_regi=
on =3D &m;
> >      int i;
> > +    bool found =3D false;
> > =20
> >      if (vmsg->fd_num !=3D 1 ||
> >          vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> > @@ -835,21 +836,22 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >                  munmap(m, r->size + r->mmap_offset);
> >              }
> > =20
> > -            break;
> > +            /*
> > +             * Shift all affected entries by 1 to close the hole at in=
dex i and
> > +             * zero out the last entry.
> > +             */
> > +            memmove(dev->regions + i, dev->regions + i + 1,
> > +                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
> > +            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRe=
gion));
> > +            DPRINT("Successfully removed a region\n");
> > +            dev->nregions--;
> > +            i--;
> > +
> > +            found =3D true;
>=20
> Maybe add a comment like
>=20
> /* Continue the search for eventual duplicates. */

Ack - I'll add it.

>=20
>=20
> --=20
> Thanks,
>=20
> David / dhildenb
> =

