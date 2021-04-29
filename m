Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D636EADE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:50:27 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc67e-0008RW-Sk
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc663-0007L5-PC; Thu, 29 Apr 2021 08:48:47 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:53124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc660-0005un-W5; Thu, 29 Apr 2021 08:48:47 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TCm63n007949; Thu, 29 Apr 2021 05:48:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Mze4n9dipsXbKlrkBJMwIlh7BC91g+PxVi7dn6tlvkA=;
 b=rkvCcfr1kE9RVhUyfZm/uW00zPtyCLQdo8n0SdkNF/2ag2g4pczcksK/Ra9O95D5Wu5q
 fk+cY9lOyu3YO06/a6TTK7nILorpBSPWE1uwDUQOCAIAlJIq0q+yNtI9Z3aNx0JoRPAw
 FM8OgY4BUuELPZFOacBvVyAp/mIKw+G/fQGH6rZh588dMZLwHYoUOvjJkqV+1OKrEC9N
 wm4fHfyKzX2eNbdF96M8dkpwn9hv0r9bZ8Vu/1dpwwkPkX1IQwXuuc2S8AS+yRIYKxnj
 6w9s1nnkyNYh5wxZL8pA5NK/zEY9khdteD0yXyJeNcgHBmQKmqaMeeZegiAiRLrLkIvL Rw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0a-002c1b01.pphosted.com with ESMTP id 387f7t1gdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1pn6oKPc6iwE+24vIF3M23a1alqfvxsbLwH1ukL3Zav9PeDadEtAXZ7H/bEf+sGLfC45t/XIPVDe59UlFLvkLdIC/ZjuFTA+Fy3ejb9fQnUp5P29LzLewEZdPgB+qsamVvxPGv9nTiX0+iwvHhAj3tSqGo5VQ8liggr7WRvExE/I/Tl2b2/nGIASVByJ27ZalSEJu+7cH0Qys3nadGhrAEahBhJxjf3YRSwYTw/4wAjirjUtVupW4zwXQfsnZGIeg6rOcVxJbYiDFRHXpnMT6jWSmMSAe222RNK/5xC+BHl4WQ3e6IloZT9GpDf/NDcWSB/z3cGAOKT8En6yPApzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mze4n9dipsXbKlrkBJMwIlh7BC91g+PxVi7dn6tlvkA=;
 b=RQ3wZbR3pxop7cW0A9NnTYy4yHwmWEbJ9J3JD+TFVLJDVGGG9/Ok3GJMlFglKBFb56toSts56CbNY6/t8Nt2vEfRag3aoUYvQlDI6g0FEuqL3WLdb9wwRKHBysQS3bJ+qL8ip3baOgo9QV3/QK1GvHNEjueZNnxdSldls5IxIP+p9qMx+jhEyyCRx4wNUUOgJyfTIniUWo2atkmJYnSe88XKOGklPOkm1VdruWVXkhNGuqm8bkp3HNjZo5HUjf1TcFC6RZzzfTb4ieLi2QoZMu+YkOuAT4WGRcycrC5VdAPjEBtKEzyEmndzSrxJ9iMxNkhWrk3RFMBvhQVLwe26yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4224.namprd02.prod.outlook.com (2603:10b6:805:33::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 29 Apr
 2021 12:48:38 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 12:48:38 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/5] virtio: Fail if iommu_platform is requested, but
 unsupported
Thread-Topic: [PATCH 4/5] virtio: Fail if iommu_platform is requested, but
 unsupported
Thread-Index: AQHXN5lWW/llp3lkL06gnwadtyn+KqrKWQeAgADtZYCAADZOgA==
Date: Thu, 29 Apr 2021 12:48:38 +0000
Message-ID: <20210429124833.GA21125@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-5-kwolf@redhat.com>
 <20210428192431.GC20605@raphael-debian-dev>
 <YIp9k9AC2jwIMnYA@merkur.fritz.box>
In-Reply-To: <YIp9k9AC2jwIMnYA@merkur.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fb709ea-5035-4b25-253c-08d90b0d1c2b
x-ms-traffictypediagnostic: SN6PR02MB4224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB42246EEBEE74141BCB599902EA5F9@SN6PR02MB4224.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4s2mqm4P4ZAjVjLsGoXGM37iCZ4s26Kcf9b9+YUB6egPw+M8lSBzmnHQxwcHjDVANPJpU2MpJeIEdRbewkoo0+teQVBxA3k+UNx3uTlOrG8Baw0nLS4gBEjCSNbR9VLG3DdVMUQJ5A+ykrYAaUOjJpP8qaihQ1qh0RcZpI9yVtFbMlUqwYJIEZ8BeqGRGT6cg9/CTzN91MgKYAe49vwUd+ZZhGoZtehXHe36cWuXtmhkgl+HwNGlaKJWVbAlpNifHW6LfkWs/6oFzAYwB+AQH8QSIkHkBtG/7MANsjIdnHM7opw+grIEjguT7eiVTl5vhDkNeNAFkFQkHcsdx8O5uAefElZoDWlq2ekGx5icRSklYa9xADGvEn/QSDL8l2r0TBPcmLwqo2dXxCpFF6R88kSEkRJWz0ee1K7ZDyNKrW0ovxEKmNvLJK6vWn4tbvIDY3Fv+Mf9n/j1fRdcszUkPqAW20cqcdn4BXVRPDmL+KCf5HxMFhaeHwiHHBIpywGcAqKpmFTfXVls71Zl8BYyoEIPcXENKPRK1NjL3SkMwtoI8KTJu+8MtvR8N07qjJAoSfHjP9hnCTIuNUX7v8Om8zw2dBRMCAh6/T12Edqeh6lGqMQBnbVl++/qkywtIgQgyMEu2Q4C/k+aXIabiEFMxX9tbC1W3QdBYDJeUflJVGHFwDtMr2f3EE7heQh/9TfQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(83380400001)(71200400001)(6916009)(33656002)(86362001)(6512007)(8676002)(122000001)(76116006)(5660300002)(38100700002)(66446008)(64756008)(66946007)(91956017)(66556008)(66476007)(33716001)(478600001)(4326008)(186003)(26005)(6506007)(44832011)(54906003)(316002)(2906002)(9686003)(6486002)(8936002)(966005)(1076003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UcEQ9XjoUkuTXt3hi40AsCfw09/imKC6dpV+lXPlnkNxFv6boKMxIuMVxEE9?=
 =?us-ascii?Q?gvMvvc+yVuHWFkf29G+QYZqddZorDZVlh/Yd7MVxkJZGY7F20IbPWqMKn6PD?=
 =?us-ascii?Q?vdXu/4bWD204qWQ7kfasRI2YV6v6brQmnNWWlppFCIqmZMA6phIzSvwMAnIa?=
 =?us-ascii?Q?0TLxzOKHj31xoG9p3hIwrleG7UO9II6NeEDWagWZkyFzfCnh5zzak8pI/cdM?=
 =?us-ascii?Q?gtPNOOFkiCQFW1xyCwPVvtAIU8FfP+i/StF3LkckBqVO0o6pW0nBmJr+x0D2?=
 =?us-ascii?Q?2fdVsBoHpluWhfPcLX0jfnrXYHES90rViOc0zmcySpUkxaekH+qjnm5nOBC3?=
 =?us-ascii?Q?zxypacmqEe0C7ifP8CpkrarNPolRxVm0czYPlhdpAwl0t1Xg2RdvQIQYLnIz?=
 =?us-ascii?Q?/FLkAYPZmyo4kW2LMLTYW+S5TEdMHoH3RGMaUnQQZ/cfsph7ForI9KnQ0bcK?=
 =?us-ascii?Q?6prhL7jeHYdYuPgrtgqSQi4GF/2VryIvQsKMsXGy+p4ayFn6dNmyszzATUus?=
 =?us-ascii?Q?7XNiD9aoukOk59l8NtdkxpRHzI5RueAhmr87erAsKOvXYGPjI/qSzivdaEDL?=
 =?us-ascii?Q?X9YQUvuBWEAKHkt0tzrSwmWxTXFRFDniV+XA8Dx7P4xV7Ac6tDRH2wEyZsZE?=
 =?us-ascii?Q?YhzhT3GAupauW2QrAFklAgya5Ms4ZyhLqH3UEgLabHy2PfhlmXGzuo+ei8X5?=
 =?us-ascii?Q?ktH1NJ4p8FHjlWDxNMG5gRyv0N+AzYxYTL5B0gC4Xg/4hTekGMyQWejEBNDk?=
 =?us-ascii?Q?WzNT/Q44cWsF6VxNaWkeFpICFShjkbMimsFQ4E/irzdURI3PoKnKrr8dAjpo?=
 =?us-ascii?Q?bTYQikpm0cfwOphUavuWZ/SstOf/FeyrjCRKG2NzblexUen49xXluyg/VdAN?=
 =?us-ascii?Q?EJodRAyaYHnVONZdIzqBoFqEQvyENBK/3UsyN5jHoekO41FrSDNax09djAxc?=
 =?us-ascii?Q?DGrHMc+JvoTl8rx5bDV0RDHai2nEJKpc76fCUdyzRin+cn1a/UNiWFjlS9QB?=
 =?us-ascii?Q?FenEp3u2mmXRuOrQSKJtarzthuvdiTx9uRNoG+tYf54beIdovMjl9Irb7/1S?=
 =?us-ascii?Q?vVJg5QcH0Bb3wePJqWtjGRlghIqgeRxJVr+kObRq93Jw/22VmlXta1NQVwKm?=
 =?us-ascii?Q?+hN/44eld9DmdeNfPcvTdwHZ+c1hwlClHblE3ke3L9iymjfdKM6k9IPeQNCa?=
 =?us-ascii?Q?dEEVlmydqW7ekqPs+3Uqn08hF+vTmoIhWif8xHnYwf6I8pIZjJkdfCV4+I6L?=
 =?us-ascii?Q?O11gcgWegYr34kjs83RgybUjUVIM6sSNoJnTiUrBA9r6UAmLVOx2Z9EOlKFQ?=
 =?us-ascii?Q?auKU/H0HVPFBN1doT1UfA0Lo?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5DBA325003E394FBE9B65A7F353337B@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb709ea-5035-4b25-253c-08d90b0d1c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 12:48:38.3436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2hERZw5Dy6ChHwhONnLkuuVGajqP6PyqPN0BduaSQ365JRZhsqE3AgaNIz4YXdlOrGyQuBsj4LA1RELqewvMlNkdbikWU5vCgKiKr18n1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4224
X-Proofpoint-GUID: k5oGFqmQe3OUU41bvYSQ8KoOg8k-1jLd
X-Proofpoint-ORIG-GUID: k5oGFqmQe3OUU41bvYSQ8KoOg8k-1jLd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_06:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Got it - thanks for the clarification.

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Thu, Apr 29, 2021 at 11:34:11AM +0200, Kevin Wolf wrote:
> Am 28.04.2021 um 21:24 hat Raphael Norwitz geschrieben:
> > On Thu, Apr 22, 2021 at 07:02:20PM +0200, Kevin Wolf wrote:
> > > Commit 2943b53f6 (' virtio: force VIRTIO_F_IOMMU_PLATFORM') made sure
> > > that vhost can't just reject VIRTIO_F_IOMMU_PLATFORM when it was
> > > requested. However, just adding it back to the negotiated flags isn't
> > > right either because it promises support to the guest that the device
> > > actually doesn't support. One example of a vhost-user device that
> > > doesn't have support for the flag is the vhost-user-blk export of QEM=
U.
> > >=20
> > > Instead of successfully creating a device that doesn't work, just fai=
l
> > > to plug the device when it doesn't support the feature, but it was
> > > requested. This results in much clearer error messages.
> > >=20
> > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935019
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > >  hw/virtio/virtio-bus.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > > index d6332d45c3..859978d248 100644
> > > --- a/hw/virtio/virtio-bus.c
> > > +++ b/hw/virtio/virtio-bus.c
> > > @@ -69,6 +69,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev,=
 Error **errp)
> > >          return;
> > >      }
> > >
> >=20
> > Can you explain this check a little more?
> >=20
> > Above we have:
> > bool has_iommu =3D virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFOR=
M);
>=20
> If I underdstand the code correctly, at this point this is still the
> unchanged value of the iommu_platform=3Don|off qdev property as given by
> the user.
>=20
> > and then we get the host features from the bckend:
> > vdev->host_features =3D vdc->get_features(vdev, vdev->host_features
>=20
> Yes, and now a flag is only set if the user had requested it and the
> backend also supports it.
>=20
> > So as is this is catching the case where vdev->host_features had
> > VIRTIO_F_IOMMU_PLATFORM set before (by default?), but doesn't now that
> > the features have been retrieved?=20
> >=20
> > Why not just:
> >     if (!virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>=20
> We don't want to fail if the user hadn't even requested the feature, but
> just if it was requested, but could not be provided.
>
> > > +    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_P=
LATFORM)) {
> > > +        error_setg(errp, "iommu_platform=3Dtrue is not supported by =
the device");
> > > +        return;
> > > +    }
> > > +
> > >      if (klass->device_plugged !=3D NULL) {
> > >          klass->device_plugged(qbus->parent, &local_err);
> > >      }
>=20
> Kevin
> =

