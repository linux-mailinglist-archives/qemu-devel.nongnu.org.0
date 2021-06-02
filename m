Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E021398B06
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:50:08 +0200 (CEST)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRG2-0000T1-BU
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>)
 id 1loLSN-0004ms-LR; Wed, 02 Jun 2021 03:38:28 -0400
Received: from mail-bn1nam07on2070.outbound.protection.outlook.com
 ([40.107.212.70]:38563 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>)
 id 1loLSK-0004vY-BU; Wed, 02 Jun 2021 03:38:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frHt7un2kIryoKC9RwfRdsTrfRIVUqnL1QzN4Ys/2HzOvwstbbPLvUsa+W7um8kaAGXsURF8NXRHvhVmtD+7d3yeDZSDS4lp7U06E7uXu5uYj2RJi2SG2v5QBjol+tRVBNiVMKRyv5CDwoYthSc808QkJDcYdQEvWpGNQMHw0McGHoc0E0MCF0c+SPQ0wqhJIb8x0h+hzQFqaXtkeMIEa+Oqt+v0mB/1G3agFWyj21P9NzhB+EAg9J1dHdgvYbZrOz8FNF5C3Yk+pu4iO1qcwOMRgFwTZuIHUA7L8ltQxfeHhUIPb1ymLlI5ttckvU1YiIUK0VlD29kQKpqCmA6kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bykpJIpJh9iQUL8RZDNZGOw7uLRtIZm/Opzaat+i9Mc=;
 b=NHemcz/j2oLJpVhOlE1dPqp2o6sTjmiML45bTqtQhdoGMrmFLjSBMGlaQEUHHjooXNHY1J8+qODuH/uLVttx+Kband7kBqbZbqSQz29mDE6Tlhuz1AvHS/YAAPJw7ZHm9e0me4nDEk4uKZj8PGqcwByhJ8o7nt7uWojUb8MfyP2Iy6tuJWOBVM2L9HRt3EOxViB3E+GE8CwqAeQuuT2urUhqx9zuBi8LFAwd1hlvid/MiXBlN/gng7m8Yw5MZDMwR0tnvH98lWUj5RcWf4pD9LhRpx2COvcSHtEfUh2qWSTfR3PzVxvQOibXrIPqNecuYXmPDsUHZortRTvoPNQQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bykpJIpJh9iQUL8RZDNZGOw7uLRtIZm/Opzaat+i9Mc=;
 b=FFPJmnBbK1zq17ZoS/11LrIFH8AQRc1eS2DERfB5rIrluFq4fweaEaCbXdP9e8l1O6TrbGwq9ifAvEBjF2fBmvO17SaQnLV6FNJ+wuIudvN5W46aW0iTNfQH/2rTsc5IfMgRFnitQ5MVGo41b1Axr+1k76SlTx2FyNtOOCr5P1A=
Received: from BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19)
 by SJ0PR02MB7647.namprd02.prod.outlook.com (2603:10b6:a03:320::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 2 Jun
 2021 07:38:16 +0000
Received: from BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::fcc5:2059:c841:933e]) by BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::fcc5:2059:c841:933e%3]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 07:38:16 +0000
From: Gautam Dawar <gdawar@xilinx.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
Thread-Topic: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
Thread-Index: AQHXV1/O69Nz5WwZQU+ZsyIYxtE3mqsAVJnA
Date: Wed, 2 Jun 2021 07:38:16 +0000
Message-ID: <BY5PR02MB69805AC4C88DFE9E5172D8BDB13D9@BY5PR02MB6980.namprd02.prod.outlook.com>
References: <20210602033127.40149-1-jasowang@redhat.com>
In-Reply-To: <20210602033127.40149-1-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [120.89.76.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97886ec5-2c09-404c-2ace-08d92599628f
x-ms-traffictypediagnostic: SJ0PR02MB7647:
x-microsoft-antispam-prvs: <SJ0PR02MB764760837C587DE6B1EAB860B13D9@SJ0PR02MB7647.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mY4qUU4Qr2WwpeHKkYB6YMpmO4ebbQipqIawhIiM+jJk4hftni0vj8gOq1aq1FSSHfGLWi+SVqgtVaApHRc4KaKdn2QVTTio//mi0hD09Gi6QDhEBR2QP19AB+7QtsftQN4xMKaUzICcFGVP+xhqWNk7VyFWx5RKsbRGZkCqOAnzu5URNALMEKNC9TVIkqica3TvGFFY7JMkbMWxg/HSdqxhtv0jUm+KKCPLLnxfgqIbgl+WUKrrf0+5J4VmdUF/GXkvLuUvjdDQRmV4pDRNoqdd2OO39sJHKTK9CBMurbYI65fsJWF1VJh7GPV0WlwLJWbHWYwz5pUmhhnCYcyB+k9QkrfVHxlHPzqQ273SG0Q9+G5dJABRhINPa+hquvv/ix47eOSjVkgAIrtt9vQaq6KnXVPIlLp0gicTe5nyeP9AJ5iMi05l24krR8cJ5UmnyMI0Mu6sAQtbRo7tw0uIK2HMGmdYcm1b7rGwNXEG7Xj/qzkma3n57W0gYcQ7IYl4421Q5TRqoitsZqKAeVTc3LJDSpd5keU7e8+XMveJ4/4EoipF4R2pDvXd7XywIwcMWUz9eCrqggbatAHXagzmy05GU5HN/Gu63F76pFIldZA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6980.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(4326008)(55016002)(71200400001)(478600001)(66556008)(110136005)(55236004)(9686003)(53546011)(2906002)(64756008)(76116006)(66476007)(122000001)(38100700002)(66446008)(5660300002)(316002)(7696005)(33656002)(54906003)(52536014)(8676002)(83380400001)(86362001)(8936002)(26005)(66946007)(6506007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wG5XOSp0GloTf/EbqFQwYt6BSv9xSoZPn969+TPD0p9whyhfQlxRjMv379b1?=
 =?us-ascii?Q?lmAncVpsqzvGULAMpcgS5wMddP8LRsus0rOn2WnVATsNGvHRsDMXMj03JktV?=
 =?us-ascii?Q?Ysy9cr3aNprsOqg3TLbiHk5aUjo6CGfATbSVEwFO9WWmrfZGOc7lHsuigghP?=
 =?us-ascii?Q?CJD//I2jbKvv8m2rfgAhuFho3SXhif9hH0fxHloWxNmGJWMnTwRQ7Vt3LGtB?=
 =?us-ascii?Q?FWECAvEYrJazqmppAGlctIv91mJXQi4SNQrPeB3COPd3T0NpJ/O+4sNnuVxS?=
 =?us-ascii?Q?X6QTBqd/WNCQKttdk1z8kVc6dJFqUdaFADnB+mCSyuPT0fXtWbuZaFZmUFHp?=
 =?us-ascii?Q?CGCKN//OU2U0ro+y0a7vjkgy7XGyZuUeV3SgpMzy2FRuKDX1LNhiDngFdZ0X?=
 =?us-ascii?Q?x2VqWaLFdRxxWnkCmt3FXdjgCQ78yVQipaATELvkgpPBxiW2yvnXHli+yuuI?=
 =?us-ascii?Q?MOLOGO78PA3HdTpyW0CAaVfooW1bsI6NehLrzX0YxVOGSwpD6h6zMmeY7BQx?=
 =?us-ascii?Q?voQJEYYx+4EISRCA9iGwm/qJWS3ZfnkYSIBuNZU95f1dmDbHE8+ZeidFnomU?=
 =?us-ascii?Q?UokKSvO2/22htYj7in7Vukq7DabBd2ilIVLBcF3v0PmtXYfRbaECw5Z67e05?=
 =?us-ascii?Q?q8ln562GSaSAovmoO3sb+x2w2CLh3at3w81Ch+oNHimh1XgCodulFVVhbGZq?=
 =?us-ascii?Q?KYmFR4HC1gAlB5DmAFaEclru1uLGrgCY9z+6kxQL1gexIIFvWW3ytcP6yT/s?=
 =?us-ascii?Q?jH1ofvXNA9eW6V7TbYbiOsNofHKjuo0Erz+0FLXrV+lY+5691L5bB+5CzLum?=
 =?us-ascii?Q?fV50sl/8wAjyryJWhMZGy9vrhnyhoSypr3sQsKn5UJrBbdjJSZEOqta3CPFH?=
 =?us-ascii?Q?cOnRSEZX9+hz9eVzoBXkAIb0U2Le/GLI2S0pO081QRWC97vYjaGcPKucEtJq?=
 =?us-ascii?Q?C0nVEWylO67vP/fawdJie1suL8EM2PvWPH0SEU9KFCwd7jwZYeiIjMdf2wnc?=
 =?us-ascii?Q?H5Kn5TMhLqbRETjFlmpMEeSn25XxtotDUjgtbLYLOV6VAIh5o8rh7n7ECufg?=
 =?us-ascii?Q?RHkZEYjgL0k29c3fejepgcVIUgHOMQaTV/RoVRRDAfTAqMOHpPEqkpltfmoJ?=
 =?us-ascii?Q?CsYvXLVT3MNZO1lvIi/f6/b+L2sbpg7LIxLv/w1f6tnwmjm4Sm8J87nrBxAd?=
 =?us-ascii?Q?nySO53EBAJ7K2MV2ZHIZGNLZGn5awThck6kna/2vXEJwysp8RN+JAcCuG/2k?=
 =?us-ascii?Q?Op/xL1qo8Vl34vIh3mANfAKr62Vaun7FAslL1Oy6WdEX2ZXwj8LMBIBpdae4?=
 =?us-ascii?Q?13Fc3vI3sWEWi4vOuCj7ygiP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97886ec5-2c09-404c-2ace-08d92599628f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 07:38:16.2274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQl7dBRxVjsCbYVDCiF+8fKsn1I0jJ+/OQ4/qmFaTsUSwhvDrh6sGiSaWCV80oYGZS5/ksGm/VxfJ48td3U7Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7647
Received-SPF: pass client-ip=40.107.212.70; envelope-from=gdawar@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Jun 2021 09:47:41 -0400
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
Cc: "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

Pls see my comments inline marked by GD>>

Regards,
Gautam

-----Original Message-----
From: Jason Wang <jasowang@redhat.com>=20
Sent: Wednesday, June 2, 2021 9:01 AM
To: mst@redhat.com; qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>; lulu@redhat.com; Jason Wang <jasowang=
@redhat.com>; qemu-stable@nongnu.org
Subject: [PATCH 1/2] vhost-vdpa: don't initialize backend_features

We used to initialize backend_features during vhost_vdpa_init() regardless =
whether or not it was supported by vhost. This will lead the unsupported fe=
atures like VIRTIO_F_IN_ORDER to be included and set to the vhost-vdpa duri=
ng vhost_dev_start. Because the VIRTIO_F_IN_ORDER is not supported by vhost=
-vdpa so it won't be advertised to guest which will break the datapath.

Fix this by not initializing the backend_features, so the acked_features co=
uld be built only from guest features via vhost_net_ack_features().

Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
Cc: qemu-stable@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c index 01d2101d=
09..5fe43a4eb5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -275,15 +275,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *d=
ev, uint8_t status)  static int vhost_vdpa_init(struct vhost_dev *dev, void=
 *opaque)  {
     struct vhost_vdpa *v;
-    uint64_t features;
     assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
=20
     v =3D opaque;
     v->dev =3D dev;
     dev->opaque =3D  opaque ;
-    vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
-    dev->backend_features =3D features;
[GD>>] Should this be initialized with 0 here? I am not sure if  memory all=
ocated for struct vhost_dev is initialized with 0.
     v->listener =3D vhost_vdpa_memory_listener;
     v->msg_type =3D VHOST_IOTLB_MSG_V2;
=20
--
2.25.1


