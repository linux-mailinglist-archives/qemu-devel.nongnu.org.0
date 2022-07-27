Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB155822D2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:09:49 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGd36-0005dU-G0
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGcyM-0001Ps-Pu
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:04:54 -0400
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85]:45153 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGcyJ-0007TR-KK
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:04:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0SGnOKCPS1m1+903hRlAmt471xy7I3TXIlwzTxMMFwmTqQjbW4VUBG3NyzzwmESGY3MJIroTqnWRseMTIZmcx+tCsi0vI0pCKW4eOYO0FKHbvrnm2MVBBFVh9VWl+RA6SQ18x3nsoWI1DOKhENuDB7xF5RjU0U6jVs9B5vTbji5LyI1d7MYvHZYf3frIpgkk3/B4tvdaI+Kvj2xVQGPl9wbVr387nqy5M7nayYoAu4+31HkFvBzSNrvyRnbMeMgDfIz7+AyV/mY14bSgj74xCGFePJLPP/cYXgGc5yffox/EcyrCtHqJG3NGLrxhq1a1I2QD1eJ3R69sZz3B+gBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3ntA3fcIJ06NpGXJO6Zv1TFR5CmvaHlVkj3PRMRZl4=;
 b=bwTz5eTgMvwEq1kupBy+NJkAjw3n1j17iL0lAdVoWGQAt7DT67ekdQX0ArQxQKRC3ArQEivQaXZROYBl734WPmYqaxvCUc5w5JMlzcm4CvrIwlPSbge/hIR/mQnXN67Ua/zGlhDgFq9if7kJCqz+1xndylpL5Q8Yex7Stpn56SgsOFbfgLcQQzC8Tcjtg7RvcjbMTVebL7i15ZeGNNHDWwp8geSeYPCxG5VPt5nvJEXSJW1/KYQNT0vrhjKI2igqktP295/2pup/RkgMdCJaTOAp4X7oJ5z81twXLlUXx37w3YgxIgaNSkc1oSMyAYsXq7ZQBDbbdlLJTBL4tyTQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3ntA3fcIJ06NpGXJO6Zv1TFR5CmvaHlVkj3PRMRZl4=;
 b=K+DG2w5yItG15JTi4yVCVgnFApJtSqiiuQbM2YZ5JmFtG/288f2OBfC+FfhtOgFd2jN7e8IYR5oNAQmNb1TegB6BAguNvvd/To87T+C348do7N3/FFP/lgmoP3DO7Qry/z09flcvXm4TdscDMn47brqJiZ6HAg3p3LTGwYBnw1wzlmKPXTHyJKtg+4V0fWAosTWIqGUyyZQObYUnz6jUScEzpyFKA18eyQK7yecTg8BprJF+tzB8JaQiY0Ym44BEIyfqMvoImkF57waMh+xCZG1fp9CfCvXeg6QEBGCbTeK8pL4dxVlzGM7C+vdnxYRGDI1CcpPHfQR0QwxJTxh5WA==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.22; Wed, 27 Jul 2022 09:04:48 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a%4]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 09:04:48 +0000
From: Eli Cohen <elic@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: VIRTIO_NET_F_MTU not negotiated
Thread-Topic: VIRTIO_NET_F_MTU not negotiated
Thread-Index: AdibctjDcRi2EWKMSzmmrEX7B4yyOAAAkbGAAAAkGdAAAGTyoAAB7gYAACC7v/AAAsI8gAAAarJAAAVbDgABV8vWUAABsF6AAAHpvoA=
Date: Wed, 27 Jul 2022 09:04:47 +0000
Message-ID: <DM8PR12MB5400E307D34E8B0C5D224813AB979@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220719093841-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220727032334-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220727032334-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d1f7f0-2844-4419-8542-08da6faf0e85
x-ms-traffictypediagnostic: CY5PR12MB6453:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3YH9SxyG3RCJz5CkeSTBn/Ac1oYFQIS4deV0XysuXsiSLKP/Y4IwIzmPZlsrb9pfSvRkHoxpMs3/sQmiD+ih8FhOGaerYeFG8qtvaiGIDL6N/HSFzN8vXlACQi8mMz87QdAah1106YuLa98SivymV9qZNdhiitW06W/ZbtIcyXcgHpWavJUj8GZVR5AljZ1mrR9aoedY/1eKnT8z30+BCbnPuTL4XDhDdere1gacXRvjHFjbOI7/4IehOLRuQiJSE1y2DJwqolnTZRCGwjJm3Ro9O6dLuN+SOjYuj0zSBVZFeyPmGhCweHPFogZ1fTWiZCTNaCBqPRMmx9RjV6FTiGjOSu4amMSoPR+5cfZXePEcPFm1rgr7p6naFl41+C1NOHEPARo+s4ERoatDeVW23eW+vTHgkGg43cDzk5W0CIn7J7r5vCB7TZlCkMWAQTXZ9GDaOgrvUmo8q2/Cm6SxEYoiLRhHjrPYLhUGyh+EVaIuaRdpxY7eiBMUITOc20JNnKQSqR1+fLZaVjwFMVGWlpYUC/DH0T5ls0MfLEriNqxoblL5JQG0Yo28LFKXfOGlOttBW2Kzu3MAWXJ9Gr7wD+0Cxg14kAYjMN7eLkUDeEWDMmyG2LA1uVnd/WSp1VZ8pfbtb+lJ0e7ANGnOb0Q557JIxJ6ijB4XUngfJzcNb6/2u8v64Y2GJPJpKp79UJwa5iEzX452anZb+aEZTIICv/MaXGWK9GXPesUG5y0dm6tMKacOdew1QpyAX72A1X1B6IQgGtejHle+B3dU0TdKcwMrcs1cUEJqFTtiXkPvQc/00tVV+ayWZNvx/a75tsoI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5400.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(8676002)(5660300002)(8936002)(7116003)(66946007)(64756008)(6916009)(186003)(66556008)(38070700005)(66446008)(76116006)(33656002)(4326008)(66476007)(53546011)(71200400001)(55016003)(478600001)(316002)(26005)(2906002)(9686003)(6506007)(86362001)(83380400001)(7696005)(38100700002)(41300700001)(122000001)(54906003)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aUi3s3V7NtfX+hjO+dcwC4XhYglARaHfRfJtP0zsoGq8U1gabLd6geQcGD3F?=
 =?us-ascii?Q?ENBSKN3HZsvRTQIxvBPF+f0V5SpLcvUO8C8o4CpyZ/11u6uMXYGv02h4rMzs?=
 =?us-ascii?Q?vfncQhKmV+glV21Ch6EnwxPJGSTvEQEop/d5froMWhCLhZgCX7BLgyHr6Mxn?=
 =?us-ascii?Q?R/9aGrQhAiCE9++bccKO+hd7QrTsynStlCQwqRzh0gSaOhoDIqhkQk0tjdr8?=
 =?us-ascii?Q?c/zIkwxIsnpTlJdTM/bPHonh5gU+BXNPdQFbYEIKLhiof6UzqudpE8joGcPH?=
 =?us-ascii?Q?OYifpOXV2eA72Sb89TXAGtf5SNDIynZ00X+gZY8Uw6YOowPPwYm113YyStCA?=
 =?us-ascii?Q?jMj3JnIFbuMV7lTRtmY9Z4anAnfHi5a5qAg4ZMpCfyKHiThn50vuA0fHCFQQ?=
 =?us-ascii?Q?ms4NmW6XEEhKfFvFuX6K5CXVq5losyoYWIvgbNxgyNXcGu3nOLq521BFVxmW?=
 =?us-ascii?Q?V+mORgISlQiMnU4I/jfqZhuGOGybe5LXCufeE067N6l4A2CQZM+0rZDGu2kG?=
 =?us-ascii?Q?OsmfuFJKQYus5QMFKVfjoVfOF1f7FLeX0vOi7nh99KYH3TECMrwGPY7aInJf?=
 =?us-ascii?Q?EPJNYDAyTCOod7fWnnLdhf3gZ4MmLzEM+bpu0QtvR5Gh5Ag54FNkW2u/TVhx?=
 =?us-ascii?Q?fJ5OV9VNLGk3HdWwHSOhJhwJQf4vLIJeElkNgSqmtXZfsCd5Z8xrwpzyAd8u?=
 =?us-ascii?Q?y6ZcxmU7Z84eDym7t+mPj3B8sz+35q4VK4JCoLDF4Fn/MuEzu/UIMSJSeEku?=
 =?us-ascii?Q?+tlUE6tmIaUFrjTRxg5dMWBLoE3s6UvzYoRLxHD6hZ/EEuiacdFdn4MOFUfX?=
 =?us-ascii?Q?P7B2VB19C8sT9ZUFNcUGazMKZagVe76ZZ2Nh9KvR5PNwZFjSzcHjDW9GQ4Gf?=
 =?us-ascii?Q?K0gkjrSPIQCLb5wthYuhy7x1sNL6GjBpdLJhnyRNzTQ/RCosIdDbNxyjItOz?=
 =?us-ascii?Q?85YDAVwGGH+LYXA1PcPjjmAevvMZpa3ngRl07f9o9li89OC1SzmPociSnnc2?=
 =?us-ascii?Q?wk+SvU/R+Ip6jtDVrjoZiWouMdwW5vGbzbxhIpES6k1592zWfVvpTkXXueiB?=
 =?us-ascii?Q?m9V6xXNFJri7T1yQby58Di9yia7X+ZrCBYuTmf+xPWrpl+ubHbnhW5nXQDKP?=
 =?us-ascii?Q?v4R4R678EWgtV3dKoLuQ3JUUM47/NEn5AvvCEYkPUS/ldNjQMEmfiXe6Kz0v?=
 =?us-ascii?Q?rwbcGgF+JXmn7CfCVdhG6ZpInf2Q2fhCmBgg9TR9Ue3O5HUXRnqA/RmO6bPf?=
 =?us-ascii?Q?aiBvYe8ZyINLVutuOu7b+TXGssj8NhPbhdNZ4jGAyfMpUapz6TSUAS+n3BNS?=
 =?us-ascii?Q?zxl11jratS1KiWVT53bKIwb3+lqJAERRup4pdXGqS7zpsKEYH62OdF0knNNF?=
 =?us-ascii?Q?Vv1YHAM0LCl/QRwencqps8ZBuB/gsjGxLz+G8LaJKL7Al1O26cx0pdypQM/4?=
 =?us-ascii?Q?6LTiqLSRh9KjP6L0sSb0SXGReVE7ATKEdRtpD6j4/NixSQ1XmGt3Kn4nCN8k?=
 =?us-ascii?Q?qalK9lHHdP2oSdk9mgs1unOJgO1rjDaIV7sFwLad0UUtfxcT6skNLmfBdCvn?=
 =?us-ascii?Q?GBHVTw0CEWMaFnLkZx4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d1f7f0-2844-4419-8542-08da6faf0e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 09:04:47.9469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZ7/doSRUyPU5AaQ7r0qt4TXHkJOhwjo0sJqRvIgsdmgyybWRjPk+vobA4awN1b4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453
Received-SPF: softfail client-ip=40.107.220.85; envelope-from=elic@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, July 27, 2022 10:25 AM
> To: Eli Cohen <elic@nvidia.com>
> Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Ja=
son Wang <jasowang@redhat.com>;
> virtualization@lists.linux-foundation.org
> Subject: Re: VIRTIO_NET_F_MTU not negotiated
>=20
> On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
> > I found out that the reason why I could not enforce the mtu stems from =
the fact that I did not configure max mtu for the net device
> (e.g. through libvirt <mtu size=3D"9000"/>).
> > Libvirt does not allow this configuration for vdpa devices and probably=
 for a reason. The vdpa backend driver has the freedom to do
> it using its copy of virtio_net_config.
> >
> > The code in qemu that is responsible to allow to consider the device MT=
U restriction is here:
> >
> > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > {
> >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >     VirtIONet *n =3D VIRTIO_NET(dev);
> >     NetClientState *nc;
> >     int i;
> >
> >     if (n->net_conf.mtu) {
> >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> >     }
> >
> > The above code can be interpreted as follows:
> > if the command line arguments of qemu indicates that mtu should be limi=
ted, then we would read this mtu limitation from the
> device (that actual value is ignored).
> >
> > I worked around this limitation by unconditionally setting VIRTIO_NET_F=
_MTU in the host features. As said, it only indicates that
> we should read the actual limitation for the device.
> >
> > If this makes sense I can send a patch to fix this.
>=20
> Well it will then either have to be for vdpa only, or have
> compat machinery to avoid breaking migration.
>=20

How about this one:

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72b3975..e464e4645c79 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3188,6 +3188,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevi=
ce *vdev, int idx,
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_feature=
s)
 {
     virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
+    virtio_add_feature(&host_features, VIRTIO_NET_F_MTU);

     n->config_size =3D virtio_feature_get_config_size(feature_sizes,
                                                     host_features);
@@ -3512,6 +3513,7 @@ static void virtio_net_device_realize(DeviceState *de=
v, Error **errp)

    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDP=
A) {
         struct virtio_net_config netcfg =3D {};
+        n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
         memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
         vhost_net_set_config(get_vhost_net(nc->peer),
             (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER)=
;


