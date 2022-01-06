Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CE486056
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:39:52 +0100 (CET)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LV9-0001yv-Lj
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5LRs-00082W-2i
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 00:36:28 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5LRp-0006KG-F7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 00:36:27 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N63nG004580;
 Wed, 5 Jan 2022 21:36:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=MDJBHn6NXaSJfhuUq2+c0b3W7Ha3p6b7gpetWSMxBMY=;
 b=21pgdhlKeiqHGVze5SdpeItCVYRaFHOgX6Pld1Ij93KGrcjDFHmgobL4ZTZqYlT7TIwz
 iyhYcsYEzKBGTW0tF0BKAz9bgcdRL1QUic044DlkS/L4fEKxA9NZ+mYtnw8n+jqmvgqB
 XQw8Z3FngizPwwZNk8JPwUcCjqLOytH66P3MH9zx7ehZLuIuWJoYlWfjbc9yJBPKSFcw
 ujnWVf4RGKFb03YE+fpXyA8pOZZs5PQnd9Snco064c8HP6F00lU2ZvH3q4BDHEWrwuOF
 tu1Mk5/fDSwB1shIa9Ro8PbVmCbUPFWj2hiz4042D5cWrGN5g95vuj2kLBSVUdcbzGta Jw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmpwgfb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 21:36:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGeg5f9nIpXQR6SjpSSF8TEwX3/ckWbv4tgotvs1swkucplfx29OJRMIQqzdoBG4jhajm1JCBt268003dtopm0yskkJ3uG4VPW4dZRh8BLUHqG+Q2PGmDVutck2gPWhiRopA8qPfGHZPeXzNZ0lFA9OT14STKQhxvcJ3cpaqgRYKYCG7hHKX3pN4aNEFID7d3W/zTFqmHF25h8me1rXHcbte43BEA/cqovAT12cF4+gckqGEgrTNeSo1PtwB3HnU5JTA2/1RS9ikIHRGyZdrA++N+Ql7Jf1eFKEzTQF/xAz+Ou/S4AqYkCzOxXBnL06/FMYiM7YlOO+EUO7yQgo7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDJBHn6NXaSJfhuUq2+c0b3W7Ha3p6b7gpetWSMxBMY=;
 b=dQjfiHNA4lMi8oAy0IuaZQUGjUcceUQzFYghN+4EYvgJXh076SD+NbDPjX4/+K6F7hLE3O+I1uGvvDOYKKsQWCqjUqktcCbJmWiEICK0oSyFgcpMBvPMHuMQ0jBLJpZoEJOREuwa46J4Wc74mEpX+aOZU6dnaoxZnU7YZx1/7tUCKQpOtCM67Im5IGDWzyNZyHVOzPNkzc9HoJbObo0HD/RdRKuTSiU20y4L7xOaeFO1L39kpuLoxCwaiwKsk0OG9VbIdaZdkSRVp+JGs0ioHm3pMvwlLR59f/Biy1k7lj/yo1D/bYqLifBwfuBPaJj3ptaNMa/N+NtKFFschTyCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4577.namprd02.prod.outlook.com (2603:10b6:208:4d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 05:36:18 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 05:36:18 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 5/5] libvhost-user: handle removal of identical regions
Thread-Topic: [RFC 5/5] libvhost-user: handle removal of identical regions
Thread-Index: AQHX8gNJEQPpKFdBa0aQg0lnFIf3o6xUaAMAgAEynAA=
Date: Thu, 6 Jan 2022 05:36:18 +0000
Message-ID: <20220106053616.GB31292@raphael-debian-dev>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-6-raphael.norwitz@nutanix.com>
 <YdV+nMs86IWxEZJN@stefanha-x1.localdomain>
In-Reply-To: <YdV+nMs86IWxEZJN@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d80df517-db97-4337-ac44-08d9d0d676cf
x-ms-traffictypediagnostic: BL0PR02MB4577:EE_
x-microsoft-antispam-prvs: <BL0PR02MB457700221EA87A862115F055EA4C9@BL0PR02MB4577.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OgBjgDZ2KZ5S+j0O2bpnnmzawaB3DU78hcERFff3A98s0PAnKtYXU876kN0OWI5fLdmByaQAyj9GSYuZia0xvnGt6hNMjbm9vzoIWaZJk/0wdv21XbEQKLy7qAjcTZ/1SfQoHRkZjWTJAkeW1HnsNM6nNyKDW+agEkUfbEHN5lBbzyhODa8+Curq7Lzi4in2q6nCCR+CTISxP/XqdrWx+25BRA83Ld6kW77qX7sqXnqEu5Ldjol6CUSrc8HlgUl+s3wLqesUZ4dZjqjqELIvXYsz0H+FIqt5oZc/9CgDkbuHujwvco1fix2hPh1r3zso9OuB65TKNQ8eRdX5dJ7dbtIqqBzUyYjQ/kGVGqUEmNPbYLNqEj2YIZhsZvbwz84cA6XOqEtoD6tZ221QdoWn/YuIiBh7MHdLdJEiZhitiCQA5O0YEtPoc/Pj/Gk0D5XNnEGWZCv9Cp3vDMd3nHV9sXxro5yrIUhA2X4/ckFN/w3rsDeloHeMdIPunOSDYZSvTlU2yaH8U+yUbUdmatFZDM1jwCyhQZ1w+TgEHvR9VkIuIg3KIKqRazfoJlC9plvTD+kOXPyyj9NRDt4qU5OlpHZ+tpbLRM2046TwmXpNX9fvO5Q+JYgVstivrwe8Pp9vEEDoXOfzokc/8PyHxT6uUJH/Xu+hBIMkUoqNF4AK2iMaNELjxFeHY/krkraM9LPG6M9HWClkD7SquUR+4r7p2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(8676002)(186003)(71200400001)(6506007)(33656002)(26005)(508600001)(8936002)(54906003)(86362001)(33716001)(2906002)(5660300002)(38070700005)(4326008)(83380400001)(91956017)(66446008)(66946007)(76116006)(64756008)(66556008)(44832011)(66476007)(6512007)(9686003)(1076003)(6486002)(6916009)(122000001)(38100700002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?72mg7zWQqh8Bye7lVFG/LkuWJtafSTfWpdmWwsBp79aEYDHyv7d47P+ieT+d?=
 =?us-ascii?Q?02RTg+0PGDTG8SHlbrt72MqFlrScxFzm2RTMAIh2xjb3QzYRMr5KrxDZqZsk?=
 =?us-ascii?Q?eGFhE+l+gXJ/Cr/NdQF7pSoDNBQ9CNZ69ZUocXGKcuS8mxXvdvn1XP6dciQQ?=
 =?us-ascii?Q?KG3oe2NpgYb0Fm292COCu+tOcOeI1idot96CqxBpYsgdpDNhAKxKllzqJvtm?=
 =?us-ascii?Q?ZflcDQCuYeDzq1KUcl9LWTlnHxldbfsqUImONjNxueWNbxR8HV0/cDcchWBS?=
 =?us-ascii?Q?S2Q935ZbPohtBRzPzNNlrIBfAt/VZ064Mzuu0mWzez80cqIrM/1mGW+L1uXV?=
 =?us-ascii?Q?eilUWijThNfhJDv+x6lJBmMOuZqG1etQl/TWLnaLaYZni6+L5seuy1b+2wxx?=
 =?us-ascii?Q?Hn6EzvKQUfeezcoPBKRsqnm0zYwn9jeWSRSXsVs7FO3JmElaLvxWQfp2VtHO?=
 =?us-ascii?Q?yxcht6/8TEs+6RqZ+qO9jOTh6NfaW8kcz9c84ZvE7MoZqubOH1LjO3gdQ7YP?=
 =?us-ascii?Q?Jorze1vCLvqTsI6WkPnXjAaUClyh4bE7nsmWLJo7nv36jo2hLyoQifd0qvMK?=
 =?us-ascii?Q?76tSHLUe/lXXJyqZOOchbkDBQjzUCyOnPQCTxyGwTTFRlHlAJrv0nfBvyJdj?=
 =?us-ascii?Q?oLfKrotamWcJ2LEIJCpJFUdXkdYTquIHYXxWeqUgHO3KXU7J4nJtK7wLwf4n?=
 =?us-ascii?Q?kELs61PjXkTwDwHNOvz5jkvCWiEFk0hd9b0twB0e5AZxm3LxkdcjtuIM9Sbb?=
 =?us-ascii?Q?YhX2T6mZvEMg/yzxkxvuftxw0A3Gb7u2+y9+L8l134eM0ofGD2zowndrDxpJ?=
 =?us-ascii?Q?1hALsdAgF2QgkB+2YDplb/HNgxdW9IuxfVbDPkM4/KRkBnKaX+lV6pefiGnT?=
 =?us-ascii?Q?bFDLVLwLmI1MJDqQ7Y3vUi3RjD6fknGrZpPd8R1Y2Hg73pO3c8n/SBGXgbiD?=
 =?us-ascii?Q?9nWgIj2EUK1ohoMUF9njiRqKKoUgyvRXAAnZlVnsJktd0YK8yyBCt76piqQj?=
 =?us-ascii?Q?/ymgStTaoo93KF9qg/SXdlYZKALzgZzkZWkMIgKpb89VT2XmaEn4j05IGrc4?=
 =?us-ascii?Q?leW4gbvq8fTp/9Xf/M2I2UVhtJcpDZ76eELdRUl06MHKy0QODBQnhiy4MAAm?=
 =?us-ascii?Q?aYc0hRHckldsoKRqSdmuUTq47XzqL6aK2Rf15urcrRarKkH6vPKh9VLORYzO?=
 =?us-ascii?Q?uZvm0m0aH3jatgyOZrGToFJqMbooXIyXgyoU0HBy6G6sBmFNb/G++3k2vDOJ?=
 =?us-ascii?Q?bdOL7MtGlxLFxMTrI9Y/gRdE2VEelQkCGJmWBs3pYIN1BNUnui1wsLpMCkF3?=
 =?us-ascii?Q?xFF/ES7w6h06swuiTfxGjXnRgnsxmYBFUrMWzaQfLCUJW/hCf5l/ktBjeWDE?=
 =?us-ascii?Q?wV0NKsGMH/416gGDxB18Sm4RhP5TjFc5TaHfs26vO23i5AJvC5zEs09ABVr/?=
 =?us-ascii?Q?xmBEoFUAG2YiZtaDr56wul6XVLdKe66VbKHnRdeT56TToGt1RNwickoUpWyK?=
 =?us-ascii?Q?+FUYp6nCduRYH5LmbS3CSIIyu3VagAglbLn/dR2nGEHsrQo7XDRQuP48j1iq?=
 =?us-ascii?Q?mtOs8IkFVkjoKNXzjfiE2+hPp+hci5n5a7wz05TG4CKVm4CipOiZSJNDG2qg?=
 =?us-ascii?Q?w9rAaTryJjLfK5vLsdZ5TUoBQBsK0G4WduOgiQ1ZvE8gc1gUgxQ5Gricwg4/?=
 =?us-ascii?Q?dJ08JriZswtZFTn7MHnbIV3UA2w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <341646CB0FD29B47AF762DD019FFDE9A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80df517-db97-4337-ac44-08d9d0d676cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 05:36:18.4067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvhUQp5iysVRxoxSvJEFb5WDqVUiCXJ77+O+15UHJotFnB71qbup8KkqECMjLwVAkp/L62R5yrdYnqYBkS8OU0yMoBjMxF9BG79spxtSiQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4577
X-Proofpoint-ORIG-GUID: gXTkkWjixDUCuovYa6ONr1bfpZKBzqct
X-Proofpoint-GUID: gXTkkWjixDUCuovYa6ONr1bfpZKBzqct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_01,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
 "mst@redhat.com" <mst@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 11:18:52AM +0000, Stefan Hajnoczi wrote:
> On Wed, Dec 15, 2021 at 10:29:55PM +0000, Raphael Norwitz wrote:
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index 74a9980194..2f465a4f0e 100644
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
> > @@ -831,25 +832,25 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >              VuDevRegion *r =3D &dev->regions[i];
> >              void *m =3D (void *) (uintptr_t) r->mmap_addr;
> > =20
> > -            if (m) {
> > +            if (m && !found) {
> >                  munmap(m, r->size + r->mmap_offset);
> >              }
>=20
> Why is only the first region unmapped? My interpretation of
> vu_add_mem_reg() is that it mmaps duplicate regions to unique mmap_addr
> addresses, so we need to munmap each of them.

I agree - I will remove the found check here.

>
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
> > +
> > +            found =3D true;
> >          }
>=20
> i-- is missing. dev->regions[] has been shortened so we need to check
> the same element again.

Ack


