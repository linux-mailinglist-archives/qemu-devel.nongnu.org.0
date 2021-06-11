Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF83A49F4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:09:48 +0200 (CEST)
Received: from localhost ([::1]:59772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnTP-0001ev-Bw
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnRz-0000KP-SH; Fri, 11 Jun 2021 16:08:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:63710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnRw-0001M1-SW; Fri, 11 Jun 2021 16:08:19 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BK8Cbb027116; Fri, 11 Jun 2021 13:08:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=GWECB3SD1YsDuvXd9mGpH9xcVpM4MMJjPLNliAJsWA8=;
 b=cgqBwy5NwDXI8RYLDAMBLh0YMCDEGJiUqyf42mAFh0LMgh2pwWMe06hEw2rLCG5RLlmN
 aqAuEyPIyWqlwSvkU8U4U26wF5akhRTzqZpwBfFYnFuACOuvCERfd/h6dY3GWh5x3MRT
 0Y8cWgjTQ3k0r90N09r7NjEnVH4oMWl6dYLo0bIs1EEHYg+okZU1DOPZKDugAz0M/Rr7
 CyxFcKSuGfEF2weU8W/yT5XMTP7FPwefZUPD81oaPXAWfILviQpBuwDKZ9zdDbJEXiCr
 ZqX4fLj2t5cPc9srmw3cb2BsilwE/1ljX6/a4l02BFpw9bz7e1NazZT/NX+QrIGDCOeB yg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0b-002c1b01.pphosted.com with ESMTP id 393mqmb4gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 13:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK24pCTANuGlkNNUGXyhd/oLq5ZcER7lyqyZ/4MeSHs3LNx7M28XTfnIFurxTLrakh9I5ZSMVw87buLews+4eqnPLszElTWwET+PV2JIAtDl1y8kvNeEEFXxc6/bvzix2qNoTcQzoQtC9bfaPn82aplrx/jwLDP92QPlxW2PaLC3LS4UnidyVLzwaYZdiAWAHpD6rEqrxiAiko0LgwSjgjFdSnDRASJGMQTNXqxxNfC20nG3lRGPpuHN6Lqfb2abwerR/QnVbYEO9mP8B8e9zyRbDRBnpjIWsU3RPFpIGa0oUS86peiB75z445wD+FKDu7ANALhTsREbDelVrLJKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWECB3SD1YsDuvXd9mGpH9xcVpM4MMJjPLNliAJsWA8=;
 b=HSyLTZs39h3r00vqJ08BxbAHAlYwaIapc+DATyHmuaM8miLZKPtAx0W3XN1xNYYGk1gUfb2UDYEk6Rw68Ewmeq4Z6E2qNeWSMPEjsLDm41dKXEkgPj+paXBYhMlTK3DWvtL8SkPwQMSggJQH4WaXe3hBQGXTx9GBEOTRJuxKjasL0OtOppAT/aC/qUpXK8+DfLEtgZ+bP6uJO0VYbNqd+imSeoatQwDLLuNY46j7NsCsO8tiyv31opi2hbtEOKvkvqCkkLYNyBV90N+TWpotnI/KBkyTxmxzBPm6JF0jz9zMFwpOWuYoLtUqnWlYKh9NTZlvx+6Ww09t3QzXGN6skw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4544.namprd02.prod.outlook.com (2603:10b6:805:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Fri, 11 Jun
 2021 20:08:11 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 20:08:11 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 5/7] vhost: Distinguish errors in vhost_dev_get_config()
Thread-Topic: [PATCH 5/7] vhost: Distinguish errors in vhost_dev_get_config()
Thread-Index: AQHXXUa/J98NrtjPlU6Z674ioPZhd6sPQHGA
Date: Fri, 11 Jun 2021 20:08:11 +0000
Message-ID: <20210611200809.GD26687@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-6-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-6-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5e0496b-f7b5-4f8a-6833-08d92d14a378
x-ms-traffictypediagnostic: SN6PR02MB4544:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB454400090DDE9AF7091324CBEA349@SN6PR02MB4544.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gaYPLp22GWcgFh95jSASOQ83h7WfSmueNI7VxFG/6ehQwoCbiCTDdZ69uiBDJIILENI1wCfJEt+fbloRzwdJaQRJNg60SmrRF7ymkFG6z3cpQYBCAeNjVJc9ri0q8IM0QBNu/pDnQinXTVGoKNPmovdPeVihF9jdGND1ZZ4JZ0oBCELuMf6SNXY7f4AqTKj3tDMNSb4lQU0A23cs2OBW2Jn7yl3oXT8CQQsrsNo4ehCmW4o+E97DkMnVtbwCtxjrmyvkEsoaDfKsX9+vSL5SbPhb+bD0YaYIn2xBLGQbMxDUOA+NNTcFMsPGvvHtQ5zl6dzC7BW7262TfdjaPkD51o+bCfyZTjXn5/210NhvnVOXl2WZpmI37bWR4dq+t4djOhkGyrrzk92Go9q7zeIhg5tWL3DQBlIpSuoSfrgGEx/+JEuKFeiekfgICCHHJAWPfWposcYUjhYofmrvcHG89r98ruGFGLyUrL13gTFkQhT8QPs20s3n5DvJ964V8cAEuXqS3T37vvRNpnrBZwRnWR9bI6sHtsrjzc2qQogyubFcjX8K3aJ49EYGsUpF9wXhue6u7PUQcVbZrDafUtt7kkaptfd4U89DnGTN337sfMw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(396003)(376002)(39860400002)(136003)(346002)(122000001)(66556008)(38100700002)(64756008)(33656002)(8676002)(91956017)(71200400001)(76116006)(54906003)(66476007)(83380400001)(6916009)(5660300002)(66446008)(8936002)(1076003)(6512007)(26005)(186003)(2906002)(9686003)(6486002)(478600001)(66946007)(33716001)(44832011)(86362001)(4326008)(6506007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ot4G8VWNOt5eucgdT4WK46TScNh4PryxCQcBm4WCymIOvIzGDdkAjLpVCESM?=
 =?us-ascii?Q?R3zgYxct6zrnShWXwdCoW9kIyd3tUWAnQ530oaqH3+ago2EPxoZxZzCCdqPz?=
 =?us-ascii?Q?QgfpGLkKBMzhc8Ex9MJ7rPhBN6uwWUmi72lf0TN/W3EAHP0LWU6A0HPdVxsj?=
 =?us-ascii?Q?ugBYHAZatGl9kKR78O3RcYyg1Mgp6MUfscSjH4CZLKcv3kEwScBv8lfQ4wa4?=
 =?us-ascii?Q?t4Hub1WIaz5VuZgGZF4Awsy2b5/97FAA+bfP/KEJASFJFq3LMNqPHKwhp72r?=
 =?us-ascii?Q?ft6FhMcAVbD1xhOIj+AG5CegXwH/D6CoH966pziPX85KdSTIXqDl857HjrRn?=
 =?us-ascii?Q?gOYK4HV9KSJuBE2qWE6k57c3YB7gHcChNve7WlfH1y50KwB+S3SAAJJtks+N?=
 =?us-ascii?Q?rKx+F5g4QXjhHfhMZOu19AVolQStZXdypeDypPZ1KuIh2Il6Sn4Qd+G+hQA6?=
 =?us-ascii?Q?16znDcNuG8AxMHGX3jltW1kbvsbfp8N7a6EqDxEcNwgUv5yi0QJ2qAWdZbh5?=
 =?us-ascii?Q?M0CGe2Mc6nh/Mo8BEDFk2DVczhdEGcuy3XvHk5sOxizAaqDZqArRx6jYS8lm?=
 =?us-ascii?Q?B5C5ONr+P9hTd5Vf7KoculgyD6mRCK43VrAVQsNgb21ya0dg3K//XJjI/h50?=
 =?us-ascii?Q?lfFjJNW327iV+k9ViYAxx9FRpnKQCmn45ye/oPjvkPhIIKLVx8IYYVgr3R/X?=
 =?us-ascii?Q?gOTia2iH4OMr19XAHDsi0SYVVyZlD3vrxo+OtOH44kYa882DDj+x4Rui/MY4?=
 =?us-ascii?Q?22a51bV8xhwgWaUJ4kDsRuvFDZS/43NTMx/P6N7RBKvzXpd4X9z0q7G9U/hX?=
 =?us-ascii?Q?B6Pm5yerWJsO9AokBMCZp1soHDpT/Nbr3rE6tQG+OfH5rN1aSirkCOBoiQdA?=
 =?us-ascii?Q?F/i3mXyOfBQe77LreumQUAlMklN+T7sgf4MaR9ZIG1p+zXvHy4I5D2lidGyX?=
 =?us-ascii?Q?2nK5zli8d7zKFG22SVgPBqMUvNuxPzZXBgv+V/RALTKTlpLnIdCe5phKxANY?=
 =?us-ascii?Q?EIrQkArry/J/pdHWzhsrgajeoEJE/4Z9McK8mZ4fw8PN0WXY0EOa9ZqBQnjM?=
 =?us-ascii?Q?dC3s77tMhom4dyALiGBwf3U0k0k6DN/S/9Zm2fyshfy5GpTmYGpgGCyQ9YPJ?=
 =?us-ascii?Q?5Dvo6P5hSMnwq/6B5BvansRa4N8cjgjC9Wfu6LHgBzuRAqMcUJ8VR0MTV4nv?=
 =?us-ascii?Q?dC03KdUHeYtch2xQwcAjqmRF/ZwJtfh3UAifA7ctzZHeKGYV66H+aBCrOLg3?=
 =?us-ascii?Q?dt46G8X8hekgmCOjKG5iUYcH3yilwkTNCEwpwV731JfxjnfAYsmGSLcT2CaU?=
 =?us-ascii?Q?8moL2+zWIIy7XW0SMS57nZnZsE1Y5VVFAfRJp/3aNC+1eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF8CC616E8265D4B9D04DBBA138100C4@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e0496b-f7b5-4f8a-6833-08d92d14a378
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 20:08:11.3949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmwF5FeUnmD0ZnXCo8Xys/2t7/pHHMJgn0dxNjbahqsi2oaUguQ5JXav36GvdpbwknLXHqi12PpGu6TmN4e0iQj1jWPJ99BJLKOjYt5tHto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4544
X-Proofpoint-GUID: HY4ClJ1EbYEtP0CvMSo153cHw-2oK2yY
X-Proofpoint-ORIG-GUID: HY4ClJ1EbYEtP0CvMSo153cHw-2oK2yY
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

On Wed, Jun 09, 2021 at 05:46:56PM +0200, Kevin Wolf wrote:
> Instead of just returning 0/-1 and letting the caller make up a
> meaningless error message, add an Error parameter to allow reporting the
> real error and switch to 0/-errno so that different kind of errors can
> be distinguished in the caller.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Just one commmit message suggestion.

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  include/hw/virtio/vhost-backend.h |  2 +-
>  include/hw/virtio/vhost.h         |  4 ++--
>  hw/block/vhost-user-blk.c         |  9 +++++----
>  hw/display/vhost-user-gpu.c       |  6 ++++--
>  hw/input/vhost-user-input.c       |  6 ++++--
>  hw/net/vhost_net.c                |  2 +-
>  hw/virtio/vhost-user-vsock.c      |  9 +++++----
>  hw/virtio/vhost-user.c            | 24 ++++++++++++------------
>  hw/virtio/vhost-vdpa.c            |  2 +-
>  hw/virtio/vhost.c                 | 14 +++++++++++---
>  10 files changed, 46 insertions(+), 32 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-=
backend.h
> index 728ebb0ed9..8475c5a29d 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -98,7 +98,7 @@ typedef int (*vhost_set_config_op)(struct vhost_dev *de=
v, const uint8_t *data,
>                                     uint32_t offset, uint32_t size,
>                                     uint32_t flags);
>  typedef int (*vhost_get_config_op)(struct vhost_dev *dev, uint8_t *confi=
g,
> -                                   uint32_t config_len);
> +                                   uint32_t config_len, Error **errp);
> =20
>  typedef int (*vhost_crypto_create_session_op)(struct vhost_dev *dev,
>                                                void *session_info,
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 2d7aaad67b..045d0fd9f2 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -130,8 +130,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>                            struct vhost_vring_file *file);
> =20
>  int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int wr=
ite);
> -int vhost_dev_get_config(struct vhost_dev *dev, uint8_t *config,
> -                         uint32_t config_len);
> +int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
> +                         uint32_t config_len, Error **errp);
>  int vhost_dev_set_config(struct vhost_dev *dev, const uint8_t *data,
>                           uint32_t offset, uint32_t size, uint32_t flags)=
;
>  /* notifier callback in case vhost device config space changed
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index e9382e152a..3770f715da 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -91,11 +91,13 @@ static int vhost_user_blk_handle_config_change(struct=
 vhost_dev *dev)
>      int ret;
>      struct virtio_blk_config blkcfg;
>      VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);
> +    Error *local_err =3D NULL;
> =20
>      ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> -                               sizeof(struct virtio_blk_config));
> +                               sizeof(struct virtio_blk_config),
> +                               &local_err);
>      if (ret < 0) {
> -        error_report("get config space failed");
> +        error_report_err(local_err);
>          return -1;
>      }
> =20
> @@ -478,9 +480,8 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>      assert(s->connected);
> =20
>      ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> -                               sizeof(struct virtio_blk_config));
> +                               sizeof(struct virtio_blk_config), errp);
>      if (ret < 0) {
> -        error_setg(errp, "vhost-user-blk: get block config failed");
>          goto vhost_err;
>      }
> =20
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 6cdaa1c73b..389199e6ca 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -415,14 +415,16 @@ vhost_user_gpu_get_config(VirtIODevice *vdev, uint8=
_t *config_data)
>      VirtIOGPUBase *b =3D VIRTIO_GPU_BASE(vdev);
>      struct virtio_gpu_config *vgconfig =3D
>          (struct virtio_gpu_config *)config_data;
> +    Error *local_err =3D NULL;
>      int ret;
> =20
>      memset(config_data, 0, sizeof(struct virtio_gpu_config));
> =20
>      ret =3D vhost_dev_get_config(&g->vhost->dev,
> -                               config_data, sizeof(struct virtio_gpu_con=
fig));
> +                               config_data, sizeof(struct virtio_gpu_con=
fig),
> +                               &local_err);
>      if (ret) {
> -        error_report("vhost-user-gpu: get device config space failed");
> +        error_report_err(local_err);
>          return;
>      }
> =20
> diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
> index 63984a8ba7..273e96a7b1 100644
> --- a/hw/input/vhost-user-input.c
> +++ b/hw/input/vhost-user-input.c
> @@ -49,13 +49,15 @@ static void vhost_input_get_config(VirtIODevice *vdev=
, uint8_t *config_data)
>  {
>      VirtIOInput *vinput =3D VIRTIO_INPUT(vdev);
>      VHostUserInput *vhi =3D VHOST_USER_INPUT(vdev);
> +    Error *local_err =3D NULL;
>      int ret;
> =20
>      memset(config_data, 0, vinput->cfg_size);
> =20
> -    ret =3D vhost_dev_get_config(&vhi->vhost->dev, config_data, vinput->=
cfg_size);
> +    ret =3D vhost_dev_get_config(&vhi->vhost->dev, config_data, vinput->=
cfg_size,
> +                               &local_err);
>      if (ret) {
> -        error_report("vhost-user-input: get device config space failed")=
;
> +        error_report_err(local_err);
>          return;
>      }
>  }
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 447b119f85..10a7780a13 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -117,7 +117,7 @@ uint64_t vhost_net_get_features(struct vhost_net *net=
, uint64_t features)
>  int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
>                           uint32_t config_len)
>  {
> -    return vhost_dev_get_config(&net->dev, config, config_len);
> +    return vhost_dev_get_config(&net->dev, config, config_len, NULL);
>  }
>  int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
>                           uint32_t offset, uint32_t size, uint32_t flags)
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index b6a4a25ea1..6095ed7349 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -34,10 +34,12 @@ static void vuv_get_config(VirtIODevice *vdev, uint8_=
t *config)
>  static int vuv_handle_config_change(struct vhost_dev *dev)
>  {
>      VHostUserVSock *vsock =3D VHOST_USER_VSOCK(dev->vdev);
> +    Error *local_err =3D NULL;
>      int ret =3D vhost_dev_get_config(dev, (uint8_t *)&vsock->vsockcfg,
> -                                   sizeof(struct virtio_vsock_config));
> +                                   sizeof(struct virtio_vsock_config),
> +                                   &local_err);
>      if (ret < 0) {
> -        error_report("get config space failed");
> +        error_report_err(local_err);
>          return -1;
>      }
> =20
> @@ -114,9 +116,8 @@ static void vuv_device_realize(DeviceState *dev, Erro=
r **errp)
>      }
> =20
>      ret =3D vhost_dev_get_config(&vvc->vhost_dev, (uint8_t *)&vsock->vso=
ckcfg,
> -                               sizeof(struct virtio_vsock_config));
> +                               sizeof(struct virtio_vsock_config), errp)=
;
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "get config space failed");
>          goto err_vhost_dev;
>      }
> =20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 889559d86a..1ac4a2ebec 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2117,7 +2117,7 @@ static void vhost_user_set_iotlb_callback(struct vh=
ost_dev *dev, int enabled)
>  }
> =20
>  static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
> -                                 uint32_t config_len)
> +                                 uint32_t config_len, Error **errp)
>  {
>      VhostUserMsg msg =3D {
>          .hdr.request =3D VHOST_USER_GET_CONFIG,
> @@ -2127,32 +2127,32 @@ static int vhost_user_get_config(struct vhost_dev=
 *dev, uint8_t *config,
> =20
>      if (!virtio_has_feature(dev->protocol_features,
>                  VHOST_USER_PROTOCOL_F_CONFIG)) {
> -        return -1;
> +        error_setg(errp, "VHOST_USER_PROTOCOL_F_CONFIG not supported");
> +        return -EINVAL;
>      }
> =20
> -    if (config_len > VHOST_USER_MAX_CONFIG_SIZE) {
> -        return -1;
> -    }
> +    assert(config_len <=3D VHOST_USER_MAX_CONFIG_SIZE);

Maybe just note that you are changing the check to an assert in the
commit message since it is a functional change?

> =20
>      msg.payload.config.offset =3D 0;
>      msg.payload.config.size =3D config_len;
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> -        return -1;
> +        return -EPROTO;
>      }
> =20
>      if (vhost_user_read(dev, &msg) < 0) {
> -        return -1;
> +        return -EPROTO;
>      }
> =20
>      if (msg.hdr.request !=3D VHOST_USER_GET_CONFIG) {
> -        error_report("Received unexpected msg type. Expected %d received=
 %d",
> -                     VHOST_USER_GET_CONFIG, msg.hdr.request);
> -        return -1;
> +        error_setg(errp,
> +                   "Received unexpected msg type. Expected %d received %=
d",
> +                   VHOST_USER_GET_CONFIG, msg.hdr.request);
> +        return -EINVAL;
>      }
> =20
>      if (msg.hdr.size !=3D VHOST_USER_CONFIG_HDR_SIZE + config_len) {
> -        error_report("Received bad msg size.");
> -        return -1;
> +        error_setg(errp, "Received bad msg size.");
> +        return -EINVAL;
>      }
> =20
>      memcpy(config, msg.payload.config.region, config_len);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 71897c1a01..6b6f974a83 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -451,7 +451,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *de=
v, const uint8_t *data,
>  }
> =20
>  static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
> -                                   uint32_t config_len)
> +                                   uint32_t config_len, Error **errp)
>  {
>      struct vhost_vdpa_config *v_config;
>      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, buf=
);
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index c7f9d8bb06..1b66f1de70 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1562,15 +1562,23 @@ void vhost_ack_features(struct vhost_dev *hdev, c=
onst int *feature_bits,
>  }
> =20
>  int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
> -                         uint32_t config_len)
> +                         uint32_t config_len, Error **errp)
>  {
> +    ERRP_GUARD();
> +    int ret;
> +
>      assert(hdev->vhost_ops);
> =20
>      if (hdev->vhost_ops->vhost_get_config) {
> -        return hdev->vhost_ops->vhost_get_config(hdev, config, config_le=
n);
> +        ret =3D hdev->vhost_ops->vhost_get_config(hdev, config, config_l=
en, errp);
> +        if (ret < 0 && !*errp) {
> +            error_setg_errno(errp, -ret, "vhost_get_config failed");
> +        }
> +        return ret;
>      }
> =20
> -    return -1;
> +    error_setg(errp, "vhost_dev_get_config not implemented");
> +    return -ENOTSUP;
>  }
> =20
>  int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
> --=20
> 2.30.2
> =

