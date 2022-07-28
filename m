Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B324B583864
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:05:52 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwed-000199-Op
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGwR0-0000FL-Da
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:51:46 -0400
Received: from mail-bn1nam07on2066.outbound.protection.outlook.com
 ([40.107.212.66]:44934 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGwQp-000195-Dz
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:51:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsKdOLrFdmvqjWKub72HZmhbazhmaWzC/G831u/GZt5wIW19E+dbeyVgRRO2C1ZMfEpjGgXjyxOBV9qpQBUsFMyjJYslwWUHLZWA6pMFeC/XQSWRXR9w5pv7WAdtacB/oW8H+mufQ7Ffh+pDvU2oIJQS8+eJu2QITcOIQZ7TSix9GCO03MW1aoWi2RKZIKi11SgSV1TnurGP3an8W93XCWl3VJ4geESRFt0K2UVp25yluYr9UvqT5YNTLw7PuFB3LwlRJRAHNoSU1pxYdbLXlW6B2u8PPvSe7DzvLbqAywVbWH0LsIXZjdz7RsVcMWONJljg/k9RoIZYg9VJVj65AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoKL+tDejAjqUd6eiDnqcyyaGy+dUV9Hr6cLrugKoK0=;
 b=bpgcVsjdzW+fsBsD7MmAV7VJWm1RT5b1hw7GCeX4ZrZ1Kqzmv+Q1nOGz+96wYnbSM48FDYHl3r4jgNKpg0qEJqXRqG0fHVHWRMxr/ffaSY/Abm1BmMPt7BpB8zf8w2ZONJfYCyT4ewL03RrTn7y6Pkpb91JRhQj3ZWbFmzIk73Mj9Vz/7r1lxGyRWU0bVRsZ+giPVpAhRkumX7VilSoDetxNcO6gGrWg0GHuqYsTpK4zJ5X2YRFx9goh2j+na6OakavaBPXdXVO+lH6RN1YtoJmpxs+A8oS/hoVZnfJ3ogduwK+uWC9iBgNUOphqDfgLcZkUZ4HW7ZCBr01tL+JJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoKL+tDejAjqUd6eiDnqcyyaGy+dUV9Hr6cLrugKoK0=;
 b=J+NPqDDY8LDqshM1E5wCtA7SC/+iW1TwSb1dyI+dBp+GDV1dzKEEQK9QCRqNG4BXrDlljWkx5Y+WAbrIV/PLKEynGKoOgNtoCtrcMDJPBDKqTqp13HqwQNm4z0ktTiQ+PwYKaW3hLNxZE3hRIexEgj7Ah6ubZMSXQG0vFTM1xQaQNYaHtY9nAlCN5Rsrl0cDiM+D5f2NUJb80wExsaa76e5NmhkWQFH7+Tbxiq0aeAiHEDMdiRiFViX53SmuOdQB7Nmtp04sMoIjRe9gftPcUIuDv8AqLMJr/TIt4xF2E1Kb5LSjqEwKOLHBcCXiMXvOX8yky7nZHSF4Vpx5T2aSmg==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 CY4PR12MB1670.namprd12.prod.outlook.com (2603:10b6:910:4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.20; Thu, 28 Jul 2022 05:51:32 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a%4]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 05:51:32 +0000
From: Eli Cohen <elic@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: VIRTIO_NET_F_MTU not negotiated
Thread-Topic: VIRTIO_NET_F_MTU not negotiated
Thread-Index: AdibctjDcRi2EWKMSzmmrEX7B4yyOAAAkbGAAAAkGdAAAGTyoAAB7gYAACC7v/AAAsI8gAAAarJAAAVbDgABV8vWUAABsF6AAAHpvoAAAp9bgAABXvCgAAuFOQAAHXUpQA==
Date: Thu, 28 Jul 2022 05:51:32 +0000
Message-ID: <DM8PR12MB5400E23C3E7DA97E034F02BEAB969@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727053311-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400AE8A41758321E0348764AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727114228-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220727114228-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b9a05ad-696e-4193-a34b-08da705d3937
x-ms-traffictypediagnostic: CY4PR12MB1670:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rWnQ/9RnsG7AKjAgbOPS2EbVJ33qJBEBAKVAL/euGR+Gk4rr8ZI4dMau89n0x/P/KTodr+N/KHyKLi/Yz9Lhpz0UO3WZcsrkKGGlv/q2lO1f5AxjIisZc3XLUC+O8YyvMrpPZjXRg/TN+hDGBSBH5bsbc1ilj7Pp+6YYaTX8MsY2ZZtxO1v0NBcyHWX3qaRq95SyGunZ3p+4NIFqDgkEAQzR4TOi6DctEWJ2BboIIo043l0D1C0eOtXPyqFq2AQ6O1bPyylY3ErZGeLce6xsfCC4FCLoOCsWGL9rQPQuS3vqnUcwAIcnydySbZuN2HwYhaunJPkcXqNq+pIHJ3KpLYyfWcgaujdbRCiGVzflc18a4CHmUQkCaQ6aUD26xdOoZGGv+c2PSe+UrUysH/OWWOBvQcSFB+l8MmWI9x82vdes9ccwkUYCEHQbXao2XuZTl8+Ri1WGiVj7x8+MA8kiMufcnySYdarHifbhrgCG9GzxrzF3x6jxKXt3pBoJVOWbfq0Q4IH/f0BuBebIN3zXRCpm9Cq7BipmnNq02xb0327P/xq2EelHSZEoYNkmf3Yn1jbhd9I1XZzVpTpfBxRc0mKFD9Bh6WT/DiB3/d5vBpLo2j3UX0lN/1HQqbNEogs91niut/Ie0m6zC/uwKNUjRAeDcXyVUNtT8m2xiAxlL4fmYWPb/9g4gQDAMP5WmyKGru8015s034L/hyNx0Ft+x6FU0+AiOjhXVEp4ubTrCOmTT7BfxfyI2RQtQvJhH9SX/rN69hA7prSFx6i5z9F6e7RyNJcps8y3w1gXkpYVG9KXzp3aTJSYF/wiqZh8sTjf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5400.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(316002)(186003)(38070700005)(54906003)(52536014)(38100700002)(2906002)(6916009)(122000001)(33656002)(8936002)(5660300002)(76116006)(66476007)(66556008)(83380400001)(66446008)(8676002)(7696005)(64756008)(7116003)(41300700001)(4326008)(478600001)(71200400001)(55016003)(6506007)(9686003)(53546011)(86362001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K7wSNSq9R1Q+665pjw/h2foixiOtdKIyJpHn1zsc94lKd1uB44bh0GDbsEJa?=
 =?us-ascii?Q?fSuQpuxjvfztcb00/VPjNtVfmIN+bbNSaeTPGjmDYxyLplHd/ZmalIwG7Fue?=
 =?us-ascii?Q?AeRUBNxunp2D9CmhBJLbjve6jBEPTWsLAKTGZCS1Phesnve66DJDrGm07DsS?=
 =?us-ascii?Q?6NLRDPYfGXNTGDa2a9ofbLpRh7YNLioOOdzvFzUg8AbKqJKIMUXAh+Fj2lcu?=
 =?us-ascii?Q?NNb9aLZbcFVWBLBgqpj/WmHaJLv8X5kNSKoSSh9Ca5tYpg4Gz0Q0mRcVnpHE?=
 =?us-ascii?Q?vFwi/AsRE4Y9yb9dOhAK6htNB5+nU3XK6YdAskgYJvG6KHAVujTmm8YeCI6r?=
 =?us-ascii?Q?IDUGu4M6msrmDwzUEqKFa7+pIQlPCyhnRM7Q7/2nj2OahJQpEvJobSxapsv8?=
 =?us-ascii?Q?XPFZBLQX26ZiZkgejQ3vj5J2oRy9exr31fLKgv51WGcHavYopu3YjrIIVBDc?=
 =?us-ascii?Q?A2gka/vHnZ630qK2OI5YAxld9RSj1m+05x/Yw7GmduWr7g6ok87GdQMu8LsV?=
 =?us-ascii?Q?vgHiwvlV1eL77Zsh2VFwGK/pHM0IjbSJkRXhJ9H4Ov7PkOduvEbbG2TeNmVZ?=
 =?us-ascii?Q?HELKCi2UlaEFuMoH3nS7lnx9WLjoa7WrUwswCFP3H6Iatb9YJsjKho3xPRlz?=
 =?us-ascii?Q?Qmb2vrvc4m0jF5SbUs/irQ2tJylPakDN89z0PwO/1YyY3zJLsYqVcD3Fa7X6?=
 =?us-ascii?Q?CVV5uqLWIhj8uLb54rsGg+uM80fShNcBjgN5jh7uvqQ+VLqIDZQCmQdnfqWg?=
 =?us-ascii?Q?6Wy2gjLZX7D1lwJStiAg4PKB64eGH3hDbh5zC8fhaSfapdV8JdV95ML4mrW+?=
 =?us-ascii?Q?XQMW1wmUTvez/N/goSenSZgrSD2dXRcjSkaXjJr9q5EraFO/SikhsdvrYty8?=
 =?us-ascii?Q?7TrKxRO27m6HFLP/pidTKX6ysRUSaIN519kq1Z232b6+595fbMEDP/qQZoqt?=
 =?us-ascii?Q?mZnVq5Toi048f+A+cTWv47c7Y/N/In2kUt7sE5QJCruqy+myImrChTzJFi20?=
 =?us-ascii?Q?9Z21qt/eM7NJfkV1m+6U9zjSAMs0B2U5Mqmr0QdgZrzd0E5hqUdTlLQnIOrC?=
 =?us-ascii?Q?bppzD6M4e6vLvjggDHSL3wgd/NRHDk8slkVhE91nGG2T5oYbqFQLPkGUPiYE?=
 =?us-ascii?Q?eOPY0pj3rJBCNpX2qL3X6RiuEg2yQAVwUmYixENUxzgoORvVsb1IbMvGcval?=
 =?us-ascii?Q?yoR6TUjC+Wy3hO+AaZMKc179x0Bzmk6gNb7qXicsE1eO0mgdtP1sGzkl1gAd?=
 =?us-ascii?Q?dcKeIQoaQhyp7MytzqvmTM1hh0u6ZfmnMrS78HORb2fVKbxD0BwAGtVDmI1g?=
 =?us-ascii?Q?JjdEJjn4XHjHc6H4qlyI8nQuh/zEBpRhwUyoz4wa3akf/NLC6xUYolWuSPGH?=
 =?us-ascii?Q?9l04JdM2lMPHhBEaV65hWb2NgjGBTp3s9rcACn086z89GvGDb0dPO23Cp3C4?=
 =?us-ascii?Q?iHTd4TJNU17N7w1pmKG3cuEzsKl2yLUci2pUEbOx2p7vao+JPbr/cwPnpFqD?=
 =?us-ascii?Q?oaXF/wZiRQbRS88d9w6WFf9MI/wymMvQabWi6/gy2acjnWk7nZ/m8cIQ44Cg?=
 =?us-ascii?Q?RyTb94LHwRWyi2TjZ9k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9a05ad-696e-4193-a34b-08da705d3937
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 05:51:32.0251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fy70w8Og4ZQx3X1A0kiXkfIV8kw/6gpiugkn4BLdIrWI8RO+tdhMFgxW5Xqs1AE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1670
Received-SPF: softfail client-ip=40.107.212.66; envelope-from=elic@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, July 27, 2022 6:44 PM
> To: Eli Cohen <elic@nvidia.com>
> Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Ja=
son Wang <jasowang@redhat.com>;
> virtualization@lists.linux-foundation.org
> Subject: Re: VIRTIO_NET_F_MTU not negotiated
>=20
> On Wed, Jul 27, 2022 at 10:16:19AM +0000, Eli Cohen wrote:
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, July 27, 2022 12:35 PM
> > > To: Eli Cohen <elic@nvidia.com>
> > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org=
; Jason Wang <jasowang@redhat.com>;
> > > virtualization@lists.linux-foundation.org
> > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > >
> > > On Wed, Jul 27, 2022 at 09:04:47AM +0000, Eli Cohen wrote:
> > > > > -----Original Message-----
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Wednesday, July 27, 2022 10:25 AM
> > > > > To: Eli Cohen <elic@nvidia.com>
> > > > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu=
.org; Jason Wang <jasowang@redhat.com>;
> > > > > virtualization@lists.linux-foundation.org
> > > > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > > > >
> > > > > On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > > > > > I found out that the reason why I could not enforce the mtu ste=
ms from the fact that I did not configure max mtu for the net
> > > device
> > > > > (e.g. through libvirt <mtu size=3D"9000"/>).
> > > > > > Libvirt does not allow this configuration for vdpa devices and =
probably for a reason. The vdpa backend driver has the
> freedom
> > > to do
> > > > > it using its copy of virtio_net_config.
> > > > > >
> > > > > > The code in qemu that is responsible to allow to consider the d=
evice MTU restriction is here:
> > > > > >
> > > > > > static void virtio_net_device_realize(DeviceState *dev, Error *=
*errp)
> > > > > > {
> > > > > >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > > > >     VirtIONet *n =3D VIRTIO_NET(dev);
> > > > > >     NetClientState *nc;
> > > > > >     int i;
> > > > > >
> > > > > >     if (n->net_conf.mtu) {
> > > > > >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > > > > >     }
> > > > > >
> > > > > > The above code can be interpreted as follows:
> > > > > > if the command line arguments of qemu indicates that mtu should=
 be limited, then we would read this mtu limitation from
> the
> > > > > device (that actual value is ignored).
> > > > > >
> > > > > > I worked around this limitation by unconditionally setting VIRT=
IO_NET_F_MTU in the host features. As said, it only indicates
> > > that
> > > > > we should read the actual limitation for the device.
> > > > > >
> > > > > > If this makes sense I can send a patch to fix this.
> > > > >
> > > > > Well it will then either have to be for vdpa only, or have
> > > > > compat machinery to avoid breaking migration.
> > > > >
> > > >
> > > > How about this one:
> > > >
> > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > index 1067e72b3975..e464e4645c79 100644
> > > > --- a/hw/net/virtio-net.c
> > > > +++ b/hw/net/virtio-net.c
> > > > @@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(Vi=
rtIODevice *vdev, int idx,
> > > >  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host=
_features)
> > > >  {
> > > >      virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
> > > > +    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);
> > > >
> > > >      n->config_size =3D virtio_feature_get_config_size(feature_size=
s,
> > > >                                                      host_features)=
;
> > >
> > > Seems to increase config size unconditionally?
> >
> > Right but you pay for reading two more bytes. Is that such a high price=
 to pay?
>=20
>=20
> That's not a performance question. The issue compatibility, size
> should not change for a given machine type.
>=20

Did you mean it should not change for virtio_net pci devices?
Can't management controlling the live migration process take care of this?

>=20
> > >
> > > > @@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceS=
tate *dev, Error **errp)
> > > >
> > > >     if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_V=
HOST_VDPA) {
> > > >          struct virtio_net_config netcfg =3D {};
> > > > +        n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > > >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> > > >          vhost_net_set_config(get_vhost_net(nc->peer),
> > > >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE=
_MASTER);
> > >
> > > And the point is vdpa does not support migration anyway ATM, right?
> > >
> >
> > I don't see how this can affect vdpa live migration. Am I missing somet=
hing?
>=20
> config size affects things like pci BAR size. This must not change
> during migration.
>=20

Why should this change during live migration?

> --
> MST


