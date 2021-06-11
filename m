Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06543A4993
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:45:16 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrn5f-0008O1-Ea
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrn4O-0007Z4-Bj; Fri, 11 Jun 2021 15:43:56 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:9076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrn4J-00033B-6i; Fri, 11 Jun 2021 15:43:56 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BJcpBN028733; Fri, 11 Jun 2021 12:43:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=lbviJNDeyWFYCVniZVQe1yneOZgLmOia7anmc1vg6G4=;
 b=V5V8mQdMFDtmmGfqqzEu15ebk5pMxFlBzX1JdsarDDMOZdbgohehpU13na/SywSJfX+c
 /IwKAkvirklEnU34fNNPub7kqiygMcwzIV9U2hSSWmsQ5mtnaYzx0/4z0nX0Yjcb0J6G
 7vDvFmonBhM/7NTBAP7pQ3fDsot1adk4Yv8K+/z+x6vV5GbXLDz8ybrNbRrBzrWVf+jO
 P62HVMoXk/QTLf1HHrqdzk+/bVXgMmvT7aFp9K+EilZeJK0jqatHZqnDuFh/ePTRju/B
 yuiQ/izhXjwHRVxzSjiViU7NpcAo0UjDwsVsoCgUgrQM8+H0nqqloTS8YF6Pf4WGFnzB Bw== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by mx0b-002c1b01.pphosted.com with ESMTP id 394b4mrc9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 12:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2E/MeA4Sh8EQzVMJrtY0bu3th/tHkbHvgIvDdqAuAExKgOXBi+nSfRwHUPkk73ZdUgW0QaiOL+FiojtPh4jiHMAVuUb4zjfDfpNUEBXUAOPsAvIAh4vuEvXBbtFf5PHBzyw5xCEX6r8L/8zrL6ZrRGrU5dsDuCImaT1EZkVr+liDkpFis17A12dZkEStzgZ3C3HfG6mZ42edo8fFiB52AuyFvBnpNYUQ3oAMRIq/iyC/nc5cXQnyKJ28JYHY1mc1I+Tu1dNzxxCbhsOSUEZIPW6e5I0zgt6RErrQuw2vNUGbD1eVsIubVsnl+DpUWfcEW9z4H5wJ7z6RbeOvM/PLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbviJNDeyWFYCVniZVQe1yneOZgLmOia7anmc1vg6G4=;
 b=WO1WvSccdZ8PY08hQsYh553cF/Jq8eEan5uC1ASrsT9Gr5//xPi1L+5fO7hLMAy5TG4psfXcevmSoCxSYcNXZLqMzOfWctQPXEFxoQh4J00XoTQ5cyUNB7ivi+Vio10LPza1t7pupG9/eNC/hxNIjGpQENfvnAld52P9iEwDhaUzBQA0rylRjfLsRlo4R93/vQBS8/UeguQux7Ly83Ap9Q/bHsW5z8y0s33EWefLH8zGCX+3UAj3zAYVwTV6EYmHYiB8eoudxsWNjibIK+tbOCIZhLso8ERpwI9MUC/5fF2uwJIRyrLqp8VD0+sPdpUpwyfsgOEhS05zpYBTxEZDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4222.namprd02.prod.outlook.com (2603:10b6:805:35::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Fri, 11 Jun
 2021 19:43:46 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 19:43:45 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/7] vhost: Distinguish errors in vhost_backend_init()
Thread-Topic: [PATCH 2/7] vhost: Distinguish errors in vhost_backend_init()
Thread-Index: AQHXXUa7fWiMYsj9IkOIL5/mr/Ofz6sPOZuA
Date: Fri, 11 Jun 2021 19:43:45 +0000
Message-ID: <20210611194341.GA26687@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-3-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-3-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfdbdfc6-7d5f-42df-fc4e-08d92d1139f7
x-ms-traffictypediagnostic: SN6PR02MB4222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4222FD7CD8B78B15DB3736ACEA349@SN6PR02MB4222.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwWhKUpkA40Huea4iyAeUHXwFIludSn8+7XxMO/kB01oGabv7+fqpsNJTJqHRAjLFv+fM+nRrCco1R5IHJjVA5cd53hBCCP5UmRvbJaDwpMK0fQwDHXW2mlA8OGVihzRhe73yfQvoaDoOqlYR6UfDJPlfyHGkdTn+0bwF0VTdr9UJ+9R+BfAlZT2RfpbdkIyB0rjGmG20cHk/Vf0+ck2cJEdJPeEMpi0DkVT/yhoeq32Zjjj3AojALyg/4mh+PnKwu+Otl7JnpInAtkvoKM8g74Ed/biywyHqeEVWanAphfw58Xvd/2yO+yx76rTbWVfGI2xEoe4EKEAskYDS5jSoJSW1qH1OMzPMovtqjoh8k6QEZQ77BEoWUMYwO1//d6eshE8qGbMUbD3/H7iL9yjrPX67EJg9VegMrhPHyjmcltaL2FeZ2LZ/30AKHttyV0jDgzQMGJ7vRF1CzfvMw04F96RfZ1uaU5OAPQp5b5r+KIyvHaf4wioL6PDKYtycKWaUcHhdTxQrhdw8pCl0Q2zwju0weW6Y0NwbsgA8q96pHdLI0ClCkoDphDZy2Ea0qlssS74OpwfMPIV0nWkYGz3gu5NxNeqRXJ7o8ODBoGe1ok=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(366004)(376002)(396003)(39860400002)(346002)(9686003)(6512007)(8676002)(44832011)(83380400001)(2906002)(8936002)(71200400001)(6486002)(86362001)(66556008)(6916009)(66476007)(4326008)(5660300002)(64756008)(66446008)(33716001)(76116006)(1076003)(91956017)(478600001)(316002)(66946007)(122000001)(26005)(38100700002)(33656002)(54906003)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?63Sqw8FR2o4cMqDgU81cgnhf18aNUI35mUcExQMs+Kl5OOMQGK5HftUm1qKh?=
 =?us-ascii?Q?3zkJmA2HrV+cWYWLs5CaD2kgWP22musWVtDcDPJxjjVbu1ThWWrXSSmEHlIu?=
 =?us-ascii?Q?BX75qO3k+tw6bN96XcEqOi0eVG288y1kniJdIQwlCNoqrrbUD8z4Tfjea8IX?=
 =?us-ascii?Q?uxAMGCz7dJ1+PNxuWFPnnjYOIlNX4okjQ5d/lmLkiUo8lsjk05wkffRjDPU6?=
 =?us-ascii?Q?DBgAKCl+uvYXotbS1IUa7Im2DV4yH7jPr6dVqSRiuqGfebRzUdwRije8crb/?=
 =?us-ascii?Q?LWqcJy0ddBtp0M/x8ZWna/YavN+AQHE2u0kKT12421loz/b1LTHXwQolOjMB?=
 =?us-ascii?Q?D8SqhyNmt6SsdR8JbP7pNZBzdq4IIRDooLKXjwp2RFMBkB0grw9dpD+eD8Ob?=
 =?us-ascii?Q?lfb0LcidSc59pl4pftRAfdiJC8LSeLwGYKjDYO7EvfpsQbntsfyYBcGbNrDc?=
 =?us-ascii?Q?l3ZADOjTvGlq6bN1O5FNOw7rtGrpvSm1PC/ps85eH6O0y9B/NRmD/j/T3hEx?=
 =?us-ascii?Q?O+FTljLjHyuD/+nOd9s/yDwZHDM7+FNFygQ318XOGmGMtP1LRjQZB1iciXEb?=
 =?us-ascii?Q?8+ANVYVH0pAsXLFQF3AH8OpdsXO77enSDGdDyH2Z908PZKF3EA1a9qmBWp8l?=
 =?us-ascii?Q?BId9kgREZXJ4NBh3WNcL4I+0WGYl7tt79hZZXLOS4eelCSfWbcU2IbNMr4x3?=
 =?us-ascii?Q?emKDqGwR8a4dFAd/LgKHG7AuPnxY1h9NZoaQUEb8yRUiWoKgkz4paiQu9Utm?=
 =?us-ascii?Q?rQl4TbcgE6FaA1P1tncFyck/xZqAzfMZOO2j0NcVY1n0q4a9FJUASnSCFA8D?=
 =?us-ascii?Q?/0/lHh9P2AP17sSqd7TZjlaXjrBAlK/5bPWrzRQIMpqVuTvXXAMbTVFM3k8Q?=
 =?us-ascii?Q?8Gy6I9pkHbwG+DZ7+BEhi6KWbK4xdQ0LNiPV4YtoLGGLrgrUyOto6IGr+mn4?=
 =?us-ascii?Q?kwSm6vdNuC8ukjI/2biG+knvVUHbArahckchAO+sKNUcS9ll3vI840LDH6Km?=
 =?us-ascii?Q?RSX7Qf/KEVvTDNehTccdS7LFxNO0tud+blaT6iZe/OxHGMHeI3yJ7PDlEoXN?=
 =?us-ascii?Q?6UcxfIopUtqZtWldYR/sVPW/4gmLQIvXUPfJXFzZY7QQTOeil6DR6bbz9xIG?=
 =?us-ascii?Q?GCc38eUeQkhiZbOM5R6AqNZsgB0NkxcEoxyMzaU8MQLxB+9dcnw6TkMTGOj+?=
 =?us-ascii?Q?ZPuriVc+68H6qKwnGGZsZ0HX9oW2D/4/MMGUynhJ3bVwL4+7HMyU8H7AARFB?=
 =?us-ascii?Q?TJ4Sru+wJTsfadkCCT6+5CPmppqmplGkG0Q8+qByhAFP0JoAfkE6UeAAEpzc?=
 =?us-ascii?Q?r/upl9Bls5ZYHq+sS0Oii4nP0ZdVkWrj4ZCXtnPMwUzUng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21E836D513FD164EA05517157EF96911@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdbdfc6-7d5f-42df-fc4e-08d92d1139f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 19:43:45.8703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5eiiJqA4pWIAjxAv53gEJX9s3pgJFcpMk8ixPGRiwIFduElMiOZVkKo9WlgOUpej3joptJgNmW9Km5j/5rvkyEfW47X6S/2hhh4ksKx3lec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4222
X-Proofpoint-GUID: ywKChTtjIPxXWn8Ej4Q1APuuiSRww9oB
X-Proofpoint-ORIG-GUID: ywKChTtjIPxXWn8Ej4Q1APuuiSRww9oB
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

On Wed, Jun 09, 2021 at 05:46:53PM +0200, Kevin Wolf wrote:
> Instead of just returning 0/-1 and letting the caller make up a
> meaningless error message, add an Error parameter to allow reporting the
> real error and switch to 0/-errno so that different kind of errors can
> be distinguished in the caller.
>=20
> Specifically, in vhost-user, EPROTO is used for all errors that relate
> to the connection itself, whereas other error codes are used for errors
> relating to the content of the connection. This will allow us later to
> automatically reconnect when the connection goes away, without ending up
> in an endless loop if it's a permanent error in the configuration.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  include/hw/virtio/vhost-backend.h |  3 ++-
>  hw/virtio/vhost-backend.c         |  2 +-
>  hw/virtio/vhost-user.c            | 41 ++++++++++++++++---------------
>  hw/virtio/vhost-vdpa.c            |  2 +-
>  hw/virtio/vhost.c                 | 13 +++++-----
>  5 files changed, 32 insertions(+), 29 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-=
backend.h
> index 8a6f8e2a7a..728ebb0ed9 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -37,7 +37,8 @@ struct vhost_scsi_target;
>  struct vhost_iotlb_msg;
>  struct vhost_virtqueue;
> =20
> -typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque);
> +typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque,
> +                                  Error **errp);
>  typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
>  typedef int (*vhost_backend_memslots_limit)(struct vhost_dev *dev);
> =20
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 31b33bde37..f4f71cf58a 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -30,7 +30,7 @@ static int vhost_kernel_call(struct vhost_dev *dev, uns=
igned long int request,
>      return ioctl(fd, request, arg);
>  }
> =20
> -static int vhost_kernel_init(struct vhost_dev *dev, void *opaque)
> +static int vhost_kernel_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
>  {
>      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_KERNEL=
);
> =20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe045..024cb201bb 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1856,7 +1856,8 @@ static int vhost_user_postcopy_notifier(NotifierWit=
hReturn *notifier,
>      return 0;
>  }
> =20
> -static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
> +static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> +                                   Error **errp)
>  {
>      uint64_t features, protocol_features, ram_slots;
>      struct vhost_user *u;
> @@ -1871,7 +1872,7 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque)
> =20
>      err =3D vhost_user_get_features(dev, &features);
>      if (err < 0) {
> -        return err;
> +        return -EPROTO;
>      }
> =20
>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> @@ -1880,7 +1881,7 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque)
>          err =3D vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES=
,
>                                   &protocol_features);
>          if (err < 0) {
> -            return err;
> +            return -EPROTO;
>          }
> =20
>          dev->protocol_features =3D
> @@ -1891,14 +1892,14 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque)
>              dev->protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_=
CONFIG);
>          } else if (!(protocol_features &
>                      (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
> -            error_report("Device expects VHOST_USER_PROTOCOL_F_CONFIG "
> -                    "but backend does not support it.");
> -            return -1;
> +            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFI=
G "
> +                       "but backend does not support it.");
> +            return -EINVAL;
>          }
> =20
>          err =3D vhost_user_set_protocol_features(dev, dev->protocol_feat=
ures);
>          if (err < 0) {
> -            return err;
> +            return -EPROTO;
>          }
> =20
>          /* query the max queues we support if backend supports Multiple =
Queue */
> @@ -1906,12 +1907,12 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque)
>              err =3D vhost_user_get_u64(dev, VHOST_USER_GET_QUEUE_NUM,
>                                       &dev->max_queues);
>              if (err < 0) {
> -                return err;
> +                return -EPROTO;
>              }
>          }
>          if (dev->num_queues && dev->max_queues < dev->num_queues) {
> -            error_report("The maximum number of queues supported by the =
"
> -                         "backend is %" PRIu64, dev->max_queues);
> +            error_setg(errp, "The maximum number of queues supported by =
the "
> +                       "backend is %" PRIu64, dev->max_queues);
>              return -EINVAL;
>          }
> =20
> @@ -1920,9 +1921,9 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque)
>                      VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
>                   virtio_has_feature(dev->protocol_features,
>                      VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
> -            error_report("IOMMU support requires reply-ack and "
> -                         "slave-req protocol features.");
> -            return -1;
> +            error_setg(errp, "IOMMU support requires reply-ack and "
> +                       "slave-req protocol features.");
> +            return -EINVAL;
>          }
> =20
>          /* get max memory regions if backend supports configurable RAM s=
lots */
> @@ -1932,15 +1933,15 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque)
>          } else {
>              err =3D vhost_user_get_max_memslots(dev, &ram_slots);
>              if (err < 0) {
> -                return err;
> +                return -EPROTO;
>              }
> =20
>              if (ram_slots < u->user->memory_slots) {
> -                error_report("The backend specified a max ram slots limi=
t "
> -                             "of %" PRIu64", when the prior validated li=
mit was %d. "
> -                             "This limit should never decrease.", ram_sl=
ots,
> -                             u->user->memory_slots);
> -                return -1;
> +                error_setg(errp, "The backend specified a max ram slots =
limit "
> +                           "of %" PRIu64", when the prior validated limi=
t was "
> +                           "%d. This limit should never decrease.", ram_=
slots,
> +                           u->user->memory_slots);
> +                return -EINVAL;
>              }
> =20
>              u->user->memory_slots =3D MIN(ram_slots, VHOST_USER_MAX_RAM_=
SLOTS);
> @@ -1958,7 +1959,7 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque)
>      if (dev->vq_index =3D=3D 0) {
>          err =3D vhost_setup_slave_channel(dev);
>          if (err < 0) {
> -            return err;
> +            return -EPROTO;
>          }
>      }
> =20
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index ee51863d28..c2aadb57cb 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -273,7 +273,7 @@ static void vhost_vdpa_add_status(struct vhost_dev *d=
ev, uint8_t status)
>      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>  }
> =20
> -static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
> +static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **=
errp)
>  {
>      struct vhost_vdpa *v;
>      uint64_t features;
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 991c67ddcd..fd13135706 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1289,9 +1289,9 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>                     VhostBackendType backend_type, uint32_t busyloop_time=
out,
>                     Error **errp)
>  {
> +    ERRP_GUARD();
>      uint64_t features;
>      int i, r, n_initialized_vqs =3D 0;
> -    Error *local_err =3D NULL;
> =20
>      hdev->vdev =3D NULL;
>      hdev->migration_blocker =3D NULL;
> @@ -1299,9 +1299,11 @@ int vhost_dev_init(struct vhost_dev *hdev, void *o=
paque,
>      r =3D vhost_set_backend_type(hdev, backend_type);
>      assert(r >=3D 0);
> =20
> -    r =3D hdev->vhost_ops->vhost_backend_init(hdev, opaque);
> +    r =3D hdev->vhost_ops->vhost_backend_init(hdev, opaque, errp);
>      if (r < 0) {
> -        error_setg(errp, "vhost_backend_init failed");
> +        if (!*errp) {
> +            error_setg_errno(errp, -r, "vhost_backend_init failed");
> +        }
>          goto fail;
>      }
> =20
> @@ -1369,9 +1371,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>      }
> =20
>      if (hdev->migration_blocker !=3D NULL) {
> -        r =3D migrate_add_blocker(hdev->migration_blocker, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        r =3D migrate_add_blocker(hdev->migration_blocker, errp);
> +        if (*errp) {
>              error_free(hdev->migration_blocker);
>              goto fail_busyloop;
>          }
> --=20
> 2.30.2
> =

