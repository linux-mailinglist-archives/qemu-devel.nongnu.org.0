Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B337582413
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:21:03 +0200 (CEST)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGeA2-0003rI-8n
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGe5e-0000p2-Cb
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:16:30 -0400
Received: from mail-bn8nam12on2056.outbound.protection.outlook.com
 ([40.107.237.56]:30817 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGe5Y-0002gs-8F
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:16:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czHDV5ij/OZ63Z15E4fKGa8wD+cC3QShbGM67blyu9DN5Cgb9L0ixm8WFBLmh0VethSsEaB2yOWEihK8xXyu2qCVN5fJpRU0M6pVJzlnacjqxKmom1on7TFlE/S8l9wjwMXCg87/jjQigtO2ybt3atNMJ14te1dWhPpc9RdIjvDjPHvDOxm3K0I9RYQj0v5gJZlxswbV19jmTTbogE/t75RFZWAIelQVXwEyvjhTi9xnGw4oIYeABfJWhxtNzKoPfCkxia4ZI37VnWL03tNi1Kh/fohTCwi5FJ0pgeVVomL6nxdl89iOBMpIlla66qs6FtlXO13L8Rysrv2vvHpsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M95nTBJgrwQ8kkFTk2TI29UcQrO440t/vbKZPt+18Gc=;
 b=a+QbfoX+Z5VdKxCN/+7MIjWyMR0wo0UkySdBaaFxyyopUfXNQxBM5NV3Ptu6d16IaKQfmpOm4LMl1c7LNSTvshb6FyIeLK4BRhbffBmQhiJtx3NTY15+4bc2yntXV5kfrhogbFA2TDzM4lTlhqB6euuODgPiFfUVOCjP3T+0YjwXtnNROWwGS/dydacFmI8cB5zBHQ8JBYrenrov84PzarLzT7CsjXhbyxsnKvjIq0JBTMCOx95LGWLHaB5Uhkm+EdIWdUBu9oSkyVr7x6525Mh4VRK7M/309Eml0SDOEr0ytew7K4glzfUW1d7XClsQ4SUoeI2jS2cdEqEeopFyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M95nTBJgrwQ8kkFTk2TI29UcQrO440t/vbKZPt+18Gc=;
 b=seW73yfIOXZ6Ek59SxKp6HfsDbNp3/M3rbC2+2hugGv4WduDKR9EmHitJd5l6aeufxk1feDkaaOOA9bhT/CgfUYodDvvcesz0y9BCoiQzE9Z46OlCnA9nMBe0fNJDFijTmvWU23qs4ox2Etd7Of5zCOmgPb9WKU5tBIRJm9vVwumAD7BSgV0AeU+gctyhL372+guCo6tjQ/3BOasQBYkjxVorXxLVBwnzu8juUEHIrEbF3jDbDi8Z5Mb0Pqg6FTM3y6Q/6KyJUVi7ddUhEi0KkNDfrtOLzP0oWjjrbi9rNhEXRHaJkgaAc03CUZc7TLlFAXoPfgBgNon0poppGfH5g==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 BL0PR12MB2337.namprd12.prod.outlook.com (2603:10b6:207:45::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Wed, 27 Jul 2022 10:16:20 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a%4]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 10:16:19 +0000
From: Eli Cohen <elic@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: VIRTIO_NET_F_MTU not negotiated
Thread-Topic: VIRTIO_NET_F_MTU not negotiated
Thread-Index: AdibctjDcRi2EWKMSzmmrEX7B4yyOAAAkbGAAAAkGdAAAGTyoAAB7gYAACC7v/AAAsI8gAAAarJAAAVbDgABV8vWUAABsF6AAAHpvoAAAp9bgAABXvCg
Date: Wed, 27 Jul 2022 10:16:19 +0000
Message-ID: <DM8PR12MB5400AE8A41758321E0348764AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727053311-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220727053311-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63aac9fc-ce4f-41c6-55f4-08da6fb90c9b
x-ms-traffictypediagnostic: BL0PR12MB2337:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oiYceWE2EeGeWysmPpeuEEdRKQNWZJ99sTHEpurQARVGiHFDOZd9YScxlv/uAcfwGhuInesnBUaGb/EJiXrYFfwTQtxCIyCqZHS+Fx+WnmxDSLaG/18dykd9MmSuR72uosAl9ZBw21HkRWmZdztv2ujhXVgmD7xTvZOJmmi2RbKI35wuNGgLv/KiXQXFO1FhO/TAoiL2LYhIQlcSP/ZFDlmP8BOYTgqcbRJZr7kYlQMbbtuQUak6OxpZx2V6GSCAr9ozMDGxjXEaOZQFnMeOK2llD30nZ2qRk+Jjob/nf5VDBBHmj9tuhspluqD4cwM4NdA6Pjtv/Py6R1rQqKXg6N6+j0in8JGEbWmBAtMJ88B045lpkAcTIoIt3mfdzQWYX2M/srWJZpKOnIT3/qYxsEw/SKz2RI3WlpyFNq9xTXMEnA3diOQ9xV7RshhQ19eSYPppcANwewVbxTRoy6w6dzEL2mCKvliHsZrQsMdqFDISkAR6ccOchHihEHggEJ6fxoCVzkIGwv3isnQ5moyFQwIcXUS0rkTzNoIBtUcVI+N+D+U7Xgbol2c7wahmLVX4l9vdqGEPANbaokUfL+V4kWqg1k720K9gWndYK+GJsWEWwvzl6Qvp9xEZZwJD4mSckhCeFzRmp+xYGw5eQ8Rt9N1flG6xJ96CnFpI6YMaxdUokpVCXoaPBbyvym323JWvnNIsMRt+fTEIAGlyOfXZl+ciTFLUohMXBk4NMx8xzRLHTHH5t//MHNmY6zRpJc5llPr7uMlKAC/HafekKMGTIUhQVvzJD4pa1sVnFR8j1iiJwLuNLZXEoFiuVyV1XNfX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5400.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(38070700005)(38100700002)(7696005)(86362001)(478600001)(5660300002)(8936002)(33656002)(316002)(122000001)(52536014)(66476007)(6916009)(7116003)(4326008)(66946007)(76116006)(186003)(83380400001)(9686003)(54906003)(66446008)(71200400001)(64756008)(55016003)(41300700001)(26005)(2906002)(8676002)(66556008)(6506007)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5smjeeD4tl8BxMGYNt6MOBEwjNkUhISyQsgQ1mMecQso4Sj/ZTCSAc5P3jg/?=
 =?us-ascii?Q?MYDq8k/2AVzLm3EIz1trPxZ6D79P4DrdJxb2+GTZUpMV81UrDzkwujGvFYDS?=
 =?us-ascii?Q?V/4les/xai+aWE32Har2meR6xdx/XuWzcMx7EiHHmYdWz4OK87dETFAZPJBg?=
 =?us-ascii?Q?JErk/1ecmE+yKS5rDVM8UBaullyNBsWexfrsO655wyljb8vevPIsx0RJHTDH?=
 =?us-ascii?Q?jPfqzQoKe43deg2NeOP3PZkruzvesU4QjuBJkehPKHfMCZRFAvIIh/nPFxOQ?=
 =?us-ascii?Q?xH2J3SuT4dAWUZHEWZLQvbQCD3xD+IzWQgcLPuyeTsfSNNTor+DPq6g88SLt?=
 =?us-ascii?Q?xJtvBvK83/Uu+OedDOXhqkCkwfPMyTXxFYW9GJRyepg59BlHG7oc99MlODWe?=
 =?us-ascii?Q?OvfE4hzBq9eMUawQv2AMPSUpcLDmmx4/Eu0OiE74ICJADbDrLd0H/P28u/PX?=
 =?us-ascii?Q?hhth/23/9hZQAMLayASnxf4mD/5mz8gDbvxOYjA0g7BIdhdU43r3ZqcYQQPS?=
 =?us-ascii?Q?2y2uC/QwYCJOOQsSUTNcGTxclze98Iaf4bRa1wudMltIJYRhCpzZz5hVjKj8?=
 =?us-ascii?Q?cpK+3B0jVD1jZQztypylEq6Ug7YwGHF/d6zpqsC35qeZIk1hfaJ0fK92eR/V?=
 =?us-ascii?Q?3MLLoBzfjBwWVWo/8cWcHg5gebNvN9mERB5LEW+TqwmwNTaAaxEr9tSQ9cMZ?=
 =?us-ascii?Q?masikyzfpYo371vPNurj2R+OVRqiEq6KEJMEQEHag/3oX9IJMGMkQwH953k9?=
 =?us-ascii?Q?bH6RyCTjYeLHLj1KRkAoAjSNHaHS2RXovt0+qxhADM74MGXUVNtzgVJK+CJU?=
 =?us-ascii?Q?E7vO/z1AvEILh2zwigJWV4BJ+iHaFUkuEtH4wOZruJeveyX6rRqt9Z5W01nE?=
 =?us-ascii?Q?jfeZ9bnjZgBucDDBVEB8dlxXDwxE7gMoVBNbyXCW4a5YwcLWV7Y6wOWOwJYL?=
 =?us-ascii?Q?Akh/mqrLJqVQE8GuTR+FPN77YCNmAZYQGbzP9m3bqGNRiUAo5FXBIuHBXmKP?=
 =?us-ascii?Q?zh9KhfSApSRLKqCcakCtaeHOcZEQlgCXpEc0nHT6J1Ft21sR2yMhwsuhtuYa?=
 =?us-ascii?Q?tHCWF9THJGSu/yVSGYsMJGvhMtbv6uxQVD0H13ACTtkXi6WAuZvxUyzryZPU?=
 =?us-ascii?Q?x/L3R0O8YHk8CB21MH7TNrE7JIP9ejlO5j8u1148/60tTjzDr17qhXdzM/Fs?=
 =?us-ascii?Q?GkzCHZjdi23N+vb+hUmI3g+xB5xh4xEFpvcZ3mmp3oq56gQPKUWwg8gV48Qx?=
 =?us-ascii?Q?CQUZVi2TA7jAqY9pKjt1PqWKXifWJgLW4ZujFD3mREaca7mf37utXysXzj7/?=
 =?us-ascii?Q?CCNH9tM0kgC1fYDBh0ZWQRCS7iFabjQCMGjU8Tft18NFYOJosXmdbSvNF4eu?=
 =?us-ascii?Q?KtX5u6KsJ6uuv1bKyBBcVuNxeXhBxS1grTbIicN68zpQHzMugbvYwe8jIneT?=
 =?us-ascii?Q?XGWFFHNwgiHYMtVg4/hJ9+ra4q/vJ0psgMkkNH9JHhVBeEfpdjWUMKHo9V9J?=
 =?us-ascii?Q?OekPav6+gY2qzkfvnRCBrbnDnN+jkFwSOaM5ybK4M+QpC+S+rgExkM2nNYmj?=
 =?us-ascii?Q?ZrBahvam0n2xSGlO3nE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aac9fc-ce4f-41c6-55f4-08da6fb90c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 10:16:19.7174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGUmN0IxgnikO39R0Xv8GHOHWW31BHlAHwsl6JOI9YuSdMzlkgwVspXSA2eq9kSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2337
Received-SPF: softfail client-ip=40.107.237.56; envelope-from=elic@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, July 27, 2022 12:35 PM
> To: Eli Cohen <elic@nvidia.com>
> Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Ja=
son Wang <jasowang@redhat.com>;
> virtualization@lists.linux-foundation.org
> Subject: Re: VIRTIO_NET_F_MTU not negotiated
>=20
> On Wed, Jul 27, 2022 at 09:04:47AM +0000, Eli Cohen wrote:
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, July 27, 2022 10:25 AM
> > > To: Eli Cohen <elic@nvidia.com>
> > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org=
; Jason Wang <jasowang@redhat.com>;
> > > virtualization@lists.linux-foundation.org
> > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > >
> > > On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > > > I found out that the reason why I could not enforce the mtu stems f=
rom the fact that I did not configure max mtu for the net
> device
> > > (e.g. through libvirt <mtu size=3D"9000"/>).
> > > > Libvirt does not allow this configuration for vdpa devices and prob=
ably for a reason. The vdpa backend driver has the freedom
> to do
> > > it using its copy of virtio_net_config.
> > > >
> > > > The code in qemu that is responsible to allow to consider the devic=
e MTU restriction is here:
> > > >
> > > > static void virtio_net_device_realize(DeviceState *dev, Error **err=
p)
> > > > {
> > > >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > >     VirtIONet *n =3D VIRTIO_NET(dev);
> > > >     NetClientState *nc;
> > > >     int i;
> > > >
> > > >     if (n->net_conf.mtu) {
> > > >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > > >     }
> > > >
> > > > The above code can be interpreted as follows:
> > > > if the command line arguments of qemu indicates that mtu should be =
limited, then we would read this mtu limitation from the
> > > device (that actual value is ignored).
> > > >
> > > > I worked around this limitation by unconditionally setting VIRTIO_N=
ET_F_MTU in the host features. As said, it only indicates
> that
> > > we should read the actual limitation for the device.
> > > >
> > > > If this makes sense I can send a patch to fix this.
> > >
> > > Well it will then either have to be for vdpa only, or have
> > > compat machinery to avoid breaking migration.
> > >
> >
> > How about this one:
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 1067e72b3975..e464e4645c79 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(VirtIO=
Device *vdev, int idx,
> >  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fea=
tures)
> >  {
> >      virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
> > +    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);
> >
> >      n->config_size =3D virtio_feature_get_config_size(feature_sizes,
> >                                                      host_features);
>=20
> Seems to increase config size unconditionally?

Right but you pay for reading two more bytes. Is that such a high price to =
pay?

>=20
> > @@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceState=
 *dev, Error **errp)
> >
> >     if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST=
_VDPA) {
> >          struct virtio_net_config netcfg =3D {};
> > +        n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> >          vhost_net_set_config(get_vhost_net(nc->peer),
> >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MAS=
TER);
>=20
> And the point is vdpa does not support migration anyway ATM, right?
>=20

I don't see how this can affect vdpa live migration. Am I missing something=
?

