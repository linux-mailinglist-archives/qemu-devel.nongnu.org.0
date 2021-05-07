Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC53768A3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:24:56 +0200 (CEST)
Received: from localhost ([::1]:35660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3Hb-0004qR-4v
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf3Fl-0003Sa-JV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:23:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:62276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf3Fj-00044X-5j
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:23:00 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147G7aCd032684; Fri, 7 May 2021 09:22:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=NPunP13F/GH6Gzug5vmUIA1DzxTFyP3cc9TB+hYCDNg=;
 b=2ZMqwtqF0ArRtaPxuIEOyoUlI8NAykZfzNEcBFA/QSnG/WCV0KOy3/+1eBjWkNlfzALh
 Y4csayiBLGdK5+rCwbFUDCT9xLgECPorRGhAPLdEOYfnW3ySj/BcuU9i0NlMN8+E/2Kl
 X94DsfqpLvEXUuHG9Xv9FELRYsweqNeOL1L/jf04KH3pqAMssSp64IrQd3hWuJ1rI0ni
 WwBcN5/WEbPcT+a00Wx68XigrkkBxgmXxYnGSkyMSpV2/xIOmp9SPRPQQzMfmH7G83aH
 yceTbuWCr5S9MxB9MZ4ZlVtUbMLKt9kVr8W5g5b9+NUKOUsD6o+zArsYrURCfdGVpn4c Ww== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0b-002c1b01.pphosted.com with ESMTP id 38csqgsnam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 09:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1aEJiNRwmnjkx8TPLSMEH1vlOsplq8wEZXrc3AJMuR9ZCiCevksTufHPvaeVPqQKo9dq5qXaiVoJrfovgSE4OyZYZIbjqK+BQr5YPdaYGYcF8PhUTfq/YIWwiI9BO/VCXU0PiW/nzcS1KllwqelsAbJ1jJ0m3cR6hwznA0urB6Ru2uwpTUIiek83v7bNVk5E68IcBEoMTL2T6cjT+f2yvUnyRxXS3zOCBYU24CPYwwRww5MlNiduylz1bJY1EZeVFXw1iImHi7ZuSnO6d2M/fQMpw9Ry47pki9pIXbn7l/gruOHun6NULADjQiy7WXBYxs6P6DdMyRBzlo23agM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPunP13F/GH6Gzug5vmUIA1DzxTFyP3cc9TB+hYCDNg=;
 b=i8yLNkuKF9CKJqXZKaeu62+uTvOqFApQ3uR4zYXwY/iwgVIQGoC6bk/bNZkUiazWEE3vz7c8au6zoiV2Dlpqu9CjDcCmTSHW7AT89QCqLN036H2per/ZleHpC0lAA64UjcOggotLHQ76KXFoxKLagk5B0Y/sKBlfxlSfsifsFopV81Hkiure+6SSW53w06cD9ULpGkEOZXFRWdlzEwE283JdbGVnrWerCKe4xTAx3lwk2kKWCRRKO+5vP99jl1DsIt+Zq5hzgM34LJ/7dxl660NL748v+DYAJkizDd2Dgh1U/zpCKQOw9yjc3OkGqU+F34APgmlKnYrIgoDbE4v9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MWHPR02MB3373.namprd02.prod.outlook.com (2603:10b6:301:6a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 16:22:54 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797%3]) with mapi id 15.20.4108.027; Fri, 7 May 2021
 16:22:54 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: question regarding QEMU adding overlapping memory regions to VFIO
Thread-Topic: question regarding QEMU adding overlapping memory regions to VFIO
Thread-Index: AddDR/aFSv9jmdx9TKe5+OpCTvxxcAAD5FCAAAEMP+A=
Date: Fri, 7 May 2021 16:22:54 +0000
Message-ID: <MW2PR02MB372374DCA7D9F509D9C290428B579@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <MW2PR02MB3723B94416375A06F6F69BB08B579@MW2PR02MB3723.namprd02.prod.outlook.com>
 <20210507094205.43adae95@redhat.com>
In-Reply-To: <20210507094205.43adae95@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff65e8b8-eef3-400f-6934-08d911745e4d
x-ms-traffictypediagnostic: MWHPR02MB3373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR02MB3373C1349BB0E35B451D6EAA8B579@MWHPR02MB3373.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zM4VJv4BkonVOfe1tOrwrR9ZRWqNtiheN5Pquw4zWImN0rP7GJPS+NYyOUSAXuBRfYxa0UJwp1wHpLZ1lT+u5TFj3mdrluwiDO7gaKs5g6MlG8Nk9weDDMwd9enoWMqHXe4tKx/DzP/g2fOsOzyRswJg0icEKIF0SOh/Fv5UO2oaycxMRSI/5mENSmS0PcBhDDdeyP56MdrdE7DinUFzD57gxARdJ1cNVLHKPsVjFVmxF5ulKHz9IOys5OguzdRkU+w44D6n2q2hPYD8j78hS10CYPScc7Qea6agqzmX+wR03FmryjvpnXIrSP0GK9PAMeEBehQu175eUowTe8VyxL1s1L0Ut+TxnzwRfPzC9PerZB2iLjwIM5vHMyBxsTzb8jgYZBLYYZIyucLVnI039H+ITJ+ncdmfGR04DJy1NcS3Oz8Z8Mqwzfw/O2F14EaqDqpLU3rJlKIGbFLm94XyKQ7vM26sFdJM9mlMyutXhpMnf+KgZrDiQiyA+YYShA6lXmSsfLnzZ141JwmPG5EYY/sbQH+w3tVXiQgfPUOXfORPok+grGVhn8K7hOe6peMxIHOHBsPPI9ZxXrPBwUJvyUvRn+zZGpv2EW5eieX21v4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39850400004)(346002)(366004)(376002)(55236004)(86362001)(6916009)(4326008)(26005)(478600001)(54906003)(8936002)(71200400001)(52536014)(122000001)(316002)(38100700002)(44832011)(83380400001)(76116006)(6506007)(5660300002)(55016002)(66946007)(33656002)(8676002)(2906002)(53546011)(66476007)(66556008)(9686003)(64756008)(186003)(7696005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H0dPDGkCcT7xe/em2GSG+tc2M0jN0OkBaLPgpzETi/8FKqw83/bkgfeeLC1i?=
 =?us-ascii?Q?Wz3HpIWE5IqoW21GIL3InvIWQZh5JlR8QFQlbbKaP+Kg1OaD258+95nL2oOQ?=
 =?us-ascii?Q?dZf8ItQ4bLrXMJ6Y4a0mwK/gyGec8jSqHR9ClmgNnheRYViAi6vRIfLvxivc?=
 =?us-ascii?Q?+uov8EsLH3ILKMO5KBixHJLy1OznPl2TIPYNSb2JH5o0NC+mxC1N/vLUh+Zw?=
 =?us-ascii?Q?07HgwJKhKWsAOEq+YPPNDettMc3GeUh2gISIfbmpRKCOX4tRa8Ttx+5+rEn2?=
 =?us-ascii?Q?c2cN4XjNScuRZrsWUNjabMAMCTIjcU/Kg9Wq8/4Na8QF6uC6ZD6QKbadP0GL?=
 =?us-ascii?Q?8vVX7tbh4qyZ502osPc1V8KuohD37WpleimCICOTWQRgYsjmNYCrNrLwjWt5?=
 =?us-ascii?Q?gjni8ucJ37IP0BYqLU/uv8qeGXeWoFyS5SMJyGfknfc8MRQpQov4aR3B83SB?=
 =?us-ascii?Q?LVFvzaGta8tuTIwtYLJLJWxw8Kt72vtnB7RFyWts7oQRWVmgHUZ54I7sGpcX?=
 =?us-ascii?Q?X8RLwwRG0eLKt3/ndlcES4AwJmyM5PuSGLhJZYCZajOl1AZpidPvfz+MTp2n?=
 =?us-ascii?Q?oCWku/sompWDr9YfiC4xEEPLP9nlfwRzWiSd0aVAlSCoMyqEODmx+IkvsKdh?=
 =?us-ascii?Q?WXSSu8+MVgBG1hPt2i1kBYnQtSgnaFMZXhM2S8PPRK2NgJCa9N8fSYj/W+FD?=
 =?us-ascii?Q?CEk+kyRtDmA5E8FcC2GGbTWdfqUlFP/BPZNipErU8zOYISGJy8KFJ80m9ERg?=
 =?us-ascii?Q?i/0CwlEnwF3ooNEEBZNz/Ll7Bfd4/LF8iiIQZ7I/gjTpdusKBt70rksnTE/P?=
 =?us-ascii?Q?BcpDYyve0xQysGksnN/18uDd7vcxYpSU2RmYom+2Ljukl/nicKNAy3bNA68J?=
 =?us-ascii?Q?Uj0OZCyHckW362oEzZ//DfA2fznt+7+ahekxGvm3m0BolzWZFbJI4eQVVEM6?=
 =?us-ascii?Q?sK6CvlZBcllD0ERX2zB5ftf1ChDXSYMaXvWyQZ0Q+aDLXnD4PHUWRi1Qb9h+?=
 =?us-ascii?Q?3ef7ZfnVCf2taZmnz5jfsbU1z2kvAkQv60KBEoq5q3p+h6gj4OWSj3D9qn+E?=
 =?us-ascii?Q?XVkyz71yNCubRwx4Rfty4pGkxOzLX53DivxKCLT9T1s02hn6JtMmcpYIjBlK?=
 =?us-ascii?Q?BVxSWmbnXrBMhsMmLxNnF51kHhijXOuTOBYQ56zCrV4dLd9DTFJBz0fgeB3p?=
 =?us-ascii?Q?FbEQeoUxqvv1duDh/mmNelO2xS/21oh31Y9+clgEdXpvxLptPJtn/4apILfj?=
 =?us-ascii?Q?OlabvoJFhoc4eJN+JL6lseEU8q8bCuMeOcZLGlog6RcCdc+B19TOJUBCShdE?=
 =?us-ascii?Q?vKM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff65e8b8-eef3-400f-6934-08d911745e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 16:22:54.4736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFbuQZ80/NgDXny+I5mXMYfBVAUexpa3A0lFhPQ/YVOrvL3ea7BIKCineh63gzbhmSPZAhrimkBBTIhrjLEVUQyVnXuw0PmH7qrK8tBUqvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3373
X-Proofpoint-ORIG-GUID: nAFLrFOF2nUh0xzLlHoDr-ZlPRa_6mC9
X-Proofpoint-GUID: nAFLrFOF2nUh0xzLlHoDr-ZlPRa_6mC9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_06:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 John G Johnson <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: 07 May 2021 16:42
> To: Thanos Makatos <thanos.makatos@nutanix.com>
> Cc: qemu-devel@nongnu.org; Raphael Norwitz
> <raphael.norwitz@nutanix.com>
> Subject: Re: question regarding QEMU adding overlapping memory regions
> to VFIO
>=20
> On Fri, 7 May 2021 13:51:52 +0000
> Thanos Makatos <thanos.makatos@nutanix.com> wrote:
>=20
> > I've noticed that QEMU adds overlapping memory regions to VFIO, e.g.:
> >
> > vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xc0fff
> > [0x7f6702c00000] vfio_listener_region_del region_del 0xc4000 - 0xdffff
> > vfio_listener_region_add_ram region_add [ram] 0xc1000 - 0xc3fff
> > [0x7f66406c1000] vfio_listener_region_del region_del 0xe0000 - 0xfffff
> > vfio_listener_region_add_ram region_add [ram] 0xc4000 - 0xdffff
> > [0x7f6702c04000] vfio_listener_region_add_ram region_add [ram] 0xc0000
> > - 0xc0fff [0x7f66406c0000] 2021-05-05T09:38:16.158864Z
> > qemu-system-x86_64: vfio_dma_map(0x557b8fd281b0, 0xc0000, 0x1000,
> > 0x7f66406c0000) =3D -22 (Resource temporarily unavailable)
> >
> > Region 0xc0000 - 0xc0fff is added first and then region 0xc0000 -
> > 0xc0fff is added again? Is this legitimate? What is the implication of
> > this? Is the previous region replaced by the more recent one?
>=20
> This might be where the hack we have in
> hw/vfio/common.c:vfio_dma_map() comes from:
>=20
>     /*
>      * Try the mapping, if it fails with EBUSY, unmap the region and try
>      * again.  This shouldn't be necessary, but we sometimes see it in
>      * the VGA ROM space.
>      */
>     if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) =3D=3D 0 ||
>         (errno =3D=3D EBUSY && vfio_dma_unmap(container, iova, size, NULL=
) =3D=3D 0
> &&
>          ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) =3D=3D 0)) {
>         return 0;
>     }
>=20
> Clearly that's only triggered with -EBUSY and you're getting -EINVAL, did=
 we
> unintentionally change the errno for this?  What's the host kernel versio=
n?
>=20
> It's my expectation that this really shouldn't happen, the above is a laz=
y
> workaround, but a listener being told to map two different things at the
> same address range without an unmap in between seems like it should
> violate the MemoryListener protocol.  Thanks,
>=20
> Alex

Sorry, I should have mentioned that this is seen on a version of QEMU where
we're modifying hw/vfio/* to send requests to a vfio-user server instead of=
 the
kernel. I would expect this code to be the same in both cases but apparentl=
y it
isn't (or maybe we broke something). It's good to know what the expected
behavior is.

Thank you

