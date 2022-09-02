Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D85AB823
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:28:29 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBP1-0001Rm-RT
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAwf-0001HI-3Y; Fri, 02 Sep 2022 13:59:09 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:10286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAwd-0006dH-3i; Fri, 02 Sep 2022 13:59:08 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2829GXS0016200;
 Fri, 2 Sep 2022 10:59:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=oWaErvLDn6b7ghkQKlXyFOb1Jf9jErOcYDx5BhpA0h0=;
 b=yEyJqvaHQuYoWb3N9cCX8DkXjLYGmSo2DFiyDnUSH7oAsnDGoEQuRuFjWHTI3IZDKUTQ
 UAb6v8WSu2yFhi566E7kTkynwcrjrPqOBcuMTSQ8HK5la4XvyFQsOEYL3gYUqeM5jSUz
 wYihol6NH+c6ejIYddh+MiAVDONdPLZHpr1pXS/k/m6Atx2hV6/q0JR2y6MqeSoy0XVH
 QEE45RG6+nBBJxwKh9NPf97VKL/X5vVOZUvDKxbbGPxXRdq8bkSA3Nmx9vupjdvcyAE2
 y5zgAioIsM8GnnQk260ltHRv4PgJ7YT1Nzgt5bcFnWi6fhsbSbkSDgtm6kC2g7f9XEyL Tw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jb51wstk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X67/IQnFNgI55dVr8EalYta2TxnfUnLbjcLA0gT3wB5EPACZP6e6ApgTxNtI+wvDn2MBbRqamkaVpM/QdoJPO2SCqnnFuHo/oKN7ufIeHfk2eck2JN26cSQQ0+x6rDYPVN2dx+IcAGVYQeMe0aztuCbtdJcJjdIFdKGZ29y0MBfcWxgNiJF/50qk5wvpOMFXjiukC+oQW4hH8lCUX8rxwASFXXSxxhIWrpJ7LJs1IFwOmxfa9a0zxtqXi/0vw4+0aXzY9SWbyu7A2ttFdot66B5qXZahczhHGbsTD+lySrNpLTnBiec1WqkekpMsTFrE6094EY+KXNKGh3Rq7PPdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWaErvLDn6b7ghkQKlXyFOb1Jf9jErOcYDx5BhpA0h0=;
 b=T7Cgxfh5jXX5aK98ckOjY5q2IJdjseHo6/t9C8rfoZP3zISg0G13wXD9UbNC8KcWj9gD+yBLfbuEp9pgyOvd+TaOLEkY5jTj1aH7debKcjWJbSLS9wzg5KqmNt/hAcXPcGUfDgVo6drRqWGgLl9WkVFddX+Z4GeMPwYoSTlhdty+DSftgVtujJrVzhpcJrQxglk1XobnwAUqPT1n/fU2DwSUskNicV+yZme/VoQn9pc77Pz77+yaZQDctiA+1++7uuh0TjyQEdNxuO8cDqfvA9nl91xRM21zFiiYIhKjw9u2y6+Lp8Ikyu/PlmOMlI/1/tPuU16afhc5/qWb696H+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8866.namprd02.prod.outlook.com (2603:10b6:208:3b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Fri, 2 Sep
 2022 17:59:02 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:59:01 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 8/8] vhost-user-blk: dynamically resize config space
 based on features
Thread-Topic: [PATCH v2 8/8] vhost-user-blk: dynamically resize config space
 based on features
Thread-Index: AQHYuVjJJZMJ/0VxA0yoX/sYMbEI+63MeKuA
Date: Fri, 2 Sep 2022 17:59:01 +0000
Message-ID: <20220902175901.GH5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-9-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-9-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d35159-b436-4fc5-04c0-08da8d0cd16e
x-ms-traffictypediagnostic: BL3PR02MB8866:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yVxCExrDccDJQzKcLFzzMKpJCRHchnajuHvVzqwRTVBey8KaeTg2akvlfwru+rbwOhq0cPPD4t9gsW6yNoNuVqyHyRAaoUkgy3TAi/x9w6/lor22trM+e/kSS/j0icJy4TsYKR30sndXthE9FXO7/rZyo9JKG+eB+j7qpVSmJGv+pphx2wSHmvIU63edynBCdvrYBBViXnmR21umBZK85FQRvhLJbB9tWKWq970+HqN1yE/LVpM/XUVBJFQnNdphxfGyRHN/OJZP7RYMim7NGdX0nJwcNEC2G76RoQXrMSjOUiKZUUTL8DWtDYUX8+o9jdh168YEIhCZo8ilkEVQKvzK4Pp+48bdmKxKIz+54iGp78FIk1Hsfbowm+05B/KtP1TU1v8Ayb4hRG4yCap59AW2KDcBIo/zADCDoSuWi/K7GMx6F+kt5LZM5Cs2qL+IFYdDHMypPVJgLTyg3K+GeodkXYhuMw1yQGP8Ncw66PPlKw7X0L0C8DwJLDfPyJAgHqXIx8VHWDR+r8n04QpWIR93K4dcknEav/7aNU/Fe6iwMVJ2SnrQZqGmmb6s12l8UL9GfKN1EjRXrMWOyHiDaxJjV2oQ8eThih/pOoXeOt1hkMA/v+8cUm33zceJXSj04AlLrz7ZieV25tlekqMNAkJvloQZVYkPcmu+Yln+ysvWkId1KDKjeendS8CF4flpuvJsuQfLFRHACb25RmRL7PYiuMNb6D9PbjMRfFZDkq7ClXETGC4vTdB5Ct2LMdU91+1+MmCnXnPCmvYvB7+3sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(5660300002)(6916009)(41300700001)(8936002)(44832011)(1076003)(186003)(6506007)(9686003)(6512007)(2906002)(33656002)(26005)(86362001)(83380400001)(478600001)(71200400001)(122000001)(76116006)(316002)(54906003)(38100700002)(38070700005)(66446008)(4326008)(8676002)(64756008)(66946007)(6486002)(66556008)(66476007)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r+OyRyQLgV4PcgyaDetuZ1rWTiLbwJJ4D71FNkbyprAjVqUpsS4EQcvbZ6rm?=
 =?us-ascii?Q?P2t/CkkujoMQf7RfjVFgzjXT0xS8GEGCJhIv+Apm6gili9QOtutVlHweeJIr?=
 =?us-ascii?Q?pJhEladpVVNvtCmnA7ZdSXA/+nmQlVEwi1jgeTQh7plGn5bg1IIBajQa4p0X?=
 =?us-ascii?Q?t0OMrqKW0bBvrL9L/6ZN/JTOAeix43x7If1XmiPQdqRVwqW1EA/le9JwME9K?=
 =?us-ascii?Q?IRnLY9EuYErtjI6d3TbwTSQ5YR1Wr7J71+htKQPl7nfY+y1X2Iz28h+jbPlO?=
 =?us-ascii?Q?/ZRTIwVMYvN1ZHcuOR/HqQg2xNHb+di1VWnkpb/V1G981MHI4t6oYhYWfOFi?=
 =?us-ascii?Q?I5eRTRGBOmSTbB5r6/L1n5gQohXGHWjt4UmGc1nQUVGJuYuC+qupE8z3siL3?=
 =?us-ascii?Q?NlPqkX8ZtFdKIbkAKHcV3irX7LcnNTBVj7tGPUui0v9Dj7IgFuUK4zXa/jQq?=
 =?us-ascii?Q?HNFLoliC8KXLkA4lyq+YSj0CiIyIExwZRdyCLsE94KKse589yvNdjCpbMXWE?=
 =?us-ascii?Q?7bB9mw5ECHgAw4D/d2zcb6t5UBr+MfK1AYboEQrQYSWZGQ4UVVh5SIj/57kB?=
 =?us-ascii?Q?5b98VkqN+xVsH4pbOemLCupyk0O0Lwm5SqHP0pDzrdMFCWK6JyFsyZySmBXV?=
 =?us-ascii?Q?jyNad2RCpUKNSXqXAjM6sZBS3WkhjkZ8Pv/P0boOpkSILVp8eLJ/3BIYgtR7?=
 =?us-ascii?Q?5KxugP01u74M53I3eb/HSSZMLwWwNjRwMvP4E1IqaC06iExKHXOL5UX9n40/?=
 =?us-ascii?Q?BLsd7FtiWUtlqcUqAra/V2y9gmldx/b9n7TkkmEX3IjNQrtj1kWcQTgahxqX?=
 =?us-ascii?Q?zMPMq+GetHX5YR6AXhQvRWn8gR4jsLT0clXXxImT8uM9SmzOmduxotbxsde2?=
 =?us-ascii?Q?S8J5SrjdxQbJ1ORc8A3Z6cajkZNGXo0SoRnpooB2BlDpMitnybDS1PXCFatM?=
 =?us-ascii?Q?VasB2fDWIOMfeC/sYRZc3UuVUQTO0TLyV2iXQIoqpzFxAA7rD0spDbWAY0/K?=
 =?us-ascii?Q?J0oexYxhJ7az+0wMK1K45HCbisepCsf+rjcvXl4bDhXy3OKaMXwkeKqfuNF1?=
 =?us-ascii?Q?OAwgfMc/k85KX7qU5cMiEsE1mlA7S19VLBzs9DU+mVrJ50dODn7rCEpGxISK?=
 =?us-ascii?Q?kwSVLMD85jKi9FgAG7YZfJ+6C7z4hRXIz9LFKpAhqr/EJIjrtBYYc+ThgyYx?=
 =?us-ascii?Q?9DY+43K7uTAIPGQXJ4p7VsRC/+zt6swNchMwCUVxD0Mh8j0DHPQymfc1PKSY?=
 =?us-ascii?Q?BCba6KdFuI2bvjEwcBoQnhgKLW9AOzCDKPVXtPUaYj3tzMNv9irp8PYKlTt+?=
 =?us-ascii?Q?KeS3eDYT85f37ZgH4SUMRU2HWrsDxQgtdhd+gBVM3O+Qzn9CdouHCha3whD8?=
 =?us-ascii?Q?hUqcTrCgXGe5cwTqYPnapv23sj6LxNCQHpOpx6hhutCYPLYCRuvkLBIhYmZ6?=
 =?us-ascii?Q?bkokp89T/+ja/W7eSRiGs1+fdA019fB+6SA3DuziiaZbH8x4A+KoVTgLRzBV?=
 =?us-ascii?Q?MvXjdXyrN7wECBYf/9nwEajr+WZGHr7ltW3igUrkRfX1B+LNCHPo7iq6a7iG?=
 =?us-ascii?Q?u9fDPl1RCoT2gKGt+8o9VzcidYsnqmdHmjJamtdY6fP5B7cLydTXJvFcAF6j?=
 =?us-ascii?Q?X1/50IIFvPAuHMeLtgmpAPM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C75116CA5FD504FB816FFA400BF94E6@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d35159-b436-4fc5-04c0-08da8d0cd16e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:59:01.8493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Or3aU6QQ4MnllVCZQeTMZNyDjD1VRAUmr/1UBLtgPSjssdXNk4QOHOkV3hLhWS0bPiO1uR+o5ytJRYA74Jcx1/q9b8MAgH9jOuVsW+9/3bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8866
X-Proofpoint-ORIG-GUID: tvYZtcDAOmpydABColHnx02Nx-M-P6oS
X-Proofpoint-GUID: tvYZtcDAOmpydABColHnx02Nx-M-P6oS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 26, 2022 at 05:32:48PM +0300, Daniil Tatianin wrote:
> Make vhost-user-blk backwards compatible when migrating from older VMs
> running with modern features turned off, the same way it was done for
> virtio-blk in 20764be0421c ("virtio-blk: set config size depending on the=
 features enabled")
>=20
> It's currently impossible to migrate from an older VM with
> vhost-user-blk (with disable-legacy=3Doff) because of errors like this:
>=20
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x10 read=
: 41 device: 1 cmask: ff wmask: 80 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load virtio-blk:virtio
> qemu-system-x86_64: error while loading state for instance 0x0 of device =
'0000:00:05.0:00.0:02.0/virtio-blk'
> qemu-system-x86_64: load of migration failed: Invalid argument
>=20
> This is caused by the newer (destination) VM requiring a bigger BAR0
> alignment because it has to cover a bigger configuration space, which
> isn't actually needed since those additional config fields are not
> active (write-zeroes/discard).
>

With the relevant meson.build and MAINTAINERS bits rebased here:

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>


> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0d916edefa..8dd063eb96 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -23,6 +23,7 @@
>  #include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
> +#include "hw/virtio/virtio-blk-common.h"
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user-blk.h"
>  #include "hw/virtio/virtio.h"
> @@ -63,7 +64,7 @@ static void vhost_user_blk_update_config(VirtIODevice *=
vdev, uint8_t *config)
>      /* Our num_queues overrides the device backend */
>      virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> =20
> -    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
> +    memcpy(config, &s->blkcfg, vdev->config_len);
>  }
> =20
>  static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t =
*config)
> @@ -92,12 +93,12 @@ static int vhost_user_blk_handle_config_change(struct=
 vhost_dev *dev)
>  {
>      int ret;
>      struct virtio_blk_config blkcfg;
> +    VirtIODevice *vdev =3D dev->vdev;
>      VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);
>      Error *local_err =3D NULL;
> =20
>      ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> -                               sizeof(struct virtio_blk_config),
> -                               &local_err);
> +                               vdev->config_len, &local_err);
>      if (ret < 0) {
>          error_report_err(local_err);
>          return ret;
> @@ -106,7 +107,7 @@ static int vhost_user_blk_handle_config_change(struct=
 vhost_dev *dev)
>      /* valid for resize only */
>      if (blkcfg.capacity !=3D s->blkcfg.capacity) {
>          s->blkcfg.capacity =3D blkcfg.capacity;
> -        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_c=
onfig));
> +        memcpy(dev->vdev->config, &s->blkcfg, vdev->config_len);
>          virtio_notify_config(dev->vdev);
>      }
> =20
> @@ -442,7 +443,7 @@ static int vhost_user_blk_realize_connect(VHostUserBl=
k *s, Error **errp)
>      assert(s->connected);
> =20
>      ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> -                               sizeof(struct virtio_blk_config), errp);
> +                               s->parent_obj.config_len, errp);
>      if (ret < 0) {
>          qemu_chr_fe_disconnect(&s->chardev);
>          vhost_dev_cleanup(&s->dev);
> @@ -457,6 +458,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>      ERRP_GUARD();
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    size_t config_size;
>      int retries;
>      int i, ret;
> =20
> @@ -487,8 +489,9 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>          return;
>      }
> =20
> -    virtio_init(vdev, VIRTIO_ID_BLOCK,
> -                sizeof(struct virtio_blk_config));
> +    config_size =3D virtio_get_config_size(&virtio_blk_cfg_size_params,
> +                                         vdev->host_features);
> +    virtio_init(vdev, VIRTIO_ID_BLOCK, config_size);
> =20
>      s->virtqs =3D g_new(VirtQueue *, s->num_queues);
>      for (i =3D 0; i < s->num_queues; i++) {
> --=20
> 2.25.1
> =

