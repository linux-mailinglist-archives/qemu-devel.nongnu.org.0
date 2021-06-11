Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED43A495B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:16:24 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrmdj-00056Z-6V
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrmcR-0004KN-6j; Fri, 11 Jun 2021 15:15:03 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:48816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrmcO-0001ks-93; Fri, 11 Jun 2021 15:15:02 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BJChdv015829; Fri, 11 Jun 2021 12:14:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=0GB8QqZq+YIHzzeYkDz5vDAa0QpzzL+YspZ7QtFUloo=;
 b=E06ozlYBKvG4ytqUgpvm2TL8ujToz98MZ+g5r5Q5fT3586kR+9R6lO5Bo/uPY+hNeLNI
 ESuFwBwR7ve7K3xHVpaioEFYLV6/NxWQMbUeqMbn9oucgunxw+XdWkK78AoGgDmq+4lz
 2tTpAQ9ibSE3fBTkxVMmuDhmsqV+cUZV4PKKOlO8hy+TM1eeEnypgiq5DZUyZTAbSt/n
 cQr3L84qlGVkUJgAtDxGvylER9izlpQVCqoj5nhxOrojtRmRgLsJR1cOZTn+oFg/itTY
 iylJd7pjq9c3rVh1RwfRoJWH4c2pAuYZ9powaLzqA31GqLxgqYGDtjRkRKZIGOzPVMg4 9Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0b-002c1b01.pphosted.com with ESMTP id 394b4mravv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 12:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZGOrMypVir1YbLk5GWQk+Sj1KBV9u3V+YcgYkZqMXx/8VRC7qIvn4EWA7zh8uvGVcE0d1DoJ+siXSGBySEK9NZCMrBZ+qBEgpdZBXhhrq0hB20vP8t/W3NfZDuLWICW0qI1Gzt9eiTdSeQwg/Fq8BERDxuIBLtgLyHKjlEatvBlimwYoIS0ZeI/S570GgHTC3G1Kd/Tl+7tRnKAPLNl1XU29/5YQZpQkZlZnPIHquMR9mhX31zjjhNSB7QmI3U+RmLtCJP+VqDBDa4K/tIZvcBcYUIKnQ1xt4surm7qcj3cO9Jig6J78q9TYoeVCMGktQK1DzIE/xbxNU6FqlGb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GB8QqZq+YIHzzeYkDz5vDAa0QpzzL+YspZ7QtFUloo=;
 b=YQ0QwoKQMeFA1KMC7ZCrtbs4ZQI1q46qyp8uaFjr7paXSRRBrdxF23l6o6Jz3pTgD7gjkDKcfsDOQARgHM3vLbcQd5JwC7QkbN1YCPKy/bkL2u5Zycg2Fe7gWo+ilmjWfwba9oWImu3rHKnCjEtrdze48H+cDJv7KsyBzxVvhrLSHOjHE9Ejd4jR7qNGmhvGdv1h8xy0tRmI4ogXpKatav6VE4p4ZzJTuyA5dciiT39BL7Bn6WOWStuXWHjl5Y7nlOls7ASw+VoTQlMF8BWbj7brgOMH47UuCZyAQHv/9PMo/+oXeH1fv+h4ByH19fXS/vn/0zNuLD36m9TGS+2GOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB5694.namprd02.prod.outlook.com (2603:10b6:805:e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 19:14:51 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 19:14:51 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/7] vhost: Add Error parameter to vhost_dev_init()
Thread-Topic: [PATCH 1/7] vhost: Add Error parameter to vhost_dev_init()
Thread-Index: AQHXXUa8IhTgJ0wMHEiMa6mCTWFKgqsPMYwA
Date: Fri, 11 Jun 2021 19:14:51 +0000
Message-ID: <20210611191450.GB25895@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-2-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-2-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea09c8b-e7ee-4097-d89a-08d92d0d3042
x-ms-traffictypediagnostic: SN6PR02MB5694:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB56943ABC9B96FB4812A2E4E9EA349@SN6PR02MB5694.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dY6cPO27yTYamAfoYe3GPRa/SGLNdoUJOaAB5yfZ4xnuJgorzDQCAyxlzCq5GP06P6PGTHDHme35P0K2Z17k89k21bqfQsVPejnVn8isGNEVmmFjFnX7zYm4AMKP17VidQ2XAbdiwceih4Q4U31rWlrSvZvOBgWeZPc9kMdzo8bXQq1kF2VDhChRsZeF16eeu3HXngSZuOJvvTbgtETn8UafdOYjEkvNlTQ+5GeRVHi8fJNAqIt0vP4tu2OfjTqwD4yoPDuzq6d4RdKZFdhtuG6nL3X8BhDRVf9uDClTqB/GJMAQstPei9k9S2QC6mMpZOvJ5zBcM8S4blBpqhcov4ASrqbXBqyoE/g+4j4A2nWnzAC+EQ7LK/ciK6Qb+HHCkqon9R76cE+C3v8Nc3Qvae+N0L5A+cIBnAcu0O5hORSb6EGdI8O/9UT22HPi7woO5m1Qj02+SQfDWl61rJXvH3FzVilSLSwqtA1Lq0hY2RIQxscuXP/wBLMXi8QpgcdWWzzXNbojWruC+HU6zTt54iyDyBf61WughxI9D6fAMSW5p+peOskkWyovojWn6huRe3SMCwgFqdQqDuiZdunHIcOwRYK9AUHtVCewSlDceaw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(6512007)(91956017)(8676002)(9686003)(6506007)(76116006)(6486002)(6916009)(38100700002)(5660300002)(44832011)(26005)(8936002)(122000001)(71200400001)(186003)(66946007)(64756008)(66476007)(66446008)(66556008)(4326008)(33656002)(33716001)(83380400001)(2906002)(86362001)(1076003)(478600001)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N+40iFtzRM/OuTiH2iKrV2u5p3a1D7aAeit08YsDfZ1OP9Ugy7BfhioW1yJX?=
 =?us-ascii?Q?32wdFGMM0d31X3d1wrliO4uDACBQfsKVTOl6wEQ4xxXn/2hjP8luxuAOoKK/?=
 =?us-ascii?Q?Z23Oze4aM7AmPFOxy5Tos8tdVDNM6L/J+tMB74gduFGo1irXUH/j7Q+O7bU0?=
 =?us-ascii?Q?2NA0kHI+cZTI6GzmCUeQaTjC0pFy9PRbzyhgoGZRNztUlGEKPqgwqOdQ98j4?=
 =?us-ascii?Q?xyUsIfQPiI3fDGOHxIEocUt3tLzZHSGPHdfVztYBS8+r/uDiIqkgDADfGAyI?=
 =?us-ascii?Q?33FXsfXhjTNyNFOvd6STU3yCB8S+FhAo0mFOLo3xYi4rt38Bvmfn2wG77NoE?=
 =?us-ascii?Q?QWYyPzT0gvhOLM/4/QXPPVcFJZjmOFiViRf0fnBqwlNK/lR5tCGmHQJVKeWi?=
 =?us-ascii?Q?ke9NcxM+pdS/k4XP8q7FKPW0QxfrCIL/+2UkOe7R1c65sSNVsn3ddNu5Xr/e?=
 =?us-ascii?Q?1bXm09PAE539HqY8MXiX7cUoN5gb+oCADzvKOQeA6EgDCWHte41hE9tfSbpr?=
 =?us-ascii?Q?PJFGkGKnAWEuLOQ4Zk6xLaeXj6EqxutGfb8VEy2jNrTHvXFo/uHCRf9w/cna?=
 =?us-ascii?Q?58AJYW58BC2Q0wdi6VSFMWFiaYrUxGoqIsb1sJ/Fe6YFwOw3nTCr24Bbnm/z?=
 =?us-ascii?Q?+9BGUtFT/dJlj5720j2mBjxgKuXb5GNdi65e01sMrWoMNSXekrN+0LoLQy6p?=
 =?us-ascii?Q?e/x9yteNzQa+dCN2Fs5R45TCgikEpM+2kH199AHAa1Zqc/N85yXj0ZxvjBpe?=
 =?us-ascii?Q?7yBLSDZyYnk71W6O9/KVuTTT7U2bUUii152yrCVqjTq3g7hS4MTG4sIT3cMB?=
 =?us-ascii?Q?BSNg+S6oumjxYQiBLmHG6QAWPioXK2qfResCnr7s+E2MSOoKmvlyppeUcbXo?=
 =?us-ascii?Q?RunBlEj/zDiq9BO1B3cT7HZFoFqeUN7sP1uQctAA9iEtLp/DeHYA1SrLAZOR?=
 =?us-ascii?Q?8J/NsD3FMH5my/cDHAk6ecWwdSiqcbHJAtfbJqv18y/wmsP4FrswGnObzrJG?=
 =?us-ascii?Q?TwJdiqAV74J8i3tX5nCwAha0Ud/1+MsJJItyWWTplCl0RrrU3P9hvpamM8Xq?=
 =?us-ascii?Q?QL633TGP3yKjtC9DUgYwGgHQn5k+pDbotkdxXeVh7ZKh7iyz3uoAtYtTniQF?=
 =?us-ascii?Q?DHhETsF/0BWcqYSuF6FAeuCXR5GD/vkbUoSBg6TevPfNZZhlKfuwfIxr69x0?=
 =?us-ascii?Q?raoVv5sZNYZ3mI/YfULrpXW3VWUWda4FQZ9ZUfxNAqCC2QHcBBASfspIJvNc?=
 =?us-ascii?Q?rvpW6519Kz+7mX6ea91etqi+DGSWek3pvw/YJhbkcaQDNlMjqUmP388oLMmS?=
 =?us-ascii?Q?zKXutAavevYMiilVMQ1kWomF?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91957031AA49DF4499AEFFDD2495994C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea09c8b-e7ee-4097-d89a-08d92d0d3042
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 19:14:51.5758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2g76LCVk31dBCQpWZATacHlX3d9fXVcIM7ah3vvlHnGq4OhRKdb2RJy05+iglvsFxkeleEXZORxHd68l1CvuCjm7NC6RLlWrAW72gsKgkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5694
X-Proofpoint-GUID: uuyi38g3UjmMrq24ZrOhw0GeY3tv-7bX
X-Proofpoint-ORIG-GUID: uuyi38g3UjmMrq24ZrOhw0GeY3tv-7bX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:52PM +0200, Kevin Wolf wrote:
> This allows callers to return better error messages instead of making
> one up while the real error ends up on stderr. Most callers can
> immediately make use of this because they already have an Error
> parameter themselves. The others just keep printing the error with
> error_report_err().
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  include/hw/virtio/vhost.h    |  2 +-
>  backends/cryptodev-vhost.c   |  5 ++++-
>  backends/vhost-user.c        |  4 ++--
>  hw/block/vhost-user-blk.c    |  4 ++--
>  hw/net/vhost_net.c           |  6 +++++-
>  hw/scsi/vhost-scsi.c         |  4 +---
>  hw/scsi/vhost-user-scsi.c    |  4 +---
>  hw/virtio/vhost-user-fs.c    |  3 +--
>  hw/virtio/vhost-user-vsock.c |  3 +--
>  hw/virtio/vhost-vsock.c      |  3 +--
>  hw/virtio/vhost.c            | 16 ++++++++++------
>  11 files changed, 29 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 21a9a52088..2d7aaad67b 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -104,7 +104,7 @@ struct vhost_net {
> =20
>  int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>                     VhostBackendType backend_type,
> -                   uint32_t busyloop_timeout);
> +                   uint32_t busyloop_timeout, Error **errp);
>  void vhost_dev_cleanup(struct vhost_dev *hdev);
>  int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
> index 8231e7f1bc..bc13e466b4 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -52,6 +52,7 @@ cryptodev_vhost_init(
>  {
>      int r;
>      CryptoDevBackendVhost *crypto;
> +    Error *local_err =3D NULL;
> =20
>      crypto =3D g_new(CryptoDevBackendVhost, 1);
>      crypto->dev.max_queues =3D 1;
> @@ -66,8 +67,10 @@ cryptodev_vhost_init(
>      /* vhost-user needs vq_index to initiate a specific queue pair */
>      crypto->dev.vq_index =3D crypto->cc->queue_index * crypto->dev.nvqs;
> =20
> -    r =3D vhost_dev_init(&crypto->dev, options->opaque, options->backend=
_type, 0);
> +    r =3D vhost_dev_init(&crypto->dev, options->opaque, options->backend=
_type, 0,
> +                       &local_err);
>      if (r < 0) {
> +        error_report_err(local_err);
>          goto fail;
>      }
> =20
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index b366610e16..10b39992d2 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -48,9 +48,9 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIO=
Device *vdev,
>      b->dev.nvqs =3D nvqs;
>      b->dev.vqs =3D g_new0(struct vhost_virtqueue, nvqs);
> =20
> -    ret =3D vhost_dev_init(&b->dev, &b->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0);
> +    ret =3D vhost_dev_init(&b->dev, &b->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0,
> +                         errp);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "vhost initialization failed");
>          return -1;
>      }
> =20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index c6210fad0c..0cb56baefb 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -332,9 +332,9 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
> =20
>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> =20
> -    ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0);
> +    ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0,
> +                         errp);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "vhost initialization failed");
>          return ret;
>      }
> =20
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 44c1ed92dc..447b119f85 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -22,6 +22,7 @@
>  #include "standard-headers/linux/vhost_types.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "net/vhost_net.h"
> +#include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> =20
> @@ -157,6 +158,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *opt=
ions)
>      bool backend_kernel =3D options->backend_type =3D=3D VHOST_BACKEND_T=
YPE_KERNEL;
>      struct vhost_net *net =3D g_new0(struct vhost_net, 1);
>      uint64_t features =3D 0;
> +    Error *local_err =3D NULL;
> =20
>      if (!options->net_backend) {
>          fprintf(stderr, "vhost-net requires net backend to be setup\n");
> @@ -187,8 +189,10 @@ struct vhost_net *vhost_net_init(VhostNetOptions *op=
tions)
>      }
> =20
>      r =3D vhost_dev_init(&net->dev, options->opaque,
> -                       options->backend_type, options->busyloop_timeout)=
;
> +                       options->backend_type, options->busyloop_timeout,
> +                       &local_err);
>      if (r < 0) {
> +        error_report_err(local_err);
>          goto fail;
>      }
>      if (backend_kernel) {
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index 4d70fa036b..8c611bfd2d 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -219,10 +219,8 @@ static void vhost_scsi_realize(DeviceState *dev, Err=
or **errp)
>      vsc->dev.backend_features =3D 0;
> =20
>      ret =3D vhost_dev_init(&vsc->dev, (void *)(uintptr_t)vhostfd,
> -                         VHOST_BACKEND_TYPE_KERNEL, 0);
> +                         VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>      if (ret < 0) {
> -        error_setg(errp, "vhost-scsi: vhost initialization failed: %s",
> -                   strerror(-ret));
>          goto free_vqs;
>      }
> =20
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 4666019442..1b2f7eed98 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -122,10 +122,8 @@ static void vhost_user_scsi_realize(DeviceState *dev=
, Error **errp)
>      vqs =3D vsc->dev.vqs;
> =20
>      ret =3D vhost_dev_init(&vsc->dev, &s->vhost_user,
> -                         VHOST_BACKEND_TYPE_USER, 0);
> +                         VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> -        error_setg(errp, "vhost-user-scsi: vhost initialization failed: =
%s",
> -                   strerror(-ret));
>          goto free_vhost;
>      }
> =20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 6f7f91533d..c595957983 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -235,9 +235,8 @@ static void vuf_device_realize(DeviceState *dev, Erro=
r **errp)
>      fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
>      fs->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, fs->vhost_dev.n=
vqs);
>      ret =3D vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> -                         VHOST_BACKEND_TYPE_USER, 0);
> +                         VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "vhost_dev_init failed");
>          goto err_virtio;
>      }
> =20
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index a6f08c26b9..b6a4a25ea1 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -108,9 +108,8 @@ static void vuv_device_realize(DeviceState *dev, Erro=
r **errp)
>      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> =20
>      ret =3D vhost_dev_init(&vvc->vhost_dev, &vsock->vhost_user,
> -                         VHOST_BACKEND_TYPE_USER, 0);
> +                         VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "vhost_dev_init failed");
>          goto err_virtio;
>      }
> =20
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 8ddfb9abfe..777cafe70d 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -170,9 +170,8 @@ static void vhost_vsock_device_realize(DeviceState *d=
ev, Error **errp)
>      vhost_vsock_common_realize(vdev, "vhost-vsock");
> =20
>      ret =3D vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
> -                         VHOST_BACKEND_TYPE_KERNEL, 0);
> +                         VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "vhost-vsock: vhost_dev_init failed=
");
>          goto err_virtio;
>      }
> =20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7b7bde7657..991c67ddcd 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1286,7 +1286,8 @@ static void vhost_virtqueue_cleanup(struct vhost_vi=
rtqueue *vq)
>  }
> =20
>  int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
> -                   VhostBackendType backend_type, uint32_t busyloop_time=
out)
> +                   VhostBackendType backend_type, uint32_t busyloop_time=
out,
> +                   Error **errp)
>  {
>      uint64_t features;
>      int i, r, n_initialized_vqs =3D 0;
> @@ -1300,24 +1301,26 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> =20
>      r =3D hdev->vhost_ops->vhost_backend_init(hdev, opaque);
>      if (r < 0) {
> +        error_setg(errp, "vhost_backend_init failed");
>          goto fail;
>      }
> =20
>      r =3D hdev->vhost_ops->vhost_set_owner(hdev);
>      if (r < 0) {
> -        VHOST_OPS_DEBUG("vhost_set_owner failed");
> +        error_setg(errp, "vhost_set_owner failed");
>          goto fail;
>      }
> =20
>      r =3D hdev->vhost_ops->vhost_get_features(hdev, &features);
>      if (r < 0) {
> -        VHOST_OPS_DEBUG("vhost_get_features failed");
> +        error_setg(errp, "vhost_get_features failed");
>          goto fail;
>      }
> =20
>      for (i =3D 0; i < hdev->nvqs; ++i, ++n_initialized_vqs) {
>          r =3D vhost_virtqueue_init(hdev, hdev->vqs + i, hdev->vq_index +=
 i);
>          if (r < 0) {
> +            error_setg_errno(errp, -r, "Failed to initialize virtqueue %=
d", i);
>              goto fail;
>          }
>      }
> @@ -1327,6 +1330,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>              r =3D vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_in=
dex + i,
>                                                       busyloop_timeout);
>              if (r < 0) {
> +                error_setg(errp, "Failed to set busyloop timeout");
>                  goto fail_busyloop;
>              }
>          }
> @@ -1367,7 +1371,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>      if (hdev->migration_blocker !=3D NULL) {
>          r =3D migrate_add_blocker(hdev->migration_blocker, &local_err);
>          if (local_err) {
> -            error_report_err(local_err);
> +            error_propagate(errp, local_err);
>              error_free(hdev->migration_blocker);
>              goto fail_busyloop;
>          }
> @@ -1384,8 +1388,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>      QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
> =20
>      if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hd=
ev)) {
> -        error_report("vhost backend memory slots limit is less"
> -                " than current number of present memory slots");
> +        error_setg(errp, "vhost backend memory slots limit is less"
> +                   " than current number of present memory slots");
>          r =3D -1;
>          goto fail_busyloop;
>      }
> --=20
> 2.30.2
> =

