Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08143A5F5C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:48:38 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjCv-0007gI-Ve
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjBq-0006Fv-AR
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:47:30 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:12936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjBn-0003Zz-Fy
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:47:29 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15E9h8Ht008880; Mon, 14 Jun 2021 02:47:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=FQP6w9AoBxTwC3N7XDyKHT4h5HpAuqBrXws5H0zf9Fw=;
 b=iLEbM7Xio1anpzjnB6E8RokkZfbAj9196kVjD/KC8WvusQLXCsxAhEatLtR+YhsahHb5
 SlV6vDlXspdCtDasuCuVneG4l/TVuv3g5L4ZCOx457eaU/foXSVY+/Wm5/9BtqjGRC+a
 EHdafgRIda5azmn+4BEfthIdKH3SI9eaLEe7Gc0GaKBiFokqIyjlvipU8e3Oa0YTr+YR
 xHOjb7khw91oY55PxgiAR0FmCjXAzjhUpAfyIOlvyfCDbIkCeHfIDq0WG8pgXU6AL55S
 2kzqQ6jC+W+kjn5vVb0tt7iLAl33dJ2U93H3b2cHHH1fuD8lMbMcbnokYC9984EnBoXu YQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3962qkg7tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 02:47:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db9f0uUmNWYlLz1BowTaw884EpZJNgfaIvF/d6dOxsjxRz9gjpWQNRsb9LJSP2L2h4Bi37KIbeycLTgJdzFSJNnAO9oQAZCsGxv2Sn9MrmddMjQMqBT4V9cGQ2q/TRgcZH8fESkhCBRTBmtAV0I9yGwjn9hWzAr3JakNGY2lOW5s1CAy8oh6S2pCJSn9Be7AXUgHQYMi6tyFg5cN9jkRWe3bZj96kS7QvjkZBzxURDnCTwRiwnVVTfQoU3EKiSEwoQ51d09WY4NU9DAGRzl8E4GyPQ9cPRtqqflzJipkKC5Z7rTl1oNh5hqsjBl01JTjlH4VMWUEXLp/rT1RA1N1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQP6w9AoBxTwC3N7XDyKHT4h5HpAuqBrXws5H0zf9Fw=;
 b=P1crbX8LPb1C8BmABVjT54iI0TRTZu7lYJPfr7W6/zzQEUNCfwBLfyrrV35Ok0/NmjXDtDQigGV7aoXYb6KYSMiti5TNiDvg+bYY29OYUsdOS165XMqhTiSzKJT75mZVn/0FSUOzOME15Dh+/XkdJOjbSq6cvAQqgZ9grv040WZt9KwQa1VWeiv1eCHjddwm4TZz9nAelLuxQzzNlJDw7T9+6Qm4OW7NNzyeKNGuWZnI5ZvX1yvoiRdOYdQangdVEeh5pZYDOot+8aIWCW2JAojYiNPSIYPaLBWURA484VobGRckSnfo1PtngN1eGkRZLSZU5NtG/ZJCdpJhe8mysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6407.namprd02.prod.outlook.com (2603:10b6:610:12::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 09:47:14 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 09:47:12 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: John Levon <john.levon@nutanix.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMjtDp7nXmGRkuiYMGnZrvqnqrrg+aAgAAZSwCAKAPwsA==
Date: Mon, 14 Jun 2021 09:47:12 +0000
Message-ID: <CH0PR02MB7898A0837EC681D880E15B558B319@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <20210519150817.6a90985b.alex.williamson@redhat.com>
 <20210519223844.GA1036405@sent>
In-Reply-To: <20210519223844.GA1036405@sent>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd474ae-54dd-492b-1a6c-08d92f1962de
x-ms-traffictypediagnostic: CH2PR02MB6407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6407B46839BBEACBFF3131278B319@CH2PR02MB6407.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wLp1CxEjI1PnhVvPPfu04fo4w4JtUS6eQaQCp9zup8svPXjQ8J5eKSPf2C8hEZH/4yf3ZCXrl+r3RtXiX7ErWX9B3jUHiCTHIL4sj417UvMb9c0V7Woi+Ym5fjAQLrEBZu+CJGEwokv8vYn/xXdrYH+Bimf8UlDYU5Y09+1F5MzovmSfXUYN1nCQlcwOoT1Xtuf37DonXsY+UJiqol1Qk8vX0CyHR4pWOzGuvr1RlJEZweuHrA8nwKCQORWwly8OoecLAFOIibqFZP19TfsZBcyJt+FQhSH606RVOJncq9K70PIMiyy9Z3nXM21cgp3rnBUmONoM1i5lC0GLznt3tSuX3KnZ+kczRcWJ6psQUDuFYITAuKTkGvNxhGuuhPRYDmfs+Ksb9t3dghIJOWlzSf69go91ka62Gd31ZjP8ixIp7D4DWP6eb7nzDONo9uLtRr5xyQn8YFAnm49Dg3MIpTOXDvmpdCZVoJCmKAlN+eStTeEIqI2kAZj2ywp+QIuL1skt8Og+AHxXHUNgffTZ8kDCwzibxEizjclOeFg1X0ZkKGB46sOhLS1O7ldWMNM5orULZ1pJopvu3l9Q0VlnArvddMVameRX4aBMyI1pNqiyScRl0CkdaRlR5+m3G/hJACpfbnzOM7DusmY8pSzrbzr4dkotNnukI/NjUrPS1o6hE23xAj5QuJ2813JQ8511GBnawdKokAJYiZxMppSDTGLFSLXNBk+/0Ywqph+zvuU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(71200400001)(7416002)(52536014)(8936002)(38100700002)(966005)(86362001)(7696005)(122000001)(8676002)(2906002)(26005)(54906003)(55016002)(76116006)(44832011)(55236004)(186003)(110136005)(4326008)(66556008)(64756008)(66446008)(66476007)(6506007)(66946007)(83380400001)(33656002)(9686003)(316002)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jnq7TYFZ1LebGK2gTElt1ZNB2xXaWltgpiZKMl4quEoVO3mbhlBqWIIDlWmu?=
 =?us-ascii?Q?s8zTTxQv2Ou4aovZgqV1jwz83LACjbl4vYIF4LU9k3QuIkWbxsaLiZTsX+HV?=
 =?us-ascii?Q?qoJBj/Vbpe/hrt1W8Zjb9NycTv6PmrYPXUn8miJbs5yQpWUpJqHswkTXkAk8?=
 =?us-ascii?Q?F0HyHf3H+z+sXSZ5fzOsegGHNUNEhyoCGzB0hFL/twJXeV1AA+Akkd3bmzpr?=
 =?us-ascii?Q?UbJIEc2WwK8MSDKIEbLEG2PNZTEJLZnLKQw70+de2n1P01H6UBdxpwhqufBA?=
 =?us-ascii?Q?AU43H0XQ/RtJuwJk7iCvLNx0L68Lvm+bdCu55kAaPX/W1lbjx3LGlt6cZ1Ks?=
 =?us-ascii?Q?Alk1sPvpC/HubKs96YdZ8rwIi39da+DRKsl+ISCm7hkWSG59tbtR6uQF1poE?=
 =?us-ascii?Q?Lpq/KLqumcQhV8G3n98OeCr2GT1C2R0JPEuVd/WfNuH43TpWEaCTci5URRuD?=
 =?us-ascii?Q?heLf6Vl9I40rjyquQqe6/ZxKouT0BOkYKl112FSn2BtODyg/a6gaBjfHbo/r?=
 =?us-ascii?Q?au7qyiLr6M88E+jfmaA0MNtftrBpVlQ63J1iIJuvMcxz1N+ui5rtxDvjk3l+?=
 =?us-ascii?Q?PncCI1/k/CeTG17wESyODKwgt/88jd9znjgU5FM09ZZfuDRXQ/HUzEkyYcSx?=
 =?us-ascii?Q?5OUNji5M+t37QyUmHsuUTM+r9p4jt8BvMwKH1PaE1Ga0Qfnug70Lr7VSh/nj?=
 =?us-ascii?Q?6h7Jv2EkL+F+WmpPVTO6ysHzHilioiKV6VxUpLwabaS7navDSVQYSf+TeMek?=
 =?us-ascii?Q?X6n7X7QQwe4kz9fzDoerarcR66s9Pf+j7LXQIULWmcMTGDd5Jk5o6WrawsK9?=
 =?us-ascii?Q?cKzYz9WjrwNHBjf7lzsp5X2xqxLExAyp/TH30AyvdhqR7UZxQ54U4L1eXH5B?=
 =?us-ascii?Q?z47TtbgItmlmQF1nZswLEcE/ClRgA2oF2t+qwjsMJ0oVlcVe77EGlc56Tyzc?=
 =?us-ascii?Q?pa2yASdq7FkbF/d+y6ZN7hF7+fsTC0d1rQXEObBydVaSopQw+pAVv9UToyxf?=
 =?us-ascii?Q?8HRRO0k8tKCLY9d/hzgt4+wiuQozHlcHdLwdbQYTFYXhFfadmkUWfMJNFGBn?=
 =?us-ascii?Q?fKHmqZdAF7ZPeX+tKJXVua60VPtKMamTahLl6h2vTvqB6NcmJY//7+tw6q9O?=
 =?us-ascii?Q?vq6FIQ3nRf2pPJCjd2PDaXn97Kg+H4DW6mDIHmHiw/2NQM9LWiWK8hVV5OBe?=
 =?us-ascii?Q?tDWV+JtUpnXGVb3K9T/ikJnumWmT+TSdnN7m+tWqUauvPiPGHLy+l7RtrPXa?=
 =?us-ascii?Q?PPweddwEu8aTodxXfRcRCljamGB8SWbi6GaEpb0oUSji0C0lYO62KgwPYL6C?=
 =?us-ascii?Q?g8c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd474ae-54dd-492b-1a6c-08d92f1962de
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 09:47:12.7254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+jbBau3RWijvCvoqjsrE1jS+h7QYhC4ez0wmLKs76CPRluwMf95ivloAk8QChbXEglDlY4c7xuV1X5i6tB48qwcBjaCESH99o6r3cPq/3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6407
X-Proofpoint-ORIG-GUID: TrgtR0SOSMwJH1C6uy5xmYGNgSaK8uOB
X-Proofpoint-GUID: TrgtR0SOSMwJH1C6uy5xmYGNgSaK8uOB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_04:2021-06-11,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > +VFIO_USER_DMA_UNMAP
> > > +-------------------
> > > +
> > > +This command message is sent by the client to the server to inform
> > > +it that a DMA region, previously made available via a
> > > +VFIO_USER_DMA_MAP command message, is no longer available for
> DMA.
> > > +It typically occurs when memory is subtracted from the client or if
> > > +the client uses a vIOMMU. If the client does not expect the server
> > > +to perform DMA then it does not need to send to the server
> > > +VFIO_USER_DMA_UNMAP commands. If the server does not need to
> > > +perform DMA then it can ignore such commands but it must still
> > > +reply to them. The table is an
> >
> > I'm confused why expectation of DMA plays a factor here.  For example,
> > if QEMU unplugs a DIMM and the server has an mmap of the file
> > descriptor related to that DIMM, does it get to retain the mmap if it
> > doesn't currently have any DMA queued targeting that address range?
> > Can QEMU skip sending an unmap if the PCI bus master bit is disabled
> > on the device preventing further DMA?  How can the associated file
> > descriptor get released?  This doesn't feel strongly specified.
>=20
> I thought we'd removed those sentences actually, as they're just confusin=
g.
> In reality, everything is going to both send and handle map/unmap
> messages.
>=20
> > Are there any assumptions about address and size of the unmap command
> > relative to the original map command or is the client freely allowed
> > to bisect, overlap, or overextend previous mappings?
>=20
> Good question. Filed https://github.com/nutanix/libvfio-user/issues/504 t=
o
> track this.
>=20
> I actually don't know what clients would like to be able to do in this re=
spect.

It's probably not worth supporting such behavior at this point, especially =
since
there's no valid use case yet. Let's drop it. Should we ever want to introd=
uce
such behavior in the future, can should be able to do so by a capability. A=
lso,
the protocol format won't have to change since additional DMA regions can
simply be appended to the message payload.

